#!/usr/bin/env python3

import os
import shutil
import sqlglot
import argparse
import json
from pathlib import Path
from typing import List, Tuple, Set, Dict, Any

class TemplateAdjuster:
    def __init__(self, workspace_dir: str):
        """
        Initialize the Template Adjuster
        
        Args:
            workspace_dir: Root directory containing templates
        """
        self.workspace_dir = Path(workspace_dir)
    
    def find_template_dirs(self) -> List[Path]:
        """Find all template directories (excluding _common and hidden dirs)."""
        template_dirs = []
        for item in self.workspace_dir.iterdir():
            if item.is_dir() and not item.name.startswith('_') and not item.name.startswith('.'):
                template_dirs.append(item)
        return template_dirs
    
    def process_inputs_jsonnet(self, file_path: Path):
        """
        Process inputs.jsonnet file to adjust for BigQuery
        
        Args:
            file_path: Path to inputs.jsonnet file
        """
        print(f"Processing {file_path}")
        
        # Read the original file
        with open(file_path, 'r') as f:
            content = f.read()
            
        # Basic string replacements for transformation names
        content = content.replace('Snowflake Transformation', 'Transformation')
        content = content.replace('snowflake-transformation', 'google-bigquery-transformation')
        
        # Parse the jsonnet content (as a string, not executing it)
        # Look for steps array
        steps_start = content.find('steps: [')
        if steps_start == -1:
            return
            
        # Find the matching closing bracket
        bracket_count = 1
        steps_end = steps_start + 7  # len('steps: [')
        while bracket_count > 0 and steps_end < len(content):
            if content[steps_end] == '[':
                bracket_count += 1
            elif content[steps_end] == ']':
                bracket_count -= 1
            steps_end += 1
            
        if bracket_count > 0:
            return
            
        # Extract steps array content
        steps_content = content[steps_start:steps_end]
        
        # Create new content with backend parameter
        new_content = content[:steps_start] + \
            'backend: std.extVar("backend"),\n  ' + \
            'steps: if std.extVar("backend") == "snowflake" then [\n    ' + \
            steps_content[7:] + \
            '\n  ] else [\n    ' + \
            steps_content[7:].replace(
                'keboola.snowflake-transformation', 
                'keboola.google-bigquery-transformation'
            ) + \
            '\n  ]' + \
            content[steps_end:]
        
        # Write the modified content back
        with open(file_path, 'w') as f:
            f.write(new_content)
            
    def process_template(self, template_dir: Path):
        """
        Process a template directory to adjust inputs.jsonnet
        
        Args:
            template_dir: Path to template directory
        """
        # Look for inputs.jsonnet files
        for inputs_file in template_dir.rglob('inputs.jsonnet'):
            self.process_inputs_jsonnet(inputs_file)

class SQLTranspiler:
    def __init__(self, source_dir: str, source_dialect: str = 'snowflake', target_dialect: str = 'bigquery'):
        """
        Initialize the SQL Transpiler
        
        Args:
            source_dir: Root directory containing SQL files to transpile
            source_dialect: Source SQL dialect (default: snowflake)
            target_dialect: Target SQL dialect (default: bigquery)
        """
        self.source_dir = Path(source_dir)
        self.source_dialect = source_dialect
        self.target_dialect = target_dialect

    def find_sql_files(self) -> List[Tuple[Path, Path]]:
        """Find all code.sql files and their target paths."""
        sql_files = []
        
        # Walk through all directories in _common
        for dirpath, _, filenames in os.walk(self.source_dir):
            current_path = Path(dirpath)
            
            # Skip if we're already in a -bq folder
            if '-bq' in str(current_path):
                continue
                
            for filename in filenames:
                if filename == 'code.sql':
                    source_file = current_path / filename
                    
                    # Create target path by replacing the base folder name
                    relative_path = source_file.relative_to(self.source_dir)
                    parent_dir = relative_path.parts[0]
                    target_dir = f"{parent_dir}-bq"
                    
                    target_path = self.source_dir / target_dir / '/'.join(relative_path.parts[1:])
                    sql_files.append((source_file, target_path))
        
        return sql_files

    def get_folders_with_sql(self) -> Set[Path]:
        """Find all root folders that contain code.sql files."""
        folders = set()
        sql_files = self.find_sql_files()
        
        for source_file, _ in sql_files:
            # Get the root folder (first level under _common)
            root_folder = source_file.relative_to(self.source_dir).parts[0]
            folders.add(self.source_dir / root_folder)
            
        return folders

    def transpile_sql(self, source_file: Path, target_file: Path):
        """
        Transpile SQL from source dialect to target dialect
        
        Args:
            source_file: Path to source SQL file
            target_file: Path to target SQL file
        """
        print(f"Transpiling {source_file} to {target_file}")
        
        # Read source SQL
        with open(source_file, 'r') as f:
            sql = f.read()
            
        try:
            # Transpile SQL using sqlglot
            transpiled = sqlglot.transpile(
                sql,
                read=self.source_dialect,
                write=self.target_dialect,
                pretty=True
            )
            
            # Create target directory if it doesn't exist
            target_file.parent.mkdir(parents=True, exist_ok=True)
            
            # Write transpiled SQL - join multiple statements with newlines
            with open(target_file, 'w') as f:
                f.write('\n'.join(transpiled))
                
        except Exception as e:
            print(f"Error transpiling {source_file}: {str(e)}")

    def copy_folder_structure(self, source_folder: Path, target_folder: Path):
        """
        Copy entire folder structure including all files except code.sql
        
        Args:
            source_folder: Source folder path
            target_folder: Target folder path
        """
        print(f"Copying folder structure from {source_folder} to {target_folder}")
        
        # Create target folder
        target_folder.mkdir(parents=True, exist_ok=True)
        
        # Copy all files and subdirectories
        for item in source_folder.rglob('*'):
            # Get the relative path from source folder
            relative_path = item.relative_to(source_folder)
            target_path = target_folder / relative_path

            # Check if Snowflake transformation is anywhere in the path
            if 'keboola.snowflake-transformation' in str(target_path):
                # Replace the snowflake part with bigquery in the path
                parts = list(target_path.parts)
                idx = parts.index('keboola.snowflake-transformation')
                parts[idx] = 'keboola.google-bigquery-transformation'
                target_path = Path(*parts)

            if item.is_file():
                # Skip code.sql files as they will be transpiled
                if item.name == 'code.sql':
                    continue
                    
                # Create parent directories if they don't exist
                target_path.parent.mkdir(parents=True, exist_ok=True)
                shutil.copy2(item, target_path)
            elif item.is_dir():
                target_path.mkdir(parents=True, exist_ok=True)

    def remove_transpiled_folders(self):
        """Remove all -bq folders in the source directory."""
        removed = 0
        for item in self.source_dir.iterdir():
            if item.is_dir() and item.name.endswith('-bq'):
                print(f"Removing {item}")
                shutil.rmtree(item)
                removed += 1
        print(f"Removed {removed} transpiled folders")

    def process(self):
        """Process all SQL files and copy folder structures."""
        # First find folders that contain SQL files
        folders_with_sql = self.get_folders_with_sql()
        
        # Copy folder structure only for folders containing SQL
        for source_folder in folders_with_sql:
            target_folder = self.source_dir / f"{source_folder.name}-bq"
            self.copy_folder_structure(source_folder, target_folder)
        
        # Then transpile SQL files
        # sql_files = self.find_sql_files()
        # for source_file, target_file in sql_files:
            # self.transpile_sql(source_file, target_file)

def main():
    parser = argparse.ArgumentParser(description='SQL Transpiler and Template Adjuster')
    parser.add_argument('--clean', action='store_true', help='Remove all transpiled (-bq) folders')
    parser.add_argument('--source-dir', default='_common', help='Source directory to process (default: _common)')
    parser.add_argument('--source-dialect', default='snowflake', help='Source SQL dialect (default: snowflake)')
    parser.add_argument('--target-dialect', default='bigquery', help='Target SQL dialect (default: bigquery)')
    parser.add_argument('--adjust-templates', action='store_true', help='Adjust template inputs.jsonnet files')
    
    args = parser.parse_args()
    
    # Step 1: SQL Transpilation
    transpiler = SQLTranspiler(
        source_dir=args.source_dir,
        source_dialect=args.source_dialect,
        target_dialect=args.target_dialect
    )
    
    if args.clean:
        transpiler.remove_transpiled_folders()
    else:
        # Process all files
        transpiler.process()
        
        # Step 2: Template Adjustment (if requested)
        if args.adjust_templates:
            adjuster = TemplateAdjuster(os.path.dirname(args.source_dir))
            template_dirs = adjuster.find_template_dirs()
            for template_dir in template_dirs:
                adjuster.process_template(template_dir)

if __name__ == "__main__":
    main() 
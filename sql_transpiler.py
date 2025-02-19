#!/usr/bin/env python3

import os
import shutil
import sqlglot
import argparse
from pathlib import Path
from typing import List, Tuple, Set

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
    parser = argparse.ArgumentParser(description='SQL Transpiler for converting between SQL dialects')
    parser.add_argument('--clean', action='store_true', help='Remove all transpiled (-bq) folders')
    parser.add_argument('--source-dir', default='_common', help='Source directory to process (default: _common)')
    parser.add_argument('--source-dialect', default='snowflake', help='Source SQL dialect (default: snowflake)')
    parser.add_argument('--target-dialect', default='bigquery', help='Target SQL dialect (default: bigquery)')
    
    args = parser.parse_args()
    
    # Initialize transpiler
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

if __name__ == "__main__":
    main() 
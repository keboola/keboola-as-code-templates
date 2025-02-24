#!/usr/bin/env python3

import os
import shutil
import sqlglot
import argparse
from pathlib import Path
from typing import List, Tuple, Set, Dict, Any

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
        
        # Walk through all directories
        for dirpath, _, filenames in os.walk(self.source_dir):
            current_path = Path(dirpath)
            
            # Skip if we're already in a bigquery transformation folder
            if 'keboola.google-bigquery-transformation' in str(current_path):
                continue
                
            for filename in filenames:
                if filename == 'code.sql':
                    source_file = current_path / filename
                    
                    # Check if this is under a snowflake transformation folder
                    if 'keboola.snowflake-transformation' in str(source_file):
                        # Create target path by replacing snowflake with bigquery in the path
                        parts = list(source_file.parts)
                        idx = parts.index('keboola.snowflake-transformation')
                        parts[idx] = 'keboola.google-bigquery-transformation'
                        target_path = Path(*parts)
                        sql_files.append((source_file, target_path))
        
        return sql_files

    def get_transformation_folders(self) -> Set[Path]:
        """Find all Snowflake transformation folders."""
        folders = set()
        
        for dirpath, dirnames, _ in os.walk(self.source_dir):
            current_path = Path(dirpath)
            
            # Skip if we're already in a bigquery transformation folder
            if 'keboola.google-bigquery-transformation' in str(current_path):
                continue
                
            # Check if this is a snowflake transformation folder
            if 'keboola.snowflake-transformation' in str(current_path):
                folders.add(current_path)
                
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

    def copy_folder_structure(self, source_folder: Path):
        """
        Copy Snowflake transformation folder structure to BigQuery transformation folder
        
        Args:
            source_folder: Source Snowflake transformation folder path
        """
        # Create target folder path by replacing snowflake with bigquery
        parts = list(source_folder.parts)
        idx = parts.index('keboola.snowflake-transformation')
        parts[idx] = 'keboola.google-bigquery-transformation'
        target_folder = Path(*parts)
        
        print(f"Copying folder structure from {source_folder} to {target_folder}")
        
        # Create target folder
        target_folder.mkdir(parents=True, exist_ok=True)
        
        # Copy all files and subdirectories
        for item in source_folder.rglob('*'):
            # Get the relative path from source folder
            relative_path = item.relative_to(source_folder)
            target_path = target_folder / relative_path

            if item.is_file():
                # Skip code.sql files as they will be transpiled
                if item.name == 'code.sql':
                    continue
                    
                # Create parent directories if they don't exist
                target_path.parent.mkdir(parents=True, exist_ok=True)
                shutil.copy2(item, target_path)
            elif item.is_dir():
                target_path.mkdir(parents=True, exist_ok=True)

    def remove_bigquery_folders(self):
        """Remove all BigQuery transformation folders."""
        removed = 0
        for dirpath, dirnames, _ in os.walk(self.source_dir):
            current_path = Path(dirpath)
            if current_path.name == 'keboola.google-bigquery-transformation':
                print(f"Removing {current_path}")
                shutil.rmtree(current_path)
                removed += 1
        print(f"Removed {removed} BigQuery transformation folders")

    def process(self):
        """Process all SQL files and copy folder structures."""
        # First find Snowflake transformation folders
        transformation_folders = self.get_transformation_folders()
        
        # Copy folder structure for each transformation folder
        for source_folder in transformation_folders:
            self.copy_folder_structure(source_folder)
        
        # Then transpile SQL files
        sql_files = self.find_sql_files()
        for source_file, target_file in sql_files:
            self.transpile_sql(source_file, target_file)

def main():
    parser = argparse.ArgumentParser(description='SQL Transpiler and Template Adjuster')
    parser.add_argument('--clean', action='store_true', help='Remove all BigQuery transformation folders')
    parser.add_argument('--source-dir', default='_common', help='Source directory to process (default: _common)')
    parser.add_argument('--source-dialect', default='snowflake', help='Source SQL dialect (default: snowflake)')
    parser.add_argument('--target-dialect', default='bigquery', help='Target SQL dialect (default: bigquery)')
    
    args = parser.parse_args()
    
    # Step 1: SQL Transpilation
    transpiler = SQLTranspiler(
        source_dir=args.source_dir,
        source_dialect=args.source_dialect,
        target_dialect=args.target_dialect
    )
    
    if args.clean:
        transpiler.remove_bigquery_folders()
    else:
        # Process all files
        transpiler.process()
        
if __name__ == "__main__":
    main() 
import pandas as pd
import json
import zipfile
import os

# Load the CSV file into a DataFrame
df = pd.read_csv('in/tables/confluence_pages.csv')

# Create a directory to store the individual JSON files
json_dir = 'in/files'
os.makedirs(json_dir, exist_ok=True)

# Convert each row of the DataFrame into an individual JSON file
for index, row in df.iterrows():
    json_file_path = os.path.join(json_dir, f'row_{index}.json')
    row.to_json(json_file_path, orient='index')

# Zip the directory of JSON files
zip_file_path = 'out/files/conflu_pages.zip'
with zipfile.ZipFile(zip_file_path, 'w') as zipf:
    for root, _, files in os.walk(json_dir):
        for file in files:
            json_file_path = os.path.join(root, file)
            zipf.write(json_file_path, os.path.relpath(json_file_path, json_dir))
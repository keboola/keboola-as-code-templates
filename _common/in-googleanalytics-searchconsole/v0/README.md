# IN-GOOGLEANALYTICS-SEARCHCONSOLE

This template enriches Google analytics template with data from Google Search Console.

## Steps to make:
1. Authorize account in extractor
2. Run orchestration

## Included components' configurations:
EX -> TR –> ORCH

### EX: [IN-GOOGLEANALYTICS-SEARCHCONSOLE] Extractor

This extractor is getting data from Google Search Console.

### TR: [IN-GOOGLEANALYTICS-SEARCHCONSOLE] Transformation

Google search console results are grouped by URL and date. 

### ORCH: [IN-GOOGLEANALYTICS-SEARCHCONSOLE] Orchestration: BDM Creation

This orchestration includes Google search console extractor and one transformation which prepare data for BDM model.

## Business Data Model


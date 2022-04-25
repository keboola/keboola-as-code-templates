# IN-THOUGHTSPOT-GOOGLEANALYTICS

This is an end to end flow for getting data from Google Analytics and transforming them.

## Steps to make:
1. Setup profile in extractor
2. Run orchestration

## Included components' configurations:
EX -> TR –> ORCH

### EX: [IN-THOUGHTSPOT-GOOGLEANALYTICS] Extractor

This extractor is getting data from Google Analytics. It's an incremental update.

### TR: [IN-THOUGHTSPOT-GOOGLEANALYTICS] Transformation

This transformation is forming data from Google Analytics into requested shape.

### ORCH: [IN-THOUGHTSPOT-GOOGLEANALYTICS] Orchestration: BDM Creation

This orchestration includes Extractor and one transformation which prepare data for BDM model.

## Business Data Model



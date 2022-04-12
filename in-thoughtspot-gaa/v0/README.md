# IN-THOUGHTSPOT-GAA

This is an end to end flow for getting data from Google Analytics and visualizing them in spotapp.

## Steps to make:
1. Setup profile in extractor
2. Run orchestration

## Included components' configurations:
EX -> TR –> ORCH

### EX: [IN-THOUGHTSPOT-GAA] Extractor

This extractor is getting data from Google Analytics. It's an incremental update.

### TR: [IN-THOUGHTSPOT-GAA] Transformation

This transformation is forming data from Google Analytics into requested shape.

### ORCH: [IN-THOUGHTSPOT-GAA] Orchestration: BDM Creation

This orchestration includes Extractor and one transformation which prepare data for BDM model.

## Business Data Model



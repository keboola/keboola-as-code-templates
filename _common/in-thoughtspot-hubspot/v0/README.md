# IN-THOUGHTSPOT-HUBSPOT

This is an end to end flow for getting data from Hubspot and transforming them.

## Steps to make:
1. Setup profile in extractor
2. Run orchestration

## Included components' configurations:
EX -> TR –> ORCH

### EX: [IN-THOUGHTSPOT-HUBSPOT] Extractor

This extractor is getting data from Hubspot. It's an incremental update.

### TR: [IN-THOUGHTSPOT-HUBSPOT] Transformation

This transformation is forming data from Hubspot into requested shape.

### ORCH: [IN-THOUGHTSPOT-HUBSPOT] Orchestration: BDM Creation

This orchestration includes Extractor and one transformation which prepare data for BDM model.

## Business Data Model





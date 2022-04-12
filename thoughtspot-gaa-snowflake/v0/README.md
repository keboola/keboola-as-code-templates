# THOUGHTSPOT-GAA-SNOWFLAKE

This is an end to end flow for getting data from Google Analytics and visualizing them in spotapp.

## Steps to make:
1. Setup profile in extractor
2. Run orchestration

## Included components' configurations:
EX -> TR -> WR –> ORCH

### EX: [THOUGHTSPOT-GAA-SNOWFLAKE] Extractor

This extractor is getting data from Google Analytics. It's an incremental update.

### TR: [THOUGHTSPOT-GAA-SNOWFLAKE] Transformation

This transformation is forming data from Google Analytics into requested shape.

### WR: [THOUGHTSPOT-GAA-SNOWFLAKE] Writer

Writer loads transformed data into Snowflake database.

### ORCH: [THOUGHTSPOT-GAA-SNOWFLAKE] Orchestration

This orchestration includes Extractor, Transformation and Writer.

## Business Data Model


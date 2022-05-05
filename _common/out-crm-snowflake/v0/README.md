# OUT-CRM-SNOWFLAKE

This template is useful for writing transformed CRM data to a Snowflake database.

## Steps to make:

1. Fill credentials
2. Run orchestration

## Included components' configurations:

Snowflake WR -> ORCH

### WR: [OUT-CRM-SNOWFLAKE] Writer

Writer load data into a Snowflake database.

### ORCH: [OUT-CRM-SNOWFLAKE] Orchestration: BDM Usage

This orchestration use writer to load created Hubspot CRM BDM to Snowflake database.
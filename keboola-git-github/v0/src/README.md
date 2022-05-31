# KEBOOLA-GIT-GITHUB

By using this end-to-end flow you can extract data from GitHub and transform it into visualizations in your BI tool or anywhere else you prefer.

## Steps to take:
1. Authorize GitHub data source
2. Optionaly select and authorize data destinations
3. Run the flow

## Included components' configurations:

GitHub DS -> TR1 -> TR2 -> DD -> FLOW


### DS: Data Source [IN-GIT-GITHUB]

GitHub data source collects data about organizations, teams, members, repositories, commits, issues and pull requests.

### TR1: Transformation1: Organization, User [IN-GIT-GITHUB] 

In this transformation, tables with organizations and users are created. These tables are used in the second transformation.

### TR2: Transformation2: Output Tables Creation [IN-GIT-GITHUB]

Within this transformation, output tables are done to be able to do simple visualization.

### DD: Data Destination [OUT-GIT-GSHEET]  OR [OUT-GIT-SNOWFLAKE] OR [OUT-GIT-BIGQUERY]

The data destination loads data into a Google sheet or a Snowflake database or a BigQuery database.

### FLOW: Flow [GIT-GITHUB] 

The Flow gets the data from GitHub Data Source, transforms the data and optionally writes the data into selected data destinations.

## Business Data Model





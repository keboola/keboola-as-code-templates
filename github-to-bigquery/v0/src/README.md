# GITHUB-TO-BIGQUERY

By using this end-to-end flow you can extract data from GitHub and transform it into visualizations in your BI tool or anywhere else you prefer.

## Steps to take:
1. Authorize GitHub data source
2. Authorize data destination
3. Run the flow

## Included components' configurations:

GitHub DS -> TR1 -> TR2 -> DD -> FLOW


### DS: Data Source [IN-GIT-GITHUB]

GitHub data source collects data about organizations, teams, members, repositories, commits, issues and pull requests.

### TR1: Transformation1: Organization, User [IN-GIT-GITHUB] 

In this transformation, tables with organizations and users are created. These tables are used in the second transformation.

### TR2: Transformation2: Output Tables Creation [IN-GIT-GITHUB]

Within this transformation, output tables are done to be able to do simple visualization.

### DD: Data Destination [OUT-GIT-BIGQUERY]

The data destination loads data into a BigQuery database.

### FLOW: Flow [GITHUB-TO-BIGQUERY] 

The Flow gets the data from GitHub Data Source, transforms the data and optionally writes the data into BigQuery data destination.

## Business Data Model





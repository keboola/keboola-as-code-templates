# ASANA-TO-GOOGLESHEET

By using this end-to-end flow you can extract data from Asana and transform it into visualizations in your BI tool or anywhere else you prefer.

## Steps to take:
1. Fill out your API key in the Asana data source
2. Authorize data destination
3. Run the flow

## Included components' configurations:

Asana DS -> TR1 -> TR2 -> TR3 -> DD -> FLOW


### DS: Data Source [IN-MGMT-ASANA]

Asana data source gathers data about projects and tasks.

### TR1: Transformation1: User, Project [IN-MGMT-ASANA] 

In this Transformation, output table with projects is created and snapshot project table is done to be able to track progress in time.

### TR2: Transformation2: Tasks [IN-MGMT-ASANA]

Within this transformation, output table with tasks is created and snapshot task table is done to be able to track progress in time.

### TR3: Transformation3: Snapshots [IN-MGMT-ASANA]

The third transformation creates task snapshot table and project snapshot table. Task snapshot table defines if there has been change of section, assignee or due date project snapshot table. The project snapshot table defines if there has been change of status, owner or due date and counts number of days in previous stage.

### DD: Data Destination [OUT-MGMT-GSHEET]

The data destination loads data into a Google sheet.

### FLOW: Flow [ASANA-TO-GOOGLESHEET] 

The Flow gets the data from Asana Data Source, transforms the data, creates snapshots and optionally writes the data into Google sheet data destination.

## Business Data Model




{ mainConfig: {
    componentId: "keboola.orchestrator",
    id: ConfigId("flow-mgmt-jira"),
  },
  configurations: std.filter(function(v) v != null,[
    {
      componentId: "keboola.orchestrator",
      id: ConfigId("flow-mgmt-jira"),
      path: "other/keboola.orchestrator/flow-mgmt-jira",
      rows: [],
    },
    {
      componentId: "kds-team.ex-jira",
      id: ConfigId("data-source-in-mgmt-jira"),
      path: "<common>/in-mgmt-jira/extractor/kds-team.ex-jira/data-source-in-mgmt-jira",
      rows: [],
    },

	if HasProjectBackend("snowflake") then {
	  componentId: "keboola.snowflake-transformation",
	  id: ConfigId("transformation-in-mgmt-jira"),
	  path: "<common>/in-mgmt-jira/transformation/keboola.snowflake-transformation/transformation-in-mgmt-jira",
	  rows: [],
	  metadata: { "KBC.configuration.folderName": "[MGMT-JIRA]"}
	} else if HasProjectBackend("bigquery") then {
	  componentId: "keboola.google-bigquery-transformation",
	  id: ConfigId("transformation-in-mgmt-jira"),
	  path: "<common>/in-mgmt-jira/transformation/keboola.google-bigquery-transformation/transformation-in-mgmt-jira",
	  rows: [],
	  metadata: { "KBC.configuration.folderName": "[MGMT-JIRA]"}
    },
     if InputIsAvailable("wr-google-bigquery-v2-service-account-private-key") then
    {
      componentId: "keboola.wr-google-bigquery-v2",
      id: ConfigId("data-destination-out-mgmt-bigquery"),
      path: "<common>/out-mgmt-bigquery/writer/keboola.wr-google-bigquery-v2/data-destination-out-mgmt-bigquery",
      rows: [
        {
          id: ConfigRowId("project"),
          path: "rows/project",
        },
        {
          id: ConfigRowId("project-snapshot"),
          path: "rows/project-snapshot",
        },
        {
          id: ConfigRowId("project-user"),
          path: "rows/project-user",
        },
        {
          id: ConfigRowId("task"),
          path: "rows/task",
        },
        {
          id: ConfigRowId("task-custom-field"),
          path: "rows/task-custom-field",
        },
        {
          id: ConfigRowId("task-event"),
          path: "rows/task-event",
        },
        {
          id: ConfigRowId("task-snapshot"),
          path: "rows/task-snapshot",
        },
        {
          id: ConfigRowId("task-tag"),
          path: "rows/task-tag",
        },
        {
          id: ConfigRowId("task-user"),
          path: "rows/task-user",
        },
        {
          id: ConfigRowId("user"),
          path: "rows/user",
        },
      ],
    },
    if InputIsAvailable("google-sheet-id") then
    {
      componentId: "keboola.wr-google-sheets",
      id: ConfigId("data-destination-out-mgmt-gsheet"),
      path: "<common>/out-mgmt-gsheet/writer/keboola.wr-google-sheets/data-destination-out-mgmt-gsheet",
      rows: [],
    },
    if InputIsAvailable("wr-snowflake-db-host") then
    {
      componentId: SnowflakeWriterComponentId(),
      id: ConfigId("data-destination-out-mgmt-snowflake"),
      path: "<common>/out-mgmt-snowflake/writer/keboola.wr-snowflake/data-destination-out-mgmt-snowflake",
      rows: [
        {
          id: ConfigRowId("project-001"),
          path: "rows/project-001",
        },
        {
          id: ConfigRowId("project-snapshot-001"),
          path: "rows/project-snapshot-001",
        },
        {
          id: ConfigRowId("project-user-001"),
          path: "rows/project-user-001",
        },
        {
          id: ConfigRowId("task-001"),
          path: "rows/task-001",
        },
        {
          id: ConfigRowId("task-custom-field-001"),
          path: "rows/task-custom-field-001",
        },
        {
          id: ConfigRowId("task-event-001"),
          path: "rows/task-event-001",
        },
        {
          id: ConfigRowId("task-snapshot-001"),
          path: "rows/task-snapshot-001",
        },
        {
          id: ConfigRowId("task-tag-001"),
          path: "rows/task-tag-001",
        },
        {
          id: ConfigRowId("task-user-001"),
          path: "rows/task-user-001",
        },
        {
          id: ConfigRowId("user-001"),
          path: "rows/user-001",
        },
      ],
    },
    if InputIsAvailable("wr-postgresql-db-hostname") then
    {
      componentId: "keboola.wr-db-pgsql",
      id: ConfigId("out-mgmt-postgresql-writer"),
      path: "<common>/out-mgmt-postgresql/v0/src/writer/keboola.wr-db-pgsql/out-mgmt-postgresql-writer",
      rows: [
        {
          id: ConfigRowId("project"),
          path: "rows/project",
        },
        {
          id: ConfigRowId("project-snapshot"),
          path: "rows/project-snapshot",
        },
        {
          id: ConfigRowId("project-user"),
          path: "rows/project-user",
        },
        {
          id: ConfigRowId("task"),
          path: "rows/task",
        },
        {
          id: ConfigRowId("task-custom-field"),
          path: "rows/task-custom-field",
        },
        {
          id: ConfigRowId("task-event"),
          path: "rows/task-event",
        },
        {
          id: ConfigRowId("task-snapshot"),
          path: "rows/task-snapshot",
        },
        {
          id: ConfigRowId("task-tag"),
          path: "rows/task-tag",
        },
        {
          id: ConfigRowId("task-user"),
          path: "rows/task-user",
        },
        {
          id: ConfigRowId("user"),
          path: "rows/user",
        },
      ],
    },
  ],)
}

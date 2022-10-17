{
  parameters: {},
  storage: {
    input: {
      tables: [
        {
          source: "in.c-keboola-ex-telemetry-data-" + ConfigId("telemetry-activity-center-project") + ".kbc_project",
          destination: "kbc_project",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-kds-team-ex-kbc-project-metadata-v2-" + ConfigId("metadata-activity-center-project") + ".tables",
          destination: "tables",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-kds-team-ex-kbc-project-metadata-v2-" + ConfigId("metadata-activity-center-project") + ".tables-columns",
          destination: "tables-columns",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-kds-team-ex-kbc-project-metadata-v2-" + ConfigId("metadata-activity-center-project") + ".tables-columns-metadata",
          destination: "tables-columns-metadata",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-kds-team-ex-kbc-project-metadata-v2-" + ConfigId("metadata-activity-center-project") + ".tables-metadata",
          destination: "tables-metadata",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
      ],
    },
    output: {
      tables: [
        {
          destination: "out.c-datahub.table-level-metadata",
          source: "table-level-metadata",
        },
      ],
    },
  },
}

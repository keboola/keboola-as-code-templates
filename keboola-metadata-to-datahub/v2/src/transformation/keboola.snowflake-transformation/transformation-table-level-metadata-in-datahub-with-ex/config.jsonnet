{
  parameters: {},
  storage: {
    input: {
      tables: [
        {
          source: "in.c-" + Input("telemetry-folder") + ".kbc_project",
          destination: "kbc_project",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-" + Input("metadata-folder") + ".tables",
          destination: "tables",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-" + Input("metadata-folder") + ".tables-columns",
          destination: "tables-columns",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-" + Input("metadata-folder") + ".tables-columns-metadata",
          destination: "tables-columns-metadata",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-" + Input("metadata-folder") + ".tables-metadata",
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
          destination: "out.c-datahub-" + InstanceIdShort() + ".table-level-metadata",
          source: "table-level-metadata",
        },
      ],
    },
  },
}

{
  storage: {
    input: {
      tables: [
        {
          source: "out.c-datahub-" + InstanceIdShort() + ".table-level-metadata",
          destination: "table-level-metadata.csv",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "out.c-datahub-" + InstanceIdShort() + ".storage_inputs_and_outputs",
          destination: "storage-inputs-and-outputs.csv",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
      ],
    },
  },
  parameters: {
    jobs: {
      tags: true,
      schema: true,
      properties: true,
    },
    tags: [
      "is_alias",
      "is_deprecated",
    ],
    deprecated_in: 90,
    "#datahub_token": Input("app-datahub-datahub-token"),
    server_address: Input("app-datahub-server-address"),
  },
}

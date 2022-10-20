{
  parameters: {},
  storage: {
    input: {
      tables: [
        {
          source: "in.c-" + Input("metadata-folder") + ".configurations",
          destination: "configurations",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-" + Input("telemetry-folder") + ".kbc_project",
          destination: "kbc_project",
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
          destination: "out.c-datahub-" + InstanceIdShort() + ".configuration_json",
          source: "configuration_json",
        },
        {
          destination: "out.c-datahub-" + InstanceIdShort() + ".rows_json",
          source: "rows_json",
        },
        {
          destination: "out.c-datahub-" + InstanceIdShort() + ".configurations_parsed",
          source: "configurations_parsed",
        },
        {
          destination: "out.c-datahub-" + InstanceIdShort() + ".storage_inputs_and_outputs",
          source: "storage_inputs_and_outputs",
        },
      ],
    },
  },
}

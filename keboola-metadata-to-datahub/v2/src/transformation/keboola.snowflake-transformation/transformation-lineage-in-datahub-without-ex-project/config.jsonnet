{
  parameters: {},
  storage: {
    input: {
      tables: [
        {
          source: "in.c-kds-team-ex-kbc-project-metadata-v2-" + ConfigId("metadata-activity-center-project") + ".configurations",
          destination: "configurations",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-keboola-ex-telemetry-data-" + ConfigId("telemetry-activity-center-project") + ".kbc_project",
          destination: "kbc_project",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-kds-team-ex-kbc-project-metadata-v2-" + ConfigId("metadata-activity-center-project") + ".orchestrations_v2_tasks",
          destination: "orchestrations_v2_tasks",
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

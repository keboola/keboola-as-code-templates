{
  parameters: {},
  storage: {
    input: {
      tables: [
        {
          source: "in.c-kds-team-ex-kbc-project-metadata-v2-" + ConfigId("metadata-activity-center") + ".orchestrations_v2",
          destination: "orchestrations_v2",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-kds-team-ex-kbc-project-metadata-v2-" + ConfigId("metadata-activity-center") + ".configurations",
          destination: "configurations",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-kds-team-ex-kbc-project-metadata-v2-" + ConfigId("metadata-activity-center") + ".orchestrations_v2_phases",
          destination: "orchestrations_v2_phases",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-kds-team-ex-kbc-project-metadata-v2-" + ConfigId("metadata-activity-center") + ".orchestrations_v2_tasks",
          destination: "orchestrations_v2_tasks",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "out.c-datahub-" + InstanceIdShort() + ".storage_inputs_and_outputs",
          destination: "storage_inputs_and_outputs",
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
          destination: "out.c-datahub-" + InstanceIdShort() + ".dataset_lineage",
          source: "dataset_lineage",
        },
        {
          destination: "out.c-datahub-" + InstanceIdShort() + ".flow_tasks",
          source: "flow_tasks",
        },
      ],
    },
  },
}

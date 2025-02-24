{
  parameters: {},
  storage: {
    input: {
      tables: [
        {
          source: "out.c-projectmgmt-tr-" + InstanceIdShort() + ".project_snapshot",
          destination: "project_snapshot",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
          keep_internal_timestamp_column: false,
        },
        {
          source: "out.c-projectmgmt-tr-" + InstanceIdShort() + ".task_snapshot",
          destination: "task_snapshot",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
          keep_internal_timestamp_column: false,
        },
      ],
    },
    output: {
      tables: [
        {
          destination: "out.c-projectmgmt-bdm-" + InstanceIdShort() + ".project_snapshot",
          source: "out_project_snapshot",
          primary_key: [],
        },
        {
          source: "out_task_snapshot",
          destination: "out.c-projectmgmt-bdm-" + InstanceIdShort() + ".task_snapshot",
          primary_key: [],
        },
      ],
    },
  },
}

{
  parameters: {},
  storage: {
    input: {
      tables: [
        {
          source: "out.c-projectmgmt-tr-" + InstanceIdShort() + ".project_snapshot",
          destination: "project_snapshot",
          column_types: [],
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "out.c-projectmgmt-tr-" + InstanceIdShort() + ".task_snapshot",
          destination: "task_snapshot",
          column_types: [],
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
          destination: "out.c-projectmgmt-bdm-" + InstanceIdShort() + ".project_snapshot",
          source: "out_project_snapshot",
          primary_key: [
            "project_id",
            "snapshot_date",
          ],
        },
        {
          destination: "out.c-projectmgmt-bdm-" + InstanceIdShort() + ".task_snapshot",
          source: "out_task_snapshot",
          primary_key: [
            "task_id",
            "snapshot_date",
          ],
        },
      ],
    },
  },
}

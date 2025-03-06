{
  parameters: {},
  storage: {
    input: {
      tables: [
        {
          source: "in.c-kds-team-ex-asana-v2-" + ConfigId("data-source-in-mgmt-asana") + ".sections",
          destination: "sections",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
          keep_internal_timestamp_column: false,
        },
        {
          source: "in.c-kds-team-ex-asana-v2-" + ConfigId("data-source-in-mgmt-asana") + ".task_details",
          destination: "task_details",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
          keep_internal_timestamp_column: false,
        },
        {
          source: "in.c-kds-team-ex-asana-v2-" + ConfigId("data-source-in-mgmt-asana") + ".task_details-memberships",
          destination: "task_details_memberships",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
          keep_internal_timestamp_column: false,
        },
        {
          source: "in.c-kds-team-ex-asana-v2-" + ConfigId("data-source-in-mgmt-asana") + ".task_stories",
          destination: "task_stories",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
          keep_internal_timestamp_column: false,
        },
        {
          source: "in.c-kds-team-ex-asana-v2-" + ConfigId("data-source-in-mgmt-asana") + ".task_details-followers",
          destination: "task_details_followers",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
          keep_internal_timestamp_column: false,
        },
        {
          source: "in.c-kds-team-ex-asana-v2-" + ConfigId("data-source-in-mgmt-asana") + ".tasks",
          destination: "tasks",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
          keep_internal_timestamp_column: false,
        },
        {
          source: "out.c-projectmgmt-bdm-" + InstanceIdShort() + ".project",
          destination: "project",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
          keep_internal_timestamp_column: false,
        },
        {
          source: "out.c-projectmgmt-bdm-" + InstanceIdShort() + ".user",
          destination: "user",
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
          destination: "out.c-projectmgmt-bdm-" + InstanceIdShort() + ".task",
          source: "out_task",
          primary_key: [],
        },
        {
          source: "out_task_tag",
          destination: "out.c-projectmgmt-bdm-" + InstanceIdShort() + ".task_tag",
        },
        {
          source: "out_task_user",
          destination: "out.c-projectmgmt-bdm-" + InstanceIdShort() + ".task_user",
        },
        {
          source: "out_task_snapshot",
          destination: "out.c-projectmgmt-tr-" + InstanceIdShort() + ".task_snapshot",
        },
        {
          source: "out_task_event",
          destination: "out.c-projectmgmt-bdm-" + InstanceIdShort() + ".task_event",
        },
        {
          source: "out_task_custom_field",
          destination: "out.c-projectmgmt-bdm-" + InstanceIdShort() + ".task_custom_field",
        },
      ],
    },
  },
}

{
  parameters: {},
  storage: {
    input: {
      tables: [
        {
          source: "out.c-projectmgmt-tr-" + InstanceIdShort() + ".project",
          destination: "project",
          column_types: [],
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "out.c-projectmgmt-tr-" + InstanceIdShort() + ".user",
          destination: "user",
          column_types: [],
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-leochan-ex-asana-" + ConfigId("data-source-in-mgmt-asana") + ".sections",
          destination: "sections",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-leochan-ex-asana-" + ConfigId("data-source-in-mgmt-asana") + ".task_details",
          destination: "task_details",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-leochan-ex-asana-" + ConfigId("data-source-in-mgmt-asana") + ".task_details-custom_fields",
          destination: "task_details-custom_fields",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-leochan-ex-asana-" + ConfigId("data-source-in-mgmt-asana") + ".task_details-memberships",
          destination: "task_details_memberships",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-leochan-ex-asana-" + ConfigId("data-source-in-mgmt-asana") + ".task_details-tags",
          destination: "task_details_tags",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-leochan-ex-asana-" + ConfigId("data-source-in-mgmt-asana") + ".task_stories",
          destination: "task_stories",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-leochan-ex-asana-" + ConfigId("data-source-in-mgmt-asana") + ".task_details-followers",
          destination: "task_details_followers",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-leochan-ex-asana-" + ConfigId("data-source-in-mgmt-asana") + ".tasks",
          destination: "tasks",
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
          destination: "out.c-projectmgmt-bdm-" + InstanceIdShort() + ".task",
          source: "out_task",
          incremental: true,
          delete_where_column: "",
          delete_where_operator: "eq",
          delete_where_values: [],
          primary_key: [
            "task_id",
          ],
        },
        {
          destination: "out.c-projectmgmt-bdm-" + InstanceIdShort() + ".task_tag",
          source: "out_task_tag",
          primary_key: [
            "task_id",
            "tag",
          ],
        },
        {
          destination: "out.c-projectmgmt-bdm-" + InstanceIdShort() + ".task_user",
          source: "out_task_user",
          primary_key: [
            "user_id",
            "task_id",
          ],
        },
        {
          destination: "out.c-projectmgmt-tr-" + InstanceIdShort() + ".task_snapshot",
          primary_key: [
            "task_id",
            "snapshot_date",
          ],
          incremental: true,
          delete_where_column: "",
          delete_where_operator: "eq",
          delete_where_values: [],
          source: "out_task_snapshot",
        },
        {
          destination: "out.c-projectmgmt-bdm-" + InstanceIdShort() + ".task_event",
          source: "out_task_event",
          primary_key: [
            "task_event_id",
          ],
        },
        {
          destination: "out.c-projectmgmt-bdm-" + InstanceIdShort() + ".task_custom_field",
          source: "out_task_custom_field",
          primary_key: [
            "task_custom_field_id",
          ],
        },
      ],
    },
  },
}

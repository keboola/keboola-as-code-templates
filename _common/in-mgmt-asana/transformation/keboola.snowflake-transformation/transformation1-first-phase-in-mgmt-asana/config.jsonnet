{
  parameters: {},
  storage: {
    input: {
      tables: [
        {
          source: "in.c-leochan-ex-asana-" + ConfigId("data-source-in-mgmt-asana") + ".projects",
          destination: "projects",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-leochan-ex-asana-" + ConfigId("data-source-in-mgmt-asana") + ".projects_details",
          destination: "projects_details",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-leochan-ex-asana-" + ConfigId("data-source-in-mgmt-asana") + ".projects-members",
          destination: "projects_members",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-leochan-ex-asana-" + ConfigId("data-source-in-mgmt-asana") + ".users_details",
          destination: "users_details",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-leochan-ex-asana-" + ConfigId("data-source-in-mgmt-asana") + ".workspaces",
          destination: "workspaces",
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
          destination: "out.c-projectmgmt-tr-" + InstanceIdShort() + ".project",
          source: "out_project",
          primary_key: [
            "project_id",
          ],
          incremental: true,
          delete_where_column: "",
          delete_where_operator: "eq",
          delete_where_values: [],
        },
        {
          destination: "out.c-projectmgmt-tr-" + InstanceIdShort() + ".user",
          source: "out_user",
          primary_key: [
            "user_id",
          ],
        },
        {
          destination: "out.c-projectmgmt-bdm-" + InstanceIdShort() + ".project_user",
          source: "out_project_user",
          primary_key: [
            "user_id",
            "project_id",
          ],
        },
        {
          destination: "out.c-projectmgmt-tr-" + InstanceIdShort() + ".project_snapshot",
          source: "out_project_snapshot",
          incremental: true,
          delete_where_column: "",
          delete_where_operator: "eq",
          delete_where_values: [],
          primary_key: [
            "project_id",
            "snapshot_date",
          ],
        },
      ],
    },
  },
}

{
  parameters: {},
  storage: {
    input: {
      tables: [
        {
          source: "in.c-kds-team-ex-asana-v2-" + ConfigId("data-source-in-mgmt-asana") + ".projects_details",
          destination: "projects_details",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
          keep_internal_timestamp_column: false,
        },
        {
          source: "in.c-kds-team-ex-asana-v2-" + ConfigId("data-source-in-mgmt-asana") + ".workspaces",
          destination: "workspaces",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
          keep_internal_timestamp_column: false,
        },
        {
          source: "in.c-kds-team-ex-asana-v2-" + ConfigId("data-source-in-mgmt-asana") + ".projects-members",
          destination: "projects_members",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
          keep_internal_timestamp_column: false,
        },
        {
          source: "in.c-kds-team-ex-asana-v2-" + ConfigId("data-source-in-mgmt-asana") + ".users_details",
          destination: "users_details",
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
          destination: "out.c-projectmgmt-bdm-" + InstanceIdShort() + ".project",
          source: "out_project",
        },
        {
          destination: "out.c-projectmgmt-bdm-" + InstanceIdShort() + ".user",
          source: "out_user",
        },
        {
          source: "out_project_user",
          destination: "out.c-projectmgmt-bdm-" + InstanceIdShort() + ".project_user",
        },
        {
          source: "out_project_snapshot",
          destination: "out.c-projectmgmt-tr-" + InstanceIdShort() + ".project_snapshot",
        },
      ],
    },
  },
}

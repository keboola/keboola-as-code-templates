{
  parameters: {},
  storage: {
    input: {
      tables: [
        {
          source: "in.c-kds-team-ex-jira-" + ConfigId("data-source-in-mgmt-jira") + ".projects",
          destination: "projects",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
          keep_internal_timestamp_column: false,
        },
        {
          source: "in.c-kds-team-ex-jira-" + ConfigId("data-source-in-mgmt-jira") + ".users",
          destination: "users",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
          keep_internal_timestamp_column: false,
        },
        {
          source: "in.c-kds-team-ex-jira-" + ConfigId("data-source-in-mgmt-jira") + ".issues-changelogs",
          destination: "issues-changelogs",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
          keep_internal_timestamp_column: false,
        },
        {
          source: "in.c-kds-team-ex-jira-" + ConfigId("data-source-in-mgmt-jira") + ".issues",
          destination: "issues",
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
          primary_key: [
            "project_id",
          ],
        },
        {
          destination: "out.c-projectmgmt-bdm-" + InstanceIdShort() + ".user",
          source: "out_user",
          primary_key: [
            "user_id",
          ],
        },
        {
          destination: "out.c-projectmgmt-bdm-" + InstanceIdShort() + ".project_user",
          source: "out_project_user",
          primary_key: [
            "project_id",
            "user_id",
          ],
        },
        {
          destination: "out.c-projectmgmt-bdm-" + InstanceIdShort() + ".task",
          source: "out_task",
          primary_key: [
            "task_id",
          ],
        },
        {
          destination: "out.c-projectmgmt-bdm-" + InstanceIdShort() + ".task_custom_field",
          source: "out_task_custom_field",
          primary_key: [
            "task_custom_field_id",
          ],
        },
        {
          destination: "out.c-projectmgmt-bdm-" + InstanceIdShort() + ".task_event",
          source: "out_task_event",
          primary_key: [
            "task_event_id",
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
            "task_id",
            "user_id",
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
        {
          destination: "out.c-projectmgmt-bdm-" + InstanceIdShort() + ".project_snapshot",
          source: "out_project_snapshot",
          primary_key: [
            "project_id",
            "snapshot_date",
          ],
        },
      ],
    },
  },
}

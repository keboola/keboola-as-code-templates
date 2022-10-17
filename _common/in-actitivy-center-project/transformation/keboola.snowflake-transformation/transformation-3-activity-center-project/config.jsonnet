{
  parameters: {},
  storage: {
    input: {
      tables: [
        {
            source: "in.c-kds-team-ex-kbc-project-metadata-v2-" + ConfigId("metadata-activity-center-project") + ".configurations",
            destination: "md_configurations",
            where_column: "",
            where_values: [],
            where_operator: "eq",
            columns: []
        },
        {
            source: "out.c-activity-center-project.configurations",
            destination: "configurations",
            where_column: "",
            where_values: [],
            where_operator: "eq",
            columns: []
        },
        {
            source: "out.c-activity-center-project.jobs",
            destination: "jobs",
            where_column: "",
            where_values: [],
            where_operator: "eq",
            columns: []
        },
        {
            source: "out.c-activity-center-project.users",
            destination: "users",
            where_column: "",
            where_values: [],
            where_operator: "eq",
            columns: []
        },
        {
            source: "out.c-activity-center-project.tokens",
            destination: "tokens",
            where_column: "",
            where_values: [],
            where_operator: "eq",
            columns: []
        },
        {
            source: "out.c-activity-center-project.security_events",
            destination: "security_events",
            where_column: "",
            where_values: [],
            where_operator: "eq",
            columns: []
        },
        {
            source: "out.c-activity-center-project.configurations_versions",
            destination: "configurations_versions",
            where_column: "",
            where_values: [],
            where_operator: "eq",
            columns: []
        },
        {
            source: "in.c-kds-team-ex-kbc-project-metadata-v2-" + ConfigId("metadata-activity-center-project") + ".triggers",
            destination: "md_triggers",
            where_column: "",
            where_values: [],
            where_operator: "eq",
            columns: []
        },
        {
            source: "in.c-kds-team-ex-kbc-project-metadata-v2-" + ConfigId("metadata-activity-center-project") + ".tokens",
            destination: "md_tokens",
            where_column: "",
            where_values: [],
            where_operator: "eq",
            columns: []
        },
        {
            source: "in.c-kds-team-ex-kbc-project-metadata-v2-" + ConfigId("metadata-activity-center-project") + ".orchestrations-notifications",
            destination: "md_orchestrations_notifications",
            where_column: "",
            where_values: [],
            where_operator: "eq",
            columns: []
        },
        {
            source: "in.c-kds-team-ex-kbc-project-metadata-v2-" + ConfigId("metadata-activity-center-project") + ".orchestrations",
            destination: "md_orchestrations",
            where_column: "",
            where_values: [],
            where_operator: "eq",
            columns: []
        },
        {
            source: "in.c-kds-team-ex-kbc-project-metadata-v2-" + ConfigId("metadata-activity-center-project") + ".orchestrations-tasks",
            destination: "md_orchestrations_tasks",
            where_column: "",
            where_values: [],
            where_operator: "eq",
            columns: []
        },
        {
            source: "out.c-activity-center-project.projects",
            destination: "projects",
            where_column: "",
            where_values: [],
            where_operator: "eq",
            columns: []
        },
        {
            source: "out.c-activity-center-project.tables",
            destination: "tables",
            where_column: "",
            where_values: [],
            where_operator: "eq",
            columns: []
        },
        {
            source: "out.c-activity-center-project.tables_metrics",
            destination: "tables_metrics",
            where_column: "",
            where_values: [],
            where_operator: "eq",
            columns: []
        },
        {
            source: "out.c-activity-center-project.snowflake_statistics",
            destination: "snowflake_statistics",
            where_column: "",
            where_values: [],
            where_operator: "eq",
            columns: []
        }
            ]
        },
        output: {
            tables: [
                {
                    destination: "out.c-activity-center-project.configurations_health",
                    source: "out_configuration_health",
                    primary_key: []
                },
                {
                    destination: "out.c-activity-center-project.users_events",
                    source: "out_user_events"
                },
                {
                    destination: "out.c-activity-center-project.users_metrics",
                    source: "out_users_metrics"
                },
                {
                    destination: "out.c-activity-center-project.latest_configurations",
                    source: "out_latest_configurations"
                },
                {
                    destination: "out.c-activity-center-project.orchestrations",
                    source: "out_orchestrations",
                    primary_key: []
                },
                {
                    destination: "out.c-activity-center-project.orchestrations_tasks",
                    source: "out_orchestrations_tasks",
                    primary_key: []
                },
                {
                    destination: "out.c-activity-center-project.orchestrations_notifications",
                    source: "out_orchestrations_notifications",
                    primary_key: []
                },
                {
                    destination: "out.c-activity-center-project.projects_metrics",
                    source: "out_projects_metrics"
                }
            ]
        }
    }
}
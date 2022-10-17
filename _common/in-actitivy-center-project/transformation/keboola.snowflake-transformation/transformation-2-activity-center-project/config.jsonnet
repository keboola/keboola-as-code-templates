{
  parameters: {},
  storage: {
    input: {
      tables: [
        {
          source: "in.c-keboola-ex-telemetry-data-" + ConfigId("telemetry-activity-center-project") + ".kbc_usage_metrics_values",
          destination: "kbc_usage_metrics_values",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-keboola-ex-telemetry-data-" + ConfigId("telemetry-activity-center-project") + ".kbc_component_configuration_version",
          destination: "kbc_component_configuration_version",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-keboola-ex-telemetry-data-" + ConfigId("telemetry-activity-center-project") + ".kbc_snowflake_stats",
          destination: "kbc_snowflake_stats",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-keboola-ex-telemetry-data-" + ConfigId("telemetry-activity-center-project") + ".kbc_component_configuration",
          destination: "kbc_component_configuration",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-keboola-ex-telemetry-data-" + ConfigId("telemetry-activity-center-project") + ".kbc_bucket_snapshot",
          destination: "kbc_bucket_snapshot",
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
          source: "in.c-keboola-ex-telemetry-data-" + ConfigId("telemetry-activity-center-project") + ".kbc_project_snapshot",
          destination: "kbc_project_snapshot",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-keboola-ex-telemetry-data-" + ConfigId("telemetry-activity-center-project") + ".kbc_job",
          destination: "kbc_job",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-keboola-ex-telemetry-data-" + ConfigId("telemetry-activity-center-project") + ".kbc_project_user",
          destination: "kbc_project_user",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-keboola-ex-telemetry-data-" + ConfigId("telemetry-activity-center-project") + ".kbc_table_snapshot",
          destination: "kbc_table_snapshot",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-kds-team-ex-kbc-project-metadata-v2-" + ConfigId("metadata-activity-center-project") + ".tables",
          destination: "md_tables",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-kds-team-ex-kbc-project-metadata-v2-" + ConfigId("metadata-activity-center-project") + ".tables-metadata",
          destination: "md_tables_metadata",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-kds-team-ex-kbc-project-metadata-v2-" + ConfigId("metadata-activity-center-project") + ".tokens",
          destination: "md_tokens",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-kds-team-ex-kbc-project-metadata-v2-" + ConfigId("metadata-activity-center-project") + ".tokens-last-events",
          destination: "md_tokens_events",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-kds-team-ex-kbc-project-metadata-v2-" + ConfigId("metadata-activity-center-project") + ".configurations",
          destination: "md_configurations",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-kds-team-ex-kbc-project-metadata-v2-" + ConfigId("metadata-activity-center-project") + ".orchestrations-notifications",
          destination: "md_orchestrations_notifications",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-kds-team-ex-kbc-project-metadata-v2-" + ConfigId("metadata-activity-center-project") + ".orchestrations",
          destination: "md_orchestrations",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-kds-team-ex-kbc-project-metadata-v2-" + ConfigId("metadata-activity-center-project") + ".orchestrations-tasks",
          destination: "md_orchestrations_tasks",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-kds-team-ex-kbc-project-metadata-v2-" + ConfigId("metadata-activity-center-project") + ".triggers",
          destination: "md_triggers",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-keboola-ex-telemetry-data-" + ConfigId("telemetry-activity-center-project") + ".security_event",
          destination: "security_event",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-kds-team-ex-kbc-project-metadata-v2-" + ConfigId("metadata-activity-center-project") + ".transformations-v2",
          destination: "transformations",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: []
        },
        {
          source: "in.c-kds-team-ex-kbc-project-metadata-v2-" + ConfigId("metadata-activity-center-project") + ".transformations-v2-inputs",
          destination: "transformations-inputs",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: []
        },
        {
          source: "in.c-kds-team-ex-kbc-project-metadata-v2-" + ConfigId("metadata-activity-center-project") + ".transformations-v2-outputs",
          destination: "transformations-outputs",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: []
        },
        {
          source: "in.c-kds-team-ex-kbc-project-metadata-v2-" + ConfigId("metadata-activity-center-project") + ".transformations-v2-codes",
          destination: "transformations-queries",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: []
        },
        {
          source: "out.c-activity-center-project.analyser-inputs",
          destination: "analyser-inputs",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: []
        }
      ],
    },
    output: {
      tables: [
        {
          destination: "out.c-activity-center-project.components",
          source: "out_components",
          primary_key: [
            "component_id",
          ],
        },
        {
          destination: "out.c-activity-center-project.configurations",
          source: "out_configurations",
          primary_key: [
            "component_configuration_id",
          ],
        },
        {
          destination: "out.c-activity-center-project.configurations_versions",
          source: "out_configurations_versions",
          primary_key: [
            "component_configuration_version_id",
          ],
        },
        {
          destination: "out.c-activity-center-project.jobs",
          source: "out_jobs",
          primary_key: [
            "job_id",
          ],
        },
        {
          destination: "out.c-activity-center-project.snowflake_statistics",
          source: "out_snowflake",
          primary_key: [
            "snowflake_job_id",
          ],
        },
        {
          destination: "out.c-activity-center-project.tables",
          source: "out_tables",
          primary_key: [
            "table_project_id",
          ],
        },
        {
          destination: "out.c-activity-center-project.tables_metrics",
          source: "out_tables_metrics",
          primary_key: [
            "table_snapshot_id",
          ],
        },
        {
          destination: "out.c-activity-center-project.buckets",
          source: "out_buckets",
          primary_key: [
            "bucket_project_id",
          ],
        },
        {
          destination: "out.c-activity-center-project.buckets_metrics",
          source: "out_buckets_metrics",
          primary_key: [
            "bucket_snapshot_id",
          ],
        },
        {
          destination: "out.c-activity-center-project.users",
          source: "out_users",
        },
        {
          destination: "out.c-activity-center-project.tokens",
          source: "out_tokens",
        },
        {
          destination: "out.c-activity-center-project.tokens_events",
          source: "out_tokens_last_events",
        },
        {
          destination: "out.c-activity-center-project.projects",
          source: "out_projects",
        },
        {
          destination: "out.c-activity-center-project.security_events",
          source: "out_security_events",
        },
        {
          destination: "out.c-activity-center-project.transformations",
          source: "out_transformations_rows"
        },
        {
          destination: "out.c-activity-center-project.transformations_inputs",
          source: "out_transformations_inputs"
        }
      ],
    },
  },
}

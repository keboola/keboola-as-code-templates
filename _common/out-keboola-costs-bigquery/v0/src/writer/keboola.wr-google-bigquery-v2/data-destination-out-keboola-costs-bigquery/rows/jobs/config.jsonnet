{
  storage: {
    input: {
      tables: [
        {
          source: "out.c-keboola-costs.jobs",
          destination: "out.c-keboola-costs.jobs.csv",
          changed_since: "adaptive",
          columns: [
            "job_id",
            "job_number",
            "component_configuration_id",
            "job_start",
            "job_start_date",
            "job_created",
            "job_created_date",
            "job_runtime",
            "job_end",
            "job_waittime",
            "job_status",
            "job_run_type",
            "job_billed_credits",
            "job_time_credits",
            "job_network_mb",
            "token_id",
            "token_name",
            "job_ds_backend",
            "job_dwh_small_ratio",
            "job_dwh_medium_ratio",
            "job_dwh_large_ratio",
            "job_url",
            "job_transformation_type",
            "job_run_id",
            "parent_job_run_id",
            "job_is_child",
          ],
        },
      ],
    },
  },
  parameters: {
    tables: [
      {
        dbName: "jobs",
        tableId: "out.c-keboola-costs.jobs",
        incremental: true,
        items: [
          {
            name: "job_id",
            dbName: "job_id",
            type: "STRING",
          },
          {
            name: "job_number",
            dbName: "job_number",
            type: "STRING",
          },
          {
            name: "component_configuration_id",
            dbName: "component_configuration_id",
            type: "STRING",
          },
          {
            name: "job_start",
            dbName: "job_start",
            type: "STRING",
          },
          {
            name: "job_start_date",
            dbName: "job_start_date",
            type: "STRING",
          },
          {
            name: "job_created",
            dbName: "job_created",
            type: "STRING",
          },
          {
            name: "job_created_date",
            dbName: "job_created_date",
            type: "STRING",
          },
          {
            name: "job_runtime",
            dbName: "job_runtime",
            type: "STRING",
          },
          {
            name: "job_end",
            dbName: "job_end",
            type: "STRING",
          },
          {
            name: "job_waittime",
            dbName: "job_waittime",
            type: "INTEGER",
          },
          {
            name: "job_status",
            dbName: "job_status",
            type: "STRING",
          },
          {
            name: "job_run_type",
            dbName: "job_run_type",
            type: "STRING",
          },
          {
            name: "job_billed_credits",
            dbName: "job_billed_credits",
            type: "STRING",
          },
          {
            name: "job_time_credits",
            dbName: "job_time_credits",
            type: "STRING",
          },
          {
            name: "job_network_mb",
            dbName: "job_network_mb",
            type: "STRING",
          },
          {
            name: "token_id",
            dbName: "token_id",
            type: "STRING",
          },
          {
            name: "token_name",
            dbName: "token_name",
            type: "STRING",
          },
          {
            name: "job_ds_backend",
            dbName: "job_ds_backend",
            type: "STRING",
          },
          {
            name: "job_dwh_small_ratio",
            dbName: "job_dwh_small_ratio",
            type: "STRING",
          },
          {
            name: "job_dwh_medium_ratio",
            dbName: "job_dwh_medium_ratio",
            type: "STRING",
          },
          {
            name: "job_dwh_large_ratio",
            dbName: "job_dwh_large_ratio",
            type: "STRING",
          },
          {
            name: "job_url",
            dbName: "job_url",
            type: "STRING",
          },
          {
            name: "job_transformation_type",
            dbName: "job_transformation_type",
            type: "STRING",
          },
          {
            name: "job_run_id",
            dbName: "job_run_id",
            type: "STRING",
          },
          {
            name: "parent_job_run_id",
            dbName: "parent_job_run_id",
            type: "STRING",
          },
          {
            name: "job_is_child",
            dbName: "job_is_child",
            type: "BOOLEAN",
          },
        ],
      },
    ],
  },
}

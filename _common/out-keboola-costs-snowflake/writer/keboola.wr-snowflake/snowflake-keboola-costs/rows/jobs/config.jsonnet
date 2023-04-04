{
  parameters: {
    tableId: "out.c-keboola-costs.jobs",
    dbName: "jobs",
    incremental: true,
    primaryKey: [
      "job_id",
    ],
    items: [
      {
        name: "job_id",
        dbName: "job_id",
        type: "text",
        nullable: false,
        default: "",
        size: "1000",
      },
      {
        name: "job_number",
        dbName: "job_number",
        type: "text",
        nullable: true,
        default: "",
        size: "1000",
      },
      {
        name: "component_configuration_branch_id",
        dbName: "component_configuration_branch_id",
        type: "text",
        nullable: true,
        default: "",
        size: "1000",
      },
      {
        name: "component_configuration_id",
        dbName: "component_configuration_id",
        type: "text",
        nullable: true,
        default: "",
        size: "1000",
      },
      {
        name: "job_start",
        dbName: "job_start",
        type: "text",
        nullable: true,
        default: "",
        size: "30",
      },
      {
        name: "job_start_date",
        dbName: "job_start_date",
        type: "date",
        nullable: true,
        default: "",
        size: "",
      },
      {
        name: "job_created",
        dbName: "job_created",
        type: "text",
        nullable: true,
        default: "",
        size: "30",
      },
      {
        name: "job_created_date",
        dbName: "job_created_date",
        type: "date",
        nullable: true,
        default: "",
        size: "",
      },
      {
        name: "job_runtime",
        dbName: "job_runtime",
        type: "int",
        nullable: true,
        default: "",
        size: "",
      },
      {
        name: "job_end",
        dbName: "job_end",
        type: "text",
        nullable: true,
        default: "",
        size: "30",
      },
      {
        name: "job_waittime",
        dbName: "job_waittime",
        type: "int",
        nullable: true,
        default: "",
        size: "",
      },
      {
        name: "job_status",
        dbName: "job_status",
        type: "text",
        nullable: true,
        default: "",
        size: "20",
      },
      {
        name: "job_run_type",
        dbName: "job_run_type",
        type: "text",
        nullable: true,
        default: "",
        size: "1000",
      },
      {
        name: "job_billed_credits",
        dbName: "job_billed_credits",
        type: "float",
        nullable: true,
        default: "",
        size: "",
      },
      {
        name: "job_time_credits",
        dbName: "job_time_credits",
        type: "float",
        nullable: true,
        default: "",
        size: "",
      },
      {
        name: "job_network_mb",
        dbName: "job_network_mb",
        type: "float",
        nullable: true,
        default: "",
        size: "",
      },
      {
        name: "token_id",
        dbName: "token_id",
        type: "text",
        nullable: true,
        default: "",
        size: "1000",
      },
      {
        name: "token_name",
        dbName: "token_name",
        type: "text",
        nullable: true,
        default: "",
        size: "1000",
      },
      {
        name: "job_ds_backend",
        dbName: "job_ds_backend",
        type: "text",
        nullable: true,
        default: "",
        size: "1000",
      },
      {
        name: "job_dwh_small_ratio",
        dbName: "job_dwh_small_ratio",
        type: "float",
        nullable: true,
        default: "",
        size: "",
      },
      {
        name: "job_dwh_medium_ratio",
        dbName: "job_dwh_medium_ratio",
        type: "float",
        nullable: true,
        default: "",
        size: "",
      },
      {
        name: "job_dwh_large_ratio",
        dbName: "job_dwh_large_ratio",
        type: "float",
        nullable: true,
        default: "",
        size: "",
      },
      {
        name: "job_url",
        dbName: "job_url",
        type: "text",
        nullable: true,
        default: "",
        size: "1000",
      },
      {
        name: "job_transformation_type",
        dbName: "job_transformation_type",
        type: "text",
        nullable: true,
        default: "",
        size: "1000",
      },
      {
        name: "job_run_id",
        dbName: "job_run_id",
        type: "text",
        nullable: true,
        default: "",
        size: "1000",
      },
      {
        name: "parent_job_run_id",
        dbName: "parent_job_run_id",
        type: "text",
        nullable: true,
        default: "",
        size: "1000",
      },
      {
        name: "job_is_child",
        dbName: "job_is_child",
        type: "boolean",
        nullable: true,
        default: "",
        size: "",
      },
    ],
  },
  storage: {
    input: {
      tables: [
        {
          source: "out.c-keboola-costs.jobs",
          destination: "out.c-keboola-costs.jobs.csv",
          columns: [
            "job_id",
            "job_number",
            "component_configuration_branch_id",
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
          changed_since: "adaptive",
        },
      ],
    },
  },
}
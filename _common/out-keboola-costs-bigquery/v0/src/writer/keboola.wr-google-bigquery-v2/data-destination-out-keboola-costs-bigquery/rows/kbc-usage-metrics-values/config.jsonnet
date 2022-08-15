{
  storage: {
    input: {
      tables: [
        {
          source: "in.c-keboola-ex-telemetry-data-19488507.kbc_usage_metrics_values",
          destination: "in.c-keboola-ex-telemetry-data-19488507.kbc_usage_metrics_values.csv",
          changed_since: "adaptive",
          columns: [
            "metrics_values_id",
            "kbc_project_id",
            "usage_metric_id",
            "usage_breakdown",
            "is_sandbox",
            "date",
            "value",
            "organization_value",
            "company_value",
            "time_credits_value",
            "run_time_hours",
            "dst_proj_single",
            "dst_stack_single",
            "dst_proj_company",
            "dst_stack_company",
            "dst_timestamp",
          ],
        },
      ],
    },
  },
  parameters: {
    tables: [
      {
        dbName: "kbc_usage_metrics_values",
        tableId: "in.c-keboola-ex-telemetry-data-19488507.kbc_usage_metrics_values",
        incremental: true,
        items: [
          {
            name: "metrics_values_id",
            dbName: "metrics_values_id",
            type: "STRING",
          },
          {
            name: "kbc_project_id",
            dbName: "kbc_project_id",
            type: "STRING",
          },
          {
            name: "usage_metric_id",
            dbName: "usage_metric_id",
            type: "STRING",
          },
          {
            name: "usage_breakdown",
            dbName: "usage_breakdown",
            type: "STRING",
          },
          {
            name: "is_sandbox",
            dbName: "is_sandbox",
            type: "STRING",
          },
          {
            name: "date",
            dbName: "date",
            type: "STRING",
          },
          {
            name: "value",
            dbName: "value",
            type: "FLOAT",
          },
          {
            name: "organization_value",
            dbName: "organization_value",
            type: "FLOAT",
          },
          {
            name: "company_value",
            dbName: "company_value",
            type: "FLOAT",
          },
          {
            name: "time_credits_value",
            dbName: "time_credits_value",
            type: "FLOAT",
          },
          {
            name: "run_time_hours",
            dbName: "run_time_hours",
            type: "FLOAT",
          },
          {
            name: "dst_proj_single",
            dbName: "dst_proj_single",
            type: "STRING",
          },
          {
            name: "dst_stack_single",
            dbName: "dst_stack_single",
            type: "STRING",
          },
          {
            name: "dst_proj_company",
            dbName: "dst_proj_company",
            type: "STRING",
          },
          {
            name: "dst_stack_company",
            dbName: "dst_stack_company",
            type: "STRING",
          },
          {
            name: "dst_timestamp",
            dbName: "dst_timestamp",
            type: "STRING",
          },
        ],
      },
    ],
  },
}

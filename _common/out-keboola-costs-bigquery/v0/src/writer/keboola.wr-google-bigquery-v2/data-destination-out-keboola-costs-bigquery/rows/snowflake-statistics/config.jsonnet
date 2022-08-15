{
  storage: {
    input: {
      tables: [
        {
          source: "out.c-keboola-costs.snowflake_statistics",
          destination: "out.c-keboola-costs.snowflake_statistics.csv",
          changed_since: "adaptive",
          columns: [
            "snowflake_job_id",
            "project_id",
            "snowflake_job_created",
            "snowflake_job_created_date",
            "dwh_size",
            "snowflake_job_database",
            "snowflake_job_schema",
            "snowflake_job_user",
            "snowflake_job_type",
            "snowflake_job_result",
            "snowflake_job_queries",
            "snowflake_job_length",
            "snowflake_job_credits",
          ],
        },
      ],
    },
  },
  parameters: {
    tables: [
      {
        dbName: "snowflake_statistics",
        tableId: "out.c-keboola-costs.snowflake_statistics",
        incremental: true,
        items: [
          {
            name: "snowflake_job_id",
            dbName: "snowflake_job_id",
            type: "STRING",
          },
          {
            name: "project_id",
            dbName: "project_id",
            type: "STRING",
          },
          {
            name: "snowflake_job_created",
            dbName: "snowflake_job_created",
            type: "STRING",
          },
          {
            name: "snowflake_job_created_date",
            dbName: "snowflake_job_created_date",
            type: "TIMESTAMP",
          },
          {
            name: "dwh_size",
            dbName: "dwh_size",
            type: "STRING",
          },
          {
            name: "snowflake_job_database",
            dbName: "snowflake_job_database",
            type: "STRING",
          },
          {
            name: "snowflake_job_schema",
            dbName: "snowflake_job_schema",
            type: "STRING",
          },
          {
            name: "snowflake_job_user",
            dbName: "snowflake_job_user",
            type: "STRING",
          },
          {
            name: "snowflake_job_type",
            dbName: "snowflake_job_type",
            type: "STRING",
          },
          {
            name: "snowflake_job_result",
            dbName: "snowflake_job_result",
            type: "STRING",
          },
          {
            name: "snowflake_job_queries",
            dbName: "snowflake_job_queries",
            type: "STRING",
          },
          {
            name: "snowflake_job_length",
            dbName: "snowflake_job_length",
            type: "STRING",
          },
          {
            name: "snowflake_job_credits",
            dbName: "snowflake_job_credits",
            type: "STRING",
          },
        ],
      },
    ],
  },
}

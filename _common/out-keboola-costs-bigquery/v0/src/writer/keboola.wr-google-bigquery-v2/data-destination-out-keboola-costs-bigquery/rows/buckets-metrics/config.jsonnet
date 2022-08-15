{
  storage: {
    input: {
      tables: [
        {
          source: "out.c-keboola-costs.buckets_metrics",
          destination: "out.c-keboola-costs.buckets_metrics.csv",
          changed_since: "adaptive",
          columns: [
            "bucket_snapshot_id",
            "bucket_id",
            "bucket_project_id",
            "project_id",
            "bucket_snapshot_date",
            "bucket_rows",
            "bucket_bytes",
            "bucket_gigabytes",
            "bucket_terabytes",
            "is_last",
          ],
        },
      ],
    },
  },
  parameters: {
    tables: [
      {
        dbName: "buckets_metrics",
        tableId: "out.c-keboola-costs.buckets_metrics",
        incremental: true,
        items: [
          {
            name: "bucket_snapshot_id",
            dbName: "bucket_snapshot_id",
            type: "STRING",
          },
          {
            name: "bucket_id",
            dbName: "bucket_id",
            type: "STRING",
          },
          {
            name: "bucket_project_id",
            dbName: "bucket_project_id",
            type: "STRING",
          },
          {
            name: "project_id",
            dbName: "project_id",
            type: "STRING",
          },
          {
            name: "bucket_snapshot_date",
            dbName: "bucket_snapshot_date",
            type: "STRING",
          },
          {
            name: "bucket_rows",
            dbName: "bucket_rows",
            type: "FLOAT",
          },
          {
            name: "bucket_bytes",
            dbName: "bucket_bytes",
            type: "FLOAT",
          },
          {
            name: "bucket_gigabytes",
            dbName: "bucket_gigabytes",
            type: "FLOAT",
          },
          {
            name: "bucket_terabytes",
            dbName: "bucket_terabytes",
            type: "FLOAT",
          },
          {
            name: "is_last",
            dbName: "is_last",
            type: "BOOLEAN",
          },
        ],
      },
    ],
  },
}

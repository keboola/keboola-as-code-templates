{
  parameters: {
    tableId: "out.c-keboola-costs.buckets_metrics",
    dbName: "buckets_metrics",
    incremental: true,
    primaryKey: [
      "bucket_snapshot_id",
    ],
    items: [
      {
        name: "bucket_snapshot_id",
        dbName: "bucket_snapshot_id",
        type: "varchar",
        nullable: true,
        default: "",
        size: "16777216",
      },
      {
        name: "bucket_id",
        dbName: "bucket_id",
        type: "varchar",
        nullable: true,
        default: "",
        size: "16777216",
      },
      {
        name: "bucket_project_id",
        dbName: "bucket_project_id",
        type: "varchar",
        nullable: true,
        default: "",
        size: "16777216",
      },
      {
        name: "project_id",
        dbName: "project_id",
        type: "varchar",
        nullable: true,
        default: "",
        size: "16777216",
      },
      {
        name: "bucket_snapshot_date",
        dbName: "bucket_snapshot_date",
        type: "varchar",
        nullable: true,
        default: "",
        size: "16777216",
      },
      {
        name: "bucket_rows",
        dbName: "bucket_rows",
        type: "number",
        nullable: true,
        default: "",
        size: "38,0",
      },
      {
        name: "bucket_bytes",
        dbName: "bucket_bytes",
        type: "number",
        nullable: true,
        default: "",
        size: "38,0",
      },
      {
        name: "bucket_gigabytes",
        dbName: "bucket_gigabytes",
        type: "float",
        nullable: true,
        default: "",
        size: "",
      },
      {
        name: "bucket_terabytes",
        dbName: "bucket_terabytes",
        type: "float",
        nullable: true,
        default: "",
        size: "",
      },
      {
        name: "is_last",
        dbName: "is_last",
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
          source: "out.c-keboola-costs.buckets_metrics",
          destination: "out.c-keboola-costs.buckets_metrics.csv",
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
          changed_since: "adaptive",
        },
      ],
    },
  },
}
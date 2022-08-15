{
  storage: {
    input: {
      tables: [
        {
          source: "out.c-keboola-costs.buckets",
          destination: "out.c-keboola-costs.buckets.csv",
          changed_since: "adaptive",
          columns: [
            "bucket_project_id",
            "bucket_id",
            "project_id",
            "bucket_name",
            "bucket_stage",
            "bucket_sharing_type",
            "is_alias",
            "bucket_url",
          ],
        },
      ],
    },
  },
  parameters: {
    tables: [
      {
        dbName: "buckets",
        tableId: "out.c-keboola-costs.buckets",
        incremental: true,
        items: [
          {
            name: "bucket_project_id",
            dbName: "bucket_project_id",
            type: "STRING",
          },
          {
            name: "bucket_id",
            dbName: "bucket_id",
            type: "STRING",
          },
          {
            name: "project_id",
            dbName: "project_id",
            type: "STRING",
          },
          {
            name: "bucket_name",
            dbName: "bucket_name",
            type: "STRING",
          },
          {
            name: "bucket_stage",
            dbName: "bucket_stage",
            type: "STRING",
          },
          {
            name: "bucket_sharing_type",
            dbName: "bucket_sharing_type",
            type: "STRING",
          },
          {
            name: "is_alias",
            dbName: "is_alias",
            type: "BOOLEAN",
          },
          {
            name: "bucket_url",
            dbName: "bucket_url",
            type: "STRING",
          },
        ],
      },
    ],
  },
}

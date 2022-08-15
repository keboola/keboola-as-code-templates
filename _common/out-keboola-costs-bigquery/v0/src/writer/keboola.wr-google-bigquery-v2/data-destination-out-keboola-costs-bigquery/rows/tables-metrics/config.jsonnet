{
  storage: {
    input: {
      tables: [
        {
          source: "out.c-keboola-costs.tables_metrics",
          destination: "out.c-keboola-costs.tables_metrics.csv",
          changed_since: "adaptive",
          columns: [
            "table_snapshot_id",
            "table_project_id",
            "project_id",
            "table_snapshot_date",
            "table_rows",
            "table_bytes",
            "table_gigabytes",
            "table_terabytes",
            "table_last_import",
            "table_created",
            "is_last",
          ],
        },
      ],
    },
  },
  parameters: {
    tables: [
      {
        dbName: "tables_metrics",
        tableId: "out.c-keboola-costs.tables_metrics",
        incremental: true,
        items: [
          {
            name: "table_snapshot_id",
            dbName: "table_snapshot_id",
            type: "STRING",
          },
          {
            name: "table_project_id",
            dbName: "table_project_id",
            type: "STRING",
          },
          {
            name: "project_id",
            dbName: "project_id",
            type: "STRING",
          },
          {
            name: "table_snapshot_date",
            dbName: "table_snapshot_date",
            type: "STRING",
          },
          {
            name: "table_rows",
            dbName: "table_rows",
            type: "FLOAT",
          },
          {
            name: "table_bytes",
            dbName: "table_bytes",
            type: "FLOAT",
          },
          {
            name: "table_gigabytes",
            dbName: "table_gigabytes",
            type: "FLOAT",
          },
          {
            name: "table_terabytes",
            dbName: "table_terabytes",
            type: "FLOAT",
          },
          {
            name: "table_last_import",
            dbName: "table_last_import",
            type: "STRING",
          },
          {
            name: "table_created",
            dbName: "table_created",
            type: "STRING",
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

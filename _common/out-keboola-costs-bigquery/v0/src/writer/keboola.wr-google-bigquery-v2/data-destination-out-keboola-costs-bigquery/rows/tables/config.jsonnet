{
  storage: {
    input: {
      tables: [
        {
          source: "out.c-keboola-costs.tables",
          destination: "out.c-keboola-costs.tables.csv",
          changed_since: "adaptive",
          columns: [
            "table_project_id",
            "table_id",
            "project_id",
            "table_name",
            "bucket_project_id",
            "table_primary_key",
            "source_table_project_id",
            "table_is_alias",
            "table_created",
            "table_last_import",
            "datediff_last_import",
            "table_not_imported",
            "table_url",
          ],
        },
      ],
    },
  },
  parameters: {
    tables: [
      {
        dbName: "tables",
        tableId: "out.c-keboola-costs.tables",
        incremental: true,
        items: [
          {
            name: "table_project_id",
            dbName: "table_project_id",
            type: "STRING",
          },
          {
            name: "table_id",
            dbName: "table_id",
            type: "STRING",
          },
          {
            name: "project_id",
            dbName: "project_id",
            type: "STRING",
          },
          {
            name: "table_name",
            dbName: "table_name",
            type: "STRING",
          },
          {
            name: "bucket_project_id",
            dbName: "bucket_project_id",
            type: "STRING",
          },
          {
            name: "table_primary_key",
            dbName: "table_primary_key",
            type: "STRING",
          },
          {
            name: "source_table_project_id",
            dbName: "source_table_project_id",
            type: "STRING",
          },
          {
            name: "table_is_alias",
            dbName: "table_is_alias",
            type: "STRING",
          },
          {
            name: "table_created",
            dbName: "table_created",
            type: "STRING",
          },
          {
            name: "table_last_import",
            dbName: "table_last_import",
            type: "STRING",
          },
          {
            name: "datediff_last_import",
            dbName: "datediff_last_import",
            type: "FLOAT",
          },
          {
            name: "table_not_imported",
            dbName: "table_not_imported",
            type: "BOOLEAN",
          },
          {
            name: "table_url",
            dbName: "table_url",
            type: "STRING",
          },
        ],
      },
    ],
  },
}

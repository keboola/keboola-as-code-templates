{
  storage: {
    input: {
      tables: [
        {
          source: "out.c-keboola-costs.projects",
          destination: "out.c-keboola-costs.projects.csv",
          changed_since: "adaptive",
          columns: [
            "project_id",
            "project_number",
            "project_name",
            "organization_id",
            "project_created",
            "project_deleted",
            "project_is_deleted",
            "project_is_active",
            "project_type",
            "project_url",
            "project_department",
            "project_team",
          ],
        },
      ],
    },
  },
  parameters: {
    tables: [
      {
        dbName: "projects",
        tableId: "out.c-keboola-costs.projects",
        incremental: true,
        items: [
          {
            name: "project_id",
            dbName: "project_id",
            type: "STRING",
          },
          {
            name: "project_number",
            dbName: "project_number",
            type: "STRING",
          },
          {
            name: "project_name",
            dbName: "project_name",
            type: "STRING",
          },
          {
            name: "organization_id",
            dbName: "organization_id",
            type: "STRING",
          },
          {
            name: "project_created",
            dbName: "project_created",
            type: "STRING",
          },
          {
            name: "project_deleted",
            dbName: "project_deleted",
            type: "STRING",
          },
          {
            name: "project_is_deleted",
            dbName: "project_is_deleted",
            type: "STRING",
          },
          {
            name: "project_is_active",
            dbName: "project_is_active",
            type: "BOOLEAN",
          },
          {
            name: "project_type",
            dbName: "project_type",
            type: "STRING",
          },
          {
            name: "project_url",
            dbName: "project_url",
            type: "STRING",
          },
          {
            name: "project_department",
            dbName: "project_department",
            type: "STRING",
          },
          {
            name: "project_team",
            dbName: "project_team",
            type: "STRING",
          },
        ],
      },
    ],
  },
}

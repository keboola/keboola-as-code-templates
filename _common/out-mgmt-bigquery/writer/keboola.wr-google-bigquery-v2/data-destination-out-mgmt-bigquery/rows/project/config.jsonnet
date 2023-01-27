{
  storage: {
    input: {
      tables: [
        {
          source: "out.c-projectmgmt-tr-" + InstanceIdShort() + ".project",
          destination: "out.c-projectmgmt-tr-" + InstanceIdShort() + ".project.csv",
          changed_since: "adaptive",
          columns: [
            "project_id",
            "project",
            "created_at",
            "due_date",
            "workspace",
            "url",
            "owner",
            "owner_type",
            "status",
            "status_text",
            "archived",
            "public",
          ],
        },
      ],
    },
  },
  parameters: {
    tables: [
      {
        dbName: "PROJECT",
        tableId: "out.c-projectmgmt-tr-" + InstanceIdShort() + ".project",
        incremental: true,
        items: [
          {
            name: "project_id",
            dbName: "PROJECT_ID",
            type: "STRING",
          },
          {
            name: "project",
            dbName: "PROJECT",
            type: "STRING",
          },
          {
            name: "created_at",
            dbName: "CREATED_AT",
            type: "STRING",
          },
          {
            name: "due_date",
            dbName: "DUE_DATE",
            type: "STRING",
          },
          {
            name: "workspace",
            dbName: "WORKSPACE",
            type: "STRING",
          },
          {
            name: "url",
            dbName: "URL",
            type: "STRING",
          },
          {
            name: "owner",
            dbName: "OWNER",
            type: "STRING",
          },
          {
            name: "owner_type",
            dbName: "OWNER_TYPE",
            type: "STRING",
          },
          {
            name: "status",
            dbName: "STATUS",
            type: "STRING",
          },
          {
            name: "status_text",
            dbName: "STATUS_TEXT",
            type: "STRING",
          },
          {
            name: "archived",
            dbName: "ARCHIVED",
            type: "STRING",
          },
          {
            name: "public",
            dbName: "PUBLIC",
            type: "STRING",
          },
        ],
      },
    ],
  },
}

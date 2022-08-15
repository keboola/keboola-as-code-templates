{
  storage: {
    input: {
      tables: [
        {
          source: "out.c-keboola-costs.configurations",
          destination: "out.c-keboola-costs.configurations.csv",
          changed_since: "adaptive",
          columns: [
            "component_configuration_id",
            "project_id",
            "component_id",
            "configuration_name",
            "configuration_url",
            "configuration_id",
            "configuration_is_deleted",
            "configuration_last_updated",
            "configuration_last_version",
            "last_update_token_id",
            "last_update_token_name",
            "configuration_created",
            "creator_token_id",
            "creator_token_name",
          ],
        },
      ],
    },
  },
  parameters: {
    tables: [
      {
        dbName: "configurations",
        tableId: "out.c-keboola-costs.configurations",
        incremental: true,
        items: [
          {
            name: "component_configuration_id",
            dbName: "component_configuration_id",
            type: "STRING",
          },
          {
            name: "project_id",
            dbName: "project_id",
            type: "STRING",
          },
          {
            name: "component_id",
            dbName: "component_id",
            type: "STRING",
          },
          {
            name: "configuration_name",
            dbName: "configuration_name",
            type: "STRING",
          },
          {
            name: "configuration_url",
            dbName: "configuration_url",
            type: "STRING",
          },
          {
            name: "configuration_id",
            dbName: "configuration_id",
            type: "STRING",
          },
          {
            name: "configuration_is_deleted",
            dbName: "configuration_is_deleted",
            type: "STRING",
          },
          {
            name: "configuration_last_updated",
            dbName: "configuration_last_updated",
            type: "STRING",
          },
          {
            name: "configuration_last_version",
            dbName: "configuration_last_version",
            type: "FLOAT",
          },
          {
            name: "last_update_token_id",
            dbName: "last_update_token_id",
            type: "STRING",
          },
          {
            name: "last_update_token_name",
            dbName: "last_update_token_name",
            type: "STRING",
          },
          {
            name: "configuration_created",
            dbName: "configuration_created",
            type: "STRING",
          },
          {
            name: "creator_token_id",
            dbName: "creator_token_id",
            type: "STRING",
          },
          {
            name: "creator_token_name",
            dbName: "creator_token_name",
            type: "STRING",
          },
        ],
      },
    ],
  },
}

{
  storage: {
    input: {
      tables: [
        {
          source: "out.c-keboola-costs.configurations_versions",
          destination: "out.c-keboola-costs.configurations_versions.csv",
          changed_since: "adaptive",
          columns: [
            "component_configuration_version_id",
            "component_configuration_id",
            "configuration_version",
            "configuration_version_updated",
            "configuration_version_is_last",
            "configuration_version_description",
            "token_id",
            "token_name",
            "configuration_version_event",
          ],
        },
      ],
    },
  },
  parameters: {
    tables: [
      {
        dbName: "configurations_versions",
        tableId: "out.c-keboola-costs.configurations_versions",
        incremental: true,
        items: [
          {
            name: "component_configuration_version_id",
            dbName: "component_configuration_version_id",
            type: "STRING",
          },
          {
            name: "component_configuration_id",
            dbName: "component_configuration_id",
            type: "STRING",
          },
          {
            name: "configuration_version",
            dbName: "configuration_version",
            type: "STRING",
          },
          {
            name: "configuration_version_updated",
            dbName: "configuration_version_updated",
            type: "STRING",
          },
          {
            name: "configuration_version_is_last",
            dbName: "configuration_version_is_last",
            type: "STRING",
          },
          {
            name: "configuration_version_description",
            dbName: "configuration_version_description",
            type: "STRING",
          },
          {
            name: "token_id",
            dbName: "token_id",
            type: "STRING",
          },
          {
            name: "token_name",
            dbName: "token_name",
            type: "STRING",
          },
          {
            name: "configuration_version_event",
            dbName: "configuration_version_event",
            type: "STRING",
          },
        ],
      },
    ],
  },
}

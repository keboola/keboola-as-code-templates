{
  storage: {
    input: {
      tables: [
        {
          source: "out.c-keboola-costs.components",
          destination: "out.c-keboola-costs.components.csv",
          changed_since: "adaptive",
          columns: [
            "component_id",
            "component_name",
            "component_type",
            "component_listing",
            "component_vendor",
            "component_origin",
          ],
        },
      ],
    },
  },
  parameters: {
    tables: [
      {
        dbName: "components",
        tableId: "out.c-keboola-costs.components",
        incremental: true,
        items: [
          {
            name: "component_id",
            dbName: "component_id",
            type: "STRING",
          },
          {
            name: "component_name",
            dbName: "component_name",
            type: "STRING",
          },
          {
            name: "component_type",
            dbName: "component_type",
            type: "STRING",
          },
          {
            name: "component_listing",
            dbName: "component_listing",
            type: "STRING",
          },
          {
            name: "component_vendor",
            dbName: "component_vendor",
            type: "STRING",
          },
          {
            name: "component_origin",
            dbName: "component_origin",
            type: "STRING",
          },
        ],
      },
    ],
  },
}

{
  parameters: {
    tableId: "out.c-keboola-costs.components",
    dbName: "components",
    incremental: true,
    primaryKey: [
      "component_id",
    ],
    items: [
      {
        name: "component_id",
        dbName: "component_id",
        type: "text",
        nullable: false,
        default: "",
        size: "1000",
      },
      {
        name: "component_name",
        dbName: "component_name",
        type: "text",
        nullable: true,
        default: "",
        size: "200",
      },
      {
        name: "component_type",
        dbName: "component_type",
        type: "text",
        nullable: true,
        default: "",
        size: "50",
      },
      {
        name: "component_listing",
        dbName: "component_listing",
        type: "text",
        nullable: true,
        default: "",
        size: "20",
      },
      {
        name: "component_vendor",
        dbName: "component_vendor",
        type: "text",
        nullable: true,
        default: "",
        size: "100",
      },
      {
        name: "component_origin",
        dbName: "component_origin",
        type: "text",
        nullable: true,
        default: "",
        size: "20",
      },
    ],
  },
  storage: {
    input: {
      tables: [
        {
          source: "out.c-keboola-costs.components",
          destination: "out.c-keboola-costs.components.csv",
          columns: [
            "component_id",
            "component_name",
            "component_type",
            "component_listing",
            "component_vendor",
            "component_origin",
          ],
          changed_since: "adaptive",
        },
      ],
    },
  },
}

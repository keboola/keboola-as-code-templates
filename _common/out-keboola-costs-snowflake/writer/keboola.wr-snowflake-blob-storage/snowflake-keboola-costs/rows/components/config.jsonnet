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
        type: "varchar",
        nullable: true,
        default: "",
        size: "16777216",
      },
      {
        name: "component_name",
        dbName: "component_name",
        type: "varchar",
        nullable: true,
        default: "",
        size: "16777216",
      },
      {
        name: "component_type",
        dbName: "component_type",
        type: "varchar",
        nullable: true,
        default: "",
        size: "16777216",
      },
      {
        name: "component_listing",
        dbName: "component_listing",
        type: "varchar",
        nullable: true,
        default: "",
        size: "16777216",
      },
      {
        name: "component_vendor",
        dbName: "component_vendor",
        type: "varchar",
        nullable: true,
        default: "",
        size: "16777216",
      },
      {
        name: "component_origin",
        dbName: "component_origin",
        type: "varchar",
        nullable: true,
        default: "",
        size: "9",
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

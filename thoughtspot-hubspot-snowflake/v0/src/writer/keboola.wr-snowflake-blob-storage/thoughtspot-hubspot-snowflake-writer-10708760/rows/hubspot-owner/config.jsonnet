{
  parameters: {
    tableId: "out.c-thoughtspot-wr-" + ConfigId("thoughtspot-hubspot-snowflake-extractor-10708760") + ".HUBSPOT_OWNER",
    dbName: "HUBSPOT_OWNER",
    incremental: false,
    primaryKey: [],
    items: [
      {
        name: "ID",
        dbName: "ID",
        type: "double",
        nullable: true,
        default: "",
        size: "",
      },
      {
        name: "EMAIL",
        dbName: "EMAIL",
        type: "varchar",
        nullable: true,
        default: "",
        size: "16777216",
      },
      {
        name: "FIRST_NAME",
        dbName: "FIRST_NAME",
        type: "varchar",
        nullable: true,
        default: "",
        size: "16777216",
      },
      {
        name: "LAST_NAME",
        dbName: "LAST_NAME",
        type: "varchar",
        nullable: true,
        default: "",
        size: "16777216",
      },
      {
        name: "USER_ID",
        dbName: "USER_ID",
        type: "double",
        nullable: true,
        default: "",
        size: "",
      },
      {
        name: "ARCHIVED",
        dbName: "ARCHIVED",
        type: "boolean",
        nullable: true,
        default: "",
        size: "",
      },
    ],
  },
  storage: {
    input: {
      tables: [
        {
          source: "out.c-thoughtspot-wr-" + ConfigId("thoughtspot-hubspot-snowflake-extractor-10708760") + ".HUBSPOT_OWNER",
          destination: "out.c-thoughtspot-wr-" + ConfigId("thoughtspot-hubspot-snowflake-extractor-10708760") + ".HUBSPOT_OWNER.csv",
          columns: [
            "ID",
            "EMAIL",
            "FIRST_NAME",
            "LAST_NAME",
            "USER_ID",
            "ARCHIVED",
          ],
        },
      ],
    },
  },
}

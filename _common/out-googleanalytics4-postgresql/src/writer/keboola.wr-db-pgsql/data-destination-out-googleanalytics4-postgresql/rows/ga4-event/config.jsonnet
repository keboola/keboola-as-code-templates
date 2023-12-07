{
  parameters: {
    tableId: "out.c-bdm-ga4-" + InstanceIdShort() + ".ga4_event",
    dbName: "ga4_event",
    incremental: true,
    primaryKey: [
      "id",
    ],
    items: [
      {
        name: "id",
        dbName: "id",
        type: "varchar",
        nullable: false,
        default: "",
        size: "2000",
      },
      {
        name: "idProperty",
        dbName: "idProperty",
        type: "varchar",
        nullable: true,
        default: "",
        size: "255",
      },
      {
        name: "date",
        dbName: "date",
        type: "date",
        nullable: true,
        default: "",
        size: "",
      },
      {
        name: "eventName",
        dbName: "eventName",
        type: "varchar",
        nullable: true,
        default: "",
        size: "255",
      },
      {
        name: "isConversionEvent",
        dbName: "isConversionEvent",
        type: "boolean",
        nullable: true,
        default: "",
        size: "",
      },
      {
        name: "eventCount",
        dbName: "eventCount",
        type: "numeric",
        nullable: true,
        default: "",
        size: "38,0",
      },
      {
        name: "eventValue",
        dbName: "eventValue",
        type: "numeric",
        nullable: true,
        default: "",
        size: "38,0",
      },
      {
        name: "totalUsers",
        dbName: "totalUsers",
        type: "numeric",
        nullable: true,
        default: "",
        size: "38,0",
      },
      {
        name: "activeUsers",
        dbName: "activeUsers",
        type: "numeric",
        nullable: true,
        default: "",
        size: "38,0",
      },
      {
        name: "newUsers",
        dbName: "newUsers",
        type: "numeric",
        nullable: true,
        default: "",
        size: "38,0",
      },
    ],
  },
  storage: {
    input: {
      tables: [
        {
          source: "out.c-bdm-ga4-" + InstanceIdShort() + ".ga4_event",
          destination: "out.c-bdm-ga4-" + InstanceIdShort() + ".ga4_event.csv",
          columns: [
            "id",
            "idProperty",
            "date",
            "eventName",
            "isConversionEvent",
            "eventCount",
            "eventValue",
            "totalUsers",
            "activeUsers",
            "newUsers",
          ],
          changed_since: "adaptive",
        },
      ],
    },
  },
}
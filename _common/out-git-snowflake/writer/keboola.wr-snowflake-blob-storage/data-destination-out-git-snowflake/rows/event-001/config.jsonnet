{
  parameters: {
    tableId: "out.c-git-bdm-" + InstanceIdShort() + ".event",
    dbName: "EVENT",
    incremental: true,
    primaryKey: [
      "EVENT_ID",
    ],
    items: [
      {
        name: "event_id",
        dbName: "EVENT_ID",
        type: "string",
        nullable: false,
        default: "",
        size: "255",
      },
      {
        name: "repository_id",
        dbName: "REPOSITORY_ID",
        type: "string",
        nullable: false,
        default: "",
        size: "255",
      },
      {
        name: "user_id",
        dbName: "USER_ID",
        type: "string",
        nullable: false,
        default: "",
        size: "255",
      },
      {
        name: "event",
        dbName: "EVENT",
        type: "string",
        nullable: false,
        default: "",
        size: "255",
      },
      {
        name: "date",
        dbName: "DATE",
        type: "datetime",
        nullable: true,
        default: "",
        size: "",
      },
      {
        name: "url",
        dbName: "URL",
        type: "string",
        nullable: false,
        default: "",
        size: "1000",
      },
    ],
  },
  storage: {
    input: {
      tables: [
        {
          source: "out.c-git-bdm-" + InstanceIdShort() + ".event",
          destination: "out.c-git-bdm-" + InstanceIdShort() + ".event.csv",
          columns: [
            "event_id",
            "repository_id",
            "user_id",
            "event",
            "date",
            "url",
          ],
          changed_since: "adaptive",
        },
      ],
    },
  },
}

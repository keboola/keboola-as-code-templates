{
  parameters: {
    tableId: "out.c-git-bdm-"+InstanceIdShort()+".event",
    dbName: "event",
    incremental: false,
    primaryKey: [
      "event_id",
    ],
    items: [
      {
        name: "event_id",
        dbName: "event_id",
        type: "varchar",
        nullable: false,
        default: "",
        size: "255",
      },
      {
        name: "repository_id",
        dbName: "repository_id",
        type: "varchar",
        nullable: true,
        default: "",
        size: "255",
      },
      {
        name: "user_id",
        dbName: "user_id",
        type: "varchar",
        nullable: true,
        default: "",
        size: "255",
      },
      {
        name: "event",
        dbName: "event",
        type: "varchar",
        nullable: true,
        default: "",
        size: "255",
      },
      {
        name: "date",
        dbName: "date",
        type: "timestamp",
        nullable: true,
        default: "",
        size: "",
      },
      {
        name: "url",
        dbName: "url",
        type: "varchar",
        nullable: true,
        default: "",
        size: "1000",
      },
    ],
  },
  storage: {
    input: {
      tables: [
        {
          source: "out.c-git-bdm-"+InstanceIdShort()+".event",
          destination: "out.c-git-bdm-"+InstanceIdShort()+".event.csv",
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

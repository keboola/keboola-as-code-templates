{
  storage: {
    input: {
      tables: [
        {
          source: "out.c-thoughtspot-wr-" + InstanceIdShort() + ".HUBSPOT_OWNER",
          destination: "out.c-thoughtspot-wr-" + InstanceIdShort() + ".HUBSPOT_OWNER.csv",
          changed_since: "",
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
  parameters: {
    tables: [
      {
        dbName: "HUBSPOT_OWNER",
        tableId: "out.c-thoughtspot-wr-" + InstanceIdShort() + ".HUBSPOT_OWNER",
        incremental: false,
        items: [
          {
            name: "ID",
            dbName: "ID",
            type: "STRING",
          },
          {
            name: "EMAIL",
            dbName: "EMAIL",
            type: "STRING",
          },
          {
            name: "FIRST_NAME",
            dbName: "FIRST_NAME",
            type: "STRING",
          },
          {
            name: "LAST_NAME",
            dbName: "LAST_NAME",
            type: "STRING",
          },
          {
            name: "USER_ID",
            dbName: "USER_ID",
            type: "STRING",
          },
          {
            name: "ARCHIVED",
            dbName: "ARCHIVED",
            type: "STRING",
          },
        ],
      },
    ],
  },
}

{
  storage: {
    input: {
      tables: [
        {
          source: "out.c-crm-wr-" + InstanceIdShort() + ".contact",
          destination: "out.c-crm-wr-" + InstanceIdShort() + ".contact.csv",
          changed_since: "adaptive",
          columns: [
            "contact_id",
            "contact",
            "email",
            "contact_type",
            "date_created",
            "lead_source",
            "lead_converted",
          ],
        },
      ],
    },
  },
  parameters: {
    tables: [
      {
        dbName: "contact",
        tableId: "out.c-crm-wr-" + InstanceIdShort() + ".contact",
        incremental: true,
        items: [
          {
            name: "contact_id",
            dbName: "contact_id",
            type: "STRING",
          },
          {
            name: "contact",
            dbName: "contact",
            type: "STRING",
          },
          {
            name: "email",
            dbName: "email",
            type: "STRING",
          },
          {
            name: "contact_type",
            dbName: "contact_type",
            type: "STRING",
          },
          {
            name: "date_created",
            dbName: "date_created",
            type: "STRING",
          },
          {
            name: "lead_source",
            dbName: "lead_source",
            type: "STRING",
          },
          {
            name: "lead_converted",
            dbName: "lead_converted",
            type: "STRING",
          },
        ],
      },
    ],
  },
}

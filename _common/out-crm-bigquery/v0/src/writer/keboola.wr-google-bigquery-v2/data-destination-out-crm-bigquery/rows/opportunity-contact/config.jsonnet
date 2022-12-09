{
  storage: {
    input: {
      tables: [
        {
          source: "out.c-crm-wr-" + InstanceIdShort() + ".opportunity_contact",
          destination: "out.c-crm-wr-" + InstanceIdShort() + ".opportunity_contact.csv",
          changed_since: "adaptive",
          columns: [
            "opportunity_contact_id",
            "opportunity_id",
            "contact_id",
            "is_primary_contact",
            "role",
          ],
        },
      ],
    },
  },
  parameters: {
    tables: [
      {
        dbName: "opportunity_contact",
        tableId: "out.c-crm-wr-" + InstanceIdShort() + ".opportunity_contact",
        incremental: true,
        items: [
          {
            name: "opportunity_contact_id",
            dbName: "opportunity_contact_id",
            type: "STRING",
          },
          {
            name: "opportunity_id",
            dbName: "opportunity_id",
            type: "STRING",
          },
          {
            name: "contact_id",
            dbName: "contact_id",
            type: "STRING",
          },
          {
            name: "is_primary_contact",
            dbName: "is_primary_contact",
            type: "STRING",
          },
          {
            name: "role",
            dbName: "role",
            type: "STRING",
          },
        ],
      },
    ],
  },
}

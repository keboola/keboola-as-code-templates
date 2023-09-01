{
  storage: {
    input: {
      tables: [
        {
          source: "out.c-mailchimp-bdm-" + InstanceIdShort() + ".list",
          destination: "out.c-mailchimp-bdm-" + InstanceIdShort() + ".list.csv",
          changed_since: "adaptive",
          columns: [
            "list_id",
            "list_name",
            "list_contact_company",
            "list_contact_country",
            "list_rating",
          ],
        },
      ],
    },
  },
  parameters: {
    tables: [
      {
        dbName: "list",
        tableId: "out.c-mailchimp-bdm-" + InstanceIdShort() + ".list",
        incremental: true,
        items: [
          {
            name: "list_id",
            dbName: "list_id",
            type: "STRING",
          },
          {
            name: "list_name",
            dbName: "list_name",
            type: "STRING",
          },
          {
            name: "list_contact_company",
            dbName: "list_contact_company",
            type: "STRING",
          },
          {
            name: "list_contact_country",
            dbName: "list_contact_country",
            type: "STRING",
          },
          {
            name: "list_rating",
            dbName: "list_rating",
            type: "STRING",
          },
        ],
      },
    ],
  },
}

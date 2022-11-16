{
  storage: {
    input: {
      tables: [
        {
          source: "out.c-crm-wr-" + InstanceIdShort() + ".company",
          destination: "out.c-crm-wr-" + InstanceIdShort() + ".company.csv",
          changed_since: "adaptive",
          columns: [
            "company_id",
            "company",
            "website",
            "date_created",
          ],
        },
      ],
    },
  },
  parameters: {
    tables: [
      {
        dbName: "company",
        tableId: "out.c-crm-wr-" + InstanceIdShort() + ".company",
        incremental: true,
        items: [
          {
            name: "company_id",
            dbName: "company_id",
            type: "STRING",
          },
          {
            name: "company",
            dbName: "company",
            type: "STRING",
          },
          {
            name: "website",
            dbName: "website",
            type: "STRING",
          },
          {
            name: "date_created",
            dbName: "date_created",
            type: "STRING",
          },
        ],
      },
    ],
  },
}

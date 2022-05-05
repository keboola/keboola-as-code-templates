{
  parameters: {
    tableId: "out.c-crm-wr-"+InstanceIdShort()+".company",
    dbName: "company",
    incremental: false,
    primaryKey: [
      "company_id",
    ],
    items: [
      {
        name: "company_id",
        dbName: "company_id",
        type: "varchar",
        nullable: false,
        default: "",
        size: "255",
      },
      {
        name: "company",
        dbName: "company",
        type: "varchar",
        nullable: false,
        default: "",
        size: "255",
      },
      {
        name: "website",
        dbName: "website",
        type: "varchar",
        nullable: false,
        default: "",
        size: "255",
      },
      {
        name: "date_created",
        dbName: "date_created",
        type: "date",
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
          source: "out.c-crm-wr-"+InstanceIdShort()+".company",
          destination: "out.c-crm-wr-"+InstanceIdShort()+".company.csv",
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
}

{
  parameters: {
    tableId: "out.c-crm-wr-"+InstanceIdShort()+".opportunity_contact",
    dbName: "opportunity_contact",
    incremental: false,
    primaryKey: [
      "opportunity_contact_id",
    ],
    items: [
      {
        name: "opportunity_contact_id",
        dbName: "opportunity_contact_id",
        type: "varchar",
        nullable: false,
        default: "",
        size: "255",
      },
      {
        name: "opportunity_id",
        dbName: "opportunity_id",
        type: "varchar",
        nullable: false,
        default: "",
        size: "255",
      },
      {
        name: "contact_id",
        dbName: "contact_id",
        type: "varchar",
        nullable: false,
        default: "",
        size: "255",
      },
      {
        name: "is_primary_contact",
        dbName: "is_primary_contact",
        type: "varchar",
        nullable: false,
        default: "",
        size: "255",
      },
      {
        name: "role",
        dbName: "role",
        type: "varchar",
        nullable: false,
        default: "",
        size: "255",
      },
    ],
  },
  storage: {
    input: {
      tables: [
        {
          source: "out.c-crm-wr-"+InstanceIdShort()+".opportunity_contact",
          destination: "out.c-crm-wr-"+InstanceIdShort()+".opportunity_contact.csv",
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
}

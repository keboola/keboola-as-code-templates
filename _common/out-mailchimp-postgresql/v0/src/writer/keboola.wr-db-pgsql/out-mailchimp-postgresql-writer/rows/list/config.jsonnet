{
  parameters: {
    tableId: "out.c-mailchimp-bdm-" + InstanceIdShort() + ".list",
    dbName: "list",
    incremental: false,
    primaryKey: [
      "list_id",
    ],
    items: [
      {
          name: "list_id",
          dbName: "list_id",
          type: "varchar",
          nullable: false,
          default: "",
          size: "10485760"
      },
      {
          name: "list_name",
          dbName: "list_name",
          type: "varchar",
          nullable: true,
          default: "",
          size: "10485760"
      },
      {
          name: "list_contact_company",
          dbName: "list_contact_company",
          type: "varchar",
          nullable: true,
          default: "",
          size: "10485760"
      },
      {
          name: "list_contact_country",
          dbName: "list_contact_country",
          type: "varchar",
          nullable: true,
          default: "",
          size: "10485760"
      },
      {
          name: "list_rating",
          dbName: "list_rating",
          type: "float4",
          nullable: true,
          default: "",
          size: ""
      }
    ],
  },
  storage: {
    input: {
      tables: [
        {
          source: "out.c-mailchimp-bdm-" + InstanceIdShort() + ".list",
          destination: "out.c-mailchimp-bdm-" + InstanceIdShort() + ".list.csv",
          columns: [
             "list_id",
            "list_name",
            "list_contact_company",
            "list_contact_country",
            "list_rating"
          ],
          changed_since: "adaptive",
        },
      ],
    },
  },
}

{
  parameters: {
    tableId: "out.c-marketing-bdm-" + InstanceIdShort() + ".online_marketing_transactions",
    dbName: "online_marketing_transactions",
    incremental: true,
    primaryKey: [
      "online_marketing_transactions_id",
    ],
    items: [
      {
        name: "online_marketing_transactions_id",
        dbName: "online_marketing_transactions_id",
        type: "varchar",
        nullable: true,
        default: "",
        size: "16777216",
      },
      {
        name: "online_marketing_traffic_id",
        dbName: "online_marketing_traffic_id",
        type: "varchar",
        nullable: true,
        default: "",
        size: "16777216",
      },
      {
        name: "account_name",
        dbName: "account_name",
        type: "varchar",
        nullable: true,
        default: "",
        size: "16777216",
      },
      {
        name: "date",
        dbName: "date",
        type: "varchar",
        nullable: false,
        default: "",
        size: "16777216",
      },
      {
        name: "source",
        dbName: "source",
        type: "varchar",
        nullable: false,
        default: "",
        size: "16777216",
      },
      {
        name: "medium",
        dbName: "medium",
        type: "varchar",
        nullable: false,
        default: "",
        size: "16777216",
      },
      {
        name: "campaign",
        dbName: "campaign",
        type: "varchar",
        nullable: false,
        default: "",
        size: "16777216",
      },
      {
        name: "domain",
        dbName: "domain",
        type: "varchar",
        nullable: false,
        default: "",
        size: "16777216",
      },
      {
        name: "transaction_id",
        dbName: "transaction_id",
        type: "varchar",
        nullable: false,
        default: "",
        size: "16777216",
      },
      {
        name: "item_quantity",
        dbName: "item_quantity",
        type: "float",
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
          source: "out.c-marketing-bdm-" + InstanceIdShort() + ".online_marketing_transactions",
          destination: "out.c-marketing-bdm-" + InstanceIdShort() + ".online_marketing_transactions.csv",
          columns: [
            "online_marketing_transactions_id",
            "online_marketing_traffic_id",
            "account_name",
            "date",
            "source",
            "medium",
            "campaign",
            "domain",
            "transaction_id",
            "item_quantity",
          ],
          changed_since: "adaptive",
        },
      ],
    },
  },
}

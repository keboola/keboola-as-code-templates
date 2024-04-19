{
  storage: {
    input: {
      tables: [
        {
          source: "out.c-marketing-bdm-" + InstanceIdShort() + ".online_marketing_transactions",
          destination: "out.c-marketing-bdm-" + InstanceIdShort() + ".online_marketing_transactions.csv",
          changed_since: "adaptive",
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
        },
      ],
    },
  },
  parameters: {
    tables: [
      {
        dbName: "online_marketing_transactions",
        tableId: "out.c-marketing-bdm-" + InstanceIdShort() + ".online_marketing_transactions",
        incremental: true,
        items: [
          {
            name: "online_marketing_transactions_id",
            dbName: "online_marketing_transactions_id",
            type: "STRING",
          },
          {
            name: "online_marketing_traffic_id",
            dbName: "online_marketing_traffic_id",
            type: "STRING",
          },
          {
            name: "account_name",
            dbName: "account_name",
            type: "STRING",
          },
          {
            name: "date",
            dbName: "date",
            type: "STRING",
          },
          {
            name: "source",
            dbName: "source",
            type: "STRING",
          },
          {
            name: "medium",
            dbName: "medium",
            type: "STRING",
          },
          {
            name: "campaign",
            dbName: "campaign",
            type: "STRING",
          },
          {
            name: "domain",
            dbName: "domain",
            type: "STRING",
          },
          {
            name: "transaction_id",
            dbName: "transaction_id",
            type: "STRING",
          },
          {
            name: "item_quantity",
            dbName: "item_quantity",
            type: "FLOAT",
          },
        ],
      },
    ],
  },
}

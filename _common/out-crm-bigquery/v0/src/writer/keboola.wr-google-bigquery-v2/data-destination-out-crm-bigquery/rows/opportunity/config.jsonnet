{
  storage: {
    input: {
      tables: [
        {
          source: "out.c-crm-wr-" + InstanceIdShort() + ".opportunity",
          destination: "out.c-crm-wr-" + InstanceIdShort() + ".opportunity.csv",
          changed_since: "adaptive",
          columns: [
            "opportunity_id",
            "company_id",
            "employee_id",
            "opportunity",
            "date_created",
            "date_closed",
            "is_closed",
            "is_won",
            "pipeline",
            "stage",
            "stage_order",
            "opportunity_type",
            "opportunity_value",
            "currency",
            "lead_source",
            "probability",
          ],
        },
      ],
    },
  },
  parameters: {
    tables: [
      {
        dbName: "opportunity",
        tableId: "out.c-crm-wr-" + InstanceIdShort() + ".opportunity",
        incremental: true,
        items: [
          {
            name: "opportunity_id",
            dbName: "opportunity_id",
            type: "STRING",
          },
          {
            name: "company_id",
            dbName: "company_id",
            type: "STRING",
          },
          {
            name: "employee_id",
            dbName: "employee_id",
            type: "STRING",
          },
          {
            name: "opportunity",
            dbName: "opportunity",
            type: "STRING",
          },
          {
            name: "date_created",
            dbName: "date_created",
            type: "STRING",
          },
          {
            name: "date_closed",
            dbName: "date_closed",
            type: "STRING",
          },
          {
            name: "is_closed",
            dbName: "is_closed",
            type: "STRING",
          },
          {
            name: "is_won",
            dbName: "is_won",
            type: "STRING",
          },
          {
            name: "pipeline",
            dbName: "pipeline",
            type: "STRING",
          },
          {
            name: "stage",
            dbName: "stage",
            type: "STRING",
          },
          {
            name: "stage_order",
            dbName: "stage_order",
            type: "STRING",
          },
          {
            name: "opportunity_type",
            dbName: "opportunity_type",
            type: "STRING",
          },
          {
            name: "opportunity_value",
            dbName: "opportunity_value",
            type: "STRING",
          },
          {
            name: "currency",
            dbName: "currency",
            type: "STRING",
          },
          {
            name: "lead_source",
            dbName: "lead_source",
            type: "STRING",
          },
          {
            name: "probability",
            dbName: "probability",
            type: "STRING",
          },
        ],
      },
    ],
  },
}

{
  storage: {
    input: {
      tables: [
        {
          source: "out.c-crm-wr-" + InstanceIdShort() + ".activity",
          destination: "out.c-crm-wr-" + InstanceIdShort() + ".activity.csv",
          changed_since: "adaptive",
          columns: [
            "activity_id",
            "employee_id",
            "contact_id",
            "opportunity_id",
            "activity",
            "activity_date",
            "activity_duration_m",
          ],
        },
      ],
    },
  },
  parameters: {
    tables: [
      {
        dbName: "activity",
        tableId: "out.c-crm-wr-" + InstanceIdShort() + ".activity",
        incremental: true,
        items: [
          {
            name: "activity_id",
            dbName: "activity_id",
            type: "STRING",
          },
          {
            name: "employee_id",
            dbName: "employee_id",
            type: "STRING",
          },
          {
            name: "contact_id",
            dbName: "contact_id",
            type: "STRING",
          },
          {
            name: "opportunity_id",
            dbName: "opportunity_id",
            type: "STRING",
          },
          {
            name: "activity",
            dbName: "activity",
            type: "STRING",
          },
          {
            name: "activity_date",
            dbName: "activity_date",
            type: "STRING",
          },
          {
            name: "activity_duration_m",
            dbName: "activity_duration_m",
            type: "STRING",
          },
        ],
      },
    ],
  },
}

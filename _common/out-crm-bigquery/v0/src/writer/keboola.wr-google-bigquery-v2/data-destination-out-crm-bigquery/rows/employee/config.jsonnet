{
  storage: {
    input: {
      tables: [
        {
          source: "out.c-crm-wr-" + InstanceIdShort() + ".employee",
          destination: "out.c-crm-wr-" + InstanceIdShort() + ".employee.csv",
          changed_since: "adaptive",
          columns: [
            "employee_id",
            "employee",
            "email",
            "position",
          ],
        },
      ],
    },
  },
  parameters: {
    tables: [
      {
        dbName: "employee",
        tableId: "out.c-crm-wr-" + InstanceIdShort() + ".employee",
        incremental: true,
        items: [
          {
            name: "employee_id",
            dbName: "employee_id",
            type: "STRING",
          },
          {
            name: "employee",
            dbName: "employee",
            type: "STRING",
          },
          {
            name: "email",
            dbName: "email",
            type: "STRING",
          },
          {
            name: "position",
            dbName: "position",
            type: "STRING",
          },
        ],
      },
    ],
  },
}

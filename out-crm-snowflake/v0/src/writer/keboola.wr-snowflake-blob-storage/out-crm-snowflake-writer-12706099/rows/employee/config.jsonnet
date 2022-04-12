{
  parameters: {
    tableId: "out.c-crm-wr-"+ConfigId("out-crm-snowflake-writer-12706099")+".employee",
    dbName: "employee",
    incremental: false,
    primaryKey: [
      "employee_id",
    ],
    items: [
      {
        name: "employee_id",
        dbName: "employee_id",
        type: "varchar",
        nullable: false,
        default: "",
        size: "255",
      },
      {
        name: "employee",
        dbName: "employee",
        type: "varchar",
        nullable: false,
        default: "",
        size: "255",
      },
      {
        name: "email",
        dbName: "email",
        type: "varchar",
        nullable: false,
        default: "",
        size: "255",
      },
      {
        name: "position",
        dbName: "position",
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
          source: "out.c-crm-wr-"+ConfigId("out-crm-snowflake-writer-12706099")+".employee",
          destination: "out.c-crm-wr-"+ConfigId("out-crm-snowflake-writer-12706099")+".employee.csv",
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
}

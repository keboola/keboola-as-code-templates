{
  parameters: {
    tableId: "out.c-crm-wr-"+ConfigId("out-crm-snowflake-writer-12706099")+".opportunity",
    dbName: "opportunity",
    incremental: false,
    primaryKey: [
      "opportunity_id",
    ],
    items: [
      {
        name: "opportunity_id",
        dbName: "opportunity_id",
        type: "varchar",
        nullable: false,
        default: "",
        size: "255",
      },
      {
        name: "company_id",
        dbName: "company_id",
        type: "varchar",
        nullable: false,
        default: "",
        size: "255",
      },
      {
        name: "employee_id",
        dbName: "employee_id",
        type: "varchar",
        nullable: false,
        default: "",
        size: "255",
      },
      {
        name: "opportunity",
        dbName: "opportunity",
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
      {
        name: "date_closed",
        dbName: "date_closed",
        type: "date",
        nullable: true,
        default: "",
        size: "",
      },
      {
        name: "is_closed",
        dbName: "is_closed",
        type: "varchar",
        nullable: false,
        default: "",
        size: "255",
      },
      {
        name: "is_won",
        dbName: "is_won",
        type: "varchar",
        nullable: false,
        default: "",
        size: "255",
      },
      {
        name: "pipeline",
        dbName: "pipeline",
        type: "varchar",
        nullable: false,
        default: "",
        size: "255",
      },
      {
        name: "stage",
        dbName: "stage",
        type: "varchar",
        nullable: false,
        default: "",
        size: "255",
      },
      {
        name: "stage_order",
        dbName: "stage_order",
        type: "integer",
        nullable: true,
        default: "",
        size: "",
      },
      {
        name: "opportunity_type",
        dbName: "opportunity_type",
        type: "varchar",
        nullable: false,
        default: "",
        size: "255",
      },
      {
        name: "opportunity_value",
        dbName: "opportunity_value",
        type: "number",
        nullable: true,
        default: "",
        size: "12,5",
      },
      {
        name: "currency",
        dbName: "currency",
        type: "varchar",
        nullable: false,
        default: "",
        size: "255",
      },
      {
        name: "lead_source",
        dbName: "lead_source",
        type: "varchar",
        nullable: false,
        default: "",
        size: "255",
      },
      {
        name: "probability",
        dbName: "probability",
        type: "number",
        nullable: true,
        default: "",
        size: "12,5",
      },
    ],
  },
  storage: {
    input: {
      tables: [
        {
          source: "out.c-crm-wr-"+ConfigId("out-crm-snowflake-writer-12706099")+".opportunity",
          destination: "out.c-crm-wr-"+ConfigId("out-crm-snowflake-writer-12706099")+".opportunity.csv",
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
}

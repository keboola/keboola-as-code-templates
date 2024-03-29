{
  parameters: {
    tableId: "out.c-crm-wr-"+InstanceIdShort()+".opportunity_snapshot",
    dbName: "opportunity_snapshot",
    incremental: false,
    primaryKey: [
      "opportunity_id",
      "snapshot_date"
    ],
    items: [
      {
        name: "opportunity_id",
        dbName: "opportunity_id",
        type: "varchar",
        nullable: false,
        default: "",
        size: "3000"
      },
      {
        name: "snapshot_date",
        dbName: "snapshot_date",
        type: "date",
        nullable: false,
        default: "",
        size: ""
      },
      {
        name: "employee_id",
        dbName: "employee_id",
        type: "varchar",
        nullable: true,
        default: "",
        size: "3000"
      },
      {
        name: "company_id",
        dbName: "company_id",
        type: "varchar",
        nullable: true,
        default: "",
        size: "3000"
      },
      {
        name: "pipeline",
        dbName: "pipeline",
        type: "varchar",
        nullable: true,
        default: "",
        size: "3000"
      },
      {
        name: "previous_pipeline",
        dbName: "previous_pipeline",
        type: "varchar",
        nullable: true,
        default: "",
        size: "3000"
      },
      {
        name: "pipeline_change",
        dbName: "pipeline_change",
        type: "varchar",
        nullable: true,
        default: "",
        size: "3000"
      },
      {
        name: "stage",
        dbName: "stage",
        type: "varchar",
        nullable: true,
        default: "",
        size: "3000"
      },
      {
        name: "stage_order",
        dbName: "stage_order",
        type: "integer",
        nullable: true,
        default: "",
        size: ""
      },
      {
        name: "previous_stage",
        dbName: "previous_stage",
        type: "varchar",
        nullable: true,
        default: "",
        size: "3000"
      },
      {
        name: "previous_stage_order",
        dbName: "previous_stage_order",
        type: "integer",
        nullable: true,
        default: "",
        size: ""
      },
      {
        name: "stage_change",
        dbName: "stage_change",
        type: "varchar",
        nullable: true,
        default: "",
        size: "3"
      },
      {
        name: "opportunity_value",
        dbName: "opportunity_value",
        type: "numeric",
        nullable: true,
        default: "",
        size: "12,0"
      },
      {
        name: "previous_opportunity_value",
        dbName: "previous_opportunity_value",
        type: "numeric",
        nullable: true,
        default: "",
        size: "12,0"
      },
      {
        name: "opportunity_value_change",
        dbName: "opportunity_value_change",
        type: "varchar",
        nullable: true,
        default: "",
        size: "3000"
      },
      {
        name: "probability",
        dbName: "probability",
        type: "numeric",
        nullable: true,
        default: "",
        size: "12,0"
      },
      {
        name: "previous_probability",
        dbName: "previous_probability",
        type: "numeric",
        nullable: true,
        default: "",
        size: "12,0"
      },
      {
        name: "probability_change",
        dbName: "probability_change",
        type: "varchar",
        nullable: true,
        default: "",
        size: "3000"
      },
      {
        name: "max_date_in_month",
        dbName: "max_date_in_month",
        type: "varchar",
        nullable: true,
        default: "",
        size: "3000"
      }
    ]
  },
  storage: {
    input: {
      tables: [
        {
          source: "out.c-crm-wr-"+InstanceIdShort()+".opportunity_snapshot",
          destination: "out.c-crm-wr-"+InstanceIdShort()+".opportunity_snapshot.csv",
          columns: [
            "opportunity_id",
            "snapshot_date",
            "employee_id",
            "company_id",
            "pipeline",
            "previous_pipeline",
            "pipeline_change",
            "stage",
            "stage_order",
            "previous_stage",
            "previous_stage_order",
            "stage_change",
            "opportunity_value",
            "previous_opportunity_value",
            "opportunity_value_change",
            "probability",
            "previous_probability",
            "probability_change",
            "max_date_in_month"
          ],
          changed_since: "adaptive"
        }
      ]
    }
  }
}

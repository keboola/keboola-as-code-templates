{
  parameters: {
    tableId: "out.c-projectmgmt-bdm-" + InstanceIdShort() + ".task",
    dbName: "task",
    incremental: false,
    primaryKey: [
      "task_id",
    ],
    items: [
      {
        name: "task_id",
        dbName: "task_id",
        type: "varchar",
        nullable: false,
        default: "",
        size: "255",
      },
      {
        name: "task",
        dbName: "task",
        type: "varchar",
        nullable: true,
        default: "",
        size: "1024",
      },
      {
        name: "section",
        dbName: "section",
        type: "varchar",
        nullable: true,
        default: "",
        size: "255",
      },
      {
        name: "project_id",
        dbName: "project_id",
        type: "varchar",
        nullable: true,
        default: "",
        size: "255",
      },
      {
        name: "created_at",
        dbName: "created_at",
        type: "timestamp",
        nullable: true,
        default: "",
        size: "",
      },
      {
        name: "completed_at",
        dbName: "completed_at",
        type: "timestamp",
        nullable: true,
        default: "",
        size: "",
      },
      {
        name: "due_date",
        dbName: "due_date",
        type: "date",
        nullable: true,
        default: "",
        size: "",
      },
      {
        name: "days_past_due",
        dbName: "days_past_due",
        type: "int",
        nullable: true,
        default: "",
        size: "",
      },
      {
        name: "is_past_due",
        dbName: "is_past_due",
        type: "varchar",
        nullable: true,
        default: "",
        size: "255",
      },
      {
        name: "url",
        dbName: "url",
        type: "varchar",
        nullable: true,
        default: "",
        size: "255",
      },
      {
        name: "assignee",
        dbName: "assignee",
        type: "varchar",
        nullable: true,
        default: "",
        size: "255",
      },
      {
        name: "assignee_type",
        dbName: "assignee_type",
        type: "varchar",
        nullable: true,
        default: "",
        size: "255",
      },
      {
        name: "completed",
        dbName: "completed",
        type: "varchar",
        nullable: true,
        default: "",
        size: "255",
      },
      {
        name: "is_subtask",
        dbName: "is_subtask",
        type: "varchar",
        nullable: true,
        default: "",
        size: "255",
      },
    ],
  },
  storage: {
    input: {
      tables: [
        {
          source: "out.c-projectmgmt-bdm-" + InstanceIdShort() + ".task",
          destination: "out.c-projectmgmt-bdm-" + InstanceIdShort() + ".task.csv",
          columns: [
            "task_id",
            "task",
            "section",
            "project_id",
            "created_at",
            "completed_at",
            "due_date",
            "days_past_due",
            "is_past_due",
            "url",
            "assignee",
            "assignee_type",
            "completed",
            "is_subtask",
          ],
          changed_since: "adaptive",
        },
      ],
    },
  },
}

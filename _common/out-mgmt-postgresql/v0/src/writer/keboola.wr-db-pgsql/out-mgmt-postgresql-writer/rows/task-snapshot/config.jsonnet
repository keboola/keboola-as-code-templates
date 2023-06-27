{
  parameters: {
    tableId: "out.c-projectmgmt-bdm-" + InstanceIdShort() + ".task_snapshot",
    dbName: "task_snapshot",
    incremental: false,
    primaryKey: [
      "task_id",
      "snapshot_date",
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
        name: "snapshot_date",
        dbName: "snapshot_date",
        type: "date",
        nullable: false,
        default: "",
        size: "",
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
        name: "previous_section",
        dbName: "previous_section",
        type: "varchar",
        nullable: true,
        default: "",
        size: "255",
      },
      {
        name: "section_change",
        dbName: "section_change",
        type: "varchar",
        nullable: true,
        default: "",
        size: "255",
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
        name: "previous_due_date",
        dbName: "previous_due_date",
        type: "date",
        nullable: true,
        default: "",
        size: "",
      },
      {
        name: "due_date_change",
        dbName: "due_date_change",
        type: "varchar",
        nullable: true,
        default: "",
        size: "255",
      },
      {
        name: "due_date_diff",
        dbName: "due_date_diff",
        type: "int",
        nullable: true,
        default: "",
        size: "",
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
        name: "previous_assignee",
        dbName: "previous_assignee",
        type: "varchar",
        nullable: true,
        default: "",
        size: "255",
      },
      {
        name: "assignee_change",
        dbName: "assignee_change",
        type: "varchar",
        nullable: true,
        default: "",
        size: "255",
      },
      {
        name: "last_snapshot",
        dbName: "last_snapshot",
        type: "varchar",
        nullable: true,
        default: "",
        size: "255",
      },
      {
        name: "last_day_of_month",
        dbName: "last_day_of_month",
        type: "varchar",
        nullable: true,
        default: "",
        size: "255",
      },
      {
        name: "last_day_of_quarter",
        dbName: "last_day_of_quarter",
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
          source: "out.c-projectmgmt-bdm-" + InstanceIdShort() + ".task_snapshot",
          destination: "out.c-projectmgmt-bdm-" + InstanceIdShort() + ".task_snapshot.csv",
          columns: [
            "task_id",
            "snapshot_date",
            "section",
            "previous_section",
            "section_change",
            "due_date",
            "previous_due_date",
            "due_date_change",
            "due_date_diff",
            "assignee",
            "previous_assignee",
            "assignee_change",
            "last_snapshot",
            "last_day_of_month",
            "last_day_of_quarter",
          ],
          changed_since: "adaptive",
        },
      ],
    },
  },
}

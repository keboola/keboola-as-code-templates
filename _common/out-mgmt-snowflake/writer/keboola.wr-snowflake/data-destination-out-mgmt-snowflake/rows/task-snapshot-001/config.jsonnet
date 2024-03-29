{
  parameters: {
    tableId: "out.c-projectmgmt-bdm-" + InstanceIdShort() + ".task_snapshot",
    dbName: "TASK_SNAPSHOT",
    incremental: true,
    primaryKey: [
      "TASK_ID",
      "SNAPSHOT_DATE",
    ],
    items: [
      {
        name: "task_id",
        dbName: "TASK_ID",
        type: "string",
        nullable: false,
        default: "",
        size: "255",
      },
      {
        name: "snapshot_date",
        dbName: "SNAPSHOT_DATE",
        type: "date",
        nullable: false,
        default: "",
        size: "",
      },
      {
        name: "section",
        dbName: "SECTION",
        type: "string",
        nullable: true,
        default: "",
        size: "255",
      },
      {
        name: "previous_section",
        dbName: "PREVIOUS_SECTION",
        type: "string",
        nullable: true,
        default: "",
        size: "255",
      },
      {
        name: "section_change",
        dbName: "SECTION_CHANGE",
        type: "string",
        nullable: true,
        default: "",
        size: "255",
      },
      {
        name: "due_date",
        dbName: "DUE_DATE",
        type: "date",
        nullable: true,
        default: "",
        size: "",
      },
      {
        name: "previous_due_date",
        dbName: "PREVIOUS_DUE_DATE",
        type: "date",
        nullable: true,
        default: "",
        size: "",
      },
      {
        name: "due_date_change",
        dbName: "DUE_DATE_CHANGE",
        type: "string",
        nullable: true,
        default: "",
        size: "255",
      },
      {
        name: "due_date_diff",
        dbName: "DUE_DATE_DIFF",
        type: "int",
        nullable: true,
        default: "",
        size: "",
      },
      {
        name: "assignee",
        dbName: "ASSIGNEE",
        type: "string",
        nullable: true,
        default: "",
        size: "255",
      },
      {
        name: "previous_assignee",
        dbName: "PREVIOUS_ASSIGNEE",
        type: "string",
        nullable: true,
        default: "",
        size: "255",
      },
      {
        name: "assignee_change",
        dbName: "ASSIGNEE_CHANGE",
        type: "string",
        nullable: true,
        default: "",
        size: "255",
      },
      {
        name: "last_snapshot",
        dbName: "LAST_SNAPSHOT",
        type: "string",
        nullable: true,
        default: "",
        size: "255",
      },
      {
        name: "last_day_of_month",
        dbName: "LAST_DAY_OF_MONTH",
        type: "string",
        nullable: true,
        default: "",
        size: "255",
      },
      {
        name: "last_day_of_quarter",
        dbName: "LAST_DAY_OF_QUARTER",
        type: "string",
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

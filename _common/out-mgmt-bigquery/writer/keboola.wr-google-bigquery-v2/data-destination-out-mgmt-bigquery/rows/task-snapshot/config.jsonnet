{
  storage: {
    input: {
      tables: [
        {
          source: "out.c-projectmgmt-bdm-" + InstanceIdShort() + ".task_snapshot",
          destination: "out.c-projectmgmt-bdm-" + InstanceIdShort() + ".task_snapshot.csv",
          changed_since: "adaptive",
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
        },
      ],
    },
  },
  parameters: {
    tables: [
      {
        dbName: "TASK_SNAPSHOT",
        tableId: "out.c-projectmgmt-bdm-" + InstanceIdShort() + ".task_snapshot",
        incremental: true,
        items: [
          {
            name: "task_id",
            dbName: "TASK_ID",
            type: "STRING",
          },
          {
            name: "snapshot_date",
            dbName: "SNAPSHOT_DATE",
            type: "STRING",
          },
          {
            name: "section",
            dbName: "SECTION",
            type: "STRING",
          },
          {
            name: "previous_section",
            dbName: "PREVIOUS_SECTION",
            type: "STRING",
          },
          {
            name: "section_change",
            dbName: "SECTION_CHANGE",
            type: "STRING",
          },
          {
            name: "due_date",
            dbName: "DUE_DATE",
            type: "STRING",
          },
          {
            name: "previous_due_date",
            dbName: "PREVIOUS_DUE_DATE",
            type: "STRING",
          },
          {
            name: "due_date_change",
            dbName: "DUE_DATE_CHANGE",
            type: "STRING",
          },
          {
            name: "due_date_diff",
            dbName: "DUE_DATE_DIFF",
            type: "INTEGER",
          },
          {
            name: "assignee",
            dbName: "ASSIGNEE",
            type: "STRING",
          },
          {
            name: "previous_assignee",
            dbName: "PREVIOUS_ASSIGNEE",
            type: "STRING",
          },
          {
            name: "assignee_change",
            dbName: "ASSIGNEE_CHANGE",
            type: "STRING",
          },
          {
            name: "last_snapshot",
            dbName: "LAST_SNAPSHOT",
            type: "STRING",
          },
          {
            name: "last_day_of_month",
            dbName: "LAST_DAY_OF_MONTH",
            type: "STRING",
          },
          {
            name: "last_day_of_quarter",
            dbName: "LAST_DAY_OF_QUARTER",
            type: "STRING",
          },
        ],
      },
    ],
  },
}

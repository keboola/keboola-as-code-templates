{
  storage: {
    input: {
      tables: [
        {
          source: "out.c-projectmgmt-bdm-" + InstanceIdShort() + ".task",
          destination: "out.c-projectmgmt-bdm-" + InstanceIdShort() + ".task.csv",
          changed_since: "adaptive",
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
        },
      ],
    },
  },
  parameters: {
    tables: [
      {
        dbName: "TASK",
        tableId: "out.c-projectmgmt-bdm-" + InstanceIdShort() + ".task",
        incremental: true,
        items: [
          {
            name: "task_id",
            dbName: "TASK_ID",
            type: "STRING",
          },
          {
            name: "task",
            dbName: "TASK",
            type: "STRING",
          },
          {
            name: "section",
            dbName: "SECTION",
            type: "STRING",
          },
          {
            name: "project_id",
            dbName: "PROJECT_ID",
            type: "STRING",
          },
          {
            name: "created_at",
            dbName: "CREATED_AT",
            type: "STRING",
          },
          {
            name: "completed_at",
            dbName: "COMPLETED_AT",
            type: "STRING",
          },
          {
            name: "due_date",
            dbName: "DUE_DATE",
            type: "STRING",
          },
          {
            name: "days_past_due",
            dbName: "DAYS_PAST_DUE",
            type: "INTEGER",
          },
          {
            name: "is_past_due",
            dbName: "IS_PAST_DUE",
            type: "STRING",
          },
          {
            name: "url",
            dbName: "URL",
            type: "STRING",
          },
          {
            name: "assignee",
            dbName: "ASSIGNEE",
            type: "STRING",
          },
          {
            name: "assignee_type",
            dbName: "ASSIGNEE_TYPE",
            type: "STRING",
          },
          {
            name: "completed",
            dbName: "COMPLETED",
            type: "STRING",
          },
          {
            name: "is_subtask",
            dbName: "IS_SUBTASK",
            type: "STRING",
          },
        ],
      },
    ],
  },
}

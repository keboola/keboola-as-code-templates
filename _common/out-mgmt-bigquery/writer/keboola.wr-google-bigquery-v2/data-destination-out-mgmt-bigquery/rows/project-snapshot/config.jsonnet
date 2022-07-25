{
  storage: {
    input: {
      tables: [
        {
          source: "out.c-projectmgmt-bdm-" + InstanceIdShort() + ".project_snapshot",
          destination: "out.c-projectmgmt-bdm-" + InstanceIdShort() + ".project_snapshot.csv",
          changed_since: "adaptive",
          columns: [
            "project_id",
            "snapshot_date",
            "status",
            "status_text",
            "days_in_status",
            "previous_status",
            "status_change",
            "days_in_previous_status",
            "due_date",
            "previous_due_date",
            "due_date_change",
            "due_date_diff",
            "owner",
            "previous_owner",
            "owner_change",
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
        dbName: "PROJECT_SNAPSHOT",
        tableId: "out.c-projectmgmt-bdm-" + InstanceIdShort() + ".project_snapshot",
        incremental: true,
        items: [
          {
            name: "project_id",
            dbName: "PROJECT_ID",
            type: "STRING",
          },
          {
            name: "snapshot_date",
            dbName: "SNAPSHOT_DATE",
            type: "STRING",
          },
          {
            name: "status",
            dbName: "STATUS",
            type: "STRING",
          },
          {
            name: "status_text",
            dbName: "STATUS_TEXT",
            type: "STRING",
          },
          {
            name: "days_in_status",
            dbName: "DAYS_IN_STATUS",
            type: "INTEGER",
          },
          {
            name: "previous_status",
            dbName: "PREVIOUS_STATUS",
            type: "STRING",
          },
          {
            name: "status_change",
            dbName: "STATUS_CHANGE",
            type: "STRING",
          },
          {
            name: "days_in_previous_status",
            dbName: "DAYS_IN_PREVIOUS_STATUS",
            type: "INTEGER",
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
            name: "owner",
            dbName: "OWNER",
            type: "STRING",
          },
          {
            name: "previous_owner",
            dbName: "PREVIOUS_OWNER",
            type: "STRING",
          },
          {
            name: "owner_change",
            dbName: "OWNER_CHANGE",
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

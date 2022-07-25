{
  storage: {
    input: {
      tables: [
        {
          source: "out.c-projectmgmt-bdm-" + InstanceIdShort() + ".task_tag",
          destination: "out.c-projectmgmt-bdm-" + InstanceIdShort() + ".task_tag.csv",
          changed_since: "adaptive",
          columns: [
            "task_id",
            "tag",
          ],
        },
      ],
    },
  },
  parameters: {
    tables: [
      {
        dbName: "TASK_TAG",
        tableId: "out.c-projectmgmt-bdm-" + InstanceIdShort() + ".task_tag",
        incremental: true,
        items: [
          {
            name: "task_id",
            dbName: "TASK_ID",
            type: "STRING",
          },
          {
            name: "tag",
            dbName: "TAG",
            type: "STRING",
          },
        ],
      },
    ],
  },
}

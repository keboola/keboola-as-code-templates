{
  parameters: {
    tableId: "out.c-typeform-" + InstanceIdShort() + ".answer_option",
    dbName: "answer_option",
    incremental: true,
    primaryKey: [
      "answer_option_id",
    ],
    items: [
      {
        name: "answer_option_id",
        dbName: "answer_option_id",
        type: "varchar",
        nullable: true,
        default: "",
        size: "16777216",
      },
      {
        name: "question_id",
        dbName: "question_id",
        type: "varchar",
        nullable: true,
        default: "",
        size: "16777216",
      },
      {
        name: "question_heading",
        dbName: "question_heading",
        type: "varchar",
        nullable: true,
        default: "",
        size: "16777216",
      },
      {
        name: "choice_id",
        dbName: "choice_id",
        type: "varchar",
        nullable: true,
        default: "",
        size: "16777216",
      },
      {
        name: "choice_text",
        dbName: "choice_text",
        type: "varchar",
        nullable: true,
        default: "",
        size: "16777216",
      },
      {
        name: "field_type",
        dbName: "field_type",
        type: "varchar",
        nullable: true,
        default: "",
        size: "16777216",
      },
    ],
  },
  storage: {
    input: {
      tables: [
        {
          source: "out.c-typeform-" + InstanceIdShort() + ".answer_option",
          destination: "out.c-typeform-" + InstanceIdShort() + ".answer_option.csv",
          columns: [
            "answer_option_id",
            "question_id",
            "question_heading",
            "choice_id",
            "choice_text",
            "field_type",
          ],
          changed_since: "adaptive",
        },
      ],
    },
  },
}

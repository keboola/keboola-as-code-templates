{
  parameters: {},
  storage: {
    input: {
      tables: [
        {
          source: "in.c-fisa-ex-typeform-" + ConfigId("data-source-in-typeform") + ".form",
          destination: "form",
          column_types: [],
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-fisa-ex-typeform-" + ConfigId("data-source-in-typeform") + ".form_fields",
          destination: "form_fields",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-fisa-ex-typeform-" + ConfigId("data-source-in-typeform") + ".form_fields_properties",
          destination: "form_fields_properties",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-fisa-ex-typeform-" + ConfigId("data-source-in-typeform") + ".form_fields_properties_choices",
          destination: "form_fields_properties_choices",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-fisa-ex-typeform-" + ConfigId("data-source-in-typeform") + ".responses",
          destination: "responses",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-fisa-ex-typeform-" + ConfigId("data-source-in-typeform") + ".responses_answers",
          destination: "responses_answers",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
      ],
    },
    output: {
      tables: [
        {
          destination: "out.c-typeform-" + InstanceIdShort() + ".survey",
          source: "out_survey",
          incremental: true,
          delete_where_column: "",
          delete_where_operator: "eq",
          delete_where_values: [],
          primary_key: [
            "survey_id",
          ],
        },
        {
          destination: "out.c-typeform-" + InstanceIdShort() + ".question",
          source: "out_question",
          primary_key: [
            "question_id",
          ],
        },
        {
          destination: "out.c-typeform-" + InstanceIdShort() + ".responses",
          source: "out_responses",
          primary_key: [
            "response_id",
          ],
        },
        {
          destination: "out.c-typeform-" + InstanceIdShort() + ".answer_option",
          source: "out_answer_option",
          primary_key: [
            "answer_option_id",
          ],
        },
      ],
    },
  },
}

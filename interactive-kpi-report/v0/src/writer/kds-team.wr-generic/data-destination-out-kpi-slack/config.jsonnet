{
  parameters: {
    debug: true,
    api: {
      base_url: "https://slack.com",
    },
    user_parameters: {
      "#token": Input("slack_token"),
      token_encoded: {
        "function": "concat",
        args: [
          "Bearer ",
          {
            attr: "#token",
          },
        ],
      },
    },
    request_parameters: {
      method: "POST",
      endpoint_path: "/api/chat.postMessage?",
      headers: {
        Authorization: {
          attr: "token_encoded",
        },
        "Content-type": "application/json",
      },
    },
    request_content: {
      content_type: "JSON",
      json_mapping: {
        nesting_delimiter: "_",
        chunk_size: 1,
        column_data_types: {
          autodetect: true,
        },
        request_data_wrapper: "",
      },
    },
  },
  storage: {
    input: {
      tables: [
        {
          source: "in.c-kpi-report.slack",
          destination: "slack.csv",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
      ],
    },
  },
}

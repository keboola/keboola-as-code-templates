{
  parameters: {
    api: {
      baseUrl: {
        "function": "concat",
        args: [
          "https://",
          {
            attr: "dc",
          },
          ".api.mailchimp.com/3.0/",
        ],
      },
      pagination: {
        method: "offset",
        limit: 1000,
        limitParam: "count",
      },
      name: "mailchimp",
      authentication: {
        type: "basic",
      },
      retryConfig: {
        maxRetries: 15,
      },
    },
    config: {
      dc: Input("ex-mailchimp-config-dc"),
      username: Input ("ex-mailchimp-config-username"),
      "#password": Input("ex-mailchimp-config-password"),
      outputBucket: "mailchimp-ex-" + ConfigId("data-source-2-in-mailchimp"),
      incrementalOutput: false,
      debug: 0,
      jobs: [
        {
          endpoint: "lists",
          dataField: "lists",
          dataType: "lists",
          children: [
            {
              endpoint: "lists/{id}/members",
              placeholders: {
                id: "id",
              },
              dataField: "members",
              dataType: "members",
            },
          ],
        },
      ],
    },
  },
}

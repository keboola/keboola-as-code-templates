{ 
  configurations: [
    {
      componentId: "keboola.ex-mailchimp",
      id: ConfigId("data-source-1-in-mailchimp"),
      path: "extractor/keboola.ex-mailchimp/data-source-1-in-mailchimp",
      rows: [],
    },
    {
      componentId: "keboola.ex-mailchimp",
      id: ConfigId("data-source-2-in-mailchimp"),
      path: "extractor/keboola.ex-mailchimp/data-source-2-in-mailchimp",
      rows: [],
    },
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("transformation-in-mailchimp"),
      path: "transformation/keboola.snowflake-transformation/transformation-in-mailchimp",
      rows: [],
    },
  ],
}

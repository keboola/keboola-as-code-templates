{
  parameters: {
    endpoints: [
      "opportunities",
      "postings",
      "requisitions",
    ],
    destination: {
      load_type: "full_load",
    },
    sync_options: {
      end_date: "now",
      sync_mode: "incremental_sync",
      start_date: "3 months ago",
      additional_filters: {
        tag: "AI_Automation",
      },
    },
    authentication: {
      "#token": Input("ex-lever-authentication-token"),
    },
  },
}

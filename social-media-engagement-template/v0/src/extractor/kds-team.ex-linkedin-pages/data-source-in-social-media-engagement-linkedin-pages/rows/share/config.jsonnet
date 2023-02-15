{
  parameters: {
    endpoints: "share_statistics_time_bound",
    destination: {
      load_type: "incremental_load",
    },
    sync_options: {
      date_to: "now",
      date_from: Input("ex-linkedin-pages-sync-options-date-from"),
    },
  },
}

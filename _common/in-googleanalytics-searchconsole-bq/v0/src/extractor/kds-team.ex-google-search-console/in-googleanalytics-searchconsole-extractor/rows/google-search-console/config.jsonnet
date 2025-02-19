{
  parameters: {
    domain: Input("gsc-domain"),
    date_to: Input("gsc-to"),
    date_range: "Custom",
    out_table_name: "raw_search_console",
    search_type: "web",
    endpoint: "Search analytics",
    filter_groups: [],
    date_from: Input("gsc-from"),
    loading_options: {
      incremental: 0,
    },
    search_analytics_dimensions: "page, query, country, date",
  },
}

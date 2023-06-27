{
  parameters: {
    destination: {
      load_type: "incremental_load",
      output_table_name: ""
    },
    object_type: "report_prebuilt",
    report_settings_prebuilt: {
      time_range: {
        period: Input("ex-bingads-report-period"),
        time_zone: "BelgradeBratislavaBudapestLjubljanaPrague"
      },
      aggregation: "Daily",
      preset_name: "AdGroupPerformance",
      return_only_complete_data: true
    }
  }
}

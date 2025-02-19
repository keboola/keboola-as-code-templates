{
  parameters: {
    destination: {
      load_type: "incremental_load",
      output_table_name: "Campaigns"
    },
    object_type: "entity",
    bulk_settings: {
      download_entities: [
        "Campaigns",
        "Ads"
      ],
      since_last_sync_time: true
    }
  }
}

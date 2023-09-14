{
  parameters: {
    query: {
      query: "\n\nWITH main_table AS (\n    SELECT\n    *,\n    SHA256(CONCAT(event_date,event_timestamp,user_pseudo_id,ROW_NUMBER() OVER (PARTITION BY CONCAT(event_date,event_timestamp,user_pseudo_id)))) as ROW\n    FROM `keboola-plg`.`analytics_307519514`.`events_202*`\n)\n\nSELECT\nROW,\nkey,\nvalue.string_value,\nvalue.int_value,\nvalue.float_value,\nvalue.double_value,\nvalue.set_timestamp_micros\nFROM main_table\nLEFT JOIN UNNEST(user_properties) as up",
      tableName: "user_properties",
      incremental: false,
      primaryKey: [],
      useLegacySql: false,
    },
  },
}

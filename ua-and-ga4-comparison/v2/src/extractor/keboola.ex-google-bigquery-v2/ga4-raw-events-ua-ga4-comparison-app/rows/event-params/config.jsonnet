{
  parameters: {
    query: {
      query: "WITH main_table AS (\n    SELECT\n    *,\n    SHA256(CONCAT(event_date,event_timestamp,user_pseudo_id,ROW_NUMBER() OVER (PARTITION BY CONCAT(event_date,event_timestamp,user_pseudo_id)))) as ROW\n    FROM `keboola-plg`.`analytics_307519514`.`events_202*`\n)\n\nSELECT\nROW,\nevent_name,\nkey,\nvalue.string_value,\nvalue.int_value,\nvalue.float_value,\nvalue.double_value\nFROM main_table\nLEFT JOIN UNNEST(event_params) as ep",
      tableName: "event_params",
      incremental: false,
      primaryKey: [],
      useLegacySql: false,
    },
  },
}

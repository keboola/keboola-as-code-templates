{
  parameters: {},
  storage: {
    input: {
      tables: [
        {
          source: "in.c-kds-team-ex-google-search-console-" + ConfigId("in-googleanalytics-searchconsole-extractor") + ".raw_search_console",
          destination: "raw_search_console",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
      ],
    },
    output: {
      tables: [
        {
          delete_where_column: "",
          delete_where_operator: "eq",
          delete_where_values: [],
          destination: "out.c-bdm-" + InstanceIdShort() + ".gsc_ranking",
          incremental: true,
          primary_key: [],
          source: "search_console_grouped_ranking",
        },
      ],
    },
  },
}

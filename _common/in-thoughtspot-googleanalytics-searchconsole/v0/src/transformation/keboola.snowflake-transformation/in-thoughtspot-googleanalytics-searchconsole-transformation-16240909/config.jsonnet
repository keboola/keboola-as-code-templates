{
  parameters: {},
  storage: {
    input: {
      tables: [
        {
          source: "in.c-kds-team-ex-google-search-console-" + ConfigId("in-thoughtspot-googleanalytics-searchconsole-extractor-16240909") + ".raw_search_console",
          destination: "raw_search_console",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
          changed_since: "-7 days",
        },
      ],
    },
    output: {
      tables: [
        {
          delete_where_column: "",
          delete_where_operator: "eq",
          delete_where_values: [],
          destination: "out.c-thoughtspot-bdm-" + ConfigId("in-thoughtspot-googleanalytics-searchconsole-extractor-16240909") + ".gsc_ranking",
          incremental: true,
          primary_key: [
            "id_TBE",
          ],
          source: "search_console_grouped_ranking",
        },
      ],
    },
  },
}

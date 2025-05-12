{
  parameters: {},
  storage: {
    input: {
      tables: [
        {
          source: "in.c-kds-team-ex-confluence-" + ConfigId("my-confluence-data-source") + ".confluence_pages",
          destination: "confluence_pages.csv",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
          keep_internal_timestamp_column: false,
        },
      ],
    },
    output: {
      files: [
        {
          source: "conflu_pages.zip",
          tags: [
            "confluence_pages"
          ],
          is_permanent: false
        },
      ],
    },
  },
}

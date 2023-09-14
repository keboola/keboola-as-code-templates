{
  parameters: {
    dataApp: {
      git: {
        repository: "https://TBD.git",
        branch: "main",
        entrypoint: "app.py",
        private: false,
      },
      secrets: {
        "#kec_storage_token": Input("kbc-storage-token"),
      },
    }
  },
  storage: {
    input: {
      tables: [
        {
          source: "out.c-Marketing_cash_flow.ads_insight_fact",
          destination: "ads_insight_fact.csv",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
          keep_internal_timestamp_column: false,
        },
        {
          source: "out.c-Marketing_cash_flow.campaign_budget",
          destination: "campaign_budget.csv",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
          keep_internal_timestamp_column: false,
        },
      ],
    },
  },
}

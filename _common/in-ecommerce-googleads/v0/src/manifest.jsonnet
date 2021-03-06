{
  configurations: [
    {
      componentId: "keboola.ex-google-ads",
      id: ConfigId("in-ecommerce-googleads-extractor"),
      path: "extractor/keboola.ex-google-ads/in-ecommerce-googleads-extractor",
      rows: [
        {
          id: ConfigRowId("campaign"),
          path: "rows/campaign",
        },
      ],
    },
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("in-ecommerce-googleads-transformation"),
      path: "transformation/keboola.snowflake-transformation/in-ecommerce-googleads-transformation",
      rows: [],
    },
  ],
}

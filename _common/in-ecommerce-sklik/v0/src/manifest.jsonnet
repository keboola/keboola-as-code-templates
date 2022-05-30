{
  configurations: [
    {
      componentId: "keboola.ex-sklik",
      id: ConfigId("in-ecommerce-sklik-extractor"),
      path: "extractor/keboola.ex-sklik/in-ecommerce-sklik-extractor",
      rows: [],
    },
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("in-ecommerce-sklik-transformation"),
      path: "transformation/keboola.snowflake-transformation/in-ecommerce-sklik-transformation",
      rows: [],
    },
  ],
}

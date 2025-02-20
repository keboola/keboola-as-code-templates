{
  parameters: {
    shop: Input("ex-shopify-shop"),
    endpoints: {
      events: [],
      orders: true,
      products: false,
      customers: true,
    },
    "#api_token": Input("ex-shopify-api-token"),
    api_version: "2022-10",
    loading_options: {
      date_to: Input("ex-shopify-period-to-date"),
      date_since: Input("ex-shopify-period-from-date"),
      incremental_output: 1,
    },
  },
}

{
  parameters: {
    shop: Input("ex-shopify-shop"),
    endpoints: {
      events: [],
      orders: true,
      products: true,
      customers: true,
      inventory: true,
      product_metafields: false,
      variant_metafields: false,
    },
    "#api_token": Input("ex-shopify-api-token"),
    loading_options: {
      date_to: Input("ex-shopify-period-to-date"),
      date_since: Input("ex-shopify-period-from-date"),
      incremental_output: 1,
    },
    debug: false,
  },
}

{
  parameters: {
    date_to: Input("ex-woocommerce-date-to"),
    store_url: Input("ex-woocommerce-store-url"),
    load_type: 1,
    endpoint: [
      "Customers",
      "Orders",
      "Products",
    ],
    "#consumer_secret": Input("ex-woocommerce-consumer-secret"),
    "#consumer_key": Input("ex-woocommerce-consumer-key"),
    fetching_mode: "Incremental Fetching with publish date",
    date_from: Input("ex-woocommerce-date-from"),
    query_string_auth: false,
  },
  runtime: {
    process_timeout: 7200
  },
}

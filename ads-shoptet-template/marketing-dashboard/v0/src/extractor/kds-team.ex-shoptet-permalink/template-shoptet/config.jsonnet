{
  parameters: {
    base_url: Input("ex-shoptet-permalink-base-url"),
    additional_data: [],
    customers_url: Input("ex-shoptet-permalink-customers-url"),
    stock_url: "",
    delimiter: ";",
    src_charset: "windows-1250",
    products_url: Input("ex-shoptet-permalink-products-url"),
    shop_name: Input("ex-shoptet-permalink-shop-name"),
    orders_url: Input("ex-shoptet-permalink-orders-url"),
    loading_options: {
      date_to: Input("ex-shoptet-permalink-loading-options-date-to"),
      date_since: Input("ex-shoptet-permalink-loading-options-date-since"),
      backfill_mode: 0,
      chunk_size_days: 360,
      incremental_output: 1,
    },
  },
  storage: {
    output: {
      default_bucket: "in.c-Shoptet-" + ConfigId("template-shoptet"),
    },
  },
}

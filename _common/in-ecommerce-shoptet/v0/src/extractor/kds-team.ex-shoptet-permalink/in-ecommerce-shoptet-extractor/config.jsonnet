{
  parameters: {
    additional_data: [],
    delimiter: Input("ex-shoptet-permalink-delimiter"),
    src_charset: Input("ex-shoptet-permalink-src-charset"),
    shop_name: Input("ex-shoptet-permalink-shop-name"),
    base_url: Input("ex-shoptet-permalink-base-url"),
    orders_url: Input("ex-shoptet-permalink-orders-url"),
    products_url: Input("ex-shoptet-permalink-products-url"),
    customers_url: Input("ex-shoptet-permalink-customers-url"),
    stock_url: Input("ex-shoptet-permalink-stock-url"),
    loading_options: {
      date_to: Input("ex-shoptet-permalink-to-date"),
      date_since: Input("ex-shoptet-permalink-from-date"),
      backfill_mode: 0,
      chunk_size_days: 360,
      incremental_output: 1
      },
  }
}

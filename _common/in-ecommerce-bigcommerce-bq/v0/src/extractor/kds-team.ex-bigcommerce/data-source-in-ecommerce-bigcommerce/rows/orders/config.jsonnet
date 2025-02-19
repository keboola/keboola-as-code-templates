{
  parameters: {
    endpoints: "orders",
    destination: {
      load_type: "full_load",
    },
    sync_options: {
      date_to: Input("ex-bigcommerce-date-to"),
      date_from: Input("ex-bigcommerce-date-from"),
    },
  },
}

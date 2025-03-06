{
  parameters: {},
  storage: {
    input: {
      tables: [
        {
          source: "out.c-ecommerce-wr-" + InstanceIdShort() + ".bdm_analyze_clv_by_order_count",
          destination: "bdmAnalyzeClvByOrderCount",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: []
        },
        {
          source: "out.c-ecommerce-wr-" + InstanceIdShort() + ".bdm_analyze_clv_by_time_from_previous_order",
          destination: "bdmAnalyzeClvByTimeFromPreviousOrder",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: []
        },
        {
          source: "out.c-ecommerce-wr-" + InstanceIdShort() + ".bdm_billing_type",
          destination: "bdmBillingType",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: []
        },
        {
          source: "out.c-ecommerce-wr-" + InstanceIdShort() + ".bdm_customers",
          destination: "bdmCustomers",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: []
        },
        {
          source: "out.c-ecommerce-wr-" + InstanceIdShort() + ".bdm_order_lines",
          destination: "bdmOrderLines",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: []
        },
        {
          source: "out.c-ecommerce-wr-" + InstanceIdShort() + ".bdm_orders",
          destination: "bdmOrders",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: []
        },
        {
          source: "out.c-ecommerce-wr-" + InstanceIdShort() + ".bdm_product_margin_over_time",
          destination: "bdmProductMarginOverTime",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: []
        },
        {
          source: "out.c-ecommerce-wr-" + InstanceIdShort() + ".bdm_products",
          destination: "bdmProducts",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: []
        },
        {
          source: "out.c-ecommerce-wr-" + InstanceIdShort() + ".bdm_rfm",
          destination: "bdmRfm",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: []
        },
        {
          source: "out.c-ecommerce-wr-" + InstanceIdShort() + ".bdm_shipping_type",
          destination: "bdmShippingType",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: []
        }
      ]
    },
    output: {
      tables: [
        {
          destination: "out.c-ecommerce-wr-ds" + InstanceIdShort() + ".bdmOrderLinesEnrich",
          source: "bdmOrderLinesEnrich"
        },
        {
          destination: "out.c-ecommerce-wr-ds" + InstanceIdShort() + ".bdmProductsEnrich",
          source: "bdmProductsEnrich"
        },
        {
          destination: "out.c-ecommerce-wr-ds" + InstanceIdShort() + ".bdmOrdersEnrich",
          source: "bdmOrdersEnrich"
        },
        {
          destination: "out.c-ecommerce-wr-ds" + InstanceIdShort() + ".bdmRfmEnrich",
          source: "bdmRfmEnrich"
        },
        {
          destination: "out.c-ecommerce-wr-ds" + InstanceIdShort() + ".bdmCustomerEnrich",
          source: "bdmCustomerEnrich"
        }
      ]
    }
  }
}

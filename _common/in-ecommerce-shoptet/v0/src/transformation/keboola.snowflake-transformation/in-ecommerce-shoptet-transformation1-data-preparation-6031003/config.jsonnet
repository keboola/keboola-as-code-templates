{
  parameters: {},
  storage: {
    input: {
      tables: [
        {
          source: "in.c-kds-team-ex-shoptet-permalink-" + ConfigId("in-ecommerce-shoptet-extractor-6031003") + ".customers",
          destination: "customers",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-kds-team-ex-shoptet-permalink-" + ConfigId("in-ecommerce-shoptet-extractor-6031003") + ".orders",
          destination: "orders",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-kds-team-ex-shoptet-permalink-" + ConfigId("in-ecommerce-shoptet-extractor-6031003") + ".products",
          destination: "products",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-kds-team-ex-shoptet-permalink-" + ConfigId("in-ecommerce-shoptet-extractor-6031003") + ".shoptet",
          destination: "shoptet",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-kds-team-ex-shoptet-permalink-" + ConfigId("in-ecommerce-shoptet-extractor-6031003") + ".stocks",
          destination: "stocks",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
      ],
    },
    output: {
      tables: [
        {
          destination: "out.c-ecommerce-wr-" + InstanceIdShort() + ".bdm_customers",
          source: "bdm_customers",
          primary_key: [
            "CUSTOMER_ACCOUNT_GUID",
          ],
        },
        {
          destination: "out.c-ecommerce-wr-" + InstanceIdShort() + ".bdm_orders",
          source: "bdm_orders",
          primary_key: [
            "ORDER_ID",
          ],
        },
        {
          destination: "out.c-ecommerce-wr-" + InstanceIdShort() + ".bdm_order_lines",
          source: "bdm_order_lines",
          primary_key: [
            "ORDER_LINE_ID",
          ],
        },
        {
          destination: "out.c-ecommerce-wr-" + InstanceIdShort() + ".bdm_products",
          source: "bdm_products",
          primary_key: [
            "PRODUCT_ID",
          ],
        },
        {
          destination: "out.c-ecommerce-wr-" + InstanceIdShort() + ".bdm_analyze_clv_by_order_count",
          source: "analyze_clv_by_order_count",
        },
        {
          destination: "out.c-ecommerce-wr-" + InstanceIdShort() + ".bdm_analyze_clv_by_time_from_previous_order",
          source: "analyze_clv_by_time_from_previous_order",
        },
        {
          destination: "out.c-ecommerce-wr-" + InstanceIdShort() + ".bdm_billing_type",
          source: "bdm_billing_type",
          primary_key: [
            "BILLING_TYPE_ID",
          ],
        },
        {
          destination: "out.c-ecommerce-wr-" + InstanceIdShort() + ".bdm_shipping_type",
          source: "bdm_shipping_type",
          primary_key: [
            "SHIPPING_TYPE_ID",
          ],
        },
        {
          destination: "out.c-ecommerce-wr-" + InstanceIdShort() + ".bdm_product_margin_over_time",
          source: "bdm_product_margin_over_time",
        },
        {
          destination: "out.c-ecommerce-wr-" + InstanceIdShort() + ".out_shop",
          source: "out_shoptet",
        },
      ],
    },
  },
  processors: {
    after: [
      {
        definition: {
          component: "keboola.processor-add-metadata",
        },
        parameters: {
          tables: [
            {
              table: "bdm_customers",
              metadata: [
                {
                  key: "bdm.scaffold.table.tag",
                  value: "ShoptetEcommerce.internal.outBdmCustomers",
                },
                {
                  key: "scaffold.id",
                  value: "ShoptetEcommerce",
                },
              ],
            },
            {
              table: "bdm_orders",
              metadata: [
                {
                  key: "bdm.scaffold.table.tag",
                  value: "ShoptetEcommerce.internal.outBdmOrders",
                },
                {
                  key: "scaffold.id",
                  value: "ShoptetEcommerce",
                },
              ],
            },
            {
              table: "bdm_order_lines",
              metadata: [
                {
                  key: "bdm.scaffold.table.tag",
                  value: "ShoptetEcommerce.internal.outBdmOrderLines",
                },
                {
                  key: "scaffold.id",
                  value: "ShoptetEcommerce",
                },
              ],
            },
            {
              table: "bdm_products",
              metadata: [
                {
                  key: "bdm.scaffold.table.tag",
                  value: "ShoptetEcommerce.internal.outBdmProducts",
                },
                {
                  key: "scaffold.id",
                  value: "ShoptetEcommerce",
                },
              ],
            },
            {
              table: "analyze_clv_by_order_count",
              metadata: [
                {
                  key: "bdm.scaffold.table.tag",
                  value: "ShoptetEcommerce.internal.outBdmAnalyzeClvByOrderCount",
                },
                {
                  key: "scaffold.id",
                  value: "ShoptetEcommerce",
                },
              ],
            },
            {
              table: "analyze_clv_by_time_from_previous_order",
              metadata: [
                {
                  key: "bdm.scaffold.table.tag",
                  value: "ShoptetEcommerce.internal.outBdmAnalyzeClvByTimeFromPreviousOrder",
                },
                {
                  key: "scaffold.id",
                  value: "ShoptetEcommerce",
                },
              ],
            },
            {
              table: "bdm_billing_type",
              metadata: [
                {
                  key: "bdm.scaffold.table.tag",
                  value: "ShoptetEcommerce.internal.outBdmBillingType",
                },
                {
                  key: "scaffold.id",
                  value: "ShoptetEcommerce",
                },
              ],
            },
            {
              table: "bdm_shipping_type",
              metadata: [
                {
                  key: "bdm.scaffold.table.tag",
                  value: "ShoptetEcommerce.internal.outBdmShippingType",
                },
                {
                  key: "scaffold.id",
                  value: "ShoptetEcommerce",
                },
              ],
            },
            {
              table: "bdm_product_margin_over_time",
              metadata: [
                {
                  key: "bdm.scaffold.table.tag",
                  value: "ShoptetEcommerce.internal.outBdmProductMarginOverTime",
                },
                {
                  key: "scaffold.id",
                  value: "ShoptetEcommerce",
                },
              ],
            },
            {
              table: "out_shoptet",
              metadata: [
                {
                  key: "bdm.scaffold.table.tag",
                  value: "ShoptetEcommerce.internal.outBdmShoptet",
                },
                {
                  key: "scaffold.id",
                  value: "ShoptetEcommerce",
                },
              ],
            },
          ],
        },
      },
    ],
  },
}

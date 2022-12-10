{
  parameters: {
    dbt: {
      freshness: {
        warn_after: {
          count: 1,
          active: true,
          period: "day",
        },
        error_after: {
          count: 2,
          active: true,
          period: "day",
        },
      },
      executeSteps: [
        "dbt run",
        "dbt test",
        "dbt docs generate",
      ],
    },
    showExecutedSqls: true,
    git: {
      repo: "https://bitbucket.org/kds_consulting_team/keboola_dbt_tutorial.git",
      branch: "main",
    },
    storage: {
      input: {
        tables: [
          {
            source: "in.c-keboola-ex-http-" + ConfigId("dbt-seed-files") + ".seed_beers",
          },
          {
            source: "in.c-keboola-ex-http-" + ConfigId("dbt-seed-files") + ".seed_breweries",
          },
        ],
      },
    },
  },
  storage: {
    output: {
      tables: [
        {
          destination: "out.c-beer-demo.beers",
          source: "beers",
          incremental: true,
          delete_where_column: "",
          delete_where_operator: "eq",
          delete_where_values: [],
          primary_key: [
            "BEER_ID",
          ],
        },
        {
          destination: "out.c-beer-demo.beers_with_breweries",
          source: "beers_with_breweries",
          incremental: true,
          delete_where_column: "",
          delete_where_operator: "eq",
          delete_where_values: [],
          primary_key: [
            "BEER_ID",
            "BREWERY_ID",
          ],
        },
        {
          destination: "out.c-beer-demo.breweries",
          source: "breweries",
          incremental: true,
          delete_where_column: "",
          delete_where_operator: "eq",
          delete_where_values: [],
          primary_key: [
            "BREWERY_ID",
          ],
        },
        {
          destination: "out.c-beer-demo.order_lines",
          source: "order_lines",
          incremental: true,
          delete_where_column: "",
          delete_where_operator: "eq",
          delete_where_values: [],
          primary_key: [
            "ORDER_NO",
            "ORDER_LINE",
          ],
        },
        {
          destination: "out.c-beer-demo.orders",
          source: "orders",
          incremental: true,
          delete_where_column: "",
          delete_where_operator: "eq",
          delete_where_values: [],
          primary_key: [
            "ORDER_NO",
          ],
        },
        {
          destination: "out.c-beer-demo.promo_deliveries",
          source: "promo_deliveries",
          incremental: true,
          delete_where_column: "",
          delete_where_operator: "eq",
          delete_where_values: [],
          primary_key: [
            "CUSTOMER_ID",
          ],
        },
        {
          destination: "out.c-beer-demo.sales",
          source: "sales",
          incremental: true,
          delete_where_column: "",
          delete_where_operator: "eq",
          delete_where_values: [],
          primary_key: [
            "ORDER_NO",
            "ORDER_LINE",
          ],
        },
      ],
    },
  },
}

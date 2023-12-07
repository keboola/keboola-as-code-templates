{
  parameters: {
    skipGenerateSystemTables: true,
    outputTable: "raw_page_behaviour",
    query: {
          dimensions: [
            {
              name: "ga:date",
            },
            {
              name: "ga:hostname",
            },
            {
              name: "ga:pagePath",
            },
            {
              name: "ga:landingPagePath",
            },
            {
              name: "ga:secondPagePath",
            },
            {
              name: "ga:exitPagePath",
            },
            {
              name: "ga:pageTitle",
            },
            {
              name: "ga:source",
            },
            {
              name: "ga:country",
            },
          ],
          metrics: [
            {
              expression: "ga:sessions",
            },
            {
              expression: "ga:entrances",
            },
            {
              expression: "ga:pageviews",
            },
            {
              expression: "ga:timeOnPage",
            },
            {
              expression: "ga:exits",
            },
            {
              expression: "ga:pageValue",
            },
          ],
        dateRanges: [
            {
              endDate: Input("ga-to"),
              startDate: Input("ga-from"),
            },
        ]
      },
      endpoint: "reports",
  }
}
{
  parameters: {
    skipGenerateSystemTables: true,
    outputTable: "raw_site_statistics",
    query: {
          dimensions: [
            {
              name: "ga:hostname",
            },
            {
              name: "ga:pagePath",
            },
            {
              name: "ga:country",
            },
            {
              name: "ga:browser",
            },
            {
              name: "ga:operatingSystemVersion",
            },
            {
              name: "ga:deviceCategory",
            },
            {
              name: "ga:operatingSystem",
            },
            {
              name: "ga:language",
            },
            {
              name: "ga:dateHourMinute",
            },
          ],
          metrics: [
            {
              expression: "ga:sessions",
            },
            {
              expression: "ga:pageviews",
            },
            {
              expression: "ga:avgPageLoadTime",
            },
            {
              expression: "ga:avgPageDownloadTime",
            },
            {
              expression: "ga:avgRedirectionTime",
            },
            {
              expression: "ga:avgServerConnectionTime",
            },
            {
              expression: "ga:serverResponseTime",
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
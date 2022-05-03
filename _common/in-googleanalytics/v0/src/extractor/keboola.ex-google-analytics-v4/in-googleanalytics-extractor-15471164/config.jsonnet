{
  authorization: {
    oauth_api: {},
  },
  parameters: {
    outputBucket: "in.c-kds-team-ex-google-analytics-" + ConfigId("in-googleanalytics-extractor-15471164"),
    profiles: [
      {},
    ],
    queries: [
      {
        enabled: true,
        endpoint: "reports",
        id: 87215,
        name: "RawTrafficSource",
        outputTable: "raw_traffic_source",
        query: {
          dateRanges: [
            {
              endDate: "-1 days",
              startDate: "-7 days",
            },
          ],
          dimensions: [
            {
              name: "ga:userType",
            },
            {
              name: "ga:date",
            },
            {
              name: "ga:campaign",
            },
            {
              name: "ga:source",
            },
            {
              name: "ga:medium",
            },
            {
              name: "ga:keyword",
            },
            {
              name: "ga:adContent",
            },
            {
              name: "ga:socialNetwork",
            },
            {
              name: "ga:channelGrouping",
            },
          ],
          metrics: [
            {
              expression: "ga:sessions",
            },
            {
              expression: "ga:users",
            },
            {
              expression: "ga:bounces",
            },
            {
              expression: "ga:sessionDuration",
            },
            {
              expression: "ga:pageviews",
            },
            {
              expression: "ga:organicSearches",
            },
          ],
        },
      },
      {
        enabled: true,
        endpoint: "reports",
        id: 66354,
        name: "RawGeoAudience",
        outputTable: "raw_geo_audience",
        query: {
          dateRanges: [
            {
              endDate: "-1 days",
              startDate: "-7 days",
            },
          ],
          dimensions: [
            {
              name: "ga:date",
            },
            {
              name: "ga:country",
            },
            {
              name: "ga:region",
            },
            {
              name: "ga:latitude",
            },
            {
              name: "ga:longitude",
            },
            {
              name: "ga:channelGrouping",
            },
            {
              name: "ga:userType",
            },
            {
              name: "ga:source",
            },
            {
              name: "ga:medium",
            },
          ],
          metrics: [
            {
              expression: "ga:sessions",
            },
            {
              expression: "ga:users",
            },
            {
              expression: "ga:bounces",
            },
            {
              expression: "ga:sessionDuration",
            },
            {
              expression: "ga:pageviews",
            },
          ],
        },
      },
      {
        enabled: true,
        endpoint: "reports",
        id: 92636,
        name: "RawPageBehaviour",
        outputTable: "raw_page_behaviour",
        query: {
          dateRanges: [
            {
              endDate: "-1 days",
              startDate: "-7 days",
            },
          ],
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
        },
      },
      {
        enabled: true,
        endpoint: "reports",
        id: 30212,
        name: "RawSiteStatistics",
        outputTable: "raw_site_statistics",
        query: {
          dateRanges: [
            {
              endDate: "-1 days",
              startDate: "-7 days",
            },
          ],
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
        },
      },
      {
        enabled: true,
        endpoint: "reports",
        id: 92743,
        name: "RawAdAnalytics",
        outputTable: "raw_ad_analytics",
        query: {
          dateRanges: [
            {
              endDate: "-1 days",
              startDate: "-7 days",
            },
          ],
          dimensions: [
            {
              name: "ga:date",
            },
            {
              name: "ga:adGroup",
            },
            {
              name: "ga:adContent",
            },
            {
              name: "ga:adDistributionNetwork",
            },
            {
              name: "ga:campaign",
            },
            {
              name: "ga:adSlot",
            },
          ],
          metrics: [
            {
              expression: "ga:impressions",
            },
            {
              expression: "ga:adClicks",
            },
            {
              expression: "ga:adCost",
            },
            {
              expression: "ga:CPM",
            },
            {
              expression: "ga:CPC",
            },
            {
              expression: "ga:transactionRevenue",
            },
            {
              expression: "ga:sessions",
            },
            {
              expression: "ga:bounces",
            },
            {
              expression: "ga:users",
            },
            {
              expression: "ga:pageviews",
            },
          ],
        },
      },
      {
        enabled: true,
        endpoint: "reports",
        id: 63743,
        name: "RawDemographicAudience",
        outputTable: "raw_demographic_audience",
        query: {
          dateRanges: [
            {
              endDate: "-1 days",
              startDate: "-7 days",
            },
          ],
          dimensions: [
            {
              name: "ga:date",
            },
            {
              name: "ga:userAgeBracket",
            },
            {
              name: "ga:userGender",
            },
            {
              name: "ga:interestAffinityCategory",
            },
            {
              name: "ga:channelGrouping",
            },
            {
              name: "ga:userType",
            },
            {
              name: "ga:source",
            },
            {
              name: "ga:medium",
            },
          ],
          metrics: [
            {
              expression: "ga:sessions",
            },
            {
              expression: "ga:users",
            },
            {
              expression: "ga:bounces",
            },
            {
              expression: "ga:sessionDuration",
            },
            {
              expression: "ga:pageviews",
            },
          ],
        },
      },
    ],
  },
}

{
  parameters: {
    api: {
      baseUrl: "https://api.linkedin.com/v2/",
      authentication: {
        type: "oauth20",
        format: "json",
        headers: {
          Authorization: {
            "function": "concat",
            args: [
              "Bearer ",
              {
                authorization: "data.access_token",
              },
            ],
          },
        },
      },
      pagination: {
        method: "multiple",
        scrollers: {
          campaign_scroller: {
            method: "offset",
            limit: 10,
            offsetParam: "start",
            limitParam: "count",
          },
        },
      },
    },
    config: {
      timeGranularity: "DAILY",
      end_year: ''+Input("ex-linkedin-end-year"),
      pivot: "CAMPAIGN",
      start_month: ''+Input("ex-linkedin-start-month"),
      end_day: ''+Input("ex-linkedin-end-day"),
      start_year: ''+Input("ex-linkedin-start-year"),
      end_month: ''+Input("ex-linkedin-end-month"),
      start_day: ''+Input("ex-linkedin-start-day"),
      incrementalOutput: true,
      jobs: [
        {
          endpoint: "adCampaignsV2",
          params: {
            q: "search",
            "search.status.values[0]": "ACTIVE",
            "search.status.values[1]": "COMPLETED",
            "search.status.values[2]": "PAUSED",
            "search.status.values[3]": "ARCHIVED",
            "search.status.values[4]": "CANCELED",
            "search.status.values[5]": "DRAFT",
          },
          dataField: "elements",
          dataType: "campaigns",
          scroller: "campaign_scroller",
          children: [
            {
              endpoint: "adAnalyticsV2?campaigns[0]=urn:li:sponsoredCampaign:{campaign_id}",
              placeholders: {
                campaign_id: "id",
              },
              dataField: "elements",
              dataType: "ads_inmail_stats",
              params: {
                q: "analytics",
                timeGranularity: {
                  attr: "timeGranularity",
                },
                pivot: {
                  attr: "pivot",
                },
                "dateRange.start.year": {
                  "function": "date",
                  args: [
                    "Y",
                    {
                      "function": "strtotime",
                      args: [
                        "-7 days",
                      ],
                    },
                  ],
                },
                "dateRange.start.day": {
                  "function": "date",
                  args: [
                    "d",
                    {
                      "function": "strtotime",
                      args: [
                        "-7 days",
                      ],
                    },
                  ],
                },
                "dateRange.start.month": {
                  "function": "date",
                  args: [
                    "m",
                    {
                      "function": "strtotime",
                      args: [
                        "-7 days",
                      ],
                    },
                  ],
                },
                fields: "dateRange,pivotValue,pivot,actionClicks,adUnitClicks,leadGenerationMailContactInfoShares,leadGenerationMailInterestedClicks,opens,sends,textUrlClicks",
              },
            },
            {
              endpoint: "adAnalyticsV2?campaigns[0]=urn:li:sponsoredCampaign:{campaign_id}",
              placeholders: {
                campaign_id: "id",
              },
              dataField: "elements",
              dataType: "ads_basic_stats",
              params: {
                q: "analytics",
                timeGranularity: {
                  attr: "timeGranularity",
                },
                pivot: {
                  attr: "pivot",
                },
                "dateRange.start.year": {
                  "function": "date",
                  args: [
                    "Y",
                    {
                      "function": "strtotime",
                      args: [
                        "-7 days",
                      ],
                    },
                  ],
                },
                "dateRange.start.day": {
                  "function": "date",
                  args: [
                    "d",
                    {
                      "function": "strtotime",
                      args: [
                        "-7 days",
                      ],
                    },
                  ],
                },
                "dateRange.start.month": {
                  "function": "date",
                  args: [
                    "m",
                    {
                      "function": "strtotime",
                      args: [
                        "-7 days",
                      ],
                    },
                  ],
                },
                fields: "dateRange,pivotValue,pivot,clicks,commentLikes,comments,companyPageClicks,follows,impressions,landingPageClicks,likes,otherEngagements,reactions,shares,totalEngagements",
              },
            },
            {
              endpoint: "adAnalyticsV2?campaigns[0]=urn:li:sponsoredCampaign:{campaign_id}",
              placeholders: {
                campaign_id: "id",
              },
              dataField: "elements",
              dataType: "ads_cost",
              params: {
                q: "analytics",
                timeGranularity: {
                  attr: "timeGranularity",
                },
                pivot: {
                  attr: "pivot",
                },
                "dateRange.start.year": {
                  "function": "date",
                  args: [
                    "Y",
                    {
                      "function": "strtotime",
                      args: [
                        "-7 days",
                      ],
                    },
                  ],
                },
                "dateRange.start.day": {
                  "function": "date",
                  args: [
                    "d",
                    {
                      "function": "strtotime",
                      args: [
                        "-7 days",
                      ],
                    },
                  ],
                },
                "dateRange.start.month": {
                  "function": "date",
                  args: [
                    "m",
                    {
                      "function": "strtotime",
                      args: [
                        "-7 days",
                      ],
                    },
                  ],
                },
                fields: "dateRange,pivotValue,pivot,conversionValueInLocalCurrency,costInLocalCurrency,costInUsd",
              },
            },
            {
              endpoint: "adAnalyticsV2?campaigns[0]=urn:li:sponsoredCampaign:{campaign_id}",
              placeholders: {
                campaign_id: "id",
              },
              dataField: "elements",
              dataType: "ads_other_stats",
              params: {
                q: "analytics",
                timeGranularity: {
                  attr: "timeGranularity",
                },
                pivot: {
                  attr: "pivot",
                },
                "dateRange.start.year": {
                  "function": "date",
                  args: [
                    "Y",
                    {
                      "function": "strtotime",
                      args: [
                        "-7 days",
                      ],
                    },
                  ],
                },
                "dateRange.start.day": {
                  "function": "date",
                  args: [
                    "d",
                    {
                      "function": "strtotime",
                      args: [
                        "-7 days",
                      ],
                    },
                  ],
                },
                "dateRange.start.month": {
                  "function": "date",
                  args: [
                    "m",
                    {
                      "function": "strtotime",
                      args: [
                        "-7 days",
                      ],
                    },
                  ],
                },
                fields: "dateRange,pivotValue,pivot,externalWebsiteConversions,externalWebsitePostClickConversions,externalWebsitePostViewConversions,oneClickLeadFormOpens,oneClickLeads",
              },
            },
            {
              endpoint: "adAnalyticsV2?campaigns[0]=urn:li:sponsoredCampaign:{campaign_id}",
              placeholders: {
                campaign_id: "id",
              },
              dataField: "elements",
              dataType: "ads_video_stats",
              params: {
                q: "analytics",
                timeGranularity: {
                  attr: "timeGranularity",
                },
                pivot: {
                  attr: "pivot",
                },
                "dateRange.start.year": {
                  "function": "date",
                  args: [
                    "Y",
                    {
                      "function": "strtotime",
                      args: [
                        "-7 days",
                      ],
                    },
                  ],
                },
                "dateRange.start.day": {
                  "function": "date",
                  args: [
                    "d",
                    {
                      "function": "strtotime",
                      args: [
                        "-7 days",
                      ],
                    },
                  ],
                },
                "dateRange.start.month": {
                  "function": "date",
                  args: [
                    "m",
                    {
                      "function": "strtotime",
                      args: [
                        "-7 days",
                      ],
                    },
                  ],
                },
                fields: "dateRange,pivotValue,pivot,fullScreenPlays,videoCompletions,videoFirstQuartileCompletions,videoMidpointCompletions,videoStarts,videoThirdQuartileCompletions,videoViews",
              },
            },
            {
              endpoint: "adAnalyticsV2?campaigns[0]=urn:li:sponsoredCampaign:{campaign_id}",
              placeholders: {
                campaign_id: "id",
              },
              dataField: "elements",
              dataType: "ads_basic_viral_stats",
              params: {
                q: "analytics",
                timeGranularity: {
                  attr: "timeGranularity",
                },
                pivot: {
                  attr: "pivot",
                },
                "dateRange.start.year": {
                  "function": "date",
                  args: [
                    "Y",
                    {
                      "function": "strtotime",
                      args: [
                        "-7 days",
                      ],
                    },
                  ],
                },
                "dateRange.start.day": {
                  "function": "date",
                  args: [
                    "d",
                    {
                      "function": "strtotime",
                      args: [
                        "-7 days",
                      ],
                    },
                  ],
                },
                "dateRange.start.month": {
                  "function": "date",
                  args: [
                    "m",
                    {
                      "function": "strtotime",
                      args: [
                        "-7 days",
                      ],
                    },
                  ],
                },
                fields: "dateRange,pivotValue,pivot,viralClicks,viralCommentLikes,viralComments,viralCompanyPageClicks,viralFollows,viralImpressions,viralLandingPageClicks,viralLikes,viralOtherEngagements,viralReactions,viralShares,viralTotalEngagements",
              },
            },
            {
              endpoint: "adAnalyticsV2?campaigns[0]=urn:li:sponsoredCampaign:{campaign_id}",
              placeholders: {
                campaign_id: "id",
              },
              dataField: "elements",
              dataType: "ads_other_viral_stats",
              params: {
                q: "analytics",
                timeGranularity: {
                  attr: "timeGranularity",
                },
                pivot: {
                  attr: "pivot",
                },
                "dateRange.start.year": {
                  "function": "date",
                  args: [
                    "Y",
                    {
                      "function": "strtotime",
                      args: [
                        "-7 days",
                      ],
                    },
                  ],
                },
                "dateRange.start.day": {
                  "function": "date",
                  args: [
                    "d",
                    {
                      "function": "strtotime",
                      args: [
                        "-7 days",
                      ],
                    },
                  ],
                },
                "dateRange.start.month": {
                  "function": "date",
                  args: [
                    "m",
                    {
                      "function": "strtotime",
                      args: [
                        "-7 days",
                      ],
                    },
                  ],
                },
                fields: "dateRange,pivotValue,pivot,viralExternalWebsiteConversions,viralExternalWebsitePostClickConversions,viralExternalWebsitePostViewConversions,viralOneClickLeadFormOpens,viralOneClickLeads",
              },
            },
            {
              endpoint: "adAnalyticsV2?campaigns[0]=urn:li:sponsoredCampaign:{campaign_id}",
              placeholders: {
                campaign_id: "id",
              },
              dataField: "elements",
              dataType: "ads_video_viral_stats",
              params: {
                q: "analytics",
                timeGranularity: {
                  attr: "timeGranularity",
                },
                pivot: {
                  attr: "pivot",
                },
                "dateRange.start.year": {
                  "function": "date",
                  args: [
                    "Y",
                    {
                      "function": "strtotime",
                      args: [
                        "-7 days",
                      ],
                    },
                  ],
                },
                "dateRange.start.day": {
                  "function": "date",
                  args: [
                    "d",
                    {
                      "function": "strtotime",
                      args: [
                        "-7 days",
                      ],
                    },
                  ],
                },
                "dateRange.start.month": {
                  "function": "date",
                  args: [
                    "m",
                    {
                      "function": "strtotime",
                      args: [
                        "-7 days",
                      ],
                    },
                  ],
                },
                fields: "dateRange,pivotValue,pivot,viralFullScreenPlays,viralVideoCompletions,viralVideoFirstQuartileCompletions,viralVideoMidpointCompletions,viralVideoStarts,viralVideoThirdQuartileCompletions,viralVideoViews",
              },
            },
          ],
        },
      ],
      mappings: {
        ads_other_stats: {
          pivot: {
            type: "column",
            mapping: {
              destination: "pivot",
              primaryKey: true,
            },
          },
          externalWebsitePostClickConversions: {
            type: "column",
            mapping: {
              destination: "externalWebsitePostClickConversions",
            },
          },
          oneClickLeadFormOpens: {
            type: "column",
            mapping: {
              destination: "oneClickLeadFormOpens",
            },
          },
          externalWebsitePostViewConversions: {
            type: "column",
            mapping: {
              destination: "externalWebsitePostViewConversions",
            },
          },
          "dateRange.start.year": {
            type: "column",
            mapping: {
              destination: "start_year",
              primaryKey: true,
            },
          },
          "dateRange.end.day": {
            type: "column",
            mapping: {
              destination: "end_day",
              primaryKey: true,
            },
          },
          externalWebsiteConversions: {
            type: "column",
            mapping: {
              destination: "externalWebsiteConversions",
            },
          },
          "dateRange.end.month": {
            type: "column",
            mapping: {
              destination: "end_month",
              primaryKey: true,
            },
          },
          "dateRange.end.year": {
            type: "column",
            mapping: {
              destination: "end_year",
              primaryKey: true,
            },
          },
          pivotValue: {
            type: "column",
            mapping: {
              destination: "pivotValue",
              primaryKey: true,
            },
          },
          "dateRange.start.day": {
            type: "column",
            mapping: {
              destination: "start_day",
              primaryKey: true,
            },
          },
          "dateRange.start.month": {
            type: "column",
            mapping: {
              destination: "start_month",
              primaryKey: true,
            },
          },
          oneClickLeads: {
            type: "column",
            mapping: {
              destination: "oneClickLeads",
            },
          },
        },
        campaigns: {
          "targeting.includedTargetingFacets.locations.0": {
            type: "column",
            mapping: {
              destination: "targeting_locations",
            },
          },
          "changeAuditStamps.created.time": {
            type: "column",
            mapping: {
              destination: "created",
            },
          },
          audienceExpansionEnabled: {
            type: "column",
            mapping: {
              destination: "audienceExpansionEnabled",
            },
          },
          costType: {
            type: "column",
            mapping: {
              destination: "costType",
            },
          },
          "dailyBudget.amount": {
            type: "column",
            mapping: {
              destination: "dailyBudget",
            },
          },
          associatedEntity: "associatedEntity",
          "changeAuditStamps.lastModified.time": {
            type: "column",
            mapping: {
              destination: "lastModified",
            },
          },
          name: {
            type: "column",
            mapping: {
              destination: "name",
            },
          },
          "locale.language": {
            type: "column",
            mapping: {
              destination: "language",
            },
          },
          account: {
            type: "column",
            mapping: {
              destination: "account",
            },
          },
          "dailyBudget.currencyCode": {
            type: "column",
            mapping: {
              destination: "dailyBudget_currency",
            },
          },
          "servingStatuses.0": {
            type: "column",
            mapping: {
              destination: "servingStatuses",
            },
          },
          campaignGroup: "campaignGroup",
          test: "test",
          status: {
            type: "column",
            mapping: {
              destination: "status",
            },
          },
          objectiveType: {
            type: "column",
            mapping: {
              destination: "objectiveType",
            },
          },
          "unitCost.amount": "unitCost_amount",
          "runSchedule.start": {
            type: "column",
            mapping: {
              destination: "runSchedule",
            },
          },
          offsiteDeliveryEnabled: {
            type: "column",
            mapping: {
              destination: "offsiteDeliveryEnabled",
            },
          },
          optimizationTargetType: "optimizationTargetType",
          "version.versionTag": {
            type: "column",
            mapping: {
              destination: "version",
            },
          },
          type: {
            type: "column",
            mapping: {
              destination: "type",
            },
          },
          "unitCost.currencyCode": "unitCost.currencyCode",
          id: {
            type: "column",
            mapping: {
              destination: "id",
              primaryKey: true,
            },
          },
          creativeSelection: {
            type: "column",
            mapping: {
              destination: "creativeSelection",
            },
          },
        },
        ads_basic_viral_stats: {
          viralImpressions: {
            type: "column",
            mapping: {
              destination: "viralImpressions",
            },
          },
          viralReactions: {
            type: "column",
            mapping: {
              destination: "viralReactions",
            },
          },
          pivot: {
            type: "column",
            mapping: {
              destination: "pivot",
              primaryKey: true,
            },
          },
          viralLandingPageClicks: {
            type: "column",
            mapping: {
              destination: "viralLandingPageClicks",
            },
          },
          viralCommentLikes: {
            type: "column",
            mapping: {
              destination: "viralCommentLikes",
            },
          },
          "dateRange.start.year": {
            type: "column",
            mapping: {
              destination: "start_year",
              primaryKey: true,
            },
          },
          "dateRange.end.day": {
            type: "column",
            mapping: {
              destination: "end_day",
              primaryKey: true,
            },
          },
          viralCompanyPageClicks: {
            type: "column",
            mapping: {
              destination: "viralCompanyPageClicks",
            },
          },
          "dateRange.end.month": {
            type: "column",
            mapping: {
              destination: "end_month",
              primaryKey: true,
            },
          },
          viralOtherEngagements: {
            type: "column",
            mapping: {
              destination: "viralOtherEngagements",
            },
          },
          "dateRange.end.year": {
            type: "column",
            mapping: {
              destination: "end_year",
              primaryKey: true,
            },
          },
          pivotValue: {
            type: "column",
            mapping: {
              destination: "pivotValue",
              primaryKey: true,
            },
          },
          "dateRange.start.day": {
            type: "column",
            mapping: {
              destination: "start_day",
              primaryKey: true,
            },
          },
          viralLikes: {
            type: "column",
            mapping: {
              destination: "viralLikes",
            },
          },
          "dateRange.start.month": {
            type: "column",
            mapping: {
              destination: "start_month",
              primaryKey: true,
            },
          },
          viralClicks: {
            type: "column",
            mapping: {
              destination: "viralClicks",
            },
          },
          viralFollows: {
            type: "column",
            mapping: {
              destination: "viralFollows",
            },
          },
          viralTotalEngagements: {
            type: "column",
            mapping: {
              destination: "viralTotalEngagements",
            },
          },
          viralComments: {
            type: "column",
            mapping: {
              destination: "viralComments",
            },
          },
          viralShares: {
            type: "column",
            mapping: {
              destination: "viralShares",
            },
          },
        },
        ads_inmail_stats: {
          actionClicks: {
            type: "column",
            mapping: {
              destination: "actionClicks",
            },
          },
          pivot: {
            type: "column",
            mapping: {
              destination: "pivot",
              primaryKey: true,
            },
          },
          "dateRange.start.year": {
            type: "column",
            mapping: {
              destination: "start_year",
              primaryKey: true,
            },
          },
          opens: {
            type: "column",
            mapping: {
              destination: "opens",
            },
          },
          "dateRange.end.day": {
            type: "column",
            mapping: {
              destination: "end_day",
              primaryKey: true,
            },
          },
          sends: {
            type: "column",
            mapping: {
              destination: "sends",
            },
          },
          textUrlClicks: {
            type: "column",
            mapping: {
              destination: "textUrlClicks",
            },
          },
          "dateRange.end.month": {
            type: "column",
            mapping: {
              destination: "end_month",
              primaryKey: true,
            },
          },
          "dateRange.end.year": {
            type: "column",
            mapping: {
              destination: "end_year",
              primaryKey: true,
            },
          },
          pivotValue: {
            type: "column",
            mapping: {
              destination: "pivotValue",
              primaryKey: true,
            },
          },
          "dateRange.start.day": {
            type: "column",
            mapping: {
              destination: "start_day",
              primaryKey: true,
            },
          },
          adUnitClicks: {
            type: "column",
            mapping: {
              destination: "adUnitClicks",
            },
          },
          "dateRange.start.month": {
            type: "column",
            mapping: {
              destination: "start_month",
              primaryKey: true,
            },
          },
          leadGenerationMailContactInfoShares: {
            type: "column",
            mapping: {
              destination: "leadGenerationMailContactInfoShares",
            },
          },
          leadGenerationMailInterestedClicks: {
            type: "column",
            mapping: {
              destination: "leadGenerationMailInterestedClicks",
            },
          },
        },
        ads_other_viral_stats: {
          pivot: {
            type: "column",
            mapping: {
              destination: "pivot",
              primaryKey: true,
            },
          },
          "dateRange.start.year": {
            type: "column",
            mapping: {
              destination: "start_year",
              primaryKey: true,
            },
          },
          "dateRange.end.day": {
            type: "column",
            mapping: {
              destination: "end_day",
              primaryKey: true,
            },
          },
          viralOneClickLeads: {
            type: "column",
            mapping: {
              destination: "viralOneClickLeads",
            },
          },
          "dateRange.end.month": {
            type: "column",
            mapping: {
              destination: "end_month",
              primaryKey: true,
            },
          },
          "dateRange.end.year": {
            type: "column",
            mapping: {
              destination: "end_year",
              primaryKey: true,
            },
          },
          pivotValue: {
            type: "column",
            mapping: {
              destination: "pivotValue",
              primaryKey: true,
            },
          },
          "dateRange.start.day": {
            type: "column",
            mapping: {
              destination: "start_day",
              primaryKey: true,
            },
          },
          viralExternalWebsitePostViewConversions: {
            type: "column",
            mapping: {
              destination: "viralExternalWebsitePostViewConversions",
            },
          },
          "dateRange.start.month": {
            type: "column",
            mapping: {
              destination: "start_month",
              primaryKey: true,
            },
          },
          viralExternalWebsiteConversions: {
            type: "column",
            mapping: {
              destination: "viralExternalWebsiteConversions",
            },
          },
          viralExternalWebsitePostClickConversions: {
            type: "column",
            mapping: {
              destination: "viralExternalWebsitePostClickConversions",
            },
          },
          viralOneClickLeadFormOpens: {
            type: "column",
            mapping: {
              destination: "viralOneClickLeadFormOpens",
            },
          },
        },
        ads_video_stats: {
          pivot: {
            type: "column",
            mapping: {
              destination: "pivot",
              primaryKey: true,
            },
          },
          fullScreenPlays: {
            type: "column",
            mapping: {
              destination: "fullScreenPlays",
            },
          },
          videoThirdQuartileCompletions: {
            type: "column",
            mapping: {
              destination: "videoThirdQuartileCompletions",
            },
          },
          "dateRange.start.year": {
            type: "column",
            mapping: {
              destination: "start_year",
              primaryKey: true,
            },
          },
          "dateRange.end.day": {
            type: "column",
            mapping: {
              destination: "end_day",
              primaryKey: true,
            },
          },
          videoStarts: {
            type: "column",
            mapping: {
              destination: "videoStarts",
            },
          },
          "dateRange.end.month": {
            type: "column",
            mapping: {
              destination: "end_month",
              primaryKey: true,
            },
          },
          "dateRange.end.year": {
            type: "column",
            mapping: {
              destination: "end_year",
              primaryKey: true,
            },
          },
          pivotValue: {
            type: "column",
            mapping: {
              destination: "pivotValue",
              primaryKey: true,
            },
          },
          "dateRange.start.day": {
            type: "column",
            mapping: {
              destination: "start_day",
              primaryKey: true,
            },
          },
          videoViews: {
            type: "column",
            mapping: {
              destination: "videoViews",
            },
          },
          videoMidpointCompletions: {
            type: "column",
            mapping: {
              destination: "videoMidpointCompletions",
            },
          },
          "dateRange.start.month": {
            type: "column",
            mapping: {
              destination: "start_month",
              primaryKey: true,
            },
          },
          videoCompletions: {
            type: "column",
            mapping: {
              destination: "videoCompletions",
            },
          },
          videoFirstQuartileCompletions: {
            type: "column",
            mapping: {
              destination: "videoFirstQuartileCompletions",
            },
          },
        },
        ads_video_viral_stats: {
          pivot: {
            type: "column",
            mapping: {
              destination: "pivot",
              primaryKey: true,
            },
          },
          viralVideoStarts: {
            type: "column",
            mapping: {
              destination: "viralVideoStarts",
            },
          },
          viralVideoCompletions: {
            type: "column",
            mapping: {
              destination: "viralVideoCompletions",
            },
          },
          "dateRange.start.year": {
            type: "column",
            mapping: {
              destination: "start_year",
              primaryKey: true,
            },
          },
          "dateRange.end.day": {
            type: "column",
            mapping: {
              destination: "end_day",
              primaryKey: true,
            },
          },
          "dateRange.end.month": {
            type: "column",
            mapping: {
              destination: "end_month",
              primaryKey: true,
            },
          },
          "dateRange.end.year": {
            type: "column",
            mapping: {
              destination: "end_year",
              primaryKey: true,
            },
          },
          pivotValue: {
            type: "column",
            mapping: {
              destination: "pivotValue",
              primaryKey: true,
            },
          },
          "dateRange.start.day": {
            type: "column",
            mapping: {
              destination: "start_day",
              primaryKey: true,
            },
          },
          "dateRange.start.month": {
            type: "column",
            mapping: {
              destination: "start_month",
              primaryKey: true,
            },
          },
          viralVideoFirstQuartileCompletions: {
            type: "column",
            mapping: {
              destination: "viralVideoFirstQuartileCompletions",
            },
          },
          viralFullScreenPlays: {
            type: "column",
            mapping: {
              destination: "viralFullScreenPlays",
            },
          },
          viralVideoViews: {
            type: "column",
            mapping: {
              destination: "viralVideoViews",
            },
          },
          viralVideoMidpointCompletions: {
            type: "column",
            mapping: {
              destination: "viralVideoMidpointCompletions",
            },
          },
          viralVideoThirdQuartileCompletions: {
            type: "column",
            mapping: {
              destination: "viralVideoThirdQuartileCompletions",
            },
          },
        },
        ads_cost: {
          pivot: {
            type: "column",
            mapping: {
              destination: "pivot",
              primaryKey: true,
            },
          },
          "dateRange.start.year": {
            type: "column",
            mapping: {
              destination: "start_year",
              primaryKey: true,
            },
          },
          "dateRange.end.day": {
            type: "column",
            mapping: {
              destination: "end_day",
              primaryKey: true,
            },
          },
          costInLocalCurrency: {
            type: "column",
            mapping: {
              destination: "costInLocalCurrency",
            },
          },
          "dateRange.end.month": {
            type: "column",
            mapping: {
              destination: "end_month",
              primaryKey: true,
            },
          },
          "dateRange.end.year": {
            type: "column",
            mapping: {
              destination: "end_year",
              primaryKey: true,
            },
          },
          pivotValue: {
            type: "column",
            mapping: {
              destination: "pivotValue",
              primaryKey: true,
            },
          },
          "dateRange.start.day": {
            type: "column",
            mapping: {
              destination: "start_day",
              primaryKey: true,
            },
          },
          costInUsd: {
            type: "column",
            mapping: {
              destination: "costInUsd",
            },
          },
          "dateRange.start.month": {
            type: "column",
            mapping: {
              destination: "start_month",
              primaryKey: true,
            },
          },
          conversionValueInLocalCurrency: {
            type: "column",
            mapping: {
              destination: "conversionValueInLocalCurrency",
            },
          },
        },
        ads_basic_stats: {
          pivot: {
            type: "column",
            mapping: {
              destination: "pivot",
              primaryKey: true,
            },
          },
          follows: {
            type: "column",
            mapping: {
              destination: "follows",
            },
          },
          otherEngagements: {
            type: "column",
            mapping: {
              destination: "otherEngagements",
            },
          },
          "dateRange.start.year": {
            type: "column",
            mapping: {
              destination: "start_year",
              primaryKey: true,
            },
          },
          "dateRange.end.day": {
            type: "column",
            mapping: {
              destination: "end_day",
              primaryKey: true,
            },
          },
          reactions: {
            type: "column",
            mapping: {
              destination: "reactions",
            },
          },
          impressions: {
            type: "column",
            mapping: {
              destination: "impressions",
            },
          },
          clicks: {
            type: "column",
            mapping: {
              destination: "clicks",
            },
          },
          "dateRange.end.month": {
            type: "column",
            mapping: {
              destination: "end_month",
              primaryKey: true,
            },
          },
          "dateRange.end.year": {
            type: "column",
            mapping: {
              destination: "end_year",
              primaryKey: true,
            },
          },
          pivotValue: {
            type: "column",
            mapping: {
              destination: "pivotValue",
              primaryKey: true,
            },
          },
          totalEngagements: {
            type: "column",
            mapping: {
              destination: "totalEngagements",
            },
          },
          landingPageClicks: {
            type: "column",
            mapping: {
              destination: "landingPageClicks",
            },
          },
          "dateRange.start.day": {
            type: "column",
            mapping: {
              destination: "start_day",
              primaryKey: true,
            },
          },
          shares: {
            type: "column",
            mapping: {
              destination: "shares",
            },
          },
          comments: {
            type: "column",
            mapping: {
              destination: "comments",
            },
          },
          "dateRange.start.month": {
            type: "column",
            mapping: {
              destination: "start_month",
              primaryKey: true,
            },
          },
          companyPageClicks: {
            type: "column",
            mapping: {
              destination: "companyPageClicks",
            },
          },
          likes: {
            type: "column",
            mapping: {
              destination: "likes",
            },
          },
          commentLikes: {
            type: "column",
            mapping: {
              destination: "commentLikes",
            },
          },
        },
      },
    },
  },
  authorization: {
    oauth_api: {},
  },
}

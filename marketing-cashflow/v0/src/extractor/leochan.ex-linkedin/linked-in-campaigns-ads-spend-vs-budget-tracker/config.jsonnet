{
  parameters: {
    config: {
      pivot: "CAMPAIGN",
      end_year: ''+Input("ex-linkedin-end-year"),
      end_month: ''+Input("ex-linkedin-end-month"),
      end_day: ''+Input("ex-linkedin-end-day"),
      start_year: ''+Input("ex-linkedin-start-year"),
      start_month: ''+Input("ex-linkedin-start-month"),
      start_day: ''+Input("ex-linkedin-start-day"),
      timeGranularity: "DAILY",
      incrementalOutput: true,
      mappings: {
        campaign_groups: {
          allowedCampaignTypes: {
            type: "table",
            destination: "campaign_groups_allowedCampaignTypes",
            parentKey: {
              destination: "campaign_group_id",
            },
            tableMapping: {
              ".": "allowedCampaignTypes",
            },
          },
          "changeAuditStamps.created.time": "changeAuditStamps_created_time",
          backfilled: "backfilled",
          "changeAuditStamps.lastModified.time": "changeAuditStamps_lastModified_time",
          name: "name",
          servingStatuses: {
            type: "table",
            destination: "campaign_groups_servingStatuses",
            parentKey: {
              destination: "campaign_group_id",
            },
            tableMapping: {
              ".": "servingStatuses",
            },
          },
          account: "account",
          "runSchedule.end": "runSchedule_end",
          test: "test",
          status: "status",
          "runSchedule.start": "runSchedule_start",
          id: {
            type: "column",
            mapping: {
              destination: "id",
              primaryKey: true,
            },
          },
        },
      },
      jobs: [
        {
          endpoint: "adCampaignGroups",
          params: {
            q: "search",
            "search.status.values[0]": "ACTIVE",
            "search.status.values[1]": "ARCHIVED",
            "search.status.values[2]": "CANCELED",
            "search.status.values[3]": "DRAFT",
            "search.status.values[4]": "PAUSED",
          },
          dataField: "elements",
          dataType: "campaign_groups",
          scroller: "campaign_scroller",
        },
      ],
    },
    api: {
      baseUrl: "https://api.linkedin.com/rest/",
      authentication: {
        type: "oauth20",
        format: "json",
        headers: {
          "Linkedin-Version": "202304",
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
  },
  authorization: {
    oauth_api: Input("oauth-linkedinads")
  },
}

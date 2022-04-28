{
  storage: {
    input: {
      tables: [
        {
          source: "out.c-thoughtspot-wr-" + InstanceIdShort() + ".HUBSPOT_DEALS",
          destination: "out.c-thoughtspot-wr-" + InstanceIdShort() + ".HUBSPOT_DEALS.csv",
          changed_since: "",
          columns: [
            "ID",
            "DEALNAME",
            "HS_FORECAST_AMOUNT",
            "CREATEDATE",
            "HS_IS_CLOSED",
            "HS_DEAL_STAGE_PROBABILITY",
            "DAYS_TO_CLOSE",
            "HS_CREATED_BY_USER_ID",
            "HS_PROJECTED_AMOUNT",
            "HS_IS_CLOSED_WON",
            "HS_CLOSED_AMOUNT_IN_HOME_CURRENCY",
            "DESCRIPTION",
            "AMOUNT_IN_HOME_CURRENCY",
            "HS_CLOSED_AMOUNT",
            "CLOSEDATE",
            "DEALTYPE",
            "AMOUNT",
            "HS_LASTMODIFIEDDATE",
            "PIPELINE",
            "DEALSTAGE",
            "PIPELINE_DISPLAY_ORDER",
            "HS_DATE_ENTERED_CLOSEDWON",
            "CREATED_AT_DATE",
            "CREATED_AT_TIME",
          ],
        },
      ],
    },
  },
  parameters: {
    tables: [
      {
        dbName: "HUBSPOT_DEALS",
        tableId: "out.c-thoughtspot-wr-" + InstanceIdShort() + ".HUBSPOT_DEALS",
        incremental: false,
        items: [
          {
            name: "ID",
            dbName: "ID",
            type: "STRING",
          },
          {
            name: "DEALNAME",
            dbName: "DEALNAME",
            type: "STRING",
          },
          {
            name: "HS_FORECAST_AMOUNT",
            dbName: "HS_FORECAST_AMOUNT",
            type: "STRING",
          },
          {
            name: "CREATEDATE",
            dbName: "CREATEDATE",
            type: "STRING",
          },
          {
            name: "HS_IS_CLOSED",
            dbName: "HS_IS_CLOSED",
            type: "STRING",
          },
          {
            name: "HS_DEAL_STAGE_PROBABILITY",
            dbName: "HS_DEAL_STAGE_PROBABILITY",
            type: "STRING",
          },
          {
            name: "DAYS_TO_CLOSE",
            dbName: "DAYS_TO_CLOSE",
            type: "STRING",
          },
          {
            name: "HS_CREATED_BY_USER_ID",
            dbName: "HS_CREATED_BY_USER_ID",
            type: "STRING",
          },
          {
            name: "HS_PROJECTED_AMOUNT",
            dbName: "HS_PROJECTED_AMOUNT",
            type: "STRING",
          },
          {
            name: "HS_IS_CLOSED_WON",
            dbName: "HS_IS_CLOSED_WON",
            type: "STRING",
          },
          {
            name: "HS_CLOSED_AMOUNT_IN_HOME_CURRENCY",
            dbName: "HS_CLOSED_AMOUNT_IN_HOME_CURRENCY",
            type: "STRING",
          },
          {
            name: "DESCRIPTION",
            dbName: "DESCRIPTION",
            type: "STRING",
          },
          {
            name: "AMOUNT_IN_HOME_CURRENCY",
            dbName: "AMOUNT_IN_HOME_CURRENCY",
            type: "STRING",
          },
          {
            name: "HS_CLOSED_AMOUNT",
            dbName: "HS_CLOSED_AMOUNT",
            type: "STRING",
          },
          {
            name: "CLOSEDATE",
            dbName: "CLOSEDATE",
            type: "STRING",
          },
          {
            name: "DEALTYPE",
            dbName: "DEALTYPE",
            type: "STRING",
          },
          {
            name: "AMOUNT",
            dbName: "AMOUNT",
            type: "STRING",
          },
          {
            name: "HS_LASTMODIFIEDDATE",
            dbName: "HS_LASTMODIFIEDDATE",
            type: "STRING",
          },
          {
            name: "PIPELINE",
            dbName: "PIPELINE",
            type: "STRING",
          },
          {
            name: "DEALSTAGE",
            dbName: "DEALSTAGE",
            type: "STRING",
          },
          {
            name: "PIPELINE_DISPLAY_ORDER",
            dbName: "PIPELINE_DISPLAY_ORDER",
            type: "STRING",
          },
          {
            name: "HS_DATE_ENTERED_CLOSEDWON",
            dbName: "HS_DATE_ENTERED_CLOSEDWON",
            type: "STRING",
          },
          {
            name: "CREATED_AT_DATE",
            dbName: "CREATED_AT_DATE",
            type: "STRING",
          },
          {
            name: "CREATED_AT_TIME",
            dbName: "CREATED_AT_TIME",
            type: "STRING",
          },
        ],
      },
    ],
  },
}

{
  storage: {
    input: {
      tables: [
        {
          source: "out.c-thoughtspot-wr-" + ConfigId("out-thoughtspot-hubspot-bigquery-writer-10708760") + ".HUBSPOT_MARKETING_EMAIL_EVENTS",
          destination: "out.c-thoughtspot-wr-" + ConfigId("out-thoughtspot-hubspot-bigquery-writer-10708760") + ".HUBSPOT_MARKETING_EMAIL_EVENTS.csv",
          changed_since: "",
          columns: [
            "APP_ID",
            "APP_NAME",
            "CREATED",
            "EMAIL_CAMPAIGN_ID",
            "ID",
            "PORTAL_ID",
            "RECIPIENT",
            "TYPE",
            "SENT_BY_CREATED",
            "SENT_BY_ID",
            "BROWSER_NAME",
            "LOCATION_CITY",
            "LOCATION_COUNTRY",
            "LOCATION_STATE",
            "USER_AGENT",
            "DURATION",
            "SOURCE",
            "PORTAL_SUBSCRIPTION_STATUS",
            "ATTEMPT",
            "RESPONSE",
            "URL",
            "SUBJECT",
            "FROM_EMAIL",
            "DROP_MESSAGE",
            "CAUSED_BY_ID",
            "PRE_CUSTOMER_MARKETING_EMAIL",
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
        dbName: "HUBSPOT_MARKETING_EMAIL_EVENTS",
        tableId: "out.c-thoughtspot-wr-" + ConfigId("out-thoughtspot-hubspot-bigquery-writer-10708760") + ".HUBSPOT_MARKETING_EMAIL_EVENTS",
        incremental: false,
        items: [
          {
            name: "APP_ID",
            dbName: "APP_ID",
            type: "STRING",
          },
          {
            name: "APP_NAME",
            dbName: "APP_NAME",
            type: "STRING",
          },
          {
            name: "CREATED",
            dbName: "CREATED",
            type: "STRING",
          },
          {
            name: "EMAIL_CAMPAIGN_ID",
            dbName: "EMAIL_CAMPAIGN_ID",
            type: "STRING",
          },
          {
            name: "ID",
            dbName: "ID",
            type: "STRING",
          },
          {
            name: "PORTAL_ID",
            dbName: "PORTAL_ID",
            type: "STRING",
          },
          {
            name: "RECIPIENT",
            dbName: "RECIPIENT",
            type: "STRING",
          },
          {
            name: "TYPE",
            dbName: "TYPE",
            type: "STRING",
          },
          {
            name: "SENT_BY_CREATED",
            dbName: "SENT_BY_CREATED",
            type: "STRING",
          },
          {
            name: "SENT_BY_ID",
            dbName: "SENT_BY_ID",
            type: "STRING",
          },
          {
            name: "BROWSER_NAME",
            dbName: "BROWSER_NAME",
            type: "STRING",
          },
          {
            name: "LOCATION_CITY",
            dbName: "LOCATION_CITY",
            type: "STRING",
          },
          {
            name: "LOCATION_COUNTRY",
            dbName: "LOCATION_COUNTRY",
            type: "STRING",
          },
          {
            name: "LOCATION_STATE",
            dbName: "LOCATION_STATE",
            type: "STRING",
          },
          {
            name: "USER_AGENT",
            dbName: "USER_AGENT",
            type: "STRING",
          },
          {
            name: "DURATION",
            dbName: "DURATION",
            type: "STRING",
          },
          {
            name: "SOURCE",
            dbName: "SOURCE",
            type: "STRING",
          },
          {
            name: "PORTAL_SUBSCRIPTION_STATUS",
            dbName: "PORTAL_SUBSCRIPTION_STATUS",
            type: "STRING",
          },
          {
            name: "ATTEMPT",
            dbName: "ATTEMPT",
            type: "STRING",
          },
          {
            name: "RESPONSE",
            dbName: "RESPONSE",
            type: "STRING",
          },
          {
            name: "URL",
            dbName: "URL",
            type: "STRING",
          },
          {
            name: "SUBJECT",
            dbName: "SUBJECT",
            type: "STRING",
          },
          {
            name: "FROM_EMAIL",
            dbName: "FROM_EMAIL",
            type: "STRING",
          },
          {
            name: "DROP_MESSAGE",
            dbName: "DROP_MESSAGE",
            type: "STRING",
          },
          {
            name: "CAUSED_BY_ID",
            dbName: "CAUSED_BY_ID",
            type: "STRING",
          },
          {
            name: "PRE_CUSTOMER_MARKETING_EMAIL",
            dbName: "PRE_CUSTOMER_MARKETING_EMAIL",
            type: "FLOAT",
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

{
  storage: {
    input: {
      tables: [
        {
          source: "out.c-thoughtspot-wr-" + ConfigId("in-thoughtspot-hubspot-extractor-10708760") + ".HUBSPOT_MARKETING_EMAIL",
          destination: "out.c-thoughtspot-wr-" + ConfigId("in-thoughtspot-hubspot-extractor-10708760") + ".HUBSPOT_MARKETING_EMAIL.csv",
          changed_since: "",
          columns: [
            "EMAIL_URL",
            "DATE_CREATED",
            "EMAIL_FROM_NAME",
            "CAMPAIGN_NAME",
            "REPLY_TO_EMAIL",
            "BOUNCE",
            "CLICK",
            "CONTACTS_LOST",
            "DELIVERED",
            "OPEN",
            "REPLY",
            "SENT",
            "UNSUBSCRIBED",
            "BOUNCE_RATIO",
            "CLICK_RATIO",
            "CLICK_THROUGH_RATIO",
            "OPEN_RATIO",
            "EMAIL_SUBJECT",
            "CAMPAIGN_ID",
            "DATE_CAMPAIGN_SENT",
            "CAMPAIGN_DATE",
            "CAMPAIGN_TIME",
          ],
        },
      ],
    },
  },
  parameters: {
    tables: [
      {
        dbName: "HUBSPOT_MARKETING_EMAIL",
        tableId: "out.c-thoughtspot-wr-" + ConfigId("in-thoughtspot-hubspot-extractor-10708760") + ".HUBSPOT_MARKETING_EMAIL",
        incremental: false,
        items: [
          {
            name: "EMAIL_URL",
            dbName: "EMAIL_URL",
            type: "STRING",
          },
          {
            name: "DATE_CREATED",
            dbName: "DATE_CREATED",
            type: "STRING",
          },
          {
            name: "EMAIL_FROM_NAME",
            dbName: "EMAIL_FROM_NAME",
            type: "STRING",
          },
          {
            name: "CAMPAIGN_NAME",
            dbName: "CAMPAIGN_NAME",
            type: "STRING",
          },
          {
            name: "REPLY_TO_EMAIL",
            dbName: "REPLY_TO_EMAIL",
            type: "STRING",
          },
          {
            name: "BOUNCE",
            dbName: "BOUNCE",
            type: "STRING",
          },
          {
            name: "CLICK",
            dbName: "CLICK",
            type: "STRING",
          },
          {
            name: "CONTACTS_LOST",
            dbName: "CONTACTS_LOST",
            type: "STRING",
          },
          {
            name: "DELIVERED",
            dbName: "DELIVERED",
            type: "STRING",
          },
          {
            name: "OPEN",
            dbName: "OPEN",
            type: "STRING",
          },
          {
            name: "REPLY",
            dbName: "REPLY",
            type: "STRING",
          },
          {
            name: "SENT",
            dbName: "SENT",
            type: "STRING",
          },
          {
            name: "UNSUBSCRIBED",
            dbName: "UNSUBSCRIBED",
            type: "STRING",
          },
          {
            name: "BOUNCE_RATIO",
            dbName: "BOUNCE_RATIO",
            type: "STRING",
          },
          {
            name: "CLICK_RATIO",
            dbName: "CLICK_RATIO",
            type: "STRING",
          },
          {
            name: "CLICK_THROUGH_RATIO",
            dbName: "CLICK_THROUGH_RATIO",
            type: "STRING",
          },
          {
            name: "OPEN_RATIO",
            dbName: "OPEN_RATIO",
            type: "STRING",
          },
          {
            name: "EMAIL_SUBJECT",
            dbName: "EMAIL_SUBJECT",
            type: "STRING",
          },
          {
            name: "CAMPAIGN_ID",
            dbName: "CAMPAIGN_ID",
            type: "STRING",
          },
          {
            name: "DATE_CAMPAIGN_SENT",
            dbName: "DATE_CAMPAIGN_SENT",
            type: "STRING",
          },
          {
            name: "CAMPAIGN_DATE",
            dbName: "CAMPAIGN_DATE",
            type: "STRING",
          },
          {
            name: "CAMPAIGN_TIME",
            dbName: "CAMPAIGN_TIME",
            type: "STRING",
          },
        ],
      },
    ],
  },
}

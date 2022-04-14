{
  storage: {
    input: {
      tables: [
        {
          source: "out.c-thoughtspot-wr-" + ConfigId("out-thoughtspot-hubspot-bigquery-writer-10708760") + ".HUBSPOT_COMPANIES",
          destination: "out.c-thoughtspot-wr-" + ConfigId("out-thoughtspot-hubspot-bigquery-writer-10708760") + ".HUBSPOT_COMPANIES.csv",
          changed_since: "",
          columns: [
            "ID",
            "INDUSTRY",
            "CITY",
            "NUMBEROFEMPLOYEES",
            "HS_NUM_OPEN_DEALS",
            "STATE",
            "NAME",
            "TOTAL_REVENUE",
            "CREATED_AT",
            "ARCHIVED",
            "COUNTRY",
            "CREATEDATE",
            "HS_ANALYTICS_SOURCE",
            "ZIP",
            "WEBSITE",
            "CREATED_AT_DATE",
            "CREATED_AT_TIME",
            "HS_IS_TARGET_ACCOUNT",
            "UPDATED_AT",
            "HS_ANALYTICS_LAST_VISIT_DATE",
            "HS_ANALYTICS_NUM_VISITS",
            "LIFECYCLESTAGE",
          ],
        },
      ],
    },
  },
  parameters: {
    tables: [
      {
        dbName: "HUBSPOT_COMPANIES",
        tableId: "out.c-thoughtspot-wr-" + ConfigId("out-thoughtspot-hubspot-bigquery-writer-10708760") + ".HUBSPOT_COMPANIES",
        incremental: false,
        items: [
          {
            name: "ID",
            dbName: "ID",
            type: "STRING",
          },
          {
            name: "INDUSTRY",
            dbName: "INDUSTRY",
            type: "STRING",
          },
          {
            name: "CITY",
            dbName: "CITY",
            type: "STRING",
          },
          {
            name: "NUMBEROFEMPLOYEES",
            dbName: "NUMBEROFEMPLOYEES",
            type: "FLOAT",
          },
          {
            name: "HS_NUM_OPEN_DEALS",
            dbName: "HS_NUM_OPEN_DEALS",
            type: "STRING",
          },
          {
            name: "STATE",
            dbName: "STATE",
            type: "STRING",
          },
          {
            name: "NAME",
            dbName: "NAME",
            type: "STRING",
          },
          {
            name: "TOTAL_REVENUE",
            dbName: "TOTAL_REVENUE",
            type: "STRING",
          },
          {
            name: "CREATED_AT",
            dbName: "CREATED_AT",
            type: "STRING",
          },
          {
            name: "ARCHIVED",
            dbName: "ARCHIVED",
            type: "STRING",
          },
          {
            name: "COUNTRY",
            dbName: "COUNTRY",
            type: "STRING",
          },
          {
            name: "CREATEDATE",
            dbName: "CREATEDATE",
            type: "STRING",
          },
          {
            name: "HS_ANALYTICS_SOURCE",
            dbName: "HS_ANALYTICS_SOURCE",
            type: "STRING",
          },
          {
            name: "ZIP",
            dbName: "ZIP",
            type: "STRING",
          },
          {
            name: "WEBSITE",
            dbName: "WEBSITE",
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
          {
            name: "HS_IS_TARGET_ACCOUNT",
            dbName: "HS_IS_TARGET_ACCOUNT",
            type: "STRING",
          },
          {
            name: "UPDATED_AT",
            dbName: "UPDATED_AT",
            type: "STRING",
          },
          {
            name: "HS_ANALYTICS_LAST_VISIT_DATE",
            dbName: "HS_ANALYTICS_LAST_VISIT_DATE",
            type: "STRING",
          },
          {
            name: "HS_ANALYTICS_NUM_VISITS",
            dbName: "HS_ANALYTICS_NUM_VISITS",
            type: "STRING",
          },
          {
            name: "LIFECYCLESTAGE",
            dbName: "LIFECYCLESTAGE",
            type: "STRING",
          },
        ],
      },
    ],
  },
}

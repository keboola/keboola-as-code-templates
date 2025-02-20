{
  stepsGroups: [
    {
      description: "UA source component",
      required: "all",
      steps: [
        {
          icon: "component:keboola.ex-google-analytics-v4",
          name: "Universal Analytics",
          description: "Google Analytics Data Source",
          dialogName: "Analytics Data Source",
          dialogDescription: "Connect with Google Analytics and sync data from it.",
          inputs: [
            {
                id:           "oauth-googleanalytics",
                name:         "Open Authentication",
                description:  "Authorization for Google Analytics",
                type:         "object",
                kind:         "oauth",
                componentId:  "keboola.ex-google-analytics-v4",
                rules:        "required",
            },
            {
                id:           "oauth-googleanalytics-profiles",
                name:         "Google Accounts",
                description:  "Select accounts for Google Analytics",
                type:         "object",
                kind:         "oauthAccounts",
                oauthInputId: "oauth-googleanalytics",
                rules:        "required",
            },
            {
                id: "ga-from",
                name: "Period from date",
                description: "From when do you want to get the data?",
                type: "string",
                kind: "select",
                default: "-6 months",
                options: [
                  {
                    value: '-1 week',
                    label: '1 week ago',
                  },
                  {
                    value: '-2 weeks',
                    label: '2 weeks ago',
                  },
                  {
                    value: '-1 month',
                    label: '1 month ago',
                  },
                  {
                    value: '-2 months',
                    label: '2 months ago',
                  },
                  {
                    value: '-3 months',
                    label: '3 months ago',
                  },
                  {
                    value: '-6 months',
                    label: '6 months ago',
                  },
                  {
                    value: '-12 months',
                    label: '1 year ago',
                  },
                ],
              },
            ]
          },
        ]
      }, 
      {
        description: "GA4 source component",
        required: "atLeastOne",
        steps: [
        {
          icon: "component:keboola.ex-google-analytics-v4",
          name: "Google Analytics 4",
          description: "Google Analytics Data Source",
          dialogName: "Analytics Data Source",
          dialogDescription: "Connect with Google Analytics and sync data from it.",
          inputs: [
            {
                id:           "oauth-googleanalytics4",
                name:         "Open Authentication",
                description:  "Authorization for Google Analytics 4",
                type:         "object",
                kind:         "oauth",
                componentId:  "keboola.ex-google-analytics-v4",
                rules:        "required",
            },
            {
                id:           "oauth-googleanalytics-profiles4",
                name:         "Google Accounts",
                description:  "Select accounts for Google Analytics 4",
                type:         "object",
                kind:         "oauthAccounts",
                oauthInputId: "oauth-googleanalytics4",
                rules:        "required",
            },
          ]
        },
        {
          icon: "component:keboola.ex-google-bigquery-v2",
          name: "Google Big Query",
          description: "Big Query - Source",
          dialogName: "Big Query Source", 
          dialogDescription: "Get data from Google Big Query",
          inputs: [
            {
              id: "ex-google-bigquery-v2-service-account-private-key",
              name: "Private key",
              description: "Add your service account private key.",
              type: "string",
              kind: "hidden",
              rules: "required",
            },
            {
              id: "ex-google-bigquery-v2-service-account-client-email",
              name: "Client email",
              description: "Add your service account client email.",
              type: "string",
              kind: "input",
              default: "templates@keboola-shopify.iam.gserviceaccount.com",
            },
            {
              id: "ex-google-bigquery-v2-service-account-client-id",
              name: "Client ID",
              description: "Add your service account client id.",
              type: "string",
              kind: "input",
              default: "ID",
            },
            {
              id: "ex-google-bigquery-v2-service-account-private-key-id",
              name: "Private Key ID",
              description: "Add your service account private key ID.",
              type: "string",
              kind: "input",
              default: "Private key id",
            },
            {
              id: "ex-google-bigquery-v2-service-account-project-id",
              name: "Project ID",
              description: "Add your service account project ID.",
              type: "string",
              kind: "input",
              default: "Project id",
            },
            {
              id: "ex-bq-google-storage",
              name: "Storage",
              description: "Add name of the storage",
              type: "string",
              kind: "input",
              default: "Name",
            },
            {
              id: "ex-bq-location",
              name: "Location",
              description: "Add your data location.",
              type: "string",
              kind: "input",
              default: "EU",
            },
          ],
        },
      ],
    },
    {
      description: "Snowflake Transformation",
      required: "all",
      steps: [
        {
          icon: "component:keboola.snowflake-transformation",
          backend: "snowflake",
          name: "Snowflake SQL",
          description: "Transformation",
          inputs: [],
        },,
        {
          icon: "component:keboola.google-bigquery-transformation",
          backend: "bigquery",
          name: "BigQuery SQL",
          description: "Transformation",
          inputs: [],
        },
      ]
    },
        {
      description: "Data App",
      required: "all",
      steps: [
          {
          icon: "component:keboola.data-apps",
          name: "Data App",
          description: "Configure Data App",
          dialogName: "UA and GA4 Comparison", 
          dialogDescription: "Use our interactive app to get the comparison of Google Analytics Sources.",
          inputs: [
            {
              id: "data-apps",
              name: "Let's do it!",
              description: "",
              type: "bool",
              kind: "confirm",
            },
          ],
        },
      ],
    },
  ],
}

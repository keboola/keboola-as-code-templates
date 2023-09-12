{
  stepsGroups: [
    {
      description: "Data Source",
      required: "all",
      steps: [
        {
          icon: "component:kds-team.ex-shopify",
          name: "Shopify",
          description: "Shopify - Data Source",
          dialogName: "Shopify Data Source", 
          dialogDescription: "This source component imports Shopify data (orders, products and customers). Use the Admin API access token from the Shopify custom app, and Shopify ID from the URL, e.g., [shop_id].myshopify.com",
          inputs: [
            {
              id: "ex-shopify-api-token",
              name: "Admin API access token",
              description: "Admin API access token of your Shopify custom app.",
              type: "string",
              kind: "hidden",
              rules: "required",
            },
            {
              id: "ex-shopify-shop",
              name: "Shop name",
              description: "Insert shop id found in url, e.g. [shop_id].myshopify.com",
              type: "string",
              kind: "input",
              rules: "required",
              deafult: "shop name"
            },
            {
              id: "ex-shopify-period-from-date",
              name: "Period from date [incl.]",
              description: "Select period from which you want to get the data.",
              type: "string",
              kind: "select",
              default: '6 months ago',
              options: [
                {
                  value: '1 month ago',
                  label: '1 month ago',
                },
                {
                  value: '2 months ago',
                  label: '2 months ago',
                },
                {
                  value: '3 months ago',
                  label: '3 months ago',
                },
                {
                  value: '6 months ago',
                  label: '6 months ago',
                },
              ],
            },
            {
              id: "ex-shopify-period-to-date",
              name: "Period to date [excl.]",
              description: "Select period to date you want to get the data.",
              type: "string",
              kind: "select",
              default: '1 day ago',
              options: [
                {
                  value: 'now',
                  label: 'now',
                },
                {
                  value: '1 day ago',
                  label: '1 day ago',
                },
                {
                  value: '1 week ago',
                  label: '1 week ago',
                },
              ],
            },
          ]
        },
      ],
    },
    {   
      description: "Snowflake Transformations",
      required: "all",
      steps: [
        {
          icon: "component:keboola.snowflake-transformation",
          name: "Snowflake SQL",
          description: "Transformations",
          inputs: [],
        },
      ]
    },
    {
      description: "AI application",
      required: "all",
      steps: [
        {
          icon: "component:kds-team.app-generative-ai",
          name: "OpenAI application",
          description: "OpenAI application generates personalise SMS campaigns.",
          inputs: [
            {
              id: "app-generative-ai-authentication-api-token",
              name: "OpenAI API Key",
              description: "",
              type: "string",
              kind: "hidden",
              rules: "required"
            },
          ]
        }
      ]
    },
    {
      description: "Data App",
      required: "all",
      steps: [
          {
          icon: "component:keboola.data-apps",
          name: "Data App",
          description: "Deploy Data App",
          dialogName: "Data App", 
          dialogDescription: "",
          inputs: [
            {
              id: "kbc_storage_token",
              name: "Keboola Token",
              description: "Insert your Keboola Token.",
              type: "string",
              kind: "hidden",
              rules: "required",
            },
            {
              id: "kbc_stack",
              name: "Keboola URL",
              description: "Insert your Keboola URL.",
              type: "string",
              kind: "input",
              default: "https://connection.north-europe.azure.keboola.com"
            },
          ],
        },
      ]
    },
    {
      description: "Twilio Campaign Maker",
      required: "all",
      steps: [
        {
          icon: "component:kds-team.wr-twilio",
          name: "Data Destination",
          description: "Twilio",
          inputs: [
            {
              id: "wr-twilio-auth-token",
              name: "Authentication Token",
              description: "Insert your Twilio Token. Can be found in the Console.",
              type: "string",
              kind: "hidden",
              rules: "required",
            },
            {
              id: "wr-twilio-account-sid",
              name: "Account SID",
              description: "Insert Twilio Account SID. Can be found in the Console.",
              type: "string",
              kind: "input",
            },
            {
              id: "wr-twilio-messaging-service-sid",
              name: "Messaging Service SID",
              description: "Can be created via [Messaging Services] in the Console.",
              type: "string",
              kind: "input",
            }
          ],
        },
      ],
    },
  ],
}

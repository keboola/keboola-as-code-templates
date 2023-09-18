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
          dialogDescription: "This source component imports Shopify data (orders and customers). Use the Admin API access token from the Shopify custom app, and Shopify ID from the URL, e.g., [shop_id].myshopify.com",
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
      description: "Data App",
      required: "optional",
      steps: [
          {
          icon: "component:keboola.data-apps",
          name: "Data App",
          description: "Configure Data App",
          dialogName: "Interactive KPI Report", 
          dialogDescription: "Configure Data App by filling up required secrets.",
          inputs: [
            {
              id: "kbc_storage_token",
              name: "Keboola Token",
              description: "Insert a storage or your master token.",
              type: "string",
              kind: "hidden",
              rules: "required",
            }
          ],
        },
      ]
    },
    {
      description: "Notification",
      required: "optional",
      steps: [
          {
          icon: "component:kds-team.wr-generic",
          name: "Slack Notification",
          description: "Send a Slack Notification",
          dialogName: "Slack Notification", 
          dialogDescription: "Send a Slack notifications for new comments in your KPIs report.",
          inputs: [
            {
              id: "slack_token",
              name: "Slack Token",
              description: "Provide your Slack Token.",
              type: "string",
              kind: "hidden",
              rules: "required",
              },
          ],
        },
      ]
    }
  ],
}

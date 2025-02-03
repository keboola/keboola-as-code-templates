{
  stepsGroups: [
    {
      description: "Source component",
      required: "atLeastOne",
      steps: [
        {
          icon: "component:keboola.ex-facebook-ads",
          name: "Facebook Ads",
          description: "Facebook Ads - Data Source",
          dialogName: "Facebook Ads Data Source", 
          dialogDescription: "This source component is getting data about facebook ads monthly insights and insights.",
          inputs: [
            {
              id:          "oauth-facebookads",
              name:        "Open Authentication",
              description: "Authorization for Facebook Ads",
              type:        "object",
              kind:        "oauth",
              componentId: "keboola.ex-facebook-ads",
              rules:       "required",
            },
            {
              id:           "oauth-facebookads-accounts",
              name:         "Facebook Ads Accounts",
              description:  "Accounts for Facebook Ads",
              type:         "object",
              kind:         "oauthAccounts",
              oauthInputId: "oauth-facebookads",
              rules:        "required",
            },
            {
              id: "ex-facebook-ads-since",
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
              id: "ex-facebook-ads-until",
              name: "Period to date [excl.]",
              description: "Select period to date you want to get the data.",
              type: "string",
              kind: "select",
              default: '1 day ago',
              options: [
                {
                  value: '1 day ago',
                  label: '1 day ago',
                },
                {
                  value: '7 days ago',
                  label: '7 days ago',
                },
              ],
            },
          ]
        },
        {
          icon: "component:keboola.ex-google-ads",
          name: "Google Ads",
          description: "Google Ads - Data Source",
          dialogName: "Google Ads Data Source", 
          dialogDescription: "This source component is getting data about Google ads insights.",
          inputs: [
            {
              id:          "oauth-googleads",
              name:        "Open Authentication",
              description: "Authorization for Google Ads",
              type:        "object",
              kind:        "oauth",
              componentId: "keboola.ex-google-ads",
              rules:       "required",
            },
            {
              id:           "oauth-googleads-accounts",
              name:         "Google Ads Accounts",
              description:  "Accounts for Google Ads",
              type:         "object",
              kind:         "oauthAccounts",
              oauthInputId: "oauth-googleads",
              rules:        "required",
            },
            {
              id: "ex-google-ads-since",
              name: "Since",
              description: "",
              type: "string",
              kind: "select",
              default: "-6 months",
              options: [
                {
                  value: "-1 week",
                  label: "last week"
                },
                {
                  value: "-1 month",
                  label: "last month"
                },
                {
                  value: "-3 months",
                  label: "last 3 months"
                },
                {
                  value: "-6 months",
                  label: "last 6 months"
                },
              ],
            },
            {
              id: "ex-google-ads-until",
              name: "Until",
              description: "",
              type: "string",
              kind: "select",
              default: "-1 day",
              options: [
                {
                  value: '-1 day',
                  label: '1 day ago',
                },
                {
                  value: '-1 week',
                  label: '1 week ago',
                },
              ],
            }
          ]
        },
        {
          icon: "component:keboola.ex-sklik",
          name: "Sklik",
          description: "Sklik - Data Source",
          dialogName: "Sklik Data Source", 
          dialogDescription: "This source component is getting data about Sklik campaigns daily.",
          inputs: [
            {
              id: "ex-sklik-token",
              name: "Sklik API token",
              description: "Fill your Sklik API token.",
              type: "string",
              kind: "hidden",
              rules: "required",
            },
            {
              id: "ex-sklik-accounts",
              name: "List of accounts IDs.",
              description: "Fill comma separated ids. Leave empty for all.",
              type: "string",
              kind: "input",
            },
            {
              id: "ex-sklik-from-date-daily",
              name: "Period from date [incl.]",
              description: "Select period FROM for daily statistics.",
              type: "string",
              kind: "select",
              default: '6 months ago',
              options: [
                {
                  value: '1 week ago',
                  label: '1 week ago',
                },
                {
                  value: '1 month ago',
                  label: '1 month ago',
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
              id: "ex-sklik-to-date-daily",
              name: "Period to date [excl.]",
              description: "Select period TO for daily statistics.",
              type: "string",
              kind: "select",
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
              default: '1 day ago',
            },
            {
              id: "ex-sklik-from-date-monthly",
              name: "Period from date [incl.]",
              description: "Select period FROM for monthly statistics.",
              type: "string",
              kind: "input",
              default: "2020-01-01"
            }
          ]
        },
        {
          icon: "component:kds-team.ex-tiktok-ads",
          name: "TikTok",
          description: "TikTok - Data Source",
          dialogName: "TikTok Data Source", 
          dialogDescription: "This source component is getting data about TikTok campaigns daily.",
          inputs: [
            {
              id:          "oauth-tiktok",
              name:        "Open Authentication",
              description: "Authorization for TikTok",
              type:        "object",
              kind:        "oauth",
              componentId: "kds-team.ex-tiktok-ads",
              rules:       "required",
            },
            {
              id: "ex-tiktok-date-from",
              name: "Period from date [incl.]",
              description: "Select period FROM for daily statistics.",
              type: "string",
              kind: "select",
              default: '6 months ago',
              options: [
                {
                  value: '1 week ago',
                  label: '1 week ago',
                },
                {
                  value: '1 month ago',
                  label: '1 month ago',
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
              id: "ex-tiktok-to-date",
              name: "Period to date [excl.]",
              description: "Select period TO for daily statistics.",
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
        {
          icon: "component:leochan.ex-linkedin",
          name: "LinkedIn",
          description: "LinkedIn - Data Source",
          dialogName: "LinkedIn Data Source", 
          dialogDescription: "This source component is getting data about LinkedIn campaigns daily.",
          inputs: [
            {
              id:          "oauth-linkedinads",
              name:        "Open Authentication",
              description: "Authorization for LinkedIn Ads",
              type:        "object",
              kind:        "oauth",
              componentId: "leochan.ex-linkedin",
              rules:       "required",
            },
            {
              id: "ex-linkedin-start-day",
              name: "Start Day",
              description: "Start time range of the analytics",
              type: "int",
              kind: "input",
              rules: "min=1,max=31",
              default: 1,
            },
            {
              id: "ex-linkedin-start-month",
              name: "Start Month",
              description: "Start time range of the analytics",
              type: "int",
              kind: "input",
              rules: "min=1,max=12",
              default: 1,
            },
            {
              id: "ex-linkedin-start-year",
              name: "Start Year",
              description: "Start time range of the analytics",
              type: "int",
              kind: "input",
              rules: "min=2000,max=2100",
              default: 2022,
            },
            {
              id: "ex-linkedin-end-day",
              name: "End Day",
              description: "End time range of the analytics",
              type: "int",
              kind: "input",
              rules: "min=1,max=31",
              default: 30,
            },
            {
              id: "ex-linkedin-end-month",
              name: "End Month",
              description: "End time range of the analytics",
              type: "int",
              kind: "input",
              rules: "min=1,max=12",
              default: 6,
            },
            {
              id: "ex-linkedin-end-year",
              name: "End Year",
              description: "End time range of the analytics",
              type: "int",
              kind: "input",
              rules: "min=2000,max=2100",
              default: 2022,
            }
          ]
        }
      ]
    },
    {   
      description: "Snowflake Transformations",
      required: "all",
      steps: [
        {
          icon: "component:keboola.snowflake-transformation",
          name: "Snowflake SQL",
          description: "Transformations",
          backend: "snowflake",
          inputs: [],
        },
        {
          icon: "component:keboola.ex-currency",
          name: "ECB Currency Rates",
          description: "ECB Currency Rates - Data Source",
          dialogName: "ECB Currency Rates", 
          dialogDescription: "This source component is getting data about current exchange rate EUR/CZK.",
          inputs: [],
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
          description: "Configure Data App",
          dialogName: "Ads Spend vs Budget App", 
          dialogDescription: "Configure Data App by filling up required secrets.",
          inputs: [
            {
              id: "kbc-storage-token",
              name: "Keboola Token",
              description: "Insert a storage or your master token.",
              type: "string",
              kind: "hidden",
              rules: "required",
            }
          ],
        },
      ],
    },
  ],
}

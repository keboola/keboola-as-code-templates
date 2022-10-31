{
  stepsGroups: [
    {
      description: "Default Group",
      required: "all",
      steps: [
        {
          icon: "component:kds-team.ex-hubspot-crm",
          name: "HubSpot Data Source",
          description: "Authentication.",
          inputs: [
            {
              id: "ex-hubspot-crm-authentication-type",
              name: "Authentication Type",
              description: "Select Authentication Type",
              type: "string",
              kind: "select",
              Default: "Private App Token",
              options: [
                {
                  value: 'Private App Token',
                  label: 'Private App Token',
                },
                {
                  value: 'API Key',
                  label: 'API Key',
                },
              ]
            },
            {
              id: "ex-hubspot-crm-private-app-token",
              name: "Private App Token",
              description: "Your private app token.",
              type: "string",
              kind: "hidden",
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
          name: "Snowflake SQL",
          description: "Transformation",
          inputs: [],
        },
      ]
    },
  ],
}

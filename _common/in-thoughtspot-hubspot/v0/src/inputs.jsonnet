[
    {
      id: "hubspot-auth-type",
      name: "Authentication Type",
      description: "Select authentication type: key/token.",
      type: "string",
      kind: "select",
      rules: "required",
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
      id: "ex-hubspot-crm-api-token",
      name: "API token",
      description: "Insert your API Token.",
      type: "string",
      kind: "hidden",
      showif: "[hubspot-auth-type] == 'API Key'",
    },
    {
      id: "ex-hubspot-crm-private-app-token",
      name: "Private App token",
      description: "Insert your Private App token",
      type: "string",
      kind: "hidden",
      showif: "[hubspot-auth-type] == 'Private App Token'",
    },
    {
      id: "ex-hubspot-crm-period-from",
      name: "Period from date",
      description: "From when do you want to get the data?",
      type: "string",
      kind: "select",
      default: "6 months ago",
      options: [
        {
          value: '1 month ago',
          label: '1 month ago',
        },
        {
          value: '3 months ago',
          label: '3 months ago',
        },
        {
          value: '4 months ago',
          label: '4 months ago',
        },
        {
          value: '5 months ago',
          label: '5 months ago',
        },
        {
          value: '6 months ago',
          label: '6 months ago',
        },
      ],
    },
]

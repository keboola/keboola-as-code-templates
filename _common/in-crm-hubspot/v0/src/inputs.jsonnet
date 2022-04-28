[
    {
      id: "ex-hubspot-crm-api-token",
      name: "API token",
      description: "Insert your API Token.",
      type: "string",
      kind: "hidden",
    },
    {
      id: "ex-hubspot-crm-period-from",
      name: "Period from date [incl.]",
      description: "From when do you want to get the data?",
      type: "string",
      kind: "select",
      default: "1 month ago",
      options: [
        {
          value: '1 week ago',
          label: '1 week ago',
        },
        {
          value: '2 weeks ago',
          label: '2 weeks ago',
        },
        {
          value: '1 month ago',
          label: '1 month ago',
        },
        {
          value: '2 months ago',
          label: '2 months ago',
        },
      ],
    },
]

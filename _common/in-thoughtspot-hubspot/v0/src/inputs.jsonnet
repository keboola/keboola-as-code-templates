[
    {
      id: "ex-hubspot-crm-private-app-token",
      name: "Private App token",
      description: "Insert your Private App token",
      type: "string",
      kind: "hidden",
    },
    {
      id: "ex-hubspot-crm-period-from",
      name: "Period from date [incl.]",
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

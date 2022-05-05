[
  {
    id: "ex-hubspot-crm-api-token",
    name: "API token",
    description: "Insert your API Token.",
    type: "string",
    kind: "hidden",
    rules: "required",
  },
  {
    id: "ex-hubspot-crm-period-from",
    name: "Period from date",
    description: "Select period from which you want to get the data.",
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
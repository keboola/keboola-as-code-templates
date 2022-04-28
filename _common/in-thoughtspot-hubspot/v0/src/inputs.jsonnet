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
    default: '2 months ago',
    options: [
      {
        value: '1 day ago',
        label: '1 day ago',
      },
      {
        value: '7 days ago',
        label: '7 days ago',
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
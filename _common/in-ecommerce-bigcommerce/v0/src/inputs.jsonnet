[
  {
    id: "ex-bigcommerce-access-token",
    name: "Access Token",
    description: "Insert your API access token.",
    type: "string",
    kind: "hidden",
    rules: "required",
  },
  {
    id: "ex-bigcommerce-api-path",
    name: "API Path",
    description: "Insert your API base path.",
    type: "string",
    kind: "input",
    default: "https://api.bigcommerce.com/stores/123example/v2",
  },
  {
    id: "ex-bigcommerce-date-from",
    name: "Date from",
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
    id: "ex-bigcommerce-date-to",
    name: "Date to",
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
    ]
  }
]
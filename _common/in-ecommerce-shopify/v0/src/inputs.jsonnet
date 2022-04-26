[
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
    description: "Insert your shop id found in url, e.g. [shop_id].myshopify.com.",
    type: "string",
    kind: "input",
  },
  {
    id: "ex-shopify-period-from-date",
    name: "Period from date [including]",
    description: "Select period from which you want to get the data.",
    type: "string",
    kind: "select",
    default: '2 months ago',
    options: [
      {
        id: '1 week ago',
        name: '1 week ago',
      },
      {
        id: '2 weeks ago',
        name: '2 weeks ago',
      },
      {
        id: '1 month ago',
        name: '1 month ago',
      },
      {
        id: '2 months ago',
        name: '2 months ago',
      },
    ],
  },
  {
    id: "ex-shopify-period-to-date",
    name: "Period to date [excluding]",
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
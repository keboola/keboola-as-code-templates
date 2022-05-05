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
    default: '2 months ago',
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
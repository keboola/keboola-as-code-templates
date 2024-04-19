[
  {
    id: "ex-woocommerce-store-url",
    name: "Store URL",
    description: "Insert your shop domain name, e.g. htttps://myshop.com",
    type: "string",
    kind: "input",
    rules: "required",
  },
  {
    id: "ex-woocommerce-consumer-key",
    name: "Consumer key",
    description: "Insert rest API Consumer Key from WooCommerce Admin panel",
    type: "string",
    kind: "hidden",
  },
  {
    id: "ex-woocommerce-consumer-secret",
    name: "Consumer secret",
    description: "Insert rest API Consumer Secret from WooCommerce Admin panel",
    type: "string",
    kind: "hidden",
  },
  {
    id: "ex-woocommerce-date-from",
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
    id: "ex-woocommerce-date-to",
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
  },
]
[
  {
    id: "ex-shoptet-permalink-shop-name",
    name: "Shop Name",
    description: "Insert name of your shop.",
    type: "string",
    kind: "input",
    rules: "required",
    deafult: "shop name"
  },
  {
    id: "ex-shoptet-permalink-base-url",
    name: "Base URL",
    description: "Your shop url. e.g. https://www.myshop.cz",
    type: "string",
    kind: "input",
    rules: "required",
    default: " base url"
  },
  {
    id: "ex-shoptet-permalink-orders-url",
    name: "Orders URL",
    description: "e.g. https://www.myshop.cz/export/orders.csv?hash=XXXXX",
    type: "string",
    kind: "input",
    rules: "required",
    default: "order url"
  },
  {
    id: "ex-shoptet-permalink-products-url",
    name: "Products URL",
    description: "e.g. https://www.myshop.cz/export/products.csv?hash=XXXXX",
    type: "string",
    kind: "input",
    rules: "required",
    default: "products url"
  },
  {
    id: "ex-shoptet-permalink-customers-url",
    name: "Customers URL",
    description: "e.g. https://www.myshop.cz/export/customers.csv?hash=XXXXX",
    type: "string",
    kind: "input",
    rules: "required",
    default: "customers url"
  },
  {
    id: "ex-shoptet-permalink-stock-url",
    name: "Stock URL",
    description: "e.g. https://www.myshop.cz/export/stockStatistics.csv?hash=X",
    type: "string",
    kind: "input",
    rules: "required",
    default: "stock url"
  },
  {
    id: "ex-shoptet-permalink-src-charset",
    name: "File charset",
    description: "Source file charset. All files will be converted to UTF-8.",
    type: "string",
    kind: "input",
    rules: "required",
    default: "windows-1250"
  },
  {
    id: "ex-shoptet-permalink-delimiter",
    name: "Source file delimiter",
    description: "Insert source file delimiter.",
    type: "string",
    kind: "input",
    rules: "required",
    default: ";"
  },
  {
    id: "ex-shoptet-permalink-from-date",
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
    id: "ex-shoptet-permalink-to-date",
    name: "Period to date [excl.]",
    description: "Select period to date you want to get the data.",
    type: "string",
    kind: "select",
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
    default: '1 day ago',
  },
]

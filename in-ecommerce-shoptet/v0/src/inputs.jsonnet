{
  inputs: [
    {
      id: "ex-shoptet-permalink-shop-name",
      name: "Shop Name",
      description: "Insert name of your shop.",
      type: "string",
      kind: "input",
    },
    {
      id: "ex-shoptet-permalink-base-url",
      name: "Base URL",
      description: "Your shop url. e.g. https://www.myshop.cz",
      type: "string",
      kind: "input",
    },
    {
      id: "ex-shoptet-permalink-orders-url",
      name: "Orders URL",
      description: "e.g. https://www.myshop.cz/export/orders.csv?hash=XXXXX",
      type: "string",
      kind: "input",
    },
    {
      id: "ex-shoptet-permalink-products-url",
      name: "Products URL",
      description: "e.g. https://www.myshop.cz/export/products.csv?hash=XXXXX",
      type: "string",
      kind: "input",
    },
    {
      id: "ex-shoptet-permalink-customers-url",
      name: "Customers URL",
      description: "e.g. https://www.myshop.cz/export/customers.csv?hash=XXXXX",
      type: "string",
      kind: "input",
    },
    {
      id: "ex-shoptet-permalink-stock-url",
      name: "Stock URL",
      description: "e.g. https://www.myshop.cz/export/stockStatistics.csv?hash=XXXXX",
      type: "string",
      kind: "input",
    },
    {
      id: "ex-shoptet-permalink-src-charset",
      name: "File charset",
      description: "Determines the source file charset. All files will be converted to UTF-8.",
      type: "string",
      kind: "input",
      default: "windows-1250"
    },
    {
      id: "ex-shoptet-permalink-delimiter",
      name: "Source file delimiter",
      description: "Insert source file delimiter.",
      type: "string",
      kind: "input",
      default: ";"
    },
    {
      id: "ex-shoptet-permalink-from-date",
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
      id: "ex-shoptet-permalink-to-date",
      name: "Period to date [excluding]",
      description: "Select period to date you want to get the data.",
      type: "string",
      kind: "select",
      default: 'now',
      options: [
        {
          id: 'now',
          name: 'now',
        },
        {
          id: '1 day ago',
          name: '1 day ago',
        },
        {
          id: '1 week ago',
          name: '1 week ago',
        },
      ],
    },
  ],
}

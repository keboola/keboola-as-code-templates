{
  parameters: {
    packages: [
      "faker",
      "faker-commerce",
    ],
  },
  storage: {
    output: {
      tables: [
        {
          destination: "out.c-fake-data.customers",
          source: "customers.csv",
        },
        {
          destination: "out.c-fake-data.orders",
          source: "orders.csv",
        },
      ],
    },
  },
}

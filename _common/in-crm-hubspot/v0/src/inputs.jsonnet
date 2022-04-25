{
  inputs: [
    {
      id: "ex-hubspot-crm-api-token",
      name: "API token",
      description: "Insert your API Token.",
      type: "string",
      kind: "hidden",
    },
    {
      id: "ex-hubspot-crm-period-from",
      name: "Period from date [including]",
      description: "Date in YYYY-MM-DD format or dateparser string i.e. 5 days ago, 1 month ago, yesterday, etc. If left empty, all records are downloaded.",
      type: "string",
      kind: "input",
      default: "1 month ago",
    },
  ],
}

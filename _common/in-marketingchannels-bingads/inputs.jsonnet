[
  {
    id:          "oauth-bingads",
    name:        "Open Authentication",
    description: "Authorization for Bing Ads",
    type:        "object",
    kind:        "oauth",
    default:      {},
    componentId: "esnerda.ex-bingads",
  },
  {
    id: "ex-bingads-account-id",
    name: "Account ID",
    description: "Account identifier of your BingAds account.",
    type: "string",
    kind: "input",
    default: "XXXXXXXX",
  },
  {
    id: "ex-bingads-customer-id",
    name: "Customer ID",
    description: "Customer identifier of your BingAds account.",
    type: "string",
    kind: "input",
    default: "XXXXXXXX",
  },
  {
    id: "ex-bingads-report-period",
    name: "Report Period",
    description: "Select time period the report relates to.",
    type: "string",
    kind: "select",
    default: "LastThreeMonths",
    options: [
      {
        value: "LastWeek",
        label: "Last Week"
      },
      {
        value: "LastMonth",
        label: "Last Month"
      },
      {
        value: "LastThreeMonths",
        label: "Last Three Months"
      },
      {
        value: "LastSixMonths",
        label: "Last Six Months"
      },
    ],
  }
]

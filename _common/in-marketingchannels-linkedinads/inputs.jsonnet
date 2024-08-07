[
  {
    id:          "oauth-linkedinads",
    name:        "Open Authentication",
    description: "Authorization for LinkedIn Ads",
    type:        "object",
    kind:        "oauth",
    componentId: "leochan.ex-linkedin",
    rules:       "required",
  },
  {
    id: "ex-linkedin-start-day",
    name: "Start Day",
    description: "",
    type: "int",
    kind: "input",
    rules: "min=1,max=31",
    default: 1,
  },
  {
    id: "ex-linkedin-start-month",
    name: "Start Month",
    description: "",
    type: "int",
    kind: "input",
    rules: "min=1,max=12",
    default: 1,
  },
  {
    id: "ex-linkedin-start-year",
    name: "Start Year",
    description: "",
    type: "int",
    kind: "input",
    rules: "min=2000,max=2100",
    default: 2022,
  },
  {
    id: "ex-linkedin-end-day",
    name: "End Day",
    description: "",
    type: "int",
    kind: "input",
    rules: "min=1,max=31",
    default: 30,
  },
  {
    id: "ex-linkedin-end-month",
    name: "End Month",
    description: "",
    type: "int",
    kind: "input",
    rules: "min=1,max=12",
    default: 6,
  },
  {
    id: "ex-linkedin-end-year",
    name: "End Year",
    description: "",
    type: "int",
    kind: "input",
    rules: "min=2000,max=2100",
    default: 2022,
  }
]

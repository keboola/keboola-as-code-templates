[
  {
    id: "ex-jira-token",
    name: "API Token",
    description: "An API token to Atlassian Cloud.",
    type: "string",
    kind: "hidden",
    rules: "required"
  },
  {
    id: "ex-jira-organization-id",
    name: "Organization ID",
    description: "Can be found in URL: https://<organization_id>.atlassian.net",
    type: "string",
    kind: "input",
    default: "XXXXX",
  },
  {
    id: "ex-jira-organization-url",
    name: "Organization URL",
    description: "URL which will be used to download data from your org.",
    type: "string",
    kind: "input",
    default: "XXXXX",
  },
  {
    id: "ex-jira-since",
    name: "Date Range",
    description: "Date, since when the data will be downloaded.",
    type: "string",
    kind: "select",
    default: "1 week ago",
    options: [
      {
        value: "1 week ago",
        label: "last week"
      },
      {
        value: "1 month ago",
        label: "last month"
      },
      {
        value: "3 months ago",
        label: "last 3 months"
      },
      {
        value: "6 months ago",
        label: "last 6 months"
      },
    ],
  },
  {
    id: "ex-jira-username",
    name: "Username",
    description: "A username to Atlassian Cloud, usually an email.",
    type: "string",
    kind: "input",
    default: "XXXXX",
  },
]

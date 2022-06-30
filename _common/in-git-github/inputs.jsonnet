[
  {
  id: "ex-github-start-date",
  name: "Start date",
  description: "Select day from which you want to get the data.",
  type: "string",
  kind: "select",
  default: '- 14 days',
  options: [
    {
      value: '- 7 days',
      label: '- 7 days',
    },
    {
      value: '- 14 days',
      label: '- 14 days',
    },
    {
      value: '- 30 days',
      label: '- 30 days',
    },
    {
      value: '- 60 days',
      label: '- 60 days',
    },
    {
      value: '- 180 days',
      label: '- 180 days',
    },
  ],
},
{
    id:          "g3s2-oauth-github",
    name:        "Google oAuth",
    description: "Authorization for GitHub",
    type:        "object",
    kind:        "oauth",
    deafult:      {},
    componentId: "keboola.ex-github",
  }
]
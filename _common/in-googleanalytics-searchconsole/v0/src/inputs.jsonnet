[
  {
    id:          "g3s2-oauth-googlesearch",
    name:        "Google oAuth",
    description: "Authorization for Google Search Console",
    type:        "object",
    kind:        "oauth",
    deafult:      {},
    componentId: "kds-team.ex-google-search-console",
  },
  {
    id: "gsc-domain",
    name: "Domain",
    description: "Insert your domain.",
    type: "string",
    kind: "input",
    rules: "required",
    default: "www.domain.com"
  },
  {
      id: "gsc-from",
      name: "Period from date",
      description: "From when do you want to get the data?",
      type: "string",
      kind: "select",
      default: "1 month ago",
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
      id: "gsc-to",
      name: "Period to date",
      description: "To when do you want to get the data?",
      type: "string",
      kind: "select",
      default: "1 day ago",
      options: [
        {
          value: '1 day ago',
          label: '1 day ago',
        },
        {
          value: '1 week ago',
          label: '1 week ago',
        },
      ],
    }  
]
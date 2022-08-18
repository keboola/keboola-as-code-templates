[
  {
    id: "ex-sklik-token",
    name: "Sklik API token",
    description: "Fill your Sklik API token.",
    type: "string",
    kind: "hidden",
    rules: "required",
  },
  {
    id: "ex-sklik-accounts",
    name: "List of accounts IDs.",
    description: "Fill comma separated ids. Leave empty for all.",
    type: "string",
    kind: "input",
  },
   {
    id: "ex-sklik-from-date-daily",
    name: "Period from date [incl.]",
    description: "Select period from daily statistics.",
    type: "string",
    kind: "select",
    default: '2 months ago',
    options: [
      {
        value: '1 day ago',
        label: '1 day ago',
      },
      {
        value: '1 week ago',
        label: '1 week ago',
      },
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
    ],
  },
  {
    id: "ex-sklik-to-date-daily",
    name: "Period to date [excl.]",
    description: "Select period from daily statistics.",
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
  {
    id: "ex-sklik-from-date-monthly",
    name: "Period from date [incl.]",
    description: "Select period from which you want to get the data for monthly statistics.",
    type: "string",
    kind: "input",
    default: "2020-01-01"
  }
]

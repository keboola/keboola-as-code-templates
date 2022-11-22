[
  {
    id:          "oauth-google-sheets",
    name:        "Open Authentication",
    description: "Authorization for Google Sheets",
    type:        "object",
    kind:        "oauth",
    componentId: "keboola.wr-google-sheets",
    rules:       "required",
  },
  {
    id: "google-sheet-id",
    name: "Typeform gSheet file ID",
    description: "Insert file ID of the google sheet destination",
    type: "string",
    kind: "input",
    rules: "required",
    default: "XXXXXXX"
  }
]

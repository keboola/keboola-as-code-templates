[
  {
    id:          "oauth-google-sheets",
    name:        "Open Authentication",
    description: "Authorization for Google Sheets",
    type:        "object",
    kind:        "oauth",
    componentId: "keboola.wr-google-sheets",
    rulse:       "required",
  },
  {
    id: "google-sheet-id",
    name: "Git gSheet file ID",
    description: "Insert file ID of the google sheet destination",
    type: "string",
    kind: "input",
    rules: "required",
    default: "XXXXXXX"
  }
]

[
  {
    id:          "g3s2-oauth",
    name:        "Google OAuth",
    description: "Authorization for Google Sheets",
    type:        "object",
    kind:        "oauth",
    default:      {},
    componentId: "keboola.wr-google-sheets",
  },
  {
    id: "google-sheet-id",
    name: "OUT-MAILCHIMP file ID",
    description: "Insert file ID of the google sheet destination",
    type: "string",
    kind: "input",
    rules: "required",
    default: "XXXXXXX"
  }
]
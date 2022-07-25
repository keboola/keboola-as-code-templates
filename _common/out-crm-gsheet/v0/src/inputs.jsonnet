[
    {
        id: "google-sheet-id",
        name: "CRM gSheet File ID",
        description: "Insert file ID of the google sheet destination",
        type: "string",
        kind: "input",
        rules: "required",
        default: "XXXXXXX"
    },
    {
      id:          "g3s2-oauth",
      name:        "Google oAuth",
      description: "Authorization for Google Sheets",
      type:        "object",
      kind:        "oauth",
      default:      {},
      componentId: "keboola.wr-google-sheets",
    }
]

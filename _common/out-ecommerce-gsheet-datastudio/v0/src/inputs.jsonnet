[
    {
        id: "data-studio-gsheet-id",
        name: "DataStudio gSheet File ID",
        description: "Insert file ID of the google sheet destination",
        type: "string",
        kind: "input",
        rules: "required",
        default: "XXXXXXX"
    },
    {
      id:          "oauth-datastudio",
      name:        "Google oAuth",
      description: "Authorization for DataStudio Google Sheets",
      type:        "object",
      kind:        "oauth",
      componentId: "keboola.wr-google-sheets",
      rules:       "required",
    }

]

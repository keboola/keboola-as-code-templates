[
    {
      id:          "oauth-datastudio",
      name:        "Open Authentication",
      description: "Authorization for DataStudio Google Sheets",
      type:        "object",
      kind:        "oauth",
      componentId: "keboola.wr-google-sheets",
      rules:       "required",
    },
    {
        id: "data-studio-gsheet-id",
        name: "DataStudio gSheet File ID",
        description: "Insert file ID of the google sheet destination",
        type: "string",
        kind: "input",
        rules: "required",
        default: "XXXXXXX"
    }

]

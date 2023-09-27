{
          icon: "component:keboola.ex-twitter",
          name: "Twitter Page",
          description: "Import data from Twitter Page",
          dialogName: "Twitter Page Source", 
          dialogDescription: "This source component imports all posts engagement and page engagement (since this day) from your Twitter account.",
          inputs: [
            {
              id:          "oauth-twitter",
              name:        "Open Authentication",
              description: "Authorize Twitter",
              type:        "object",
              kind:        "oauth",
              componentId: "keboola.ex-twitter",
              rules:       "required",
            },
            {
              id: "screen_name",
              name: "Screen Name",
              description: "Enter your screen name",
              type: "string",
              kind: "input",
              default: 'Screen Name',
            }
          ]
        }
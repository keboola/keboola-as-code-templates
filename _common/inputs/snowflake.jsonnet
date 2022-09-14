[
  {
    id: "wr-snowflake-selection",
    name: "Yes, I want.",
    description: "Do you want to use Keboola's Snowflake?",
    type: "bool",
    kind: "confirm",
    rules: "required",
  },
  {
    id: "wr-snowflake-go-back-to-flow",
    name: "Got it!",
    description: "When template's used, go back to flow.",
    type: "bool",
    kind: "confirm",
    showif: "[wr-snowflake-selection] != false",
  },
  {
    id: "wr-snowflake-set-credentials",
    name: "Got it!",
    description: "Go to the snowflake configuration.",
    type: "bool",
    kind: "confirm",
    showif: "[wr-snowflake-selection] != false",
  },
  {
    id: "wr-snowflake-set-credentials2",
    name: "Got it!",
    description: "Click on CONNECT DATABASE.",
    type: "bool",
    kind: "confirm",
    showif: "[wr-snowflake-selection] != false",
  },
  {
    id: "wr-snowflake-set-keboola-database",
    name: "Got it!",
    description: "Select KEBOOLA SNOWFLAKE DATABASE.",
    type: "bool",
    kind: "confirm",
    showif: "[wr-snowflake-selection] != false",
  }
]
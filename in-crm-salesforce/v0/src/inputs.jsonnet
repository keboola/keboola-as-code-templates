{
  inputs: [
    {
      id: "ex-salesforce-v2-api-version",
      name: "API version",
      description: "Specify the version of API you want to extract data from.",
      type: "string",
      kind: "input",
      default: "42.0"
    },
    {
      id: "ex-salesforce-v2-username",
      name: "Login Name",
      description: "Insert your login name for Salesforce.",
      type: "string",
      kind: "input"
    },
    {
      id: "ex-salesforce-v2-password",
      name: "Password",
      description: "Insert your Salesforce password.",
      type: "string",
      kind: "hidden",
    },
    {
      id: "ex-salesforce-v2-security-token",
      name: "Security token",
      description: "Insert your Salesforce security token.",
      type: "string",
      kind: "hidden",
    },
  ],
}

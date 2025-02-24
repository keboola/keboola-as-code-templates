{
  parameters: {
    sleep: 0,
    authentication: {
      service: "openai",
      "#api_token": Input("app-generative-ai-authentication-api-token"),
    },
  },
}

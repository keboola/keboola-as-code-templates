{
  parameters: {
    url: Input("ex-confluence-url"),
    username: Input("ex-confluence-username"),
    "#api_token": Input("ex-confluence-api-token"),
    destination_options: {
      beautify: true,
      incremental: true,
    },
  },
}

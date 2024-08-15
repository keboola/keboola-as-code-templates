{
  parameters: {
    actionType: "runActor",
    memory: "2048",
    build: "latest",
    input: {
      language: "en",
      maxReviews: 99999,
      personalData: true,
      startUrls: [
        {
          url: Input("apify-input-start-url"),
        },
      ],
    },
    actId: Input("apify-actor-id"),
    "#token": Input("apify-token"),
  },
}

{
  parameters: {
    index_options: {
      name: "confluence",
      metric: "cosine",
      dimension: 1536,
      create_new: true,
    },
    authentication: {
      "#openai_api_key": Input("wr-pinecone-authentication-openai-api-key"),
      "#pinecone_api_key": Input("wr-pinecone-authentication-pinecone-api-key"),
      pinecone_environment: Input("wr-pinecone-authentication-pinecone-environment"),
    },
    source_settings: {
      only_latest: true,
    },
  },
  storage: {
    input: {
      files: [
        {
          source: {
            tags: [
              {
                name: "confluence_pages",
              },
            ],
          },
        },
      ],
    },
  },
  processors: {
    before: [
      {
        definition: {
          component: "kds-team.processor-unzip",
        },
        parameters: {
          extract_to_folder: false,
        },
      },
    ],
    after: [],
  },
}

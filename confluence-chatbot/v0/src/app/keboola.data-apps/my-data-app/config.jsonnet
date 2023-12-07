{
  parameters: {
    dataApp: {
      streamlitAuthEnabled: true,
      secrets: {
        "#PINECONE_API_KEY": Input("wr-pinecone-authentication-pinecone-api-key"),
        PINECONE_ENV: Input("wr-pinecone-authentication-pinecone-environment"),
        "#OPENAI_API_KEY": Input("wr-pinecone-authentication-openai-api-key"),
      },
      git: {
        repository: "https://github.com/keboola/kai_slack_bot",
        branch: "streamlit-app",
        entrypoint: "streamlit_app.py",
      },
    },
  },
}

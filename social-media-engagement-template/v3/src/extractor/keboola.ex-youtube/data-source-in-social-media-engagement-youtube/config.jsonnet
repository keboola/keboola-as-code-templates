{
  authorization: {
    oauth_api: Input("oauth-youtube"),
  },
  parameters: {
    api: {
      baseUrl: "https://www.googleapis.com/youtube/v3/",
      name: "youtube",
      http: {
        Accept: "application/json",
        "Content-Type": "application/json;charset=UTF-8",
      },
      authentication: {
        type: "oauth20.login",
        loginRequest: {
          endpoint: "https://accounts.google.com/o/oauth2/token",
          params: {
            refresh_token: {
              user: "refresh_token",
            },
            client_id: {
              consumer: "client_id",
            },
            client_secret: {
              consumer: "client_secret",
            },
            grant_type: "refresh_token",
          },
          method: "FORM",
          headers: {
            "Content-Type": "application/x-www-form-urlencoded",
          },
        },
        apiRequest: {
          query: {
            access_token: "access_token",
          },
        },
      },
      pagination: {
        method: "response.param",
        responseParam: "nextPageToken",
        queryParam: "pageToken",
        includeParams: true,
      },
    },
    config: {
      jobs: [
        {
          endpoint: "channels?mine=true&part=id",
          dataType: "channels",
          dataField: "items",
          children: [
            {
              endpoint: "search?type=video&channelId={channelId}&part=id",
              dataField: "items",
              placeholders: {
                channelId: "id",
              },
              children: [
                {
                  endpoint: "videos?id={videoId}&part=id,snippet, statistics",
                  dataType: "videosDetail",
                  dataField: "items",
                  placeholders: {
                    videoId: "id.videoId",
                  },
                },
              ],
            },
          ],
        },
      ],
    },
  },
}

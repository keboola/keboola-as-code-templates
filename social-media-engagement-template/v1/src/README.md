The process is simple and we will guide you through it.

The flow, in a nutshell:

- First, the Social Media Engagement source components will collect data from your selected social networks. Currently, these networks are available:
    
    - Facebook
    - Instagram
    - YouTube
    - LinkedIn

- We then add NULL values if any columns are missing, convert dates to a standard format, and add information about the source social network to the source column.

- Finally, the combined data will be exported to the destination tables.

**Output table: pages_engagement**

| metric / social network | Facebook | Instagram | LinkedIn | YouTube |
|-------------------------|:----------:|:-----------:|:----------:|:---------:|
| page_followers          |     ✅    |     ✅     |     ✅    |    ❌    |
| page_posts_impressions  |     ✅    |     ✅     |     ✅    |    ❌    |
| page_views_total        |     ✅    |     ✅     |     ✅    |    ❌    |


**Output table: posts_engagement**

| metric / social network | Facebook | Instagram | LinkedIn | YouTube |
|-------------------------|:--------:|:---------:|:--------:|:-------:|
| likes                   |     ✅    |     ✅     |     ✅    |    ✅    |
| comments                |     ❌    |     ✅     |     ❌    |    ✅    |
| shares                  |     ✅    |     ❌     |     ❌    |    ❌    |
| views                   |     ❌    |     ❌     |     ❌    |    ✅    |
| all_reactions - SUM of: |   likes  |   likes   |   likes  |  likes  |
|                         |  shares  |  comments |          |  comments |
|                         |          |           |          | favourites |


**Availability of historical data**

Each social network allows access to the history of page engagement differently:

- Facebook - maximum 93 days ago
- Instagram - maximum 30 days ago
- LinkedIn - without known limit
- Youtube - currently not available in this template

For more information, take a look at our [documentation](https://help.keboola.com/templates/social-media-engagement/).
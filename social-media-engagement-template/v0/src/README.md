## Social Media Engagement Template

With this flow, you can get aggregated engagement data from different social networks. The output is two tables, first table pages_engagement of daily metrics for each social media and the second posts_engagement table containing all posts from selected social media.

### The flow, in a nutshell:

1. First, the data source components obtain data from chosen social networks.
Currently are available:
    - Facebook
    - Instagram
    - YouTube
    - LinkedIn
    - Twitter - announced the end of free API

2. The transformation fills Nulls in missing columns, converts dates to a standard format, and adds information about the source social network to the source column.

3. Finally, the united data are exported to the destination tables

**Output table - pages_engagement:**

| metric / social network | Facebook | Instagram | LinkedIn | Twitter | YouTube |
|-------------------------|:----------:|:-----------:|:----------:|:---------:|:---------:|
| page_followers          |     ✅    |     ✅     |     ✅    |    ✅    |    ❌    |
| page_posts_impressions  |     ✅    |     ✅     |     ✅    |    ❌    |    ❌    |
| page_views_total        |     ✅    |     ✅     |     ✅    |    ❌    |    ❌    |


**Output table - posts_engagement:**

| metric / social network | Facebook | Instagram | LinkedIn | Twitter |   YouTube  |
|-------------------------|:--------:|:---------:|:--------:|:-------:|:----------:|
| likes                   |     ✅    |     ✅     |     ✅    |    ✅    |      ✅     |
| comments                |     ❌    |     ✅     |     ❌    |    ❌    |      ✅     |
| shares                  |     ✅    |     ❌     |     ❌    |    ✅    |      ❌     |
| views                   |     ❌    |     ❌     |     ❌    |    ❌    |      ✅     |
| all_reactions - SUM of: |   likes  |   likes   |   likes  |  likes  |    likes   |
|                         |  shares  |  comments |          |  shares |  comments  |
|                         |          |           |          |         | favourites |
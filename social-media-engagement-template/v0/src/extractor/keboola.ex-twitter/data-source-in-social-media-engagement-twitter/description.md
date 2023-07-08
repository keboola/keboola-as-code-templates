This data source is returning 5 tables:

**tweets** with columns:
*id, created_at, favorite_count, in_reply_to_screen_name, in_reply_to_status_id, in_reply_to_user_id, lang, quoted_status_id, retweet_count, retweeted_status_id, source, text, truncated, withheld_copyright, user_id, keboola_source*

**tweets-hashtags** with columns:
*text, tweets_pk*

**tweets-urls** with columns:
*url, expanded_url, display_url, tweets_pk*

**tweets-user-mentions** with columns:
*name, screen_name, user_id, tweets_pk*

**users** with columns:
*id, name, screen_name, created_at, description, favourites_count, followers_count, friends_count, lang, location, statuses_count, keboola_source*
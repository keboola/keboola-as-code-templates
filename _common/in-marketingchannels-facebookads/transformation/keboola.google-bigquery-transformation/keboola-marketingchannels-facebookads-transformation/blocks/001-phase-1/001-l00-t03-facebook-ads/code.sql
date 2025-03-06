/* parse "url_tags" field function */ /* PARSE_UTM ( tag you need to parse, "url_tags" field) */
CREATE OR REPLACE FUNCTION PARSE_UTM(
    utm STRING,
    trg_str STRING
)
RETURNS STRING(255) AS
'\n\tcase when position(utm in trg_str) >0 then \n    case when position(\'&\' in substring(trg_str,position(utm in trg_str)))>0 then \n            left(substring(trg_str,position(utm in trg_str)+length(utm)+1),position(\'&\' in substring(trg_str,position(utm in trg_str)+length(utm)+1))-1)\n         else \n            substring(trg_str,position(utm in trg_str)+length(utm)+1)\n         end             \n else null end\n';

/* parse "url_tags" field function */
CREATE VIEW `tmp_utm` AS
SELECT DISTINCT
  `parent_id`,
  PARSE_UTM('utm_source', `url_tags`) AS `source`,
  PARSE_UTM('utm_medium', `url_tags`) AS `medium`,
  PARSE_UTM('utm_campaign', `url_tags`) AS `campaign`
FROM `Facebook_Ads_ads_insights_adcreatives`;

/* join all source tables in one */ /* create UTM tags (see also query and function above) */
CREATE VIEW `tmp_facebook` AS
SELECT
  LOWER(`acc`.`account_id`) AS `account_id`,
  LOWER(`acc`.`currency`) AS `currency`,
  `i`.`date_start` AS `date`,
  LOWER(COALESCE(`utm`.`source`, 'facebook')) AS `source`,
  LOWER(COALESCE(`utm`.`medium`, 'cpc')) AS `medium`,
  LOWER(
    CASE
      WHEN `utm`.`campaign` = '{{campaign.name}}'
      THEN `cmp`.`name`
      WHEN `utm`.`campaign` = '{{adset.name}}'
      THEN `as`.`name`
      ELSE COALESCE(`utm`.`campaign`, `cmp`.`name`)
    END
  ) AS `campaign`,
  '' AS `domain`,
  `i`.`impressions`,
  ROUND(IF(`i`.`inline_link_clicks` = '', 0, `i`.`inline_link_clicks`)) AS `clicks`,
  CAST(`i`.`spend` AS FLOAT64) AS `costs`
FROM `Facebook_Ads_ads_insights` AS `i`
LEFT JOIN `Facebook_Ads_ads` AS `a`
  ON `i`.`ad_id` = `a`.`id`
LEFT JOIN `Facebook_Ads_adsets` AS `as`
  ON `a`.`adset_id` = `as`.`id`
LEFT JOIN `tmp_utm` AS `utm`
  ON `a`.`id` = `utm`.`parent_id`
LEFT JOIN `Facebook_Ads_campaigns` AS `cmp`
  ON `as`.`campaign_id` = `cmp`.`id`
LEFT JOIN `Facebook_Ads_accounts` AS `acc`
  ON `cmp`.`ex_account_id` = `acc`.`id`;

/* final output table */
CREATE TABLE `out_facebook` (
  `facebook_ads_id` STRING(1024) NOT NULL,
  `clicks` INT64,
  `impressions` INT64,
  `costs` FLOAT64
);

INSERT INTO `out_facebook`
SELECT
  COALESCE(`date`, '') || '*' || COALESCE(`source`, '') || '*' || COALESCE(`medium`, '') || '*' || COALESCE(`campaign`, '') || '*' || COALESCE(`domain`, '') || '*' || COALESCE(`currency`, '') || '*' || COALESCE(`account_id`, '') AS `facebook_ads_id`,
  SUM(`clicks`) AS `clicks`,
  SUM(`impressions`) AS `impressions`,
  SUM(`costs`) AS `costs`
FROM `tmp_facebook`
GROUP BY
  `date`,
  `domain`,
  `source`,
  `medium`,
  `campaign`,
  `account_id`,
  `currency`;
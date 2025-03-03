CREATE TABLE `search_console_grouped_ranking` (
  `page` STRING(1024),
  `gsc_date` DATE,
  `gsc_average_ranking` FLOAT64
);

/* group gsc results by url and date */
INSERT INTO `search_console_grouped_ranking`
/* get average position from google search console */
SELECT
  `page`,
  CAST(CAST((
    `date`
  ) AS STRING) AS DATE) AS `gsc_date`,
  AVG(CAST(`position` AS FLOAT64)) AS `gsc_average_ranking`
FROM `raw_search_console`
GROUP BY
  `page`,
  `date`;

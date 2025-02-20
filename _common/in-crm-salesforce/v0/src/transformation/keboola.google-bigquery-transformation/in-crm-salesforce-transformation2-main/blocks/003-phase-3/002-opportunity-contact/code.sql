/* create output paring table for opportunities and contacts */ /* merge both tables ids as paring table id */ /* use inner joins and ids from referring tables to make sure referential integrity is intact */ /* change boolean values to commonly used format in KBC scaffolds */
CREATE TABLE `out_opportunity_contact` (
  `opportunity_contact_id` STRING(2000) NOT NULL,
  `opportunity_id` STRING(2000),
  `contact_id` STRING(2000),
  `is_primary_contact` STRING(255),
  `role` STRING(255)
)
INSERT INTO `out_opportunity_contact`
SELECT
  `o`.`opportunity_id` || '-' || `c`.`contact_id` AS `opportunity_contact_id`,
  `o`.`opportunity_id`,
  `c`.`contact_id`,
  IF(`r`.`IsPrimary` = 'false', 'No', 'Yes') AS `is_primary_contact`,
  `r`.`Role` AS `role`
FROM `opportunity_contact_role` AS `r`
INNER JOIN `out_opportunity` AS `o`
  ON `r`.`OpportunityId` = `o`.`opportunity_id`
INNER JOIN `out_contact` AS `c`
  ON `r`.`ContactId` = `c`.`contact_id`
WHERE
  LOWER(`r`.`IsDeleted`) = 'false'
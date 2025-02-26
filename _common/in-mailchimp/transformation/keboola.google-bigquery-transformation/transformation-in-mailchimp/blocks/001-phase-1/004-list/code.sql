/* create output table of lists */
CREATE TABLE `lists_out` (
  `list_id` STRING(255) NOT NULL,
  `list_name` STRING(255),
  `list_contact_company` STRING(255),
  `list_contact_country` STRING(255),
  `list_rating` FLOAT64
);

INSERT INTO `lists_out`
SELECT
  `id` AS `list_id`,
  `name` AS `list_name`,
  `contact_company` AS `list_contact_company`,
  `contact_country` AS `list_contact_country`,
  `list_rating` AS `list_rating`
FROM `lists`;
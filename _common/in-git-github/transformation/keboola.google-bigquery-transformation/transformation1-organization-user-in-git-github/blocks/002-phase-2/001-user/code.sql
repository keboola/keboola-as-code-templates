/* create output users table */ /* format date */ /* set active status to 'true' - it's not part of GitHub API response, but part of our model */
CREATE TABLE `out_user` (
  `user_id` STRING(255) NOT NULL,
  `user` STRING(255),
  `created_on` DATETIME,
  `type` STRING(255),
  `is_active` BOOL
)
INSERT INTO `out_user`
SELECT
  `m`.`id` AS `user_id`,
  `m`.`login` AS `user`,
  replace(LEFT(`m2`.`created_at`, 19), 'T', ' ') AS `created_on`,
  `m`.`type`,
  CAST('true' AS STRING) AS `is_active`
FROM `members` AS `m`
LEFT JOIN `members_detail` AS `m2`
  ON `m`.`login` = `m2`.`login`
/* add fake row for referential integrity (pull requests/commits/issues/comments without user) */
INSERT INTO `out_user` (
  `user_id`,
  `user`,
  `created_on`,
  `type`,
  `is_active`
)
VALUES
  ('0', 'External User', NULL, 'User', 'false')
/* create user-organization membership table */ /* link member to Unknown org if that mentioned in the data is missing */
CREATE TABLE `out_organization_user` (
  `organization_id` STRING(255) NOT NULL,
  `user_id` STRING(255) NOT NULL
)
INSERT INTO `out_organization_user`
SELECT
  COALESCE(`o`.`organization_id`, '0') AS `organization_id`,
  `m`.`id` AS `user_id`
FROM `members` AS `m`
LEFT JOIN `out_organization` AS `o`
  ON `m`.`org_name` = `o`.`organization`
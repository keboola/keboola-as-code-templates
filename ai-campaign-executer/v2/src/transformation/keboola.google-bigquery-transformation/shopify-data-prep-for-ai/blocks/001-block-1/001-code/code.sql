CREATE TABLE `out_sms_campaign` AS
SELECT
  o.`customer_id`,
  c.`first_name` AS `name`,
  c.`phone` AS `phone`,
  COUNT(li.`product_id`) AS `count`,
  p.`title`,
  p.`body_html`
FROM `order` AS o
JOIN `customer` AS c
  ON c.`id` = o.`customer_id`
JOIN `line-item` AS li
  ON li.`order_id` = o.`id`
JOIN `product` AS p
  ON p.`id` = li.`product_id`
WHERE
  o.`customer_id` <> ''
GROUP BY
  o.`customer_id`,
  c.`first_name`,
  c.`phone`,
  p.`title`,
  p.`body_html`;
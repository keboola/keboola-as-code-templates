CREATE OR REPLACE TABLE `line_item_tax_lines` (
  `channel_liable` STRING(16777216),
  `extraction_time` STRING(16777216),
  `line_item_id` STRING(16777216) NOT NULL,
  `price` STRING(16777216),
  `price_set__presentment_money__amount` STRING(16777216),
  `price_set__presentment_money__currency_code` STRING(16777216),
  `price_set__shop_money__amount` STRING(16777216),
  `price_set__shop_money__currency_code` STRING(16777216),
  `rate` STRING(16777216),
  `row_nr` STRING(16777216) NOT NULL,
  `title` STRING(16777216)
);

CREATE OR REPLACE TABLE `order_tax_lines` (
  `channel_liable` STRING(16777216),
  `extraction_time` STRING(16777216),
  `order_id` STRING(16777216) NOT NULL,
  `price` STRING(16777216),
  `price_set__presentment_money__amount` STRING(16777216),
  `price_set__presentment_money__currency_code` STRING(16777216),
  `price_set__shop_money__amount` STRING(16777216),
  `price_set__shop_money__currency_code` STRING(16777216),
  `rate` STRING(16777216),
  `row_nr` STRING(16777216) NOT NULL,
  `title` STRING(16777216)
);

CREATE TABLE `order_discount_applications` (
  `row_nr` STRING(16777216) NOT NULL,
  `order_id` STRING(16777216) NOT NULL,
  `value_type` STRING(16777216),
  `target_type` STRING(16777216),
  `code` STRING(16777216),
  `extraction_time` STRING(16777216),
  `target_selection` STRING(16777216),
  `type` STRING(16777216),
  `value` STRING(16777216),
  `allocation_method` STRING(16777216)
);

CREATE TABLE `order_fulfillments` (
  `name` STRING(16777216),
  `tracking_urls` STRING(16777216),
  `service` STRING(16777216),
  `tracking_url` STRING(16777216),
  `extraction_time` STRING(16777216),
  `tracking_company` STRING(16777216),
  `tracking_number` STRING(16777216),
  `location_id` STRING(16777216),
  `id` STRING(16777216) NOT NULL,
  `order_id` STRING(16777216) NOT NULL,
  `created_at` STRING(16777216),
  `shipment_status` STRING(16777216),
  `updated_at` STRING(16777216),
  `tracking_numbers` STRING(16777216),
  `status` STRING(16777216),
  `admin_graphql_api_id` STRING(16777216)
);
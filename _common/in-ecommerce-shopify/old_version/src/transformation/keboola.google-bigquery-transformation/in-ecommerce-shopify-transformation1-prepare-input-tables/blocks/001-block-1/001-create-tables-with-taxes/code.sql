CREATE OR REPLACE TABLE `fulfillment_line_item_tax_lines` (
  `channel_liable` STRING(16777216),
  `extraction_time` STRING(16777216),
  `line_item_id` STRING(16777216),
  `price` STRING(16777216),
  `price_set__presentment_money__amount` STRING(16777216),
  `price_set__presentment_money__currency_code` STRING(16777216),
  `price_set__shop_money__amount` STRING(16777216),
  `price_set__shop_money__currency_code` STRING(16777216),
  `rate` STRING(16777216),
  `row_nr` STRING(16777216),
  `title` STRING(16777216)
);

CREATE OR REPLACE TABLE `line_item_tax_lines` (
  `channel_liable` STRING(16777216),
  `extraction_time` STRING(16777216),
  `line_item_id` STRING(16777216),
  `price` STRING(16777216),
  `price_set__presentment_money__amount` STRING(16777216),
  `price_set__presentment_money__currency_code` STRING(16777216),
  `price_set__shop_money__amount` STRING(16777216),
  `price_set__shop_money__currency_code` STRING(16777216),
  `rate` STRING(16777216),
  `row_nr` STRING(16777216),
  `title` STRING(16777216)
);

CREATE OR REPLACE TABLE `order_tax_lines` (
  `channel_liable` STRING(16777216),
  `extraction_time` STRING(16777216),
  `order_id` STRING(16777216),
  `price` STRING(16777216),
  `price_set__presentment_money__amount` STRING(16777216),
  `price_set__presentment_money__currency_code` STRING(16777216),
  `price_set__shop_money__amount` STRING(16777216),
  `price_set__shop_money__currency_code` STRING(16777216),
  `rate` STRING(16777216),
  `row_nr` STRING(16777216),
  `title` STRING(16777216)
);

CREATE OR REPLACE TABLE `fulfillment_line_item_discount_allocations` (
  `amount` STRING(16777216),
  `amount_set__presentment_money__amount` STRING(16777216),
  `amount_set__presentment_money__currency_code` STRING(16777216),
  `amount_set__shop_money__amount` STRING(16777216),
  `amount_set__shop_money__currency_code` STRING(16777216),
  `discount_application_index` STRING(16777216),
  `extraction_time` STRING(16777216),
  `line_item_id` STRING(16777216),
  `row_nr` STRING(16777216),
  `title` STRING(16777216)
);

CREATE OR REPLACE TABLE `line_item_discount_allocations` (
  `amount` STRING(16777216),
  `row_nr` STRING(16777216),
  `line_item_id` STRING(16777216),
  `amount_set__shop_money__amount` STRING(16777216),
  `amount_set__presentment_money__amount` STRING(16777216),
  `amount_set__presentment_money__currency_code` STRING(16777216),
  `extraction_time` STRING(16777216),
  `amount_set__shop_money__currency_code` STRING(16777216),
  `discount_application_index` STRING(16777216)
);

CREATE TABLE `customer_addresses` (
  `phone` STRING(16777216),
  `name` STRING(16777216),
  `province` STRING(16777216),
  `extraction_time` STRING(16777216),
  `company` STRING(16777216),
  `country_name` STRING(16777216),
  `province_code` STRING(16777216),
  `id` STRING(16777216),
  `zip` STRING(16777216),
  `customer_id` STRING(16777216),
  `address2` STRING(16777216),
  `default` STRING(16777216),
  `address1` STRING(16777216),
  `city` STRING(16777216),
  `last_name` STRING(16777216),
  `country` STRING(16777216),
  `country_code` STRING(16777216),
  `first_name` STRING(16777216)
);

CREATE TABLE `fulfillment_line_item` (
  `admin_graphql_api_id` STRING(16777216),
  `duties` STRING(16777216),
  `extraction_time` STRING(16777216),
  `fulfillable_quantity` STRING(16777216),
  `fulfillment_id` STRING(16777216),
  `fulfillment_service` STRING(16777216),
  `fulfillment_status` STRING(16777216),
  `gift_card` STRING(16777216),
  `grams` STRING(16777216),
  `id` STRING(16777216),
  `name` STRING(16777216),
  `origin_location__address1` STRING(16777216),
  `origin_location__address2` STRING(16777216),
  `origin_location__city` STRING(16777216),
  `origin_location__country_code` STRING(16777216),
  `origin_location__id` STRING(16777216),
  `origin_location__name` STRING(16777216),
  `origin_location__province_code` STRING(16777216),
  `origin_location__zip` STRING(16777216),
  `price` STRING(16777216),
  `price_set__presentment_money__amount` STRING(16777216),
  `price_set__presentment_money__currency_code` STRING(16777216),
  `price_set__shop_money__amount` STRING(16777216),
  `price_set__shop_money__currency_code` STRING(16777216),
  `product_exists` STRING(16777216),
  `product_id` STRING(16777216),
  `properties` STRING(16777216),
  `quantity` STRING(16777216),
  `requires_shipping` STRING(16777216),
  `sku` STRING(16777216),
  `taxable` STRING(16777216),
  `title` STRING(16777216),
  `total_discount` STRING(16777216),
  `total_discount_set__presentment_money__amount` STRING(16777216),
  `total_discount_set__presentment_money__currency_code` STRING(16777216),
  `total_discount_set__shop_money__amount` STRING(16777216),
  `total_discount_set__shop_money__currency_code` STRING(16777216),
  `variant_id` STRING(16777216),
  `variant_inventory_management` STRING(16777216),
  `variant_title` STRING(16777216),
  `vendor` STRING(16777216),
  `destination_location__city` STRING(16777216),
  `destination_location__province_code` STRING(16777216),
  `destination_location__zip` STRING(16777216),
  `destination_location__id` STRING(16777216),
  `destination_location__name` STRING(16777216),
  `destination_location__address1` STRING(16777216),
  `destination_location__address2` STRING(16777216),
  `destination_location__country_code` STRING(16777216)
);

CREATE TABLE `order_discount_applications` (
  `row_nr` STRING(16777216),
  `order_id` STRING(16777216),
  `value_type` STRING(16777216),
  `target_type` STRING(16777216),
  `code` STRING(16777216),
  `extraction_time` STRING(16777216),
  `target_selection` STRING(16777216),
  `type` STRING(16777216),
  `value` STRING(16777216),
  `allocation_method` STRING(16777216)
);

CREATE TABLE `order_discount_codes` (
  `amount` STRING(16777216),
  `row_nr` STRING(16777216),
  `type` STRING(16777216),
  `order_id` STRING(16777216),
  `code` STRING(16777216),
  `extraction_time` STRING(16777216)
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
  `id` STRING(16777216),
  `order_id` STRING(16777216),
  `created_at` STRING(16777216),
  `shipment_status` STRING(16777216),
  `updated_at` STRING(16777216),
  `tracking_numbers` STRING(16777216),
  `status` STRING(16777216),
  `admin_graphql_api_id` STRING(16777216)
);
CREATE OR REPLACE TABLE "line_item_tax_lines" (
  "channel_liable" VARCHAR(16777216),
  "extraction_time" VARCHAR(16777216),
  "line_item_id" VARCHAR(16777216),
  "price" VARCHAR(16777216),
  "price_set__presentment_money__amount" VARCHAR(16777216),
  "price_set__presentment_money__currency_code" VARCHAR(16777216),
  "price_set__shop_money__amount" VARCHAR(16777216),
  "price_set__shop_money__currency_code" VARCHAR(16777216),
  "rate" VARCHAR(16777216),
	"row_nr" VARCHAR(16777216),
	"title" VARCHAR(16777216)	
);

CREATE OR REPLACE TABLE "order_tax_lines" (
  "channel_liable" VARCHAR(16777216),
  "extraction_time" VARCHAR(16777216),
  "order_id" VARCHAR(16777216),
  "price" VARCHAR(16777216),
  "price_set__presentment_money__amount" VARCHAR(16777216),
  "price_set__presentment_money__currency_code" VARCHAR(16777216),
  "price_set__shop_money__amount" VARCHAR(16777216),
  "price_set__shop_money__currency_code" VARCHAR(16777216),
  "rate" VARCHAR(16777216),
	"row_nr" VARCHAR(16777216),
	"title" VARCHAR(16777216)	
);

CREATE TABLE "order_discount_applications" (
	"row_nr" VARCHAR(16777216),
	"order_id" VARCHAR(16777216),
	"value_type" VARCHAR(16777216),
	"target_type" VARCHAR(16777216),
	"code" VARCHAR(16777216),
	"extraction_time" VARCHAR(16777216),
	"target_selection" VARCHAR(16777216),
	"type" VARCHAR(16777216),
	"value" VARCHAR(16777216),
	"allocation_method" VARCHAR(16777216)
);

CREATE TABLE "order_fulfillments" (
	"name" VARCHAR(16777216),
	"tracking_urls" VARCHAR(16777216),
	"service" VARCHAR(16777216),
	"tracking_url" VARCHAR(16777216),
	"extraction_time" VARCHAR(16777216),
	"tracking_company" VARCHAR(16777216),
	"tracking_number" VARCHAR(16777216),
	"location_id" VARCHAR(16777216),
	"id" VARCHAR(16777216),
	"order_id" VARCHAR(16777216),
	"created_at" VARCHAR(16777216),
	"shipment_status" VARCHAR(16777216),
	"updated_at" VARCHAR(16777216),
	"tracking_numbers" VARCHAR(16777216),
	"status" VARCHAR(16777216),
	"admin_graphql_api_id" VARCHAR(16777216)
);
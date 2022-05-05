CREATE OR REPLACE TABLE "fulfillment_line_item_tax_lines" (
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

CREATE OR REPLACE TABLE "fulfillment_line_item_discount_allocations" (
  "amount" VARCHAR(16777216),
	"amount_set__presentment_money__amount"	VARCHAR(16777216),
	"amount_set__presentment_money__currency_code"	VARCHAR(16777216),
	"amount_set__shop_money__amount"	VARCHAR(16777216),
	"amount_set__shop_money__currency_code"	VARCHAR(16777216),
	"discount_application_index"	VARCHAR(16777216),
	"extraction_time"	VARCHAR(16777216),
	"line_item_id"	VARCHAR(16777216),
	"row_nr"	VARCHAR(16777216),
	"title" VARCHAR(16777216)	
);

CREATE OR REPLACE TABLE "line_item_discount_allocations" (
  "amount"	VARCHAR(16777216),
	"row_nr"	VARCHAR(16777216),
	"line_item_id"	VARCHAR(16777216),
	"amount_set__shop_money__amount"	VARCHAR(16777216),
	"amount_set__presentment_money__amount"	VARCHAR(16777216),
	"amount_set__presentment_money__currency_code"	VARCHAR(16777216),
	"extraction_time"	VARCHAR(16777216),
	"amount_set__shop_money__currency_code"	VARCHAR(16777216),
	"discount_application_index"	VARCHAR(16777216)
);

CREATE TABLE "customer_addresses" (
"phone" VARCHAR(16777216),
"name" VARCHAR(16777216),
"province" VARCHAR(16777216),
"extraction_time" VARCHAR(16777216),
"company" VARCHAR(16777216),
"country_name" VARCHAR(16777216),
"province_code" VARCHAR(16777216),
"id" VARCHAR(16777216),
"zip" VARCHAR(16777216),
"customer_id" VARCHAR(16777216),
"address2" VARCHAR(16777216),
"default" VARCHAR(16777216),
"address1" VARCHAR(16777216),
"city" VARCHAR(16777216),
"last_name" VARCHAR(16777216),
"country" VARCHAR(16777216),
"country_code" VARCHAR(16777216),
"first_name" VARCHAR(16777216)
  );

CREATE TABLE "fulfillment_line_item" (
  "admin_graphql_api_id" VARCHAR(16777216),
	"duties" VARCHAR(16777216),
	"extraction_time" VARCHAR(16777216),
	"fulfillable_quantity" VARCHAR(16777216),
	"fulfillment_id" VARCHAR(16777216),
	"fulfillment_service" VARCHAR(16777216),
	"fulfillment_status" VARCHAR(16777216),
	"gift_card" VARCHAR(16777216),
	"grams" VARCHAR(16777216),
	"id" VARCHAR(16777216),
	"name" VARCHAR(16777216),
	"origin_location__address1" VARCHAR(16777216),
	"origin_location__address2" VARCHAR(16777216),
	"origin_location__city" VARCHAR(16777216),
	"origin_location__country_code" VARCHAR(16777216),
	"origin_location__id" VARCHAR(16777216),
	"origin_location__name" VARCHAR(16777216),
	"origin_location__province_code" VARCHAR(16777216),
	"origin_location__zip" VARCHAR(16777216),
	"price" VARCHAR(16777216),
	"price_set__presentment_money__amount" VARCHAR(16777216),
	"price_set__presentment_money__currency_code" VARCHAR(16777216),
	"price_set__shop_money__amount" VARCHAR(16777216),
	"price_set__shop_money__currency_code" VARCHAR(16777216),
	"product_exists" VARCHAR(16777216),
	"product_id" VARCHAR(16777216),
	"properties" VARCHAR(16777216),
	"quantity" VARCHAR(16777216),
	"requires_shipping" VARCHAR(16777216),
	"sku" VARCHAR(16777216),
	"taxable" VARCHAR(16777216),
	"title" VARCHAR(16777216),
	"total_discount" VARCHAR(16777216),
	"total_discount_set__presentment_money__amount" VARCHAR(16777216),
	"total_discount_set__presentment_money__currency_code" VARCHAR(16777216),
	"total_discount_set__shop_money__amount" VARCHAR(16777216),
	"total_discount_set__shop_money__currency_code" VARCHAR(16777216),
	"variant_id" VARCHAR(16777216),
	"variant_inventory_management" VARCHAR(16777216),
	"variant_title" VARCHAR(16777216),
	"vendor" VARCHAR(16777216),
	"destination_location__city" VARCHAR(16777216),
	"destination_location__province_code" VARCHAR(16777216),
	"destination_location__zip" VARCHAR(16777216),
	"destination_location__id" VARCHAR(16777216),
	"destination_location__name" VARCHAR(16777216),
	"destination_location__address1" VARCHAR(16777216),
	"destination_location__address2" VARCHAR(16777216),
	"destination_location__country_code" VARCHAR(16777216)
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

CREATE TABLE "order_discount_codes" (
	"amount" VARCHAR(16777216),
	"row_nr" VARCHAR(16777216),
	"type" VARCHAR(16777216),
	"order_id" VARCHAR(16777216),
	"code" VARCHAR(16777216),
	"extraction_time" VARCHAR(16777216)
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
create or replace table "configuration_json" as
  select
  "id", 
  "region", 
  "project_id", 
  "name", 
  "created", 
  "creator_token_id", 
  "creator_token_description", 
  "component_id", 
  "component_name", 
  "component_type", 
  "version", 
  "is_deleted", 
  "current_version_created", 
  "current_version_creator_token_id", 
  "current_version_creator_token_description", 
  "current_version_change_description", 
  "description", 
  "configuration", 
  "rows",
  configs.seq as config_seq,
  configs.key as config_key,
  configs.path as config_path,  
  configs.index as config_index,
  configs.value as config_value,
  configs.this as config_this
  from 
    "configurations" c, 
    lateral flatten(
      parse_json(c."configuration"),
      recursive => true,
      outer => true
    ) configs;

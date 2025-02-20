create or replace table "rows_json" as 
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
  "rows".seq as config_seq,
  "rows".key as config_key,
  "rows".path as config_path,  
  "rows".index as config_index,
  "rows".value as config_value,
  "rows".this as config_this
  from 
    "configurations" c, 
    lateral flatten(
      parse_json(c."rows"),
      recursive => true,
      outer => true
    ) "rows";

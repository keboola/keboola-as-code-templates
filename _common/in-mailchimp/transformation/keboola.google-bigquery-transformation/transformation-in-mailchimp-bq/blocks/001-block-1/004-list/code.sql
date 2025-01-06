--create output table of lists
CREATE TABLE `lists_out`
(
    list_id STRING NOT NULL,
    list_name STRING,
    list_contact_company STRING,
    list_contact_country STRING,
    list_rating FLOAT64
);

INSERT INTO `lists_out`
SELECT id              						AS list_id,
       name            						AS list_name,
       contact_company 						AS list_contact_company,
       contact_country 						AS list_contact_country,
       CAST(list_rating AS FLOAT64)    		AS list_rating
FROM `lists`;

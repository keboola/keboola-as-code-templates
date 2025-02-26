CREATE OR REPLACE TABLE MAPPING_SEGMENT_RFM (
  SCORE STRING,
  SEGMENT STRING,
  SEGMENT_NR NUMERIC(38, 0)
)
INSERT INTO MAPPING_SEGMENT_RFM
VALUES
  ('555', 'Champions', 10),
  ('554', 'Champions', 10),
  ('544', 'Champions', 10),
  ('545', 'Champions', 10),
  ('454', 'Champions', 10),
  ('455', 'Champions', 10),
  ('445', 'Champions', 10),
  ('543', 'Loyal', 9),
  ('444', 'Loyal', 9),
  ('435', 'Loyal', 9),
  ('355', 'Loyal', 9),
  ('354', 'Loyal', 9),
  ('345', 'Loyal', 9),
  ('344', 'Loyal', 9),
  ('335', 'Loyal', 9),
  ('553', 'Potential Loyalist', 8),
  ('551', 'Potential Loyalist', 8),
  ('552', 'Potential Loyalist', 8),
  ('541', 'Potential Loyalist', 8),
  ('542', 'Potential Loyalist', 8),
  ('533', 'Potential Loyalist', 8),
  ('532', 'Potential Loyalist', 8),
  ('531', 'Potential Loyalist', 8),
  ('452', 'Potential Loyalist', 8),
  ('451', 'Potential Loyalist', 8),
  ('442', 'Potential Loyalist', 8),
  ('441', 'Potential Loyalist', 8),
  ('431', 'Potential Loyalist', 8),
  ('453', 'Potential Loyalist', 8),
  ('433', 'Potential Loyalist', 8),
  ('432', 'Potential Loyalist', 8),
  ('423', 'Potential Loyalist', 8),
  ('353', 'Potential Loyalist', 8),
  ('352', 'Potential Loyalist', 8),
  ('351', 'Potential Loyalist', 8),
  ('342', 'Potential Loyalist', 8),
  ('341', 'Potential Loyalist', 8),
  ('333', 'Potential Loyalist', 8),
  ('323', 'Potential Loyalist', 8),
  ('512', 'New Customers', 7),
  ('511', 'New Customers', 7),
  ('422', 'New Customers', 7),
  ('421', 'New Customers', 7),
  ('412', 'New Customers', 7),
  ('411', 'New Customers', 7),
  ('311', 'New Customers', 7),
  ('525', 'Promising', 6),
  ('524', 'Promising', 6),
  ('523', 'Promising', 6),
  ('522', 'Promising', 6),
  ('521', 'Promising', 6),
  ('515', 'Promising', 6),
  ('514', 'Promising', 6),
  ('513', 'Promising', 6),
  ('425', 'Promising', 6),
  ('424', 'Promising', 6),
  ('413', 'Promising', 6),
  ('414', 'Promising', 6),
  ('415', 'Promising', 6),
  ('315', 'Promising', 6),
  ('314', 'Promising', 6),
  ('313', 'Promising', 6),
  ('535', 'Need Attention', 5),
  ('534', 'Need Attention', 5),
  ('443', 'Need Attention', 5),
  ('434', 'Need Attention', 5),
  ('343', 'Need Attention', 5),
  ('334', 'Need Attention', 5),
  ('325', 'Need Attention', 5),
  ('324', 'Need Attention', 5),
  ('331', 'About To Sleep', 4),
  ('321', 'About To Sleep', 4),
  ('312', 'About To Sleep', 4),
  ('221', 'About To Sleep', 4),
  ('213', 'About To Sleep', 4),
  ('231', 'About To Sleep', 4),
  ('241', 'About To Sleep', 4),
  ('251', 'About To Sleep', 4),
  ('255', 'At Risk', 3),
  ('254', 'At Risk', 3),
  ('245', 'At Risk', 3),
  ('244', 'At Risk', 3),
  ('253', 'At Risk', 3),
  ('252', 'At Risk', 3),
  ('243', 'At Risk', 3),
  ('242', 'At Risk', 3),
  ('235', 'At Risk', 3),
  ('234', 'At Risk', 3),
  ('225', 'At Risk', 3),
  ('224', 'At Risk', 3),
  ('153', 'At Risk', 3),
  ('152', 'At Risk', 3),
  ('145', 'At Risk', 3),
  ('143', 'At Risk', 3),
  ('142', 'At Risk', 3),
  ('135', 'At Risk', 3),
  ('134', 'At Risk', 3),
  ('133', 'At Risk', 3),
  ('125', 'At Risk', 3),
  ('124', 'At Risk', 3),
  ('155', 'Cannot Lose Them', 2),
  ('154', 'Cannot Lose Them', 2),
  ('144', 'Cannot Lose Them', 2),
  ('214', 'Cannot Lose Them', 2),
  ('215', 'Cannot Lose Them', 2),
  ('115', 'Cannot Lose Them', 2),
  ('114', 'Cannot Lose Them', 2),
  ('113', 'Cannot Lose Them', 2),
  ('332', 'Hibernating customers', 1),
  ('322', 'Hibernating customers', 1),
  ('231', 'Hibernating customers', 1),
  ('241', 'Hibernating customers', 1),
  ('251', 'Hibernating customers', 1),
  ('233', 'Hibernating customers', 1),
  ('232', 'Hibernating customers', 1),
  ('223', 'Hibernating customers', 1),
  ('222', 'Hibernating customers', 1),
  ('132', 'Hibernating customers', 1),
  ('123', 'Hibernating customers', 1),
  ('122', 'Hibernating customers', 1),
  ('212', 'Hibernating customers', 1),
  ('211', 'Hibernating customers', 1),
  ('111', 'Hibernating customers', 1),
  ('112', 'Hibernating customers', 1),
  ('121', 'Hibernating customers', 1),
  ('131', 'Hibernating customers', 1),
  ('141', 'Hibernating customers', 1),
  ('151', 'Hibernating customers', 1)
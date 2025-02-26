/* SEGMENT MAPPING */
CREATE OR REPLACE TABLE MAPPING_SEGMENT_RFM (
  SCORE STRING,
  SEGMENT STRING,
  SEGMENT_NR NUMERIC(38, 0)
);

INSERT INTO MAPPING_SEGMENT_RFM
VALUES
  ('555', 'Loyal', 10),
  ('554', 'Loyal', 10),
  ('544', 'Loyal', 10),
  ('545', 'Loyal', 10),
  ('454', 'Loyal', 10),
  ('455', 'Loyal', 10),
  ('445', 'Loyal', 10),
  ('543', 'Potential Loyalist', 9),
  ('444', 'Potential Loyalist', 9),
  ('435', 'Potential Loyalist', 9),
  ('355', 'Potential Loyalist', 9),
  ('354', 'Potential Loyalist', 9),
  ('345', 'Potential Loyalist', 9),
  ('344', 'Potential Loyalist', 9),
  ('335', 'Potential Loyalist', 9),
  ('553', 'Promising', 8),
  ('551', 'Promising', 8),
  ('552', 'Promising', 8),
  ('541', 'Promising', 8),
  ('542', 'Promising', 8),
  ('533', 'Promising', 8),
  ('532', 'Promising', 8),
  ('531', 'Promising', 8),
  ('452', 'Promising', 8),
  ('451', 'Promising', 8),
  ('442', 'Promising', 8),
  ('441', 'Promising', 8),
  ('431', 'Promising', 8),
  ('453', 'Promising', 8),
  ('433', 'Promising', 8),
  ('432', 'Promising', 8),
  ('423', 'Promising', 8),
  ('353', 'Promising', 8),
  ('352', 'Promising', 8),
  ('342', 'Promising', 8),
  ('341', 'Promising', 8),
  ('333', 'Promising', 8),
  ('323', 'Promising', 8),
  ('512', 'New Customers', 7),
  ('511', 'New Customers', 7),
  ('422', 'New Customers', 7),
  ('421', 'New Customers', 7),
  ('412', 'New Customers', 7),
  ('411', 'New Customers', 7),
  ('311', 'New Customers', 7),
  ('525', 'All good', 6),
  ('524', 'All good', 6),
  ('523', 'All good', 6),
  ('522', 'All good', 6),
  ('521', 'All good', 6),
  ('515', 'All good', 6),
  ('514', 'All good', 6),
  ('513', 'All good', 6),
  ('425', 'All good', 6),
  ('424', 'All good', 6),
  ('413', 'All good', 6),
  ('414', 'All good', 6),
  ('415', 'All good', 6),
  ('315', 'All good', 6),
  ('314', 'All good', 6),
  ('313', 'All good', 6),
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
  ('151', 'Hibernating customers', 1);
-- RESTART SERIAL FIELDS FOR TESTING

ALTER SEQUENCE "user _sid_seq" RESTART;

ALTER SEQUENCE "Builder_bid_seq" RESTART;

ALTER SEQUENCE "Neighborhood_nid_seq" RESTART;

ALTER SEQUENCE "House_hid_seq" RESTART;

-- DELETE RECORDS FOR TESTING
TRUNCATE  "SubContractor","Builder","Neighborhood","HireInfo", "House" CASCADE;

-- Inserting Dummy Values into tables
INSERT
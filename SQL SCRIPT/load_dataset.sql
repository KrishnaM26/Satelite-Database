USE DB_TERM_PROJECT;

-- Load Data 

LOAD DATA INFILE '/Users/krishnamehta/Desktop/Database final project/DATASET/CSV/organization.csv' INTO TABLE company
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

LOAD DATA INFILE '/Users/krishnamehta/Desktop/Database final project/DATASET/CSV/country.csv' INTO TABLE country
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

LOAD DATA INFILE '/Users/krishnamehta/Desktop/Database final project/DATASET/CSV/launch_site.csv' INTO TABLE launch_site
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

LOAD DATA INFILE '/Users/krishnamehta/Desktop/Database final project/DATASET/CSV/launch.csv' INTO TABLE launch
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

LOAD DATA INFILE '/Users/krishnamehta/Desktop/Database final project/DATASET/CSV/located_in.csv' INTO TABLE located_in
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

LOAD DATA INFILE '/Users/krishnamehta/Desktop/Database final project/DATASET/CSV/satellite.csv' INTO TABLE satellite
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

LOAD DATA INFILE '/Users/krishnamehta/Desktop/Database final project/DATASET/CSV/operates.csv' INTO TABLE opterates
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

LOAD DATA INFILE '/Users/krishnamehta/Desktop/Database final project/DATASET/CSV/satellite_purpose.csv' INTO TABLE satellite_purpose
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

LOAD DATA INFILE '/Users/krishnamehta/Desktop/Database final project/DATASET/CSV/users.csv' INTO TABLE users
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

LOAD DATA INFILE '/Users/krishnamehta/Desktop/Database final project/DATASET/CSV/satellite_has.csv' INTO TABLE satellite_has
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;



USE DB_TERM_PROJECT;

-- Loads 945/964 (possibly duplicates)*
LOAD DATA LOCAL INFILE '/Users/krishnamehta/Desktop/Database final project/DATASET/CSV/organization.csv' INTO TABLE company
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

-- Loads 83/83
LOAD DATA LOCAL INFILE '/Users/krishnamehta/Desktop/Database final project/DATASET/CSV/country.csv' INTO TABLE country
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

-- Loads 34/39 *
LOAD DATA LOCAL INFILE '/Users/krishnamehta/Desktop/Database final project/DATASET/CSV/launch_site.csv' INTO TABLE launch_site
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

-- Loads 1187/1217 *
LOAD DATA LOCAL INFILE '/Users/krishnamehta/Desktop/Database final project/DATASET/CSV/located_in.csv' INTO TABLE located_in
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

-- Loads 5275/6276
LOAD DATA LOCAL INFILE '/Users/krishnamehta/Desktop/Database final project/DATASET/CSV/launch.csv' INTO TABLE launch
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

-- Loads 8396/8421 *
LOAD DATA LOCAL INFILE '/Users/krishnamehta/Desktop/Database final project/DATASET/CSV/operates.csv' INTO TABLE operates
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

-- Loads 20/20
LOAD DATA LOCAL INFILE '/Users/krishnamehta/Desktop/Database final project/DATASET/CSV/satellite_purpose.csv' INTO TABLE satellite_purpose
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

-- Loads 6/6; has extra 0 value in primary key
LOAD DATA LOCAL INFILE '/Users/krishnamehta/Desktop/Database final project/DATASET/CSV/users.csv' INTO TABLE users
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

-- Loads 6072/6072
LOAD DATA LOCAL INFILE '/Users/krishnamehta/Desktop/Database final project/DATASET/CSV/satellite_has.csv' INTO TABLE satellite_has
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

-- Loads 5466/5466
LOAD DATA LOCAL INFILE '/Users/krishnamehta/Desktop/Database final project/DATASET/CSV/satellite.csv' INTO TABLE satellite
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

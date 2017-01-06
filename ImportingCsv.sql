-- Import csv data table to a a given table
-- CREATED BY ALEXANDRE BILLARD
-- CSV data taken from http://www.hockeyabstract.com/testimonials
-- Written with PostgreSQL

-- Update table pointer and csv for each
COPY hockey.players2014_2015_main
FROM
'/Users/alexandrebillard/Documents/Fantasy_Hockey/FantasyHockey2016_2017/2014-2015_data/NHL 2014-15_MAIN.csv' DELIMITER ',' CSV HEADER;

-- Exporting SQL data table to a csv
-- CREATED BY ALEXANDRE BILLARD
-- Written with PostgreSQL

COPY hockey.final_calculations_forwards
TO
'/Users/alexandrebillard/Documents/Fantasy_Hockey/FantasyHockey2016_2017/Results/final_calculations_forwards.csv' DELIMITER ',' CSV HEADER;

COPY hockey.final_calculations_defensemen
TO
'/Users/alexandrebillard/Documents/Fantasy_Hockey/FantasyHockey2016_2017/Results/final_calculations_defensemen.csv' DELIMITER ',' CSV HEADER;

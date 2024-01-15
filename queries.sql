 
-- 1. the total number of rows in the database
SELECT COUNT(*) FROM subway_delays;

 count 
-------
 29737
(1 row)

-- 2. show the first 15 rows, but only display 3 columns (your choice)
SELECT delay_line,subcategory,delays FROM subway_delays ORDER BY id LIMIT 15;
 delay_line |              subcategory               | delays 
------------+----------------------------------------+--------
 1          | Crew Availability                      |    193
 1          | External Agency or Utility             |    111
 1          | Braking                                |     15
 1          | Door-Related                           |     10
 1          | Fire, Smoke, Debris                    |     16
 1          | Other - CE                             |     38
 1          | Other Infrastructure                   |     49
 1          | Other Internal Disruptions             |      1
 1          | Other - Sig                            |     55
 1          | Propulsion                             |     29
 1          | Rail and Roadbed                       |     78
 1          | Service Delivery                       |     29
 1          | Train Brake Activation - Cause Unknown |     22
 1          | not specified                          |    260
 1          | Capital Work - Other Planned ROW       |     12
(15 rows)
-- 3. do the same as above, but chose a column to sort on, and sort in descending order
SELECT * FROM subway_delays ORDER BY id DESC LIMIT 15
homework06-# ;
  id   | delay_month | subdivision | delay_line | day_type |     reporting_category     |              subcategory               | delays 
-------+-------------+-------------+------------+----------+----------------------------+----------------------------------------+--------
 29737 | 2020-01-01  | Systemwide  | Systemwide |        2 | Police & Medical           | Systemwide                             |   1389
 29736 | 2020-01-01  | Systemwide  | Systemwide |        2 | Planned ROW Work           | Systemwide                             |   1938
 29735 | 2020-01-01  | Systemwide  | Systemwide |        2 | Operating Conditions       | Systemwide                             |   1557
 29734 | 2020-01-01  | Systemwide  | Systemwide |        2 | Infrastructure & Equipment | Systemwide                             |   1480
 29733 | 2020-01-01  | Systemwide  | Systemwide |        2 | External Factors           | Systemwide                             |    348
 29732 | 2020-01-01  | Systemwide  | Systemwide |        2 | Crew Availability          | Systemwide                             |    141
 29731 | 2020-01-01  | Systemwide  | Systemwide |        1 | Police & Medical           | Systemwide                             |   6132
 29730 | 2020-01-01  | Systemwide  | Systemwide |        1 | Planned ROW Work           | Systemwide                             |   6078
 29729 | 2020-01-01  | Systemwide  | Systemwide |        1 | Operating Conditions       | Systemwide                             |   8082
 29728 | 2020-01-01  | Systemwide  | Systemwide |        1 | Infrastructure & Equipment | Systemwide                             |   7820
 29727 | 2020-01-01  | Systemwide  | Systemwide |        1 | External Factors           | Systemwide                             |   1444
 29726 | 2020-01-01  | Systemwide  | Systemwide |        1 | Crew Availability          | Systemwide                             |    770
 29725 | 2020-01-01  | B DIVISION  | S Rock     |        2 | Police & Medical           | Sick/Injured Customer                  |      1
 29724 | 2020-01-01  | B DIVISION  | S Rock     |        2 | Police & Medical           | Public Conduct, Crime, Police Response |     15
 29723 | 2020-01-01  | B DIVISION  | S Rock     |        2 | Planned ROW Work           | Subways Maintenance                    |      2
-- 4. add a new column without a default value
ALTER TABLE subway_delays
ADD COLUMN location TEXT;
--first couple of rows:
id | delay_month | subdivision | delay_line | day_type |     reporting_category     |        subcategory         | delays | location 
----+-------------+-------------+------------+----------+----------------------------+----------------------------+--------+----------
  1 | 2023-08-01  | A DIVISION  | 1          |        1 | Crew Availability          | Crew Availability          |    193 | 
  2 | 2023-08-01  | A DIVISION  | 1          |        1 | External Factors           | External Agency or Utility |    111 | 
  3 | 2023-08-01  | A DIVISION  | 1          |        1 | Infrastructure & Equipment | Braking                    |     15 | 
  4 | 2023-08-01  | A DIVISION  | 1          |        1 | Infrastructure & Equipment | Door-Related               |     10 | 
  5 | 2023-08-01  | A DIVISION  | 1          |        1 | Infrastructure & Equipment | Fire, Smoke, Debris        |     16 | 

-- 5. set the value of that new column
ALTER TABLE subway_delays DROP COLUMN location
ALTER TABLE subway_delays ADD COLUMN location TEXT DEFAULT 'NYC';
SELECT * FROM subway_delays ORDER BY id LIMIT 10;
 id | delay_month | subdivision | delay_line | day_type |     reporting_category     |        subcategory         | delays | location 
----+-------------+-------------+------------+----------+----------------------------+----------------------------+--------+----------
  1 | 2023-08-01  | A DIVISION  | 1          |        1 | Crew Availability          | Crew Availability          |    193 | NYC
  2 | 2023-08-01  | A DIVISION  | 1          |        1 | External Factors           | External Agency or Utility |    111 | NYC
  3 | 2023-08-01  | A DIVISION  | 1          |        1 | Infrastructure & Equipment | Braking                    |     15 | NYC
  4 | 2023-08-01  | A DIVISION  | 1          |        1 | Infrastructure & Equipment | Door-Related               |     10 | NYC
  5 | 2023-08-01  | A DIVISION  | 1          |        1 | Infrastructure & Equipment | Fire, Smoke, Debris        |     16 | NYC
  6 | 2023-08-01  | A DIVISION  | 1          |        1 | Infrastructure & Equipment | Other - CE                 |     38 | NYC
  7 | 2023-08-01  | A DIVISION  | 1          |        1 | Infrastructure & Equipment | Other Infrastructure       |     49 | NYC
  8 | 2023-08-01  | A DIVISION  | 1          |        1 | Infrastructure & Equipment | Other Internal Disruptions |      1 | NYC
  9 | 2023-08-01  | A DIVISION  | 1          |        1 | Infrastructure & Equipment | Other - Sig                |     55 | NYC
 10 | 2023-08-01  | A DIVISION  | 1          |        1 | Infrastructure & Equipment | Propulsion                 |     29 | NYC
(10 rows)
-- 6. show only the unique (non duplicates) of a column of your choice
# SELECT DISTINCT subcategory FROM subway_delays;
              subcategory               
----------------------------------------
 Systemwide
 Signal Modernization Capital Project
 External Debris on Roadbed
 Other Infrastructure
 Subways Maintenance
 Service Delivery
 External Agency or Utility
 Insufficient Supplement Schedule
 Rail and Roadbed
 Other - CE
 Other Planned ROW Work
 Persons on Roadbed
 Sick/Injured Customer
 Train Brake Activation - Cause Unknown
 Door-Related
 Work Equipment
 Crew Availability
 Other - Sig
 Fire, Smoke, Debris
 Public Conduct, Crime, Police Response
 Other Internal Disruptions
 Braking
 not specified
 Propulsion
 Inclement Weather
 Capital Work - Other Planned ROW
(26 rows)
-- 7.group rows together by a column value (your choice) and use an aggregate function to calculate something about that group 
SELECT delay_line, SUM(delays) FROM subway_delays GROUP BY delay_line;
 delay_line |   sum   
------------+---------
 B          |   41686
 Systemwide | 1445936
 7          |   62044
 D          |   77270
 N          |  120776
 5          |   55435
 S 42nd     |    3141
 G          |   42465
 Q          |   82768
 6          |   97136
 3          |   50564
 2          |   93116
 R          |   60960
 E          |   95022
 S Rock     |    6977
 A          |  119474
 S Fkln     |    2092
 C          |   56618
 M          |   42919
 1          |   69211
 L          |   46813
 JZ         |   39632
 F          |  102524
 4          |   77293
-- 8. now, using the same grouping query or creating another one, find a way to filter the query results based on the values for the groups
SELECT delay_line, SUM(delays) FROM subway_delays WHERE delays>500 GROUP BY delay_line;
 delay_line |   sum   
------------+---------
 B          |    4508
 Systemwide | 1427919
 7          |    5788
 D          |    7722
 N          |   14750
 G          |    2464
 3          |    1292
 Q          |    7975
 6          |   20018
 2          |    3250
 R          |    1659
 E          |   16840
 A          |   16471
 C          |    3830
 1          |    4264
 M          |    1073
 L          |    1234
 JZ         |     902
 F          |   18208
 4          |    1726
(20 rows)


-- 9. write a comment about your query 9
SELECT MAX(delays) AS max_delay FROM subway_delays;
--finding the maximum value in the delays column
-- 10. write a comment about your query 10
SELECT * FROM subway_delays WHERE delays>10000
--finding months where there were over 10,000 delays for a given reason
-- 11. write a comment about your query 11
SELECT * FROM subway_delays WHERE delay_line = 'D' LIMIT 10;
--finding the first 10 entries for the D line which is my home line
-- 12. write a comment about your query 12
SELECT * FROM subway_delays ORDER BY delay_month LIMIT 15;
--ordering the table by month
--i only printed out the first 15 as to not print out over 26k lines but it would reorder
-- the table which was ordered by line to be ordered by month

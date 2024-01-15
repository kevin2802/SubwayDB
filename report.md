# Overview
1. Name / Title: MTA_Subway_Trains_Delayed_Beginning_2020(renamed to Trains.csv and then cleaned up version named newTrains.csv)
2. Link to Data: https://data.ny.gov/Transportation/MTA-Subway-Trains-Delayed-Beginning-2020/wx2t-qtaz
3. Source / Origin: 
	* Author or Creator: MTA (Metropolitan Transit Authority)
	* Publication Date: September 13 2023
	* Publisher: NY Open Data
	* Version or Data Accessed: Sun Oct 1
4. License: 	"The license for this dataset is unspecified" --> but from NYS Open Data Terms of Use "The State grants you a non-exclusive, revocable license to use the Content contained on this website in a manner consistent with the Terms of Use"  


### Fields or Column Headers

* Field/Column 1: month - string
* Field/Column 2: subway division string
* Field/Column 3: subway line - string
* Field/Column 4: day type (week or weekend) int
* Field/Column 5: reporting category - string
* Field/Column 6: subcategory - string
* Field/Column 7: delays - int


# Table Design
Table Name: subway_delays
1. id Serial Numeric type, Primary Key
2. delay_month Date Type
3. subdivision Text Type
4. delay_line Text type
5. day_type Integer type
6. reporting_category Text Type
7. subcategory Text Type
8. delays Integer Type

all should be set to NOT NULL since I handled all instances of missing data in [convert.py]




# Database Information
subwayDB=# \l
                          List of databases
    Name    | Owner | Encoding | Collate | Ctype | Access privileges 
------------+-------+----------+---------+-------+-------------------
 homework06 | kevin | UTF8     | C       | C     | 
 postgres   | kevin | UTF8     | C       | C     | 
 template0  | kevin | UTF8     | C       | C     | =c/kevin         +
            |       |          |         |       | kevin=CTc/kevin
 template1  | kevin | UTF8     | C       | C     | =c/kevin         +
            |       |          |         |       | kevin=CTc/kevin
(4 rows)




subwayDB=# \d subway_delays
                                  Table "public.subway_delays"
       Column       |  Type   | Collation | Nullable |                  Default                  
--------------------+---------+-----------+----------+-------------------------------------------
 id                 | integer |           | not null | nextval('subway_delays_id_seq'::regclass)
 delay_month        | date    |           | not null | 
 subdivision        | text    |           | not null | 
 delay_line         | text    |           | not null | 
 day_type           | integer |           | not null | 
 reporting_category | text    |           | not null | 
 subcategory        | text    |           | not null | 
 delays             | integer |           | not null | 
Indexes:
    "subway_delays_pkey" PRIMARY KEY, btree (id)


# Query Results
SELECT MAX(delays) AS max_delay FROM subway_delays;
 max_delay 
-----------
     13493
(1 row)


SELECT * FROM subway_delays WHERE delays>10000
  id   | delay_month | subdivision | delay_line | day_type |     reporting_category     | subcategory | delays | location 
-------+-------------+-------------+------------+----------+----------------------------+-------------+--------+----------
  7025 | 2022-11-01  | Systemwide  | Systemwide |        1 | Infrastructure & Equipment | Systemwide  |  10813 | NYC
  9945 | 2022-07-01  | Systemwide  | Systemwide |        1 | Infrastructure & Equipment | Systemwide  |  10507 | NYC
 14796 | 2021-12-01  | Systemwide  | Systemwide |        1 | Crew Availability          | Systemwide  |  13282 | NYC
 16155 | 2021-10-01  | Systemwide  | Systemwide |        1 | Crew Availability          | Systemwide  |  10623 | NYC
 16821 | 2021-09-01  | Systemwide  | Systemwide |        1 | Crew Availability          | Systemwide  |  11398 | NYC
 17489 | 2021-08-01  | Systemwide  | Systemwide |        1 | Crew Availability          | Systemwide  |  13493 | NYC
 18172 | 2021-07-01  | Systemwide  | Systemwide |        1 | Crew Availability          | Systemwide  |  10233 | NYC
 18834 | 2021-06-01  | Systemwide  | Systemwide |        1 | Infrastructure & Equipment | Systemwide  |  10614 | NYC
(8 rows)



SELECT * FROM subway_delays WHERE delay_line = 'D' LIMIT 10;
 id  | delay_month | subdivision | delay_line | day_type |     reporting_category     |        subcategory         | delays | location 
-----+-------------+-------------+------------+----------+----------------------------+----------------------------+--------+----------
 312 | 2023-08-01  | B DIVISION  | D          |        1 | Crew Availability          | Crew Availability          |    359 | NYC
 313 | 2023-08-01  | B DIVISION  | D          |        1 | External Factors           | Inclement Weather          |      6 | NYC
 314 | 2023-08-01  | B DIVISION  | D          |        1 | Infrastructure & Equipment | Braking                    |     18 | NYC
 315 | 2023-08-01  | B DIVISION  | D          |        1 | Infrastructure & Equipment | Door-Related               |      2 | NYC
 316 | 2023-08-01  | B DIVISION  | D          |        1 | Infrastructure & Equipment | Fire, Smoke, Debris        |     15 | NYC
 317 | 2023-08-01  | B DIVISION  | D          |        1 | Infrastructure & Equipment | Other - CE                 |     13 | NYC
 318 | 2023-08-01  | B DIVISION  | D          |        1 | Infrastructure & Equipment | Other Infrastructure       |      4 | NYC
 319 | 2023-08-01  | B DIVISION  | D          |        1 | Infrastructure & Equipment | Other Internal Disruptions |     12 | NYC
 320 | 2023-08-01  | B DIVISION  | D          |        1 | Infrastructure & Equipment | Other - Sig                |     80 | NYC
 321 | 2023-08-01  | B DIVISION  | D          |        1 | Infrastructure & Equipment | Propulsion                 |      8 | NYC
(10 rows)

SELECT * FROM subway_delays ORDER BY delay_month, LIMIT 15;
  id   | delay_month | subdivision | delay_line | day_type |     reporting_category     |           subcategory            | delays | location 
-------+-------------+-------------+------------+----------+----------------------------+----------------------------------+--------+----------
 29046 | 2020-01-01  | A DIVISION  | 1          |        1 | Infrastructure & Equipment | Other - CE                       |     20 | NYC
 29053 | 2020-01-01  | A DIVISION  | 1          |        1 | Operating Conditions       | not specified                    |    332 | NYC
 29042 | 2020-01-01  | A DIVISION  | 1          |        1 | External Factors           | External Debris on Roadbed       |      8 | NYC
 29045 | 2020-01-01  | A DIVISION  | 1          |        1 | Infrastructure & Equipment | Fire, Smoke, Debris              |     27 | NYC
 29049 | 2020-01-01  | A DIVISION  | 1          |        1 | Infrastructure & Equipment | Other - Sig                      |    124 | NYC
 29052 | 2020-01-01  | A DIVISION  | 1          |        1 | Infrastructure & Equipment | Service Delivery                 |     66 | NYC
 29040 | 2020-01-01  | A DIVISION  | 1          |        1 | Crew Availability          | Crew Availability                |     17 | NYC
 29041 | 2020-01-01  | A DIVISION  | 1          |        1 | External Factors           | External Agency or Utility       |    306 | NYC
 29043 | 2020-01-01  | A DIVISION  | 1          |        1 | Infrastructure & Equipment | Braking                          |      2 | NYC
 29044 | 2020-01-01  | A DIVISION  | 1          |        1 | Infrastructure & Equipment | Door-Related                     |     76 | NYC
 29047 | 2020-01-01  | A DIVISION  | 1          |        1 | Infrastructure & Equipment | Other Infrastructure             |      2 | NYC
 29048 | 2020-01-01  | A DIVISION  | 1          |        1 | Infrastructure & Equipment | Other Internal Disruptions       |      1 | NYC
 29050 | 2020-01-01  | A DIVISION  | 1          |        1 | Infrastructure & Equipment | Propulsion                       |     12 | NYC
 29051 | 2020-01-01  | A DIVISION  | 1          |        1 | Infrastructure & Equipment | Rail and Roadbed                 |     69 | NYC
 29054 | 2020-01-01  | A DIVISION  | 1          |        1 | Planned ROW Work           | Capital Work - Other Planned ROW |      1 | NYC
(15 rows)
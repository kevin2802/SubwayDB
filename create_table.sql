
DROP TABLE IF EXISTS subway_delays;

CREATE TABLE subway_delays(
    id SERIAL PRIMARY KEY,
    delay_month DATE NOT NULL,
    subdivision TEXT NOT NULL,
    delay_line TEXT NOT NULL,
    day_type INTEGER NOT NULL,
    reporting_category TEXT NOT NULL,
    subcategory TEXT NOT NULL,
    delays INTEGER NOT NULL

);

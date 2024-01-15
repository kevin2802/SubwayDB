--importing csv
COPY subway_delays(delay_month,subdivision,delay_line,day_type,reporting_category,subcategory,delays)
    FROM 'Trains.csv'
    csv HEADER;
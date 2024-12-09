SELECT *
FROM bike_share_yr_0

SELECT *
FROM cost_table
  -- Explore data
  -- Change seasons, months, weekdays from numbers to text. weekday to be changed from 1-7 instead of 0-6
  --Use Union to only pull through no duplicates to connect both years then use a join to pull through the prices of the cost table.

WITH bike_share_all AS
(
  SELECT *
FROM bike_share_yr_0
UNION
  SELECT *
FROM bike_share_yr_1)


--Use left join to get cost table records based on bike_share_all

SELECT dteday,season,bike_share_all.yr,mnth,hr,weekday,rider_type,riders,price,COGS, riders*price as revenue, riders*price- COGS as profit
FROM bike_share_all
LEFT JOIN cost_table 
ON bike_share_all.yr = cost_table.yr

--Connect PowerBI to SQL database and start building dashboard

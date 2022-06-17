use [Portfolio Project ];

/* Develop SQL query to create a unique table that could be brought into Power BI */

--- Q1 : Is the hotel revenue growing by year?

with hotel_revenue as 
	(select * from dbo.['2018$']
	union
	select * from dbo.['2019$']
	union
	select * from dbo.['2020$'])

select hotel,
arrival_date_year,
round(sum((stays_in_week_nights + stays_in_weekend_nights) * adr),2) as revenue
from hotel_revenue

group by hotel, arrival_date_year
order by hotel



--- Adding another two table using JOIN



with hotel_revenue as 
	(select * from dbo.['2018$']
	union
	select * from dbo.['2019$']
	union
	select * from dbo.['2020$'])

select * from hotel_revenue
left join dbo.market_segment$
	on hotel_revenue.market_segment = dbo.market_segment$.market_segment

left join dbo. meal_cost$
	on hotel_revenue.meal = dbo.meal_cost$.meal

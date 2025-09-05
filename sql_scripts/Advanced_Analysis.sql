-- Customer Analysis: Profitability by Segment
Select 
Segment,
concat('₹', format(sum(Sales),0)) as Total_Sales,
concat('₹', format(sum(Profit),0)) as Total_Profit,
concat(format((sum(Profit) / sum(Sales))*100,2),'%') as	Overall_Profit_Margin
from 
	superstore
Group by 
	Segment
Order by
	Sum(Profit) desc;
    
-- Regional Analysis: Profitability by Region
Select 
region,
concat('₹', format(sum(Sales),0)) as Total_Sales,
concat('₹', format(sum(Profit),0)) as Total_Profit,
concat(format((sum(Profit) / sum(Sales))*100,2),'%') as	Overall_Profit_Margin
from 
	superstore
Group by 
	region
Order by
	Sum(Profit) desc;
 
 
-- State-Level Analysis: Top 10 States by Profit
Select 
State,
concat('₹', format(sum(Sales),0)) as Total_Sales,
concat('₹', format(sum(Profit),0)) as Total_Profit,
concat(format((sum(Profit) / sum(Sales))*100,2),'%') as	Overall_Profit_Margin
from 
	superstore
Group by 
	State
Order by
	(sum(Profit) / sum(Sales))*100 desc
limit 10;

-- State-Level Analysis: Bottom 10 States by Profit
Select 
State,
concat('₹', format(sum(Sales),0)) as Total_Sales,
concat('₹', format(sum(Profit),0)) as Total_Profit,
concat(format((sum(Profit) / sum(Sales))*100,2),'%') as	Overall_Profit_Margin
from 
	superstore
Group by 
	State
Order by
	(sum(Profit) / sum(Sales))*100 
limit 10;

-- Profitability by Shipping Mode
Select 
`ship Mode`,
concat('₹', format(sum(Sales),0)) as Total_Sales,
concat('₹', format(sum(Profit),0)) as Total_Profit,
concat(format((sum(Profit) / sum(Sales))*100,2),'%') as	Overall_Profit_Margin
from 
	superstore
Group by 
	`Ship Mode`
Order by
	(sum(Profit) / sum(Sales))*100 desc
limit 10;
-- Analysis of Month-over-Month (MoM) Profit Growth
WITH MonthlyProfit AS (
    SELECT
        DATE_FORMAT(`Order Date`, '%Y-%m-01') AS sales_month,
        SUM(Profit) AS total_profit
    FROM
        superstore
    GROUP BY
        sales_month
    ORDER BY
        sales_month
)
SELECT
    sales_month,
    CONCAT('₹', FORMAT(total_profit, 0)) AS monthly_profit,
    -- Use LAG() to get the previous month's profit
    CONCAT('₹', FORMAT(LAG(total_profit, 1) OVER (ORDER BY sales_month), 0)) AS previous_month_profit,
    -- Calculate the percentage change
    CONCAT(FORMAT((total_profit - LAG(total_profit, 1) OVER (ORDER BY sales_month)) / LAG(total_profit, 1) OVER (ORDER BY sales_month) * 100, 2), '%') AS mom_growth_pct
FROM
    MonthlyProfit;
    
-- Analysis of Month-over-Month (MoM) Profit Growth
with MonthlyProfit AS (
select
	date_format(`Order Date`, '%Y-%m-01') as sales_month,
	sum(Profit) AS total_profit
from
	superstore
group by 
        sales_month
order by
        sales_month
)
select
    sales_month,
    concat('₹', format(total_profit, 0)) as monthly_profit,
    concat('₹', format(lag(total_profit, 1) over (order by sales_month), 0)) as previous_month_profit,
    concat(format((total_profit - lag(total_profit, 1) over (order by sales_month)) / lag(total_profit, 1) over (order by sales_month) * 100, 2), '%') as mom_growth_pct
from
    MonthlyProfit;
    
-- Analysis of each Sub-Category's contribution to total profit

select 
`Sub-Category`,
	concat('₹',format(sum(Profit),0)) as Total_Profit,
    concat(format((sum(Profit)/(select sum(Profit) from superstore))*100,2),'%') as pct_of_total_profit
from 
	superstore
group by 
	`Sub-Category`
order by 
	sum(Profit) desc;

-- Analysis of how discount levels affect profitability

select 
Discount,
concat('₹', format(avg(Profit),2)) as Average_Profit,
count(`Order ID`) as Number_of_Orders,
concat('₹', format(sum(sales),0)) as Total_Sales,
concat(format((sum(Profit) / sum(Sales))*100,2),'%') as	Profit_Margin
from 
	superstore
group by
	Discount
order by 
	Discount Asc;

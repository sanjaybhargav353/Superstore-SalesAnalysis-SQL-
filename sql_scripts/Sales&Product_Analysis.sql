use sales_Analysis;

-- Sales Analysis
select 
concat('₹',format(sum(Sales),2)) as Total_sales,
concat('₹',format(sum(Profit),2)) as Total_Profit,
concat(format((sum(Profit) / sum(Sales))*100,2),'%') as	Overall_Profit_Margin
from superstore;

-- Product Analysis: Profitability by Category and Sub-Category

Select 
Category,
concat('₹', format(sum(Sales),0)) as Total_Sales,
concat('₹', format(sum(Profit),0)) as Total_Profit
from 
	superstore
Group by 
	category
Order by
	Sum(Profit) desc;
    
-- Sub-Category
Select 
`Sub-Category`,
concat('₹', format(sum(Sales),0)) as Total_Sales,
concat('₹', format(sum(Profit),0)) as Total_Profit
from 
	superstore
Group by 
	`Sub-Category`
Order by
	Sum(Profit) desc;
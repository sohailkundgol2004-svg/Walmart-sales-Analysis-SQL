



---- generic question--------
-- 1 How many distinct cities are present in the dataset? --
-- 2 In which city is each branch situated? --

--- 1st question --- 
select distinct(city) from walmartsales;
--- 2st question --- 
select distinct branch, city from walmartsales;

---- product analysis -----
/*How many distinct product lines are there in the dataset?
1 What is the most common payment method?
2 What is the most selling product line?
3 What is the total revenue by month?
4 Which month recorded the highest Cost of Goods Sold (COGS)?
5 Which product line generated the highest revenue?
6 Which city has the highest revenue?
7 Which product line incurred the highest VAT?
8 Retrieve each product line and add a column product_category, indicating 'Good' or 'Bad,' based on whether its sales are above the average.
9 Which branch sold more products than average product sold?
10 What is the most common product line by gender?
11 What is the average rating of each product line?*/

-- 1st solution
alter table walmartsales
rename column `Product line` to product_line;
select distinct product_line from walmartsales;

-- 2st solution
select payment, count(payment) as NumberOfPay 
from walmartsales
group by payment
order by NumberOfPay desc;

-- 3st solution
select product_line, count(product_line) as numberofproduct from walmartsales
group by product_line
order by numberofproduct desc;

-- 4st solution


SELECT date,                                                -- updating and adding the month_name for Analysis
MONTHNAME(date) AS month_name
FROM walmartsales;

ALTER TABLE walmartsales ADD COLUMN month_name VARCHAR(10);

UPDATE walmartsales
SET month_name = MONTHNAME(date);

select month_name from walmartsales;
select month_name, sum(Total) as TotalRevenue from 
walmartsales
group by month_name order by TotalRevenue desc;

-- 5st solution
skip

-- 6st solution
select distinct product_line as  products, sum(total) as highestProdt from walmartsales
group by products order by highestprodt desc;   -- sports and travel --

-- 7st solution
select city, sum(total) as TotalRevenue from walmartsales
group by city order by TotalRevenue desc; -- naypyitaw

-- 8st solution
alter table walmartsales rename column `Tax 5%` to tax;

SELECT 
    product_line, SUM(tax) AS VAT
FROM
    walmartsales
GROUP BY product_line
ORDER BY VAT DESC;   -- food and beverages 

-- 9st solution
SELECT
    product_line,
    total,
    CASE
        WHEN total > AVG(total) OVER () THEN 'Good'
        ELSE 'Bad'
    END AS product_category
FROM walmartsales;

-- 10st solution
select Branch,product_line, avg(Quantity) As Avg_Quantity_sold from walmartsales
group by Branch, product_line order by Avg_Quantity_sold desc limit 1;


-- 11st solution
select Gender, count(product_line) from walmartsales
group by Gender limit 1;

-- different solution
select Gender, product_line,count(product_line) as Products from walmartsales
group by Gender, product_line order by products and Gender desc limit 3;

-- 12st solution
select product_line, avg(Rating) as AverageRating 
from walmartsales
group by product_line order by avg(Rating);

------ Sales Analysis --------
/*
1 Number of sales made in each time of the day per weekday
2 Identify the customer type that generates the highest revenue.
3 Which city has the largest tax percent/ VAT (Value Added Tax)?
4 Which customer type pays the most VAT?*/


-- 1st solution
alter table walmartsales
rename column `Invoice ID` to invoiceID; 

SELECT
    DAYNAME(date) AS weekday,
    CASE
        WHEN time BETWEEN '00:00:00' AND '11:59:59' THEN 'Morning'
        WHEN time BETWEEN '12:00:00' AND '17:59:59' THEN 'Afternoon'
        ELSE 'Evening'
    END AS time_of_day,
    COUNT(invoiceID) AS number_of_sales
FROM walmartsales
GROUP BY weekday, time_of_day
ORDER BY weekday, time_of_day;

-- 2st solution
alter table walmartsales rename column `Customer type` to customertype;

select customertype,sum(Total) as revenue 
from walmartsales
group by customertype order by revenue desc;

-- 3st solution
select city, sum(tax) as HighestTAX from walmartsales
group by city order by HighestTAX desc;

-- 4th solution
select customertype, sum(tax) AS TAX from walmartsales
group by customertype order by TAX desc; 

-------Customer Analysis-----------

/*
1 How many unique customer types does the data have?
2 How many unique payment methods does the data have?
3 Which is the most common customer type?
4 Which customer type buys the most?
5 What is the gender of most of the customers?
6 What is the gender distribution per branch?
7 Which time of the day do customers give most ratings?
8 Which time of the day do customers give most ratings per branch?
9 Which day of the week has the best avg ratings?
10 Which day of the week has the best average ratings per branch?*/

-- 1st solution
select count(distinct customertype) AS UniqueCustomerType from walmartsales;

-- 2nd solution
select count(distinct payment) as differenttypeOfPayment from walmartsales;

-- 3rd solution
select customertype, count(customertype) as UniqueCustType from walmartsales
group by customertype order by UniqueCustType desc limit 1;

-- 4th solution
select distinct customertype, sum(Total) as revenue from walmartsales
group by customertype order by revenue desc limit 1;

-- 5th solution
select distinct Gender as Genders, count(Gender) NumberOfPeople from walmartsales
group by Genders order by NumberOfPeople desc limit 1;

-- 6th solution
select branch, Gender, COUNT(Gender) AS gender_distribution
FROM walmartsales GROUP BY branch, gender ORDER BY branch;

-- 7th solution
SELECT Time, AVG(rating) AS average_rating
FROM walmartsales GROUP BY Time ORDER BY average_rating DESC LIMIT 1;

-- 8th solution
-- 8 Which time of the day do customers give most ratings per branch? UPDATE `newschema`.`walmart`
select
  Branch,
case
    when hour(time) between 6 and 11 then 'Morning'
    when hour(time) between 12 and 17 then 'Afternoon'
	when hour(time) between 18 and 23 then 'evening'
else 'night'
end as time_of_day,
count(Rating) as number_of_rating from walmartsales
group by Branch,time_of_day
order by Branch,number_of_rating desc;
      




-- 9  Which day of the week has the best avg ratings?
select dayname(Date) as days,
avg(Total) as best_avg_of_day from walmartsales
group by days order by best_avg_of_day desc limit 1;



-- 10 Which day of the week has the best average ratings per branch?
select Branch,dayname(Date) as days,
avg(Rating) as best_avg_rating from walmartsales
group by branch,days order by best_avg_rating desc limit 1 ;
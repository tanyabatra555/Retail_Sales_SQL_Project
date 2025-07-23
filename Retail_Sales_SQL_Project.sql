-- Retail Sales SQL Project
create table Retail_Sales
	(
		transactions_id INT PRIMARY KEY,
		sale_date DATE,
		sale_time TIME,
		customer_id INT,
		gender VARCHAR(15),
		age INT,
		category VARCHAR(15),
		quantiy INT,
		price_per_unit FLOAT,
		cogs FLOAT,
		total_sale FLOAT
	);


select * from Retail_Sales;

select count(*) from Retail_Sales;


--Data Cleaning
Select * from Retail_Sales
where 
		transactions_id IS NULL
		OR
		sale_date IS NULL
		OR
		sale_time IS NULL
		OR
		customer_id IS NULL
		OR
        	gender IS NULL
		OR
		age IS NULL
		OR
		category IS NULL
		OR
		quantiy IS NULL
		OR
		price_per_unit IS NULL
		OR
		cogs IS NULL
		OR
		total_sale IS NULL;

Delete from Retail_Sales
where
		transactions_id IS NULL
		OR
		sale_date IS NULL
		OR
		sale_time IS NULL
		OR
		customer_id IS NULL
		OR
        	gender IS NULL
		OR
		age IS NULL
		OR
		category IS NULL
		OR
		quantity IS NULL
		OR
		price_per_unit IS NULL
		OR
		cogs IS NULL
		OR
		total_sale IS NULL;


-- Data Exploration
-- How many sales we have?
select count(*) as total_sales from Retail_Sales;

-- How many unique customers we have?
select count(distinct customer_id) as total_customers from Retail_Sales;

-- How many category we have?
select distinct category from Retail_Sales;


-- Data Analysis & Business Key Problems & Answers
-- Q.1 Write a SQL query to retreive all the columns for sales made on '2022-11-05'
Select * from Retail_Sales
where
	sale_date = '2022-11-05'


-- Q.2 Write a SQL good quality to retrieve all the transactions where the category is ‘Clothing’ and the quantity sold is more than 4 in the month of Nov-2022
SELECT * 
FROM Retail_Sales
WHERE category = 'Clothing'
and quantity >=4
and TO_CHAR(sale_date, 'YYYY-MM') = '2022-11';


-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category
Select sum(total_sale) as net_sales, category
from Retail_Sales
group by category;


-- Q.4 Write a SQL query to find the average age of customers who purchased item from the ‘Beauty’ category
select round(avg(age),2) from Retail_Sales
where category = 'Beauty'


-- Q.5 Write a SQL query to find all the transactions where the total_sale is greater than 1000
Select * from Retail_Sales
where total_sale >1000;


-- Q.6 Write a SQL query to find the total number of transactions (transactions_id) made by each gender in each category.
Select count(transactions_id),gender, category from Retail_Sales
group by gender, category;


-- Q.7 Write a SQL query to calculate the average sale of each month. Find out best selling month in each year.
Select 
extract (year from sale_date) as year,
extract (month from sale_date) as month,
AVG(total_sale) AS avg_sale
from Retail_Sales
group by year, month
ORDER BY year, month desc;


-- Q.8 Write a SQL query to find the top 5 customers based on highest total sales.
select customer_id, sum(total_sale) as total_sales
from Retail_Sales
group by customer_id
order by total_sales desc
limit 5;


-- Q.9 Write a SQL query to find the number of unique customers who purchase item from each category.
Select count(distinct(customer_id))as customers, category
from Retail_Sales
group by category;


-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon between 12 & 17, Evening >17)
with hourly_sales as
(
select * ,
	case
		when extract (hour from sale_time) <12 then 'Morning'
		when extract (hour from sale_time) between 12 and 17 then 'Afternoon'
		else 'Evening'
	end as shift
from Retail_Sales
)
select shift, count(*) as total_orders
from hourly_sales
group by shift
ORDER BY
  CASE shift
    WHEN 'Morning' THEN 1
    WHEN 'Afternoon' THEN 2
    WHEN 'Evening' THEN 3
  END;


-- End of project

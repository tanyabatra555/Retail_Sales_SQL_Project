# Retail_Sales_SQL_Project

## Project Overview:
This case study focuses on analyzing retail sales data using SQL. The dataset includes transaction-level sales data with customer demographics, purchase date & time, and product category details.
The goal is to clean, explore, and analyze the data to uncover valuable business insights such as sales performance, customer behavior, and category trends.


## Objectives
- **1. Set up a retail sales database:** Create and populate a retail sales database with the provided sales data.
- **2. Data Cleaning:** Identify and remove any records with missing or null values.
- **3. Exploratory Data Analysis (EDA):** Perform basic exploratory data analysis to understand the dataset.
- **4. Business Analysis:** Use SQL to answer specific business questions and derive insights from the sales data.


### 1. Data Cleaning:
Before analysis, null checks were performed and any records with missing values were deleted to ensure data quality.
```SQL
SELECT * FROM Retail_Sales
WHERE transactions_id IS NULL
   OR sale_date IS NULL
   OR ... ;


Delete from Retail_Sales
where
		transactions_id IS NULL
		OR
		sale_date IS NULL
		OR
		sale_time IS NULL
		OR ... ;

```

### 2. Exploratory Data Analysis (EDA):
**Total Sales Records:**
```SQL
SELECT COUNT(*) FROM Retail_Sales;
```

**Unique Customers:**
```SQL
SELECT COUNT(DISTINCT customer_id) FROM Retail_Sales;
```

**Product Categories:**
```SQL
SELECT DISTINCT category FROM Retail_Sales;
```

### 3. Business Questions Answered:
**Q1: Sales on a Specific Day (e.g., 5th Nov 2022)**
```SQL
SELECT * FROM Retail_Sales WHERE sale_date = '2022-11-05';
```

**Q2: Clothing Sales with Quantity > 4 in Nov-2022**
```SQL
SELECT * FROM Retail_Sales
WHERE category = 'Clothing'
  AND quantity > 4
  AND TO_CHAR(sale_date, 'YYYY-MM') = '2022-11';
```
 
**Q3: Total Sales by Category**
```SQL
SELECT category, SUM(total_sale) AS net_sales
FROM Retail_Sales
GROUP BY category;
```

**Q4: Average Age of Beauty Category Customers**
```SQL
SELECT ROUND(AVG(age), 2)
FROM Retail_Sales
WHERE category = 'Beauty';
```

**Q5: High-Value Transactions (total_sale > 1000)**
```SQL
SELECT * FROM Retail_Sales
WHERE total_sale > 1000;
```

**Q6: Transactions by Gender & Category**
```SQL
SELECT gender, category, COUNT(transactions_id)
FROM Retail_Sales
GROUP BY gender, category;
```

**Q7: Monthly Average Sales**
```SQL
SELECT
   EXTRACT(YEAR FROM sale_date) AS year,
   EXTRACT(MONTH FROM sale_date) AS month,
   AVG(total_sale) AS avg_sale
FROM Retail_Sales
GROUP BY year, month
ORDER BY year, month DESC;
```

**Q8: Top 5 Customers by Total Sales**
```SQL
SELECT customer_id, SUM(total_sale) AS total_sales
FROM Retail_Sales
GROUP BY customer_id
ORDER BY total_sales DESC
LIMIT 5;
```

**Q9: Unique Customers per Category**
```SQL
SELECT category, COUNT(DISTINCT customer_id) AS customers
FROM Retail_Sales
GROUP BY category;
```

**Q10: Sales by Shift (Morning, Afternoon, Evening)**
```SQL
WITH hourly_sales AS (
  SELECT *,
    CASE
      WHEN EXTRACT(HOUR FROM sale_time) < 12 THEN 'Morning'
      WHEN EXTRACT(HOUR FROM sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
      ELSE 'Evening'
    END AS shift
  FROM Retail_Sales
)
SELECT shift, COUNT(*) AS total_orders
FROM hourly_sales
GROUP BY shift
ORDER BY CASE shift
  WHEN 'Morning' THEN 1
  WHEN 'Afternoon' THEN 2
  WHEN 'Evening' THEN 3
END;
```


## Key Business Insights:
Most sales come from the Afternoon shift.
Top-spending customers can be targeted for loyalty programs.
Clothing and Beauty are strong-performing categories.
Certain customers contribute significantly to sales volume.


## Dataset
- <a href="https://github.com/tanyabatra555/Retail_Sales_SQL_Project/blob/main/SQL%20-%20Retail%20Sales%20Analysis_utf%20.csv"> Retail_Sales_Dataset </a>


## Files Included:
Retail_Sales_SQL_Project – SQL scripts for table creation, data cleaning, and analysis.
- <a href="https://github.com/tanyabatra555/Retail_Sales_SQL_Project/blob/main/Retail_Sales_SQL_Project.sql"> Retail_Sales_SQL_Project </a>


## Tools Used:
- PostgreSQL
- pgAdmin4 (for query execution)
- GitHub (project version control)


## Conclusion
This project serves as a comprehensive introduction to SQL for data analysts, covering database setup, data cleaning, exploratory data analysis, and business-driven SQL queries. The findings from this project can help drive business decisions by understanding sales patterns, customer behavior, and product performance.


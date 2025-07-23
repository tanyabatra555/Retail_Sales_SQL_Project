## Retail_Sales_SQL_Project

# Project Overview:
This case study focuses on analyzing retail sales data using SQL. The dataset includes transaction-level sales data with customer demographics, purchase date & time, and product category details.
The goal is to clean, explore, and analyze the data to uncover valuable business insights such as sales performance, customer behavior, and category trends.

# Objectives
Set up a retail sales database: Create and populate a retail sales database with the provided sales data.
**1. Data Cleaning:** Identify and remove any records with missing or null values.
**2. Exploratory Data Analysis (EDA):** Perform basic exploratory data analysis to understand the dataset.
**3. Business Analysis:** Use SQL to answer specific business questions and derive insights from the sales data.

# Database Design:
**Table Name: Retail_Sales**
Column Name	Data Type	Description
transactions_id	INT	Unique transaction identifier
sale_date	DATE	Date of the sale
sale_time	TIME	Time of the sale
customer_id	INT	Unique customer ID
gender	VARCHAR(15)	Customer gender
age	INT	Customer age
category	VARCHAR(15)	Product category
quantity	INT	Quantity sold
price_per_unit	FLOAT	Price per unit
cogs	FLOAT	Cost of goods sold
total_sale	FLOAT	Total sale amount

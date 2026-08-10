CREATE DATABASE retail_sales;
USE retail_sales;

SELECT *
FROM customer_shopping_data;


-- DATA QUALITY AUDIT BASICS:

-- how many records?
SELECT COUNT(*) from customer_shopping_data;

-- Date range of the set 
SELECT MIN(invoice_date), MAX(invoice_date)
From customer_shopping_data;

-- What categories exist?
SELECT DISTINCT (category) 
From customer_shopping_data;

-- What malls are in the data?
SELECT DISTINCT (shopping_mall)
From customer_shopping_data;

-- Any nulls in key column?
SELECT * 
From customer_shopping_data
WHERE customer_id IS NULL
  OR PRICE IS NULL
  OR QUANTITY IS NULL;


-- Q1: Total revenue by category (add a calculated column)
SELECT category,
       SUM(quantity * price) AS total_revenue,
       COUNT(DISTINCT invoice_no) AS total_transactions,
	   ROUND(SUM(quantity * price) / COUNT(DISTINCT invoice_no), 2) AS avg_transaction_value
FROM customer_shopping_data AS Sales 
GROUP BY category
ORDER BY total_revenue DESC;

-- Q2: Best performing mall by revenue AND by transaction volume
SELECT shopping_mall,
    SUM(quantity*price) AS total_revenue,
    COUNT(DISTINCT invoice_no) AS total_transactions
FROM customer_shopping_data
GROUP BY shopping_mall
ORDER BY total_revenue DESC;	

-- Q3: Do male and female customers spend differently?
SELECT gender,
       COUNT(DISTINCT customer_id) AS total_customers,
       SUM(quantity*price) AS total_revenue,
       ROUND(SUM(quantity*price)/COUNT(DISTINCT customer_id)) AS avg_spend_per_customer
FROM customer_shopping_data
GROUP BY gender;


-- Q4: Which age group drives the most revenue?
SELECT 
CASE 
    WHEN age < 25 THEN 'Under 25'
    WHEN age BETWEEN 25 AND 35 THEN '25-35'
    WHEN age BETWEEN 36 AND 50 THEN '36-50'
    WHEN age > 50 THEN 'Over 50'
END AS age_group,
    SUM(quantity*price) AS total_revenue,
    COUNT(DISTINCT customer_id) as total_customers,
    ROUND(AVG(quantity*price),2) AS avg_spend
FROM customer_shopping_data
GROUP BY age_group
ORDER BY total_revenue DESC;

-- Q5: Monthly revenue trend (spot seasonality)
SELECT
    YEAR (str_to_date(invoice_date, '%d/%m/%Y')) AS invoice_year,
    MONTH (str_to_date(invoice_date, '%d/%m/%Y')) AS invoice_month,
    FORMAT (SUM(quantity*price), 2) AS total_revenue,
    COUNT(DISTINCT invoice_no) AS total_transactions
FROM customer_shopping_data
GROUP BY invoice_year, invoice_month
ORDER BY invoice_year, invoice_month;


-- Q6: Most popular payment method by category
SELECT category, payment_method, 
COUNT(*) AS transaction_count
FROM customer_shopping_data
GROUP BY category, payment_method
ORDER BY category, payment_method DESC;

-- Q7: Rank categories within each mall by revenue (use window function)
SELECT shopping_mall, category,
SUM(quantity*price) AS total_revenue,
RANK() OVER (PARTITION BY shopping_mall ORDER BY SUM(quantity*price) DESC) AS revenue_rank
FROM customer_shopping_data
GROUP BY shopping_mall, category;

-- Q8: Flag high-value transactions (top 10% by spend)
WITH transaction_totals AS (
  SELECT 
    invoice_no,
    customer_id,
    shopping_mall,
    SUM(quantity * price) AS transaction_value
  FROM customer_shopping_data
  GROUP BY invoice_no, customer_id, shopping_mall
)
SELECT 
    invoice_no,
    customer_id,
    shopping_mall,
    transaction_value,
CASE 
  WHEN NTILE(10) OVER (ORDER BY transaction_value DESC) = 1 
  THEN 'High Value' 
  ELSE 'Standard' 
END AS customer_tier
FROM transaction_totals
ORDER BY transaction_value DESC;

SELECT 
    shopping_mall,
    customer_tier,
    COUNT(*) AS transaction_count
FROM (
    WITH transaction_totals AS (
        SELECT 
            invoice_no,
            customer_id,
            shopping_mall,
            SUM(quantity * price) AS transaction_value
        FROM customer_shopping_data
        GROUP BY invoice_no, customer_id, shopping_mall
    )
    SELECT 
        invoice_no,
        customer_id,
        shopping_mall,
        transaction_value,
        CASE 
            WHEN NTILE(10) OVER (ORDER BY transaction_value DESC) = 1 
            THEN 'High Value' 
            ELSE 'Standard' 
        END AS customer_tier
    FROM transaction_totals
) AS flagged
WHERE customer_tier = 'High Value'
GROUP BY shopping_mall, customer_tier
ORDER BY transaction_count DESC;
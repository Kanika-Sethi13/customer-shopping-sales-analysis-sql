# Customer Shopping Data Analysis using SQL

## Project Overview

This project analyzes retail sales data using SQL to answer business questions related to customer behavior, sales performance, shopping malls, payment methods, and revenue trends.

The project demonstrates how SQL can be used for data cleaning, exploratory data analysis (EDA), business reporting, and customer segmentation.

---

## Dataset

**Dataset Name:** Customer Shopping Dataset

**Source:** https://www.kaggle.com/datasets/mehmettahiraslan/customer-shopping-dataset/data

The dataset contains **99,457 retail transactions** collected from multiple shopping malls in Turkey.

### Dataset Attributes

- Invoice Number
- Customer ID
- Gender
- Age
- Product Category
- Quantity
- Price
- Payment Method
- Invoice Date
- Shopping Mall

---

# Tools Used

- MySQL
- MySQL Workbench
- GitHub

---

# Project Objectives

The objective of this project is to use SQL to:

- Perform data quality checks
- Explore the dataset
- Calculate business KPIs
- Analyze customer purchasing behaviour
- Identify high-performing shopping malls
- Study customer demographics
- Detect seasonal sales patterns
- Practice SQL analytical functions

---

# Project Workflow

## Step 1 — Data Quality Audit

Before performing analysis, basic data validation was carried out.

### ✔ Count Total Records

**Purpose**

To understand the size of the dataset.

**SQL Concepts Used**

- COUNT()

---

### ✔ Identify Date Range

**Purpose**

To determine the period covered by the dataset.

**SQL Concepts Used**

- MIN()
- MAX()

---

### ✔ List Product Categories

**Purpose**

To understand the available product categories.

**SQL Concepts Used**

- DISTINCT

---

### ✔ List Shopping Malls

**Purpose**

To identify all shopping malls included in the dataset.

**SQL Concepts Used**

- DISTINCT

---

### ✔ Check Missing Values

**Purpose**

To ensure important columns do not contain NULL values before analysis.

**SQL Concepts Used**

- IS NULL

---

# Business Analysis

---

## Q1. Total Revenue by Category

### Objective

Identify which product categories generate the highest revenue.

### Why this analysis?

This helps businesses understand which product categories contribute the most towards overall sales.

### Finding

Clothing generated the highest total revenue at 113,996,791 TL across all categories, driven by high transaction volume. However, the avg_transaction_value ranking tells a different story Technology recorded the highest average transaction value at 11,581 TL per invoice compared to Clothing's 3,305 TL. This indicates that Technology purchases are high-spend but low-frequency, while Clothing drives revenue through volume rather than ticket size.

### SQL Concepts

- Calculated Columns
- SUM()
- COUNT()
- ROUND()
- GROUP BY
- ORDER BY

---

## Q2. Best Performing Shopping Mall

### Objective

Determine which shopping mall performs best based on:

- Total Revenue
- Total Transactions

### Why this analysis?

Comparing mall performance helps businesses evaluate store productivity and identify high-performing locations.

### SQL Concepts

- SUM()
- COUNT()
- GROUP BY
- ORDER BY

### Finding:
Mall of Istanbul ranked #1 in both total revenue (50,872,481 TL) and total transactions (19,943). The fact that it leads on both metrics not just one confirms it is the strongest performing location overall, not simply the busiest or the highest-spending.

---

## Q3. Spending Behaviour by Gender

### Objective

Compare purchasing behaviour between male and female customers.

### Why this analysis?

Understanding demographic spending patterns helps businesses target marketing campaigns more effectively.

### SQL Concepts

- SUM()
- AVG()
- COUNT()
- GROUP BY

### Finding:
Spending behaviour between male and female customers is largely similar. Male customers spent approximately 9 TL more per customer on average than female customers, a difference too small to indicate meaningfully different purchasing patterns. Marketing strategies based on gender differentiation would have limited data support from this dataset.

---

## Q4. Revenue by Age Group

### Objective

Identify which age group contributes the highest revenue.

### Why this analysis?

Customer segmentation helps businesses focus on the most valuable customer groups.

### SQL Concepts

- CASE
- SUM()
- AVG()
- COUNT()
- GROUP BY

### Finding:
The 36–50 age group generated the highest total revenue despite not being the largest customer segment. This suggests that middle-aged customers have higher purchasing power or spend more per visit compared to younger age groups, making them the most valuable demographic for targeted campaigns.

---

## Q5. Monthly Revenue Trend

### Objective

Analyse revenue trends over time to identify seasonality.

### Why this analysis?

Businesses can use seasonal patterns for inventory planning and promotional campaigns.

### SQL Concepts

- STR_TO_DATE()
- YEAR()
- MONTH()
- SUM()
- COUNT()
- GROUP BY

### Finding:
A consistent seasonal pattern emerges across both years in the dataset. Revenue peaks in July (Month 7) reaching 10,311,119 TL in 2021 and 10,067,602 TL in 2022 and again in October (Month 10), with 10,263,015 TL in 2021 and 10,282,075 TL in 2022. February consistently records the lowest revenue each year — 8,772,315 TL in 2021 and 8,344,111 TL in 2022. This dual-peak pattern suggests summer shopping and autumn seasonal demand as key revenue drivers, with post-holiday February representing the weakest period.

---

## Q6. Most Popular Payment Method

### Objective

Identify the preferred payment method within each product category.

### Why this analysis?

Understanding payment preferences helps improve customer checkout experience and payment infrastructure.

### SQL Concepts

- COUNT()
- GROUP BY
- ORDER BY

### Finding: 
Cash is the dominant payment method across all product categories. Credit cards are also widely used but have not surpassed cash in any category. This consistency suggests customer payment preferences are not category-dependent shoppers across all product types default to cash regardless of what they are purchasing.

---

## Q7. Rank Categories within each Mall

### Objective

Rank product categories according to revenue generated inside each shopping mall.

### Why this analysis?

Different malls may have different customer preferences. Ranking categories helps identify the strongest-selling products for every location.

### SQL Concepts

- Window Functions
- RANK()
- PARTITION BY
- GROUP BY

### Finding:
Clothing ranked #1 by revenue in every shopping mall in the dataset confirming it as the universally dominant category regardless of location. Shoes ranked #2 across almost all malls, with one exception where Technology took the second position. The near-identical category rankings across all malls suggest that customer purchasing preferences are consistent systemwide rather than location-specific.

---

## Q8. High-Value Transactions

### Objective

Identify the top spending transactions.

### Why this analysis?

High-value customers can be targeted for loyalty programs, premium memberships, and personalized marketing campaigns.

### SQL Concepts

- Common Table Expressions (CTE)
- CASE
- Aggregate Functions
- PERCENTILE

### Finding:
Transactions above 26,250 TL were flagged as High Value, representing the top 10% of all transactions by spend. Mall of Istanbul recorded the highest number of High Value transactions at 2,026, followed closely by Kanyon Mall at 2,025. This aligns with Mall of Istanbul's overall dominance in revenue and transaction volume, confirming it attracts the highest concentration of premium spenders.

---

# SQL Skills Demonstrated

- Data Exploration
- Data Quality Checks
- Aggregate Functions
- CASE Statements
- Date Functions
- Window Functions
- Common Table Expressions (CTEs)
- Customer Segmentation
- Revenue Analysis
- Business Reporting

---

# Repository Structure

```
Customer-Shopping-SQL-Analysis
│
├── customer_shopping_data_analysis.sql
├── README.md
└── screenshots/
```

---

# How to Run

1. Download the dataset from Kaggle.
2. Create a database in MySQL.
3. Import the CSV file into MySQL Workbench.
4. Open the SQL script.
5. Execute the queries sequentially.

---

# Learning Outcomes

This project helped strengthen my understanding of:

- Writing SQL queries for business problems
- Data exploration using SQL
- Retail sales analytics
- Customer segmentation
- Window functions
- Revenue calculations
- Exploratory Data Analysis (EDA)

---

# Author

**Kanika Sethi**

Feel free to connect or provide feedback on this project.

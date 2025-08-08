# 🛍️ Retail Sales Analysis SQL Project

<p align="center">
  <img src="https://img.shields.io/badge/SQL-MySQL-blue?style=flat-square" alt="SQL Badge" />
  <img src="https://img.shields.io/badge/Data-Cleaning-green?style=flat-square" alt="Data Cleaning Badge" />
  <img src="https://img.shields.io/badge/EDA-Exploratory%20Data%20Analysis-orange?style=flat-square" alt="EDA Badge" />
</p>

---

## 📚 Overview

This project showcases **SQL-based data analysis** on a retail sales dataset.  
Using **MySQL**, the project covers **data cleaning**, **exploratory data analysis (EDA)**, and answers **key business questions** — all without using any BI tools.  
The dataset was imported from a CSV file into MySQL, and the entire analysis was done using SQL queries.

---

## 🎯 Objectives

1. **Set up the Database**  
   - Create and structure a sales database (`Sql_project_1`)  
   - Import CSV data into a table `retail_sales`

2. **Data Cleaning**  
   - Identify and remove records with **missing/null values**

3. **Exploratory Data Analysis (EDA)**  
   - Understand data distribution (number of sales, unique customers, etc.)

4. **Business Insights**  
   - Identify top customers, category performance, sales by gender, and more

---

## 🛠️ Tech Stack

| Tool      | Purpose |
|-----------|---------|
| 🗄️ MySQL  | Database management and querying |
| 📊 SQL Queries | Data cleaning, transformation, and analysis |
| 📄 CSV    | Data source format |

---

## 🗂️ Project Structure

```
📦 retail-sales-analysis-sql
├── retail_sales.csv           # Raw dataset
├── retail_sales.sql           # SQL script (database + analysis queries)
├── README.md                  # Project documentation
```

---

## 📋 Key Features & Queries

- **Database Setup**  
  ```sql
  CREATE DATABASE Sql_project_1;
  USE Sql_project_1;

  CREATE TABLE retail_sales (
      transactions_id INT PRIMARY KEY,
      sale_date DATE,
      sale_time TIME,
      customer_id INT,
      gender VARCHAR(10),
      age INT,
      category VARCHAR(50),
      quantiy INT,
      price_per_unit FLOAT,
      cogs FLOAT,
      total_sale FLOAT
  );
  ```

- **Data Cleaning**  
  Find missing/null values:
  ```sql
  SELECT * FROM retail_sales
  WHERE transactions_id IS NULL
     OR sale_date IS NULL
     OR sale_time IS NULL
     OR customer_id IS NULL
     OR gender IS NULL
     OR age IS NULL
     OR category IS NULL
     OR quantiy IS NULL
     OR price_per_unit IS NULL
     OR cogs IS NULL
     OR total_sale IS NULL;
  ```

- **Basic Analysis**  
  - Total number of sales  
  - Number of unique customers  
  - Highest purchase customer  
  - Nth highest purchases (using `DENSE_RANK()`)  
  - Spending patterns by gender  

- **Business-Oriented Queries**  
  - Sales on a specific date  
  - Clothing sales in Nov 2022 with quantity ≥ 4  
  - Total sales by category  
  - Average customer age in Beauty category  
  - Transactions above ₹1000  
  - Monthly average sales & best months  
  - Top 5 customers by total sales  
  - Unique customers per category  
  - Orders by shift (Morning, Afternoon, Evening)

---

## 📊 Example Insights

- **Top Spending Customer**: Quickly identify customers contributing most revenue  
- **Best Performing Category**: Understand which product categories drive sales  
- **Gender-Based Trends**: Spot purchasing patterns based on customer gender  
- **Seasonality**: Identify the month with the highest average sales  

---

## 🔮 Future Enhancements

- 📈 Connect with **Power BI** or **Tableau** for interactive dashboards  
- 🏷️ Integrate category-level profitability analysis  
- 📦 Add more datasets to simulate multi-store or multi-year data

---

## 🧑‍💻 Author 
**Aman Chouhan**  
*Data Enthusiast | SQL*

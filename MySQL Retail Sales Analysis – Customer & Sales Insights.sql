create database Sql_project_1;
use Sql_project_1;
create table retail_sales(
transactions_id	int primary key,
sale_date date,
sale_time time,
customer_id	int,
gender	varchar(10),
age	int,
category varchar(50),	
quantiy int,
price_per_unit	float,
cogs	float,
total_sale float
);
select * from retail_sales;


select * from retail_sales
where transactions_id is null
or sale_date is null
or sale_time is null
or customer_id is null
or gender is null
or age is null
or category is null
or quantiy is null
or price_per_unit is null
or cogs is null 
or total_sale is null;

-- How many sales we have
select count(*) as sales_count from retail_sales;

-- how many unique customer we have
select count(distinct customer_id)as customer_count from retail_sales;

-- customer with highest purchase
SELECT 
	customer_id,
    sum(total_sale)  AS total_purchase
from retail_sales
group by customer_id
order by total_purchase desc
limit 1;

-- Nth highesh purchase
with Nth_purchase as (
select 
	customer_id,
    sum(total_sale) as total_purchase_amount 
from retail_sales
group by customer_id),
Rank_purchased as 
(select 
	customer_id,
    total_purchase_amount,
	dense_rank() over(order by total_purchase_amount desc) as purchase_rank
from Nth_purchase)
select 
	customer_id, 
    total_purchase_amount
from rank_purchased
where purchase_rank = 4;

-- customer order by total purchase amount 
SELECT 
	customer_id,
    sum(Total_sale) as total_purchase_amount 
from retail_sales
group by customer_id
order by total_purchase_amount desc;

-- Spends based on gender
select 
	gender,
    sum(total_sale) as total_sales
from retail_sales
group by gender;

-- Q.1 Write a SQL query to retrieve all columns for sales made on 2022-11-05
select * from retail_sales where sale_date = '2022-11-05';

-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022
select
 * 
 from 
	retail_sales
 where 
	category ='Clothing' 
    and
    quantiy >= 4 
    and
    sale_date >= '2022-11-01' 
    and
    sale_date < '2022-12-01';

-- Q.3 Write SQL query to calculate the total sales (total_sale) for each category.
select 
	category , 
    sum(total_sale) 
from 
	retail_sales
group by
	category;

-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
select  
	round(avg(age),2) as customer_avg_age
from 
	retail_sales
where
	category = 'Beauty';

-- Q.5 Write a SQL query to find all transactions where the total sale is greater than 1000.
select 
	 *
from 
	retail_sales
where 
	total_sale > 1000;
-- 0.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
select 
	gender,
    count(*) as Transaction_count
from 
	retail_sales
group by
	gender;
-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year
select
	year(sale_date) as Year,
	month(sale_date) as Month,
    round(avg(total_sale),2) as avg_sale_per_month
from 
	retail_sales
group by 
	Year,
    Month
order by avg_sale_per_month desc;
-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales
select
	customer_id,
    Sum(total_sale) as Total_sales
from
	retail_sales
group by
	customer_id
order by 
	Total_sales desc
limit 5;
	
-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
select 
	category,
    count(distinct customer_id) as Unique_customer
from
	retail_sales
group by
	category;
    
-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)|
select
	case
		when hour(sale_time)<=12 then 'Morning'
        when hour(sale_time) >12 and hour(sale_time) <17 then 'Afternoon'
        else 'Evening'
	End as Shift,
    count(*) as total_orders
from retail_sales
group by shift;




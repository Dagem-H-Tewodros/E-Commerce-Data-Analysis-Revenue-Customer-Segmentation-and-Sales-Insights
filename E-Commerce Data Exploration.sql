/* 
	E-Commerce Sales Data Analysis
*/
-- 1.Total Sales Revenue
	-- Calculates the total revenue from all transactions by summing the absolute value of the product of quantity and unit price, rounding up to the nearest integer.
SELECT 
    CEILING(SUM(ABS(quantity * unit_price))) AS total_transaction
FROM
    e_commerce2;

-- 2.Total Sales Revenue After Failed Transactions
	-- Calculates the total revenue from failed transactions (indicated by 'C' in the invoice number) by summing the absolute value of the product of quantity and unit price, rounding up to the nearest integer.
SELECT 
    CEILING(SUM(ABS(quantity * unit_price))) AS failed_transaction
FROM
    e_commerce2
WHERE
    invoice_no LIKE '%C%';

-- 3.Most Failed Transaction Products
	-- Identifies the products with the highest revenue from failed transactions, grouped by product name and invoice number, and orders them by the revenue in descending order.
SELECT 
    CEILING(SUM(ABS(quantity * unit_price))) AS failed_transaction,
    invoice_no,
    name
FROM
    online_retail
GROUP BY name , invoice_no
HAVING invoice_no LIKE '%C%'
ORDER BY failed_transaction DESC , invoice_no DESC;

-- 4.Total Successful Sales Revenue
	-- Calculates the total successful sales revenue by subtracting the revenue from failed transactions from the total revenue.
WITH CTE AS
(SELECT 
	1 as num1,
	ceiling(SUM(ABS(quantity*unit_price))) AS total_transaction
FROM 
	e_commerce2),
CTE2 AS
(SELECT 
	1 as num2,
	ceiling(SUM(ABS(quantity*unit_price))) AS failed_transaction
FROM 
	e_commerce2
WHERE 
	invoice_no LIKE "%C%")
SELECT 
	CTE.total_transaction - CTE2.failed_transaction as Total_Successful_Sales_Revenue
FROM 
	CTE INNER JOIN CTE2 ON CTE.num1=CTE2.num2;

-- 5.Top Selling Products
	-- Lists the top-selling products based on the total quantity sold and the total sales revenue, ordered by the quantity sold.
SELECT 
    name,
    SUM(quantity) AS total_sales,
    CEILING(SUM(ABS(quantity * unit_price))) AS total_sales_revenue
FROM
    e_commerce2
GROUP BY name
ORDER BY total_sales DESC , total_sales_revenue DESC;

-- 6.Highest Revenue Generating Products
	-- Lists the products that generate the highest revenue, ordered by the total sales revenue.
SELECT 
    name,
    SUM(quantity) AS total_sales,
    CEILING(SUM(ABS(quantity * unit_price))) AS total_sales_revenue
FROM
    e_commerce2
GROUP BY name
ORDER BY total_sales_revenue DESC;
    
-- 7.Transactions Per Country
	-- Counts the number of transactions per country, ordered by the number of transactions in descending order.
SELECT 
    COUNT(invoice_no) AS num_of_transaction, country
FROM
    e_commerce2
GROUP BY country
ORDER BY num_of_transaction DESC;

-- 8.Average Order Value of Customers
	-- Calculates the average order value for each customer by dividing the total revenue by the number of transactions, ordered by average order value.
SELECT 
    customer_id,
    CEILING(SUM(ABS(quantity * unit_price)) / COUNT(invoice_no)) AS average_order_value
FROM
    e_commerce2
GROUP BY customer_id
ORDER BY average_order_value DESC;

 -- 9.Average Order Value of countries
	-- Calculates the average order value for each country by dividing the total revenue by the number of transactions, ordered by average order value.
SELECT 
    country,
    CEILING(SUM(ABS(quantity * unit_price)) / COUNT(invoice_no)) AS average_order_value
FROM
    e_commerce2
GROUP BY country
ORDER BY average_order_value DESC;

-- 10.Averege Order Value Of Products
	-- Calculates the average order value for each product by dividing the total revenue by the number of transactions, ordered by average order value.
SELECT 
    name,
    CEILING(SUM(ABS(quantity * unit_price)) / COUNT(invoice_no)) AS average_order_value
FROM
    e_commerce2
GROUP BY name
ORDER BY average_order_value DESC;

-- 11-Most Frequent Customers
	-- Identifies the most frequent customers based on the number of transactions and the total spend by each customer, ordered by frequency of purchases.
SELECT 
    customer_id,
    COUNT(invoice_no) AS frequence_of_purchase,
    CEILING(SUM(ABS(quantity * unit_price))) AS total_spend_by_customer
FROM
    e_commerce2
GROUP BY customer_id
ORDER BY frequence_of_purchase DESC;
    
-- 12.Total Revenue per Day
	-- Calculates the total revenue for each day by summing the product of quantity and unit price, grouped by transaction date.
SELECT 
    CEILING(SUM(quantity * unit_price)), transaction_date
FROM
    e_commerce2
GROUP BY transaction_date;

-- 13.Average Revenue Per Day
	-- Calculates the average revenue per day by dividing the total revenue by the number of transactions, grouped by transaction date and ordered by average revenue per day.
SELECT 
    transaction_date,
    ROUND((SUM(quantity * unit_price)) / COUNT(quantity),
            2) avg_revenue_per_day
FROM
    e_commerce2
GROUP BY transaction_date
ORDER BY avg_revenue_per_day DESC;
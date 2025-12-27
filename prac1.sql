--This practice is to show the differences of statement between MySQL and PostgreSQL

--CREATE TABLE: MySQL & PostgreSQL same.
CREATE TABLE countries(
    country_id INT PRIMARY KEY,
    country_name VARCHAR(100) NOT NULL,
    population INT,
);

--ALTER TABLE: MySQL & PostgreSQL slight difference in syntax for modifying column constraints.
ALTER TABLE dup_countries ALTER COLUMN country_name TYPE VARCHAR(10);
ALTER TABLE dup_countries ALTER COLUMN country_name SET NOT NULL; --PostgreSQL syntax

ALTER TABLE dup_countries 
MODIFY country_name VARCHAR(10) NOT NULL; -- MySQL syntax

--LIMIT Values to certain value:
CREATE TABLE IF NOT EXISTS jobs(
    JOB_ID varchar(10) NOT NULL,
    JOB_TITLE varchar(35) NOT NULL,
    MIN_SALARY decimal(6,0),
    MAX_SALARY decimal(6,0),
    CHECK(MAX_SALARY<=25000) -- Constraint to limit MAX_SALARY to 25000
);

SELECT
    MONTH(transaction_date) AS Month,
    ROUND(SUM(unit_price * transaction_qty),2) AS Total_Sales,
    (ROUND(SUM(unit_price * transaction_qty),2) - LAG(ROUND(SUM(unit_price * transaction_qty),2),1) OVER(ORDER BY MONTH(transaction_date))) /
    LAG(ROUND(SUM(unit_price * transaction_qty),2),1) OVER(ORDER BY MONTH(transaction_date)) * 100 AS MoM
FROM
    css
WHERE month(transaction_date) IN (4,5)
GROUP BY month;

WITH sales AS(
SELECT
	month(transaction_date) AS month,
    round(sum(transaction_qty * unit_price),2) as total_sales
FROM
	css
GROUP BY month
)
SELECT
	month,
    total_sales,
    round((total_sales - lag(total_sales,1) over(order by month)) /
    lag(total_sales,1) over(order by month) * 100,2) AS MoM
FROM
	sales
WHERE
	month IN (4,5)
GROUP BY month;

SELECT
	COUNT(transaction_qty) as Total_orders
FROM
	css
Where
	month(transaction_date) = 5;

SELECT
	month,
    Total_orders,
	(Total_orders - lag(Total_orders,1) over(order by month))/
    lag(Total_orders,1) over(order by month) * 100 AS MoM
FROM orders
WHERE month IN (4,5)
GROUP by month;

SELECT
	sum(transaction_qty) AS Total_quantity_sold
FROM
	css
WHERE month(transaction_date) = 5;

--MySQL: WITH
WITH qty AS (
SELECT
	month(transaction_date) AS month,
	sum(transaction_qty) AS Total_quantity_sold
FROM
	css
GROUP BY month
)
SELECT
	month,
    Total_quantity_sold,
    (Total_quantity_sold - lag(Total_quantity_sold,1) over(order by month)) /
    lag(Total_quantity_sold,1) over(order by month) * 100 AS MoM
FROM qty
WHERE month IN (4,5)
GROUP by month;

--MySQL: CONCAT
SELECT
	CONCAT(ROUND(SUM(transaction_qty * unit_price)/1000,1), "K") AS total_sales,
    CONCAT(round(SUM(transaction_qty)/1000,1), "k") AS total_quantity_sold,
    CONCAT(ROUND(COUNT(transaction_qty)/1000,1), "k") AS total_orders
FROM
	css
WHERE
	transaction_date = '2023-05-18';


--MySQL: Day
SELECT
	day(transaction_date) AS DoM,
    SUM(transaction_qty * unit_price) AS sales
FROM
	css
WHERE month(transaction_date) = 5
GROUP BY DoM;


--MySQL: Internal Query
SELECT
	avg(total_sales) AS average_sales
FROM
	(
SELECT
	sum(transaction_qty * unit_price) AS total_sales
FROM
	css
WHERE
	month(transaction_date) = 5
GROUP BY transaction_date
) AS internal_query;

--OR

WITH daily_sales AS(
SELECT
	day(transaction_date) AS day,
	sum(transaction_qty * unit_price) AS total_sales
FROM
	css
WHERE
	month(transaction_date) = 5
GROUP BY transaction_date
)
SELECT
	day,
	total_sales
FROM
	daily_sales;


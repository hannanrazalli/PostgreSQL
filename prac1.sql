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
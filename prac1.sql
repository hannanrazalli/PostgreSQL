--This practice is to show the differences of statement between MySQL and PostgreSQL

--CREATE TABLE: MySQL & PostgreSQL same.
CREATE TABLE countries(
    country_id INT PRIMARY KEY,
    country_name VARCHAR(100) NOT NULL,
    population INT,
)

--This practice is to show the differences of statement between MySQL and PostgreSQL

--CREATE TABLE: MySQL & PostgreSQL same.
CREATE TABLE countries(
    country_id INT PRIMARY KEY,
    country_name VARCHAR(100) NOT NULL,
    population INT,
);

--ALTER TABLE: MySQL & PostgreSQL slight difference in syntax for modifying column constraints.
ALTER TABLE countries
ALTER COLUMN population SET NOT NULL; -- PostgreSQL syntax

ALTER TABLE countries
MODIFY COLUMN country_name VARCHAR(150); -- MySQL syntax
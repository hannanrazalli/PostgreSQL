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

CREATE TABLE IF NOT EXISTS countries(
    -- Column to store the two-letter country code
    COUNTRY_ID varchar(2),
    COUNTRY_NAME varchar(40)
    CHECK(COUNTRY_NAME IN('Italy','India','China')), -- Constraint to limit COUNTRY_NAME to specific values
    REGION_ID decimal(10,0)
); -- PostgreSQL syntax for CHECK constraint

CREATE TABLE IF NOT EXISTS job_history(
    EMPLOYEE_ID int NOT NULL,
    START_DATE date NOT NULL,
    END_DATE date NOT NULL,
    JOB_ID varchar(10) NOT NULL,
    DEPARTMENT_ID int NOT NULL,
    CHECK(END_DATE > START_DATE), -- Constraint to ensure END_DATE is after START_DATE
    CHECK(END_DATE::text LIKE '____-__-__')
    UNIQUE(EMPLOYEE_ID)
);

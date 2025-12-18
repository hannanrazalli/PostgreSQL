CREATE TABLE cars(
    brand VARCHAR(255),
    model VARCHAR(255),
    year INT
);

SELECT * FROM cars;

INSERT INTO cars (brand, model, year)
VALUES
    ('Ford', 'Mustang', 1964),
    ('Volvo', 'p1800', 1968),
    ('BMW', 'M1', 1978),
    ('Toyota', 'Celica', 1975);

SELECT brand, year FROM cars;

ALTER TABLE cars
ADD color VARCHAR(255); -- Alter table is used to add a new column

ALTER TABLE cars
ALTER COLUMN year TYPE VARCHAR(4); -- Change the data type of year column

UPDATE cars
SET color = 'white', year = 1970
WHERE brand = 'Toyota';

ALTER TABLE cars
DROP COLUMN color;

DELETE FROM cars
WHERE brand = 'Volvo';

TRUNCATE TABLE cars; -- Deletes all rows in the table but keeps the table structure

DROP TABLE cars; -- Deletes the entire table

SELECT * FROM cars
WHERE model LIKE 'M%'; -- Selects all cars where the model starts with 'M'
SELECT * FROM cars
WHERE model ILIKE 'm%'; -- Case-insensitive version of LIKE

SELECT  * FROM cars
WHERE brand IN ('Ford', 'Toyota');

SELECT AVG(price)::NUMERIC(10,2)
FROM products; -- 10 numbers are allowed in total, 2 of them after the decimal point

SELECT * FROM customers
WHERE city LIKE 'L_nd__'; -- _ represents a single character wildcard

SELECT product_id, product_name, category_name
FROM products
INNER JOIN categories ON products.category_id = categories.category_id; --Only shows matching records from both tables


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

SELECT testproduct_id, product_name, category_name
FROM testproducts
CROSS JOIN categories; --Instead of matching records, it shows all possible combinations

SELECT customers.customer_name, COUNT(orders.order_id)
FROM orders
LEFT JOIN customers ON orders.customer_id = customers.customer_id
GROUP BY customer_name; -- Shows all customers, even those without orders

SELECT customers.customer_name,
SUM(order_details.quantity * products.price)
FROM order_details
INNER JOIN products ON order_details.product_id = products.product_id
INNER JOIN orders ON order_details.order_id = orders.order_id
INNER JOIN customers ON orders.customer_id = customers.customer_id
GROUP BY customers.customer_id, customers.customer_name
HAVING SUM(order_details.quantity * products.price) >= 1000; -- Shows only customers with total orders of at least 1000

SELECT product_name,
CASE
  WHEN price < 10 THEN 'Low price product'
  WHEN price > 50 THEN 'High price product'
ELSE
  'Normal product'
END
FROM products; --Once a condition is true, it will stop reading and return the result. If no conditions are true, it returns the value in the ELSE clause.


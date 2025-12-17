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
ADD color VARCHAR(255);
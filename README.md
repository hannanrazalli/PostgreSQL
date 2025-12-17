CREATE TABLE cars(
    brand VARCHAR(255),
    model VARCHAR(255),
    year INT
);

SELECT * FROM cars;

INSERT INTO cars (brand, model, year)
VALUES ('Ford', 'Mustang', 1964);
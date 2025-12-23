SELECT * FROM css;

SELECT ROUND(SUM(unit_price * transaction_qty)) AS Total_sales
FROM css
WHERE EXTRACT(MONTH FROM transaction_date) = 5; --Total sales for May
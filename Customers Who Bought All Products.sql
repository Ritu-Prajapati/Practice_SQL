
-- Write a solution to report the customer ids from the Customer table that bought all the products in the Product table.


WITH pro AS (
    SELECT COUNT(DISTINCT product_key) AS total_products
    FROM Product
),
cust AS (
    SELECT customer_id, COUNT(DISTINCT product_key) AS products_bought
    FROM Customer
    GROUP BY customer_id
)
SELECT c.customer_id
FROM cust c
JOIN pro p ON c.products_bought = p.total_products

SELECT * FROM customers;
SELECT product_name, category FROM products WHERE price BETWEEN 5000 AND 10000;
SELECT * FROM products ORDER BY price DESC;
SELECT 
    product_id, 
    COUNT(*) AS num_orders,
    SUM(amount) AS total_amount,
    AVG(amount) AS average_amount,
    MAX(amount) AS highest_amount,
    MIN(amount) AS lowest_amount
FROM orders
GROUP BY product_id;
SELECT customer_id FROM orders GROUP BY customer_id HAVING COUNT(*) > 2;
SELECT 
    EXTRACT(MONTH FROM order_date) AS month,
    COUNT(*) AS num_orders
FROM orders
WHERE EXTRACT(YEAR FROM order_date) = 2020
GROUP BY EXTRACT(MONTH FROM order_date);
SELECT 
    products.product_name, 
    customers.customer_name, 
    orders.order_date
FROM orders
JOIN products ON orders.product_id = products.product_id
JOIN customers ON orders.customer_id = customers.customer_id;
SELECT * FROM orders WHERE order_date >= DATE_SUB(CURDATE(), INTERVAL 3 MONTH);
SELECT customer_id FROM customers WHERE customer_id NOT IN (SELECT DISTINCT customer_id FROM orders);

Total Revenue:
SELECT SUM(p.price * o.quantity) AS total_revenue
FROM orders o
JOIN products p ON o.product_id = p.product_id;

Revenue Per Customer:
SELECT c.first_name, c.last_name,
       SUM(p.price * o.quantity) AS total_spent
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN products p ON o.product_id = p.product_id
GROUP BY c.customer_id;


Top Selling Product:
SELECT p.product_name,
       SUM(o.quantity) AS total_sold
FROM orders o
JOIN products p ON o.product_id = p.product_id
GROUP BY p.product_id
ORDER BY total_sold DESC
LIMIT 1;

Monthly Revenue

SELECT DATE_FORMAT(order_date, '%Y-%m') AS month,
       SUM(p.price * o.quantity) AS revenue
FROM orders o
JOIN products p ON o.product_id = p.product_id
GROUP BY month;

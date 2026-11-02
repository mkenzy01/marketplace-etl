SELECT 'customers' AS table_name, COUNT(*) AS rows FROM customers
UNION ALL SELECT 'products', COUNT(*) FROM products
UNION ALL SELECT 'orders', COUNT(*) FROM orders;

SELECT status, COUNT(*) AS orders, SUM(quantity * unit_price_ngn) AS total_ngn
FROM orders GROUP BY status ORDER BY status;

SELECT o.order_id, c.full_name, p.product_name, o.quantity, o.status
FROM orders o JOIN customers c USING(customer_id) JOIN products p USING(product_id)
ORDER BY o.order_id LIMIT 10;

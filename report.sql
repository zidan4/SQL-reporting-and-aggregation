-- Monthly revenue and order count
SELECT
    TO_CHAR(order_date, 'YYYY-MM') AS month,
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(oi.quantity * p.price) AS total_revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY TO_CHAR(order_date, 'YYYY-MM')
ORDER BY month;

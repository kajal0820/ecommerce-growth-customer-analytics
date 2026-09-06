SELECT 
    p.product_category_name_english AS category,
    COUNT(DISTINCT f.order_id) AS total_orders,
    ROUND(SUM(f.price), 2) AS total_revenue,
    ROUND(AVG(f.price), 2) AS avg_item_price,
    RANK() OVER (ORDER BY SUM(f.price) DESC) AS revenue_rank
FROM fact_order_items f
JOIN dim_products p ON f.product_id = p.product_id
WHERE f.data_quality_flag != 'severe_anomaly'
GROUP BY p.product_category_name_english
ORDER BY total_revenue DESC;
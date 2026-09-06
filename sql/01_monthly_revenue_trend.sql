SELECT 
    d.year,
    d.month,
    ROUND(SUM(f.price), 2) AS total_revenue,
    COUNT(DISTINCT f.order_id) AS total_orders
FROM fact_order_items f
JOIN dim_date d ON f.date_id = d.date_id
WHERE f.data_quality_flag != 'severe_anomaly'
GROUP BY d.year, d.month
ORDER BY d.year, d.month;
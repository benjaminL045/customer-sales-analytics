-- =========================================================
-- OLIST E-COMMERCE ANALYTICS PROJECT ANALYSIS
-- =========================================================

-- =========================================================
-- 1. OVERALL PERFORMANCE METRICS
-- =========================================================

-- Total Revenue
SELECT
    SUM(total_sale_value) AS total_revenue
FROM fact_sales;


-- Total Orders
SELECT
    COUNT(DISTINCT order_id) AS total_orders
FROM fact_sales;


-- Average Order Value (AOV)
SELECT
    AVG(total_sale_value) AS average_order_value
FROM fact_sales;


-- =========================================================
-- 2. REVENUE OVER TIME (MONTHLY TREND)
-- =========================================================

SELECT
    DATE_TRUNC('month', order_purchase_timestamp) AS month,
    SUM(total_sale_value) AS revenue,
    COUNT(DISTINCT order_id) AS orders,
    AVG(total_sale_value) AS avg_order_value
FROM fact_sales
GROUP BY month
ORDER BY month;


-- =========================================================
-- 3. TOP PRODUCTS BY REVENUE
-- =========================================================

SELECT
    product_id,
    SUM(total_sale_value) AS revenue,
    COUNT(*) AS units_sold
FROM product_sales
GROUP BY product_id
ORDER BY revenue DESC
LIMIT 10;


-- =========================================================
-- 4. TOP PRODUCT CATEGORIES
-- =========================================================

SELECT
    product_category_name,
    SUM(total_sale_value) AS revenue,
    COUNT(*) AS total_items
FROM product_sales
GROUP BY product_category_name
ORDER BY revenue DESC
LIMIT 10;


-- =========================================================
-- 5. CUSTOMER ANALYSIS (HIGH VALUE CUSTOMERS)
-- =========================================================

SELECT
    customer_id,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(total_sale_value) AS lifetime_value
FROM fact_sales
GROUP BY customer_id
ORDER BY lifetime_value DESC
LIMIT 10;


-- =========================================================
-- 6. CUSTOMER SEGMENTATION
-- =========================================================

WITH customer_metrics AS (
    SELECT
        customer_id,
        MAX(order_purchase_timestamp) AS last_purchase,
        COUNT(DISTINCT order_id) AS frequency,
        SUM(total_sale_value) AS monetary_value
    FROM fact_sales
    GROUP BY customer_id
)

SELECT
    customer_id,
    frequency,
    monetary_value
FROM customer_metrics
ORDER BY monetary_value DESC;


-- =========================================================
-- 7. SELLER PERFORMANCE
-- =========================================================

SELECT
    seller_id,
    COUNT(*) AS total_items_sold,
    SUM(total_sale_value) AS revenue
FROM fact_sales
GROUP BY seller_id
ORDER BY revenue DESC
LIMIT 10;


-- =========================================================
-- 8. REVIEW IMPACT ON REVENUE
-- =========================================================

SELECT
    review_score,
    COUNT(*) AS order_count,
    SUM(total_sale_value) AS revenue,
    AVG(total_sale_value) AS avg_order_value
FROM review_sales
GROUP BY review_score
ORDER BY review_score;


-- =========================================================
-- 9. DELIVERY PERFORMANCE ANALYSIS
-- =========================================================

SELECT
    order_id,
    order_purchase_timestamp,
    order_delivered_customer_date,
    (order_delivered_customer_date - order_purchase_timestamp) AS delivery_time
FROM fact_sales
WHERE order_delivered_customer_date IS NOT NULL;


-- Average delivery time
SELECT
    AVG(order_delivered_customer_date - order_purchase_timestamp) AS avg_delivery_time
FROM fact_sales
WHERE order_delivered_customer_date IS NOT NULL;


-- =========================================================
-- 10. CATEGORY PERFORMANCE OVER TIME
-- =========================================================

SELECT
    ps.product_category_name,
    DATE_TRUNC('month', fs.order_purchase_timestamp) AS month,
    SUM(fs.total_sale_value) AS revenue
FROM product_sales ps
JOIN fact_sales fs
    ON ps.order_id = fs.order_id
GROUP BY ps.product_category_name, month
ORDER BY month, revenue DESC;


-- =========================================================
-- 11. REPEAT CUSTOMER ANALYSIS
-- =========================================================

SELECT
    customer_id,
    COUNT(DISTINCT order_id) AS total_orders
FROM fact_sales
GROUP BY customer_id
HAVING COUNT(DISTINCT order_id) > 1
ORDER BY total_orders DESC;


-- =========================================================
-- 12. REVENUE CONCENTRATION (TOP CUSTOMERS CONTRIBUTION)
-- =========================================================

WITH customer_revenue AS (
    SELECT
        customer_id,
        SUM(total_sale_value) AS revenue
    FROM fact_sales
    GROUP BY customer_id
)

SELECT
    customer_id,
    revenue,
    RANK() OVER (ORDER BY revenue DESC) AS rank
FROM customer_revenue;


-- =========================================================
-- 13. TOP 10% CUSTOMERS INSIGHT 
-- =========================================================

WITH customer_revenue AS (
    SELECT
        customer_id,
        SUM(total_sale_value) AS revenue
    FROM fact_sales
    GROUP BY customer_id
),
ranked AS (
    SELECT *,
           NTILE(10) OVER (ORDER BY revenue DESC) AS decile
    FROM customer_revenue
)

SELECT
    decile,
    SUM(revenue) AS total_revenue
FROM ranked
GROUP BY decile
ORDER BY decile;


-- =========================================================
-- 14. SALES QUALITY CHECK (SANITY CHECK)
-- =========================================================

SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT order_id) AS unique_orders
FROM fact_sales;
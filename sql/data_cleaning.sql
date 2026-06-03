-- =========================================================
-- DATA QUALITY CHECKS
-- =========================================================

-- Missing customer IDs in orders
SELECT COUNT(*) AS missing_customer_ids
FROM orders
WHERE customer_id IS NULL;

-- Missing product IDs in order items
SELECT COUNT(*) AS missing_product_ids
FROM order_items
WHERE product_id IS NULL;

-- Missing review scores
SELECT COUNT(*) AS missing_review_scores
FROM reviews
WHERE review_score IS NULL;

-- Missing product categories
SELECT COUNT(*) AS missing_product_categories
FROM products
WHERE product_category_name IS NULL;

-- =========================================================
-- DUPLICATE CHECKS
-- =========================================================

SELECT
    customer_id,
    COUNT(*)
FROM customers
GROUP BY customer_id
HAVING COUNT(*) > 1;

SELECT
    order_id,
    COUNT(*)
FROM orders
GROUP BY order_id
HAVING COUNT(*) > 1;

-- =========================================================
-- ANALYSIS-READY ORDERS
-- Keep only delivered orders
-- =========================================================

CREATE OR REPLACE VIEW clean_orders AS
SELECT
    order_id,
    customer_id,
    order_status,
    order_purchase_timestamp,
    order_delivered_customer_date
FROM orders
WHERE order_status = 'delivered';

-- =========================================================
-- ANALYSIS-READY REVIEWS
-- =========================================================

CREATE OR REPLACE VIEW clean_reviews AS
SELECT
    review_id,
    order_id,
    review_score,
    review_creation_date
FROM reviews
WHERE review_score IS NOT NULL;

-- =========================================================
-- SALES FACT VIEW
-- Core dataset for future analysis
-- =========================================================

CREATE OR REPLACE VIEW fact_sales AS
SELECT
    o.order_id,
    o.customer_id,

    oi.product_id,
    oi.seller_id,

    oi.price,
    oi.freight_value,

    (oi.price + oi.freight_value) AS total_sale_value,

    o.order_purchase_timestamp,
    o.order_delivered_customer_date

FROM clean_orders o
JOIN order_items oi
    ON o.order_id = oi.order_id;

-- =========================================================
-- PRODUCT SALES VIEW
-- Adds product information to sales
-- =========================================================

CREATE OR REPLACE VIEW product_sales AS
SELECT
    fs.order_id,
    fs.customer_id,
    fs.product_id,

    p.product_category_name,

    fs.price,
    fs.freight_value,
    fs.total_sale_value,

    fs.order_purchase_timestamp

FROM fact_sales fs
JOIN products p
    ON fs.product_id = p.product_id;

-- =========================================================
-- REVIEW + SALES VIEW
-- Used later for delivery/review analysis
-- =========================================================

CREATE OR REPLACE VIEW review_sales AS
SELECT
    fs.order_id,
    fs.customer_id,
    fs.total_sale_value,

    r.review_score

FROM fact_sales fs
LEFT JOIN clean_reviews r
    ON fs.order_id = r.order_id;
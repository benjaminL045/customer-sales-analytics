-- =========================================================
-- OLIST E-COMMERCE ANALYTICS DATABASE SCHEMA
-- =========================================================

-- =========================================================
-- 1. CUSTOMERS (DIMENSION TABLE)
-- =========================================================
CREATE TABLE customers (
    customer_id VARCHAR(50) PRIMARY KEY,
    customer_unique_id VARCHAR(50),
    customer_zip_code_prefix INTEGER,
    customer_city TEXT,
    customer_state VARCHAR(10)
);

-- =========================================================
-- 2. SELLERS (DIMENSION TABLE)
-- =========================================================
CREATE TABLE sellers (
    seller_id VARCHAR(50) PRIMARY KEY,
    seller_zip_code_prefix INTEGER,
    seller_city TEXT,
    seller_state VARCHAR(10)
);

-- =========================================================
-- 3. CATEGORY TRANSLATION (DIMENSION TABLE)
-- =========================================================
CREATE TABLE category_translation (
    product_category_name TEXT PRIMARY KEY,
    product_category_name_english TEXT
);

-- =========================================================
-- 4. PRODUCTS (DIMENSION TABLE)
-- =========================================================
CREATE TABLE products (
    product_id VARCHAR(50) PRIMARY KEY,
    product_category_name TEXT,
    product_name_length INTEGER,
    product_description_length INTEGER,
    product_photos_qty INTEGER,
    product_weight_g INTEGER,
    product_length_cm INTEGER,
    product_height_cm INTEGER,
    product_width_cm INTEGER
);

-- =========================================================
-- 5. ORDERS (CORE FACT TABLE - ORDER LEVEL)
-- =========================================================
CREATE TABLE orders (
    order_id VARCHAR(50) PRIMARY KEY,
    customer_id VARCHAR(50),
    order_status TEXT,
    order_purchase_timestamp TIMESTAMP,
    order_approved_at TIMESTAMP,
    order_delivered_carrier_date TIMESTAMP,
    order_delivered_customer_date TIMESTAMP,
    order_estimated_delivery_date TIMESTAMP
);

-- =========================================================
-- 6. ORDER ITEMS (FACT TABLE - ITEM LEVEL)
-- =========================================================
CREATE TABLE order_items (
    order_id VARCHAR(50),
    order_item_id INTEGER,
    product_id VARCHAR(50),
    seller_id VARCHAR(50),
    shipping_limit_date TIMESTAMP,
    price NUMERIC,
    freight_value NUMERIC,
    PRIMARY KEY (order_id, order_item_id)
);

-- =========================================================
-- 7. PAYMENTS (FACT TABLE)
-- =========================================================
CREATE TABLE payments (
    order_id VARCHAR(50),
    payment_sequential INTEGER,
    payment_type TEXT,
    payment_installments INTEGER,
    payment_value NUMERIC,
    PRIMARY KEY (order_id, payment_sequential)
);

-- =========================================================
-- 8. REVIEWS (FACT TABLE)
-- =========================================================
CREATE TABLE reviews (
    review_id VARCHAR(50) PRIMARY KEY,
    order_id VARCHAR(50),
    review_score INTEGER,
    review_comment_title TEXT,
    review_comment_message TEXT,
    review_creation_date TIMESTAMP,
    review_answer_timestamp TIMESTAMP
);

-- =========================================================
-- 9. GEOLOCATION (OPTIONAL DIMENSION TABLE)
-- =========================================================
CREATE TABLE geolocation (
    geolocation_zip_code_prefix INTEGER,
    geolocation_lat NUMERIC,
    geolocation_lng NUMERIC,
    geolocation_city TEXT,
    geolocation_state TEXT
);

-- =========================================================
-- 10. FOREIGN KEY CONSTRAINTS (RELATIONSHIPS)
-- =========================================================

-- Orders → Customers
ALTER TABLE orders
ADD CONSTRAINT fk_orders_customers
FOREIGN KEY (customer_id)
REFERENCES customers(customer_id);

-- Order Items → Orders
ALTER TABLE order_items
ADD CONSTRAINT fk_order_items_orders
FOREIGN KEY (order_id)
REFERENCES orders(order_id);

-- Order Items → Products
ALTER TABLE order_items
ADD CONSTRAINT fk_order_items_products
FOREIGN KEY (product_id)
REFERENCES products(product_id);

-- Order Items → Sellers
ALTER TABLE order_items
ADD CONSTRAINT fk_order_items_sellers
FOREIGN KEY (seller_id)
REFERENCES sellers(seller_id);

-- Payments → Orders
ALTER TABLE payments
ADD CONSTRAINT fk_payments_orders
FOREIGN KEY (order_id)
REFERENCES orders(order_id);

-- Reviews → Orders
ALTER TABLE reviews
ADD CONSTRAINT fk_reviews_orders
FOREIGN KEY (order_id)
REFERENCES orders(order_id);

-- -- Products → Category Translation
-- The data is incomplete / inconsistent (pc_gamer does not exist)
-- ALTER TABLE products
-- ADD CONSTRAINT fk_products_category
-- FOREIGN KEY (product_category_name)
-- REFERENCES category_translation(product_category_name);
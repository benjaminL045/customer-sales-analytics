# Schema Design

## Overview

The Olist dataset will be stored in PostgreSQL using a relational schema. The design follows the source datasets closely while defining primary keys and foreign key relationships to support analytical queries.

---

# Tables

## customers

**Source:** `olist_customers_dataset.csv`

### Columns

| Column                   | Description                        |
| ------------------------ | ---------------------------------- |
| customer_id              | Unique customer identifier         |
| customer_unique_id       | Unique customer account identifier |
| customer_zip_code_prefix | Customer zip code prefix           |
| customer_city            | Customer city                      |
| customer_state           | Customer state                     |

### Primary Key

* customer_id

---

## orders

**Source:** `olist_orders_dataset.csv`

### Columns

| Column                        | Description                  |
| ----------------------------- | ---------------------------- |
| order_id                      | Unique order identifier      |
| customer_id                   | Customer placing order       |
| order_status                  | Order status                 |
| order_purchase_timestamp      | Purchase timestamp           |
| order_approved_at             | Approval timestamp           |
| order_delivered_carrier_date  | Carrier delivery timestamp   |
| order_delivered_customer_date | Customer delivery timestamp  |
| order_estimated_delivery_date | Estimated delivery timestamp |

### Primary Key

* order_id

### Foreign Keys

* customer_id → customers.customer_id

---

## order_items

**Source:** `olist_order_items_dataset.csv`

### Columns

| Column              | Description              |
| ------------------- | ------------------------ |
| order_id            | Associated order         |
| order_item_id       | Item number within order |
| product_id          | Product identifier       |
| seller_id           | Seller identifier        |
| shipping_limit_date | Shipping deadline        |
| price               | Product price            |
| freight_value       | Shipping cost            |

### Primary Key

* (order_id, order_item_id)

### Foreign Keys

* order_id → orders.order_id
* product_id → products.product_id
* seller_id → sellers.seller_id

---

## payments

**Source:** `olist_order_payments_dataset.csv`

### Columns

| Column               | Description             |
| -------------------- | ----------------------- |
| order_id             | Associated order        |
| payment_sequential   | Payment sequence number |
| payment_type         | Payment method          |
| payment_installments | Number of installments  |
| payment_value        | Payment amount          |

### Primary Key

* (order_id, payment_sequential)

### Foreign Keys

* order_id → orders.order_id

---

## reviews

**Source:** `olist_order_reviews_dataset.csv`

### Columns

| Column                  | Description               |
| ----------------------- | ------------------------- |
| review_id               | Review identifier         |
| order_id                | Associated order          |
| review_score            | Rating score              |
| review_comment_title    | Review title              |
| review_comment_message  | Review message            |
| review_creation_date    | Review creation date      |
| review_answer_timestamp | Review response timestamp |

### Primary Key

* review_id

### Foreign Keys

* order_id → orders.order_id

---

## products

**Source:** `olist_products_dataset.csv`

### Columns

| Column                     | Description         |
| -------------------------- | ------------------- |
| product_id                 | Product identifier  |
| product_category_name      | Product category    |
| product_name_lenght        | Product name length |
| product_description_lenght | Description length  |
| product_photos_qty         | Number of photos    |
| product_weight_g           | Product weight      |
| product_length_cm          | Product length      |
| product_height_cm          | Product height      |
| product_width_cm           | Product width       |

### Primary Key

* product_id

### Foreign Keys

* product_category_name → category_translation.product_category_name

---

## sellers

**Source:** `olist_sellers_dataset.csv`

### Columns

| Column                 | Description            |
| ---------------------- | ---------------------- |
| seller_id              | Seller identifier      |
| seller_zip_code_prefix | Seller zip code prefix |
| seller_city            | Seller city            |
| seller_state           | Seller state           |

### Primary Key

* seller_id

---

## category_translation

**Source:** `product_category_name_translation.csv`

### Columns

| Column                        | Description         |
| ----------------------------- | ------------------- |
| product_category_name         | Portuguese category |
| product_category_name_english | English category    |

### Primary Key

* product_category_name

---

## geolocation

**Source:** `olist_geolocation_dataset.csv`

### Columns

| Column                      | Description     |
| --------------------------- | --------------- |
| geolocation_zip_code_prefix | Zip code prefix |
| geolocation_lat             | Latitude        |
| geolocation_lng             | Longitude       |
| geolocation_city            | City            |
| geolocation_state           | State           |

### Notes

This table will be used only for optional geographic analysis and mapping.

No primary key is defined because multiple records can exist for the same zip code prefix.

---

# Entity Relationship Diagram

customers
│
└── customer_id
│
▼
orders
│
└── order_id
│
▼
order_items
│      │
│      └──────────► sellers
│
└──────────► products
│
▼
category_translation

orders ─────────────► payments

orders ─────────────► reviews

customers/sellers ─► geolocation (optional)

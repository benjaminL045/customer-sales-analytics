# Olist E-Commerce Dataset — Data Understanding

## 1. Project Overview

This project uses the Olist Brazilian E-Commerce dataset to perform end-to-end data analytics using SQL, Python, and dashboarding tools.

The dataset represents a real-world online marketplace where customers place orders, sellers fulfill them, and payments and reviews are recorded.

---

## 2. Business Model Overview

This dataset simulates an e-commerce platform with the following flow:

1. Customers place orders
2. Orders contain one or more products (order items)
3. Sellers fulfill order items
4. Payments are made per order
5. Customers leave reviews after delivery
6. Products belong to categories

---

## 3. Core Data Architecture

### ⭐ Fact Table (Central Transaction Table)

#### `order_items`

This is the main fact table for analysis.

Each row represents a product inside an order.

**Key fields:**

* order_id
* order_item_id
* product_id
* seller_id
* price
* freight_value

**Why this is the fact table:**

* Contains revenue-related data
* Connects customers, products, and sellers
* Supports all sales analysis

---

## 4. Dimension Tables

### 👤 Customers (`olist_customers_dataset`)

Represents buyers in the system.

**Fields:**

* customer_id
* customer_unique_id
* customer_city
* customer_state
* customer_zip_code_prefix

**Use cases:**

* Customer segmentation
* Geographic analysis
* Repeat vs new customers

---

### 📦 Orders (`olist_orders_dataset`)

Represents purchase events.

**Fields:**

* order_id
* customer_id
* order_status
* order_purchase_timestamp
* order_delivered_customer_date
* order_estimated_delivery_date

**Use cases:**

* Order lifecycle analysis
* Delivery performance
* Cancellation tracking

---

### 🛍 Products (`olist_products_dataset`)

Represents items sold.

**Fields:**

* product_id
* product_category_name
* product_weight_g
* product_length_cm
* product_height_cm
* product_width_cm

**Use cases:**

* Category performance
* Product profiling
* Logistics analysis

---

### 🌍 Category Translation (`product_category_name_translation`)

Maps Portuguese categories to English.

**Fields:**

* product_category_name
* product_category_name_english

**Use cases:**

* Readable reporting
* Category grouping

---

### 💳 Payments (`olist_order_payments_dataset`)

Represents payment transactions per order.

**Fields:**

* order_id
* payment_type
* payment_installments
* payment_value

**Use cases:**

* Revenue validation
* Payment behaviour analysis

---

### ⭐ Reviews (`olist_order_reviews_dataset`)

Represents customer feedback.

**Fields:**

* review_id
* order_id
* review_score
* review_comment_message
* review_creation_date

**Use cases:**

* Customer satisfaction analysis
* Delivery impact on ratings

---

### 🏪 Sellers (`olist_sellers_dataset`)

Represents marketplace sellers.

**Fields:**

* seller_id
* seller_city
* seller_state

**Use cases:**

* Seller performance analysis
* Supply-side insights

---

### 🌍 Geolocation (`olist_geolocation_dataset`)

Maps zip codes to latitude/longitude.

**Fields:**

* geolocation_zip_code_prefix
* geolocation_lat
* geolocation_lng
* geolocation_city
* geolocation_state

**Use cases:**

* Regional mapping (optional)
* Geographic distribution analysis

---

## 5. Data Relationships (Entity Structure)

### Primary Relationships:

* customers → orders (1:M)
* orders → order_items (1:M)
* order_items → products (M:1)
* products → category_translation (M:1)
* orders → payments (1:M)
* orders → reviews (1:1 or 1:M)
* order_items → sellers (M:1)

---

## 6. Star Schema Design

### Fact Table:

* order_items

### Dimension Tables:

* customers
* orders
* products
* sellers
* payments
* reviews
* category_translation

---

## 7. Key Business Questions

### Revenue Analysis

* What is total revenue over time?
* What are monthly sales trends?
* Which categories generate the most revenue?

---

### Customer Analysis

* Who are the highest-value customers?
* What percentage of customers are repeat buyers?
* Where are customers located geographically?

---

### Product Analysis

* Which product categories perform best?
* Which products generate the most revenue?
* How does product size/weight affect sales?

---

### Operational Analysis

* What is the average delivery time?
* How often are deliveries delayed?
* Which states have the longest delivery times?

---

### Customer Satisfaction

* Do delivery delays impact review scores?
* What is the distribution of review ratings?
* How do reviews correlate with revenue?

---

### Payment Analysis

* What are the most common payment methods?
* Do installment payments affect order value?
* How does payment method vary by region?

---

## 8. Data Quality Observations

* Orders may contain multiple items (1:M relationship)
* Some orders may not have delivery timestamps (cancellations/delays)
* Reviews may be missing for some orders
* Geolocation data is noisy and optional for core analysis

---

## 9. Analytical Opportunities

This dataset supports advanced analytics such as:

* Customer segmentation (RFM analysis)
* Cohort analysis (repeat customers over time)
* Delivery performance impact on satisfaction
* Category profitability analysis
* Seller performance benchmarking
* Payment behaviour trends

---

## 10. Conclusion

This dataset provides a complete e-commerce ecosystem suitable for:

* SQL analytics
* Python data analysis
* dashboard development
* business insight generation

It forms the foundation for an end-to-end data analytics portfolio project.

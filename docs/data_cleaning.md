# Data Cleaning & Preparation

## Overview

This document outlines the data cleaning and preparation steps performed on the Olist E-commerce dataset before conducting analytical SQL queries.

The objective of this phase was to transform raw imported data into analysis-ready datasets while preserving the original source tables.

---

## Cleaning Strategy

The original CSV files were imported into PostgreSQL without modifying the raw data.

Instead of updating or deleting records from source tables, analysis-ready views were created. This approach preserves data integrity and allows the original data to remain available for future reference.

Key goals of the cleaning phase:

* Identify missing values
* Check for duplicate records
* Validate imported data
* Create clean analytical views
* Build a consolidated sales dataset for reporting

---

## Data Quality Checks

Several validation checks were performed on the imported tables.

### Missing Values

The following fields were checked for missing values:

* `orders.customer_id`
* `order_items.product_id`
* `reviews.review_score`
* `products.product_category_name`

These checks help identify records that may affect downstream analysis.

### Duplicate Records

Duplicate checks were performed on key identifiers including:

* `customers.customer_id`
* `orders.order_id`

As primary keys, these fields should contain unique values.

---

## Clean Orders View

### Purpose

Business analyses such as revenue and customer purchasing behaviour should only include completed transactions.

### Transformation

A view named `clean_orders` was created containing only orders with:

```sql
order_status = 'delivered'
```

This excludes cancelled, unavailable, and other incomplete order states.

### Benefit

Ensures sales metrics are based on successfully completed purchases.

---

## Clean Reviews View

### Purpose

Review analysis requires a valid review score.

### Transformation

A view named `clean_reviews` was created containing only rows where:

```sql
review_score IS NOT NULL
```

### Benefit

Prevents missing review scores from distorting customer satisfaction analysis.

---

## Fact Sales View

### Purpose

Analytical queries often require combining orders and order items.

To simplify future reporting, a consolidated sales view named `fact_sales` was created.

### Data Included

* Order ID
* Customer ID
* Product ID
* Seller ID
* Product Price
* Freight Cost
* Total Sale Value
* Purchase Timestamp
* Delivery Timestamp

### Calculation

Total sale value is calculated as:

```sql
price + freight_value
```

### Benefit

Provides a central dataset for revenue, customer, product, and seller analysis.

---

## Product Sales View

### Purpose

Enable category-level product analysis.

### Transformation

`fact_sales` was joined with the `products` table to create the `product_sales` view.

### Benefit

Allows analysis of:

* Product categories
* Category revenue
* Product performance
* Category rankings

---

## Review Sales View

### Purpose

Enable analysis of customer satisfaction alongside sales activity.

### Transformation

`fact_sales` was joined with `clean_reviews`.

### Benefit

Supports analyses such as:

* Revenue by review score
* Review score distributions
* Customer satisfaction trends

---

## Category Translation Relationship

During schema validation, an attempt was made to create a foreign key relationship between:

```text
products.product_category_name
→
category_translation.product_category_name
```

The constraint failed because several category values in the products dataset did not exist in the translation table.

Example:

```text
pc_gamer
```

### Decision

The foreign key constraint was not enforced.

The translation table is instead treated as a lookup table and joined when category translations are required.

### Reasoning

This approach preserves all product records while accommodating incomplete category mappings in the source dataset.

---

## Final Analytical Views

The following views were created during the cleaning phase:

| View          | Purpose                        |
| ------------- | ------------------------------ |
| clean_orders  | Delivered orders only          |
| clean_reviews | Valid review scores only       |
| fact_sales    | Core sales dataset             |
| product_sales | Sales with product information |
| review_sales  | Sales combined with reviews    |

---

## Outcome

At the completion of this phase:

* Raw data remained unchanged
* Data quality issues were documented
* Analysis-ready views were created
* A consolidated sales dataset was prepared

The database is now ready for exploratory analysis, KPI development, dashboard creation, and Python-based analytics.



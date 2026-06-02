# Data Import Notes (Olist E-commerce Dataset)

## Overview
This document records the data import process for the Olist e-commerce dataset into PostgreSQL. The dataset consists of multiple CSV files representing customers, orders, products, sellers, payments, reviews, and geolocation data.

---

## Database Setup
- Database: ecommerce_analytics
- Tool: pgAdmin (PostgreSQL 18)
- Import Method: pgAdmin Import Tool (GUI)

---

## Tables Imported

All CSV files were imported into PostgreSQL tables in the following order:

### 1. Dimension Tables
- customers
- products
- sellers
- category_translation
- geolocation

### 2. Core Fact Table
- orders

### 3. Fact Tables
- order_items
- payments
- reviews

---

## Import Order Reasoning
Tables were imported based on dependency order:

- Dimension tables first (no dependencies)
- Orders table next (depends on customers)
- Fact tables last (depend on orders, products, sellers)

This ensured foreign key relationships could be enforced later.

---

## Issues Encountered

### 1. Reviews Table Import Failure
- Initial import of `reviews` table failed multiple times.
- Cause: inconsistent timestamp formatting and empty values.

### Solution:
- Modified schema to use TEXT for timestamp fields during import.
- Successfully re-imported data.
- (Optional) Can later convert to TIMESTAMP after cleaning.

---

### 2. Foreign Key Constraint Issue (products → category_translation)
- Attempting to enforce foreign key constraint failed.
- Error: missing category values such as `pc_gamer`.

### Decision:
- Foreign key constraint was removed.
- Relationship retained logically but not enforced physically.
- Treated as a lookup relationship instead of strict FK.

---

### 3. General Import Notes
- pgAdmin GUI importer used for all CSV files.
- UTF-8 encoding selected for compatibility.
- Header row enabled for all imports.
- Delimiter set to comma (,).

---

## Data Quality Observations
- Dataset is mostly clean but contains:
  - Missing category mappings
  - Inconsistent timestamp formatting
  - Some nullable fields in reviews

These issues were handled during schema design and import phase.

---

## Outcome
All datasets were successfully imported into PostgreSQL and are ready for:
- SQL-based analysis
- Data aggregation
- Business intelligence dashboarding
- Advanced analytics (window functions, joins, etc.)

---

## Next Step
Proceed to SQL analysis phase:
- Revenue analysis
- Customer segmentation
- Product performance
- Delivery vs review analysis
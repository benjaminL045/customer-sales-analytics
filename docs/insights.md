# 📊 E-commerce Sales & Customer Analytics Report

## 🧭 Overview

This analysis explores an e-commerce marketplace dataset to understand:

- Revenue growth patterns over time
- Product category performance
- Customer purchasing behaviour
- Customer value concentration
- Seller performance
- Delivery performance
- Customer satisfaction signals
- Data quality and structural integrity

The dataset represents **order-level marketplace transactions**, where individual orders may contain multiple product line items.

---

# 📈 1. Business Growth & Revenue Trends

## Key Metrics

| Metric | Value |
|---|---:|
| Total Revenue | $15,419,773.75 |
| Total Orders | 96,478 |
| Average Order Value | $159.83 |

---

## Revenue Growth Over Time

The platform demonstrates strong growth from late 2016 through 2018.

### Key observations:

- Early stage (2016):
  - Limited transaction volume
  - Revenue remained below $50K monthly

- Growth phase (2017):
  - Monthly revenue increased consistently
  - Order volume expanded significantly
  - November 2017 became a major growth period with approximately **$1.15M revenue**

- Mature growth phase (2018):
  - Monthly revenue consistently exceeded **$900K**
  - Revenue stabilised around **$1M+ per month**

### Insight:

The platform experienced rapid marketplace adoption, with growth driven by increasing order volume and customer acquisition.

---

# 🛒 2. Product Category Performance

Revenue is concentrated among a small number of product categories.

## Top Revenue Categories

| Category | Revenue |
|---|---:|
| Beauty & Health | $1,412,089.53 |
| Watches & Gifts | $1,264,333.12 |
| Bed, Bath & Table | $1,225,209.26 |
| Sports & Leisure | $1,118,256.91 |
| Computers & Accessories | $1,032,723.77 |
| Furniture & Decoration | $880,329.92 |
| Household Utilities | $758,392.25 |
| Cool Stuff | $691,680.89 |
| Automotive | $669,454.75 |
| Garden Tools | $567,145.68 |

---

## Key patterns:

- Beauty & Health generated the highest category revenue (**$1.41M**)
- The top 5 categories each generated over **$1M**
- Lower-performing categories contributed significantly less revenue

### Insight:

Revenue depends heavily on a small group of successful categories, creating category concentration risk.

---

# 📊 3. Category Performance Over Time

Category trends show that leading categories maintain consistent contribution throughout the dataset.

### Strong-performing categories:

- Beauty & Health
- Watches & Gifts
- Bed, Bath & Table
- Sports & Leisure
- Computers & Accessories

### Insight:

Core categories provide stable revenue foundations, while smaller categories contribute less predictable sales volume.

---

# 👥 4. Customer Behaviour Analysis

## 4.1 Repeat Customer Analysis

Repeat customer analysis identified:

```
Repeat customers: 0
```

### Insight:

The dataset shows extremely limited repeat purchasing behaviour.

Most customers appear to make only one transaction.

### Business implication:

The marketplace is primarily acquisition-driven rather than retention-driven.

Potential improvements:

- Loyalty programs
- Customer re-engagement campaigns
- Personalised recommendations

---

# 🛒 4.2 Basket Size Analysis

Average order value:

```
$159.83
```

Average items per order:

```
~1.1 items
```

### Insight:

Customer purchases are mainly single-item transactions.

Potential opportunity:

- Product bundles
- Cross-selling recommendations
- Multi-item discounts

---

# 💰 5. Customer Revenue Concentration

## 5.1 Highest Value Customers

Top customer lifetime values:

| Rank | Lifetime Revenue |
|---|---:|
| 1 | $13,664.08 |
| 2 | $7,274.88 |
| 3 | $6,929.31 |
| 4 | $6,922.21 |
| 5 | $6,726.66 |

---

## Insight:

The highest-value customers contribute significantly more revenue than typical customers.

Revenue distribution is highly uneven.

---

# 📊 5.2 Customer Revenue Deciles

Customer revenue distribution:

| Customer Segment | Revenue |
|---|---:|
| Bottom 10% | $302,116.07 |
| 20% | $453,042.32 |
| 30% | $595,045.17 |
| 40% | $737,609.27 |
| 50% | $921,867.18 |
| 60% | $1,115,017.82 |
| 70% | $1,377,411.57 |
| 80% | $1,716,313.07 |
| 90% | $2,334,040.63 |
| Top 10% | $5,867,310.65 |

---

### Insight:

The top 10% of customers generate approximately **38% of total revenue**.

This indicates strong customer value concentration.

---

# 🚚 6. Delivery Performance

Average delivery time:

```
12.0 days
```

### Insight:

The platform provides a baseline delivery experience of approximately 12 days.

Potential improvements:

- Faster logistics processing
- Seller performance monitoring
- Delivery prediction models

---

# 🏪 7. Seller Performance

## Top Sellers by Revenue

| Seller | Revenue |
|---|---:|
| Seller 1 | $247,007.06 |
| Seller 2 | $237,806.69 |
| Seller 3 | $231,220.43 |
| Seller 4 | $230,797.02 |
| Seller 5 | $200,833.50 |

---

### Insight:

Seller revenue contribution is uneven, with several high-performing sellers generating significantly more revenue.

Marketplace strategy should focus on:

- Supporting top sellers
- Maintaining seller quality
- Improving underperforming seller performance

---

# ⭐ 8. Customer Review Analysis

Review scores show differences in customer behaviour.

Analysis examined:

- Number of orders
- Revenue contribution
- Average order value by review score

### Insight:

Customer satisfaction can influence repeat purchasing and marketplace reputation.

Improving:

- Delivery speed
- Product quality
- Seller reliability

can improve customer experience.

---

# 📦 9. Data Quality Insights

## Dataset Validation

| Check | Result |
|---|---:|
| Fact Sales Rows | 110,197 |
| Unique Orders | 96,478 |
| Duplicate Rows | 0 |

---

## Missing Values

Missing data identified:

- Delivery dates: 8 records
- Product categories: 1,537 records
- Review scores: 827 records

### Insight:

The dataset is structurally reliable, but missing category and review information should be handled for more accurate reporting.

---

# 📌 10. Key Business Insights

## 🔥 1. Strong marketplace growth

Revenue increased significantly from 2016 to 2018.

---

## 💰 2. Revenue concentration

Top customers contribute a disproportionate share of revenue.

---

## 🛒 3. Low repeat purchasing

Customer retention is the biggest growth opportunity.

---

## 📦 4. Category dependency

A small number of categories generate most revenue.

---

## 🚚 5. Operational improvement opportunities

Delivery speed and seller performance represent opportunities for improving customer experience.

---

# 🚀 11. Strategic Recommendations

## 1. Improve customer retention

- Loyalty programs
- Personalised marketing
- Customer lifecycle campaigns

---

## 2. Increase basket size

- Product recommendations
- Bundling strategies
- Discounts for multiple purchases

---

## 3. Protect high-value customers

- VIP customer segmentation
- Exclusive promotions
- Targeted retention campaigns

---

## 4. Strengthen profitable categories

- Expand high-performing categories
- Optimise marketing investment

---

## 5. Improve marketplace operations

- Reduce delivery times
- Monitor seller performance
- Improve product classification quality

---

# 🧾 Final Summary

The analysis shows a **rapidly growing but highly concentrated e-commerce marketplace**.

Main characteristics:

- $15.4M total revenue generated
- Strong growth from 2016–2018
- Revenue concentrated among top customers and categories
- Very limited repeat purchasing behaviour
- Small average basket size
- Operational improvement opportunities

## Final conclusion:

> The platform has strong growth potential, but long-term sustainability depends on improving customer retention, increasing basket size, strengthening operational performance, and reducing dependence on a small number of revenue drivers.
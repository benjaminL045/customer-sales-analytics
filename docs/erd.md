```mermaid
erDiagram

CUSTOMERS ||--o{ ORDERS : places
ORDERS ||--o{ ORDER_ITEMS : contains
ORDER_ITEMS }o--|| PRODUCTS : includes
PRODUCTS }o--|| CATEGORY_TRANSLATION : mapped_to

ORDERS ||--o{ PAYMENTS : has
ORDERS ||--o{ REVIEWS : generates

ORDER_ITEMS }o--|| SELLERS : fulfilled_by
```
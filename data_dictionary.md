# 📑 Data Dictionary – UK E-Commerce Sales Analysis

**Dataset:** `bigquery-public-data.ecommerce_uk.sales`  

This dataset contains transactional data from a UK online retailer.

---

## 1. Transaction-Level Data

| Field | Description | Type | Transformation | Usage |
|-------|-------------|------|----------------|-------|
| InvoiceNo | Unique transaction ID | STRING | None | Identify orders |
| StockCode | Product SKU | STRING | None | Product-level analysis |
| Description | Product name | STRING | Clean whitespace | Product sales analysis |
| Quantity | Number of units sold | INT64 | Ensure positive values | Calculate total units sold |
| InvoiceDate | Date and time of transaction | TIMESTAMP | Convert to DATE | Time-series analysis |
| UnitPrice | Price per unit in GBP | FLOAT | None | Revenue calculations |
| CustomerID | Unique customer identifier | STRING | Handle missing IDs | Customer segmentation |
| Country | Customer country | STRING | Standardize names | Regional analysis |

---

## 🔑 Notes
- Negative quantities may indicate returns; handle appropriately.  
- Ensure `CustomerID` is not NULL for customer-level analysis.  
- Revenue per transaction can be calculated as `Quantity * UnitPrice`.  

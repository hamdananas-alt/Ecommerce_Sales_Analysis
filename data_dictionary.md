# 📑 Data Dictionary – E-Commerce Sales Analysis  

**Dataset:** `bigquery-public-data.google_analytics_sample.ga_sessions_*`  

This dataset contains Google Analytics session data from the Google Merchandise Store (an e-commerce site).  

---

## 1. Session-Level Data (`ga_sessions_*`)  

| Field | Description | Type | Transformation | Usage |
|-------|-------------|------|----------------|-------|
| date | Session date (YYYYMMDD) | STRING | Convert to DATE | Time-series analysis |
| fullVisitorId | Unique user ID | STRING | None | Customer tracking |
| visitId | Unique session ID | INT64 | None | Session identification |
| trafficSource.source | Source of traffic (google, direct, etc.) | STRING | Group by channel | Marketing analysis |
| trafficSource.medium | Medium (organic, referral, cpc, etc.) | STRING | Group by type | Marketing efficiency |
| device.deviceCategory | Device used (desktop, mobile, tablet) | STRING | Normalize values | Device performance |
| geoNetwork.country | Country of visitor | STRING | Normalize/standardize | Regional analysis |

---

## 2. Transaction Data (nested in `totals`)  

| Field | Description | Type | Transformation | Usage |
|-------|-------------|------|----------------|-------|
| totals.transactions | Number of transactions in session | INT64 | None | Order volume |
| totals.transactionRevenue | Transaction revenue (in micros) | INT64 | Divide by 1e6 → USD | Revenue KPIs |
| totals.visits | Number of visits | INT64 | None | Session count |
| totals.hits | Number of interactions within session | INT64 | None | Engagement |

---

## 3. Product Data (`hits.product`)  

| Field | Description | Type | Transformation | Usage |
|-------|-------------|------|----------------|-------|
| hits.product.v2ProductName | Product name | STRING | Clean whitespace | Product sales |
| hits.product.v2ProductCategory | Product category | STRING | Replace NULLs | Category trends |
| hits.product.productQuantity | Quantity purchased | INT64 | None | Units sold |
| hits.product.productRevenue | Product-level revenue (micros) | INT64 | Convert to USD | Product revenue |
| hits.product.productSKU | Stock-keeping unit (SKU) | STRING | None | Unique product identifier |

---

## 4. Engagement Metrics  

| Field | Description | Type | Transformation | Usage |
|-------|-------------|------|----------------|-------|
| totals.pageviews | Number of pageviews in session | INT64 | None | Engagement depth |
| totals.timeOnSite | Total session duration (seconds) | INT64 | Convert to minutes | Engagement intensity |
| totals.bounces | Bounce indicator (1 = bounce) | INT64 | Binary | Bounce rate analysis |

---

## 🔑 Notes
- All revenue fields are stored in **micros** (multiply/divide by 1,000,000 for USD).  
- Some product fields may be **nested** (arrays) and require `UNNEST()` in BigQuery.  
- Not all sessions include transactions → filtering required when focusing on revenue.  

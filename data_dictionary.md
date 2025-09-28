# 📑 Data Dictionary – E-Commerce Sales Analysis

Dataset: `bigquery-public-data.google_analytics_sample.ga_sessions_*`

| Field | Description | Type | Transformation | Usage |
|-------|-------------|------|----------------|-------|
| date | Session date in YYYYMMDD | STRING | Convert to DATE | Time-series trends |
| fullVisitorId | Unique visitor ID | STRING | None | Customer segmentation |
| totals.transactions | Number of transactions in session | INT64 | None | Order count, conversion |
| totals.transactionRevenue | Revenue (in micros) | INT64 | Divide by 1e6 → USD | Revenue KPIs |
| hits.product.v2ProductCategory | Product category | STRING | Replace NULLs | Product analysis |
| geoNetwork.country | Visitor country | STRING | Normalize names | Geo insights |

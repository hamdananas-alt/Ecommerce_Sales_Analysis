-- ======================================================
-- 📊 SQL Queries – E-Commerce Sales Analysis
-- Dataset: bigquery-public-data.google_analytics_sample.ga_sessions_*
-- Author: Your Name
-- ======================================================

-- ======================================================
-- 1. Exploration Queries
-- ======================================================

-- 1.1 Get row count by date
SELECT
  date,
  COUNT(*) AS sessions
FROM `bigquery-public-data.google_analytics_sample.ga_sessions_*`
GROUP BY date
ORDER BY date;

-- 1.2 Preview distinct traffic sources
SELECT DISTINCT
  trafficSource.source,
  trafficSource.medium
FROM `bigquery-public-data.google_analytics_sample.ga_sessions_*`
LIMIT 50;

-- ======================================================
-- 2. Cleaning & Preparation Queries
-- ======================================================

-- 2.1 Convert revenue from micros to USD
SELECT
  fullVisitorId,
  date,
  totals.transactionRevenue / 1e6 AS revenue_usd
FROM `bigquery-public-data.google_analytics_sample.ga_sessions_*`
WHERE totals.transactionRevenue IS NOT NULL;

-- 2.2 Handle nested product data with UNNEST
SELECT
  date,
  hits.product.v2ProductName AS product_name,
  hits.product.v2ProductCategory AS product_category,
  hits.product.productQuantity AS quantity,
  hits.product.productRevenue / 1e6 AS product_revenue_usd
FROM `bigquery-public-data.google_analytics_sample.ga_sessions_*`,
  UNNEST(hits) AS hits
WHERE hits.product.v2ProductName IS NOT NULL;

-- ======================================================
-- 3. Analysis Queries
-- ======================================================

-- 3.1 Revenue by country
SELECT
  geoNetwork.country,
  SUM(totals.transactionRevenue) / 1e6 AS total_revenue_usd
FROM `bigquery-public-data.google_analytics_sample.ga_sessions_*`
WHERE totals.transactionRevenue IS NOT NULL
GROUP BY geoNetwork.country
ORDER BY total_revenue_usd DESC;

-- 3.2 Top product categories by revenue
SELECT
  hits.product.v2ProductCategory AS category,
  SUM(hits.product.productRevenue) / 1e6 AS revenue_usd
FROM `bigquery-public-data.google_analytics_sample.ga_sessions_*`,
  UNNEST(hits) AS hits
WHERE hits.product.v2ProductCategory IS NOT NULL
GROUP BY category
ORDER BY revenue_usd DESC;

-- 3.3 Conversion rate by device
SELECT
  device.deviceCategory,
  COUNTIF(totals.transactions > 0) / COUNT(*) AS conversion_rate
FROM `bigquery-public-data.google_analytics_sample.ga_sessions_*`
GROUP BY device.deviceCategory
ORDER BY conversion_rate DESC;

-- ======================================================
-- 4. Power BI Export Queries
-- ======================================================

-- 4.1 Create a flattened table for Power BI dashboard
SELECT
  date,
  fullVisitorId,
  geoNetwork.country,
  device.deviceCategory,
  trafficSource.source,
  trafficSource.medium,
  totals.transactions,
  totals.transactionRevenue / 1e6 AS revenue_usd,
  totals.pageviews,
  totals.timeOnSite,
  hits.product.v2ProductName AS product_name,
  hits.product.v2ProductCategory AS product_category,
  hits.product.productQuantity,
  hits.product.productRevenue / 1e6 AS product_revenue_usd
FROM `bigquery-public-data.google_analytics_sample.ga_sessions_*`,
  UNNEST(hits) AS hits
WHERE totals.transactions IS NOT NULL;

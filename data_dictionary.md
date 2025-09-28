# Data Dictionary – Google Analytics Sample Dataset

This dataset comes from the **Google Analytics Sample Dataset** in **BigQuery**:  
`bigquery-public-data.google_analytics_sample.ga_sessions_*`  

It contains session-level data with nested product details from the Google Merchandise Store (Aug 2016 – Aug 2017).  

---

## 🔑 Key Tables & Fields

### Session-Level Fields
| Field | Description | Example |
|-------|-------------|---------|
| `fullVisitorId` | Unique identifier for a visitor (user). | `9434660333145465023` |
| `visitId` | Unique identifier for a session. | `1501545600` |
| `date` | Date of the session (YYYYMMDD). | `20170801` |
| `visitNumber` | Count of visits by the same user. | `3` |
| `visitStartTime` | Timestamp for the start of the session. | `1501545600` |

---

### Totals (Aggregated per Session)
| Field | Description | Example |
|-------|-------------|---------|
| `totals.pageviews` | Number of pageviews in the session. | `5` |
| `totals.visits` | Number of visits (usually `1` per session). | `1` |
| `totals.hits` | Number of hits (interactions) in the session. | `10` |
| `totals.transactions` | Number of transactions in the session. | `1` |
| `totals.transactionRevenue` | Total revenue from transactions in micros (divide by 1,000,000 for currency). | `30000000` → $30.00 |

---

### Product-Level Fields (Nested under `hits`)
To query these, you must use **`UNNEST(hits)`** and **`UNNEST(hits.product)`**.  

| Field | Description | Example |
|-------|-------------|---------|
| `hits.product.v2ProductName` | Product name. | `Google Men's T-Shirt` |
| `hits.product.v2ProductCategory` | Product category. | `Apparel` |
| `hits.product.productRevenue` | Revenue for the product (micros). | `15000000` → $15.00 |
| `hits.product.productQuantity` | Quantity of product purchased. | `2` |

---

### Geographic & Device Fields
| Field | Description | Example |
|-------|-------------|---------|
| `geoNetwork.country` | Country of the session. | `United States` |
| `geoNetwork.city` | City of the session. | `New York` |
| `device.deviceCategory` | Device type. | `desktop`, `mobile`, `tablet` |
| `device.operatingSystem` | User’s operating system. | `Windows` |

---

### Traffic Source Fields
| Field | Description | Example |
|-------|-------------|---------|
| `trafficSource.source` | Referring source (e.g., search engine, site). | `google` |
| `trafficSource.medium` | Medium of the traffic. | `organic`, `cpc`, `referral` |
| `trafficSource.campaign` | Campaign name (if tagged). | `(not set)` |

---

## ⚠️ Notes
- **Revenue values** are stored in **micros**. Divide by 1,000,000 to convert to standard currency.  
- Many fields contain **NULL or `(not set)` values**. Handle with care in queries.  
- Product-level data requires **nested queries with UNNEST**.  

---

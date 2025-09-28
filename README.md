# Google Analytics E-Commerce Analysis

## 📌 Project Overview
This project explores e-commerce data using the **Google Analytics Sample Dataset** available in **Google BigQuery**.  
The goal is to answer the business question:

**“What drives e-commerce revenue and user behavior on the website?”**

I use **SQL for data extraction and transformation**, and **Power BI** for visualization.

---

## 🔄 Data Analysis Steps
1. **Ask** – Define the business problem: Identify key drivers of e-commerce revenue.  
2. **Prepare** – Work with Google Analytics sample data in BigQuery.  
3. **Process** – Clean and transform data with SQL (flatten nested fields, remove NULLs, aggregate).  
4. **Analyze** – Calculate KPIs such as revenue, conversion rate, and product performance.  
5. **Share** – Present insights in an interactive Power BI dashboard.  

---

## 📊 Dataset
- **Source:** BigQuery Public Dataset  
- **Table:** `bigquery-public-data.google_analytics_sample.ga_sessions_*`  
- **Coverage:** August 2016 – August 2017 (sample data from the Google Merchandise Store)  
- **Granularity:** Session-level data with nested product-level details  

---

## 📁 Repository Structure
├── README.md # Project overview
├── data_dictionary.md # Dataset schema & field descriptions
├── sql/ # SQL scripts for data exploration & transformation
├── powerbi/ # Power BI dashboard files & screenshots


---

## 🚀 Tools & Skills Demonstrated
- **BigQuery SQL** – Data extraction, transformation, nested fields (`UNNEST()`)  
- **Power BI** – Interactive dashboards, DAX measures, KPIs  
- **Data Analysis** – E-commerce metrics, trend analysis, customer insights  

---

## 📌 Deliverables
- Cleaned dataset queries (SQL)  
- Power BI dashboard showcasing revenue trends, top products, and user behavior insights  
- Documentation (README + data dictionary)  

---

## 📜 License
This project is for **educational and portfolio purposes only**.  
The dataset is publicly available from **Google BigQuery**.  

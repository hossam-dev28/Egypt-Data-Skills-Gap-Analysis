# 📊 Egypt Tech Job Market & Data Skills Gap Analysis
![Python](https://img.shields.io/badge/Python-3776AB?style=flat&logo=python&logoColor=white)
![SQL Server](https://img.shields.io/badge/SQL_Server-CC2927?style=flat&logo=microsoft-sql-server&logoColor=white)
![Power BI](https://img.shields.io/badge/Power_BI-F2C811?style=flat&logo=powerbi&logoColor=black)
![Selenium](https://img.shields.io/badge/Selenium-43B02A?style=flat&logo=selenium&logoColor=white)
![License: MIT](https://img.shields.io/badge/License-MIT-yellow?style=flat)



---
## 🎯 Business Problem
Many entry-level candidates and professionals in Egypt struggle to identify the exact technical skills and tools actually demanded by the local tech market. The disconnect between academic training and real-world employer requirements leaves job seekers misdirected in their learning efforts. 

Furthermore, there is a massive ambiguity in how job titles are used by employers locally. This project solves this problem by extracting, cleaning, and analyzing live market data from Tanqeeb.com to provide a clear, data-driven roadmap for data professionals, exposing the reality of tool demand across 7 distinct data roles.

## 📌 Project Overview
An end-to-end data analytics pipeline built to uncover the real demand for technical skills in the Egyptian market. By scraping live job postings, designing a relational Snowflake data model, and visualizing the results, this project highlights the critical skills gap, core tool stacks, and geographic distribution across 1,595 verified, clean data roles.

###  Dashboard Executive Summary
<img width="1332" height="744" alt="Summary" src="https://github.com/user-attachments/assets/ac92e2c2-a837-41e1-a631-32f231cb3117" />

---

## 🛠️ Tech Stack
* **Web Scraping:** Python (`undetected_chromedriver`, `Selenium`, `Pandas`, `Regex`)
* **Data Engineering & Modeling:** Microsoft SQL Server (T-SQL, Snowflake Schema, OBT Flat View)
* **Data Visualization:** Power BI (DAX, Matrix Visuals, Interactive Dashboards)

## ⚙️ Technical Challenges & Solutions

### 1. Anti-Scraping Mechanisms
**Problem:** Tanqeeb.com utilizes Cloudflare and bot detection, blocking standard automation scripts.
**Solution:** Implemented `undetected_chromedriver` with Selenium to simulate human browsing behavior and randomized scroll delays, successfully extracting 2,100+ raw job postings without IP bans.

### 2. Unstructured Text Data & Experience Extraction
**Problem:** Skills and experience requirements were embedded in large, unstructured HTML text blocks.
**Solution:** * Used Python **Regex** (`re.findall`) to accurately extract numeric experience levels from the text.
* Utilized a T-SQL **CROSS JOIN** with `LIKE` operators to dynamically map specific skills (SQL, Python, Excel, AWS, etc.) from raw description text into structured columns.

### 3. The Many-to-Many Relationship & Data Architecture
**Problem:** A single job posting requires multiple skills, and one skill applies to multiple jobs. Flat file storage causes massive row duplication, while counting raw rows inflates the actual job volume and distorts percentage metrics.
**Solution:** Designed a robust **Snowflake Schema** in SQL Server. Built a dedicated **Bridge Table** (`Bridge_JobSkills`) to connect `Fact_Jobs` with `Dim_Skills`. 

<details>
<summary>📐 View Data Model Architecture</summary>
<br>
  <img width="1316" height="768" alt="erd" src="https://github.com/user-attachments/assets/f1819ed0-54b9-499c-a0c5-c5de7b87075b" />
</details>

### 4. Noise Filtering & Schema Cleaning
**Problem:** Generic keyword matching during scraping brought in massive noise (e.g., Software Engineers, Civil Engineers) under the "Engineer" category, heavily diluting the true Data Engineering metrics.
**Solution:** Built an advanced T-SQL cleaning pipeline within the View using specific `LIKE` criteria to filter out non-data roles. This rigorous process filtered the initial 2,100+ raw records down to **1,595 verified, pure data vacancies**.

---

## 💡 Key Market Insights & Data Anomalies Explained
The final dashboard uncovered structural realities about the Egyptian tech ecosystem, some of which challenge global tech assumptions:

1. **The Data Analyst vs. Data Entry Reality:** The dashboard shows **Excel (66.67%)** heavily dominating the "Data Analyst" role, while **SQL sits at a lower 6.67%**. This reveals a critical local insight: *The Egyptian market heavily confounds the 'Data Analyst' title with Advanced Data Entry or basic reporting roles, relying on spreadsheets rather than relational databases.*

2. **The "Traditional" Data Engineering Bias:** After filtering out software engineering noise, the verified "Data Engineer" roles on this specific platform showed a 100% baseline dependency on SQL and traditional ETL frameworks, with noticeably lower demand for modern Cloud/Python stacks. This reveals a strong local market bias: many companies heavily relying on Tanqeeb are still operating on traditional on-premise data warehousing rather than modern data stacks.

3. **Geographic Centralization:** Cairo and Giza absorb over **84%** of total data roles, acting as the undisputed tech hub for multinational ecosystems, with Alexandria representing a distant third.

4. **The Clear-Cut Track for Scientists:** In contrast to analysts, the **Data Scientist** track shows textbook alignment with technical expectations: **Python at 74.81%** and **Machine Learning at 58.53%**, making it a highly standardized path locally.

<details>
<summary>🔍 View Market Deep Dive & Skills Matrix Dashboard</summary>
<br>
  <img width="1513" height="842" alt="Dive" src="https://github.com/user-attachments/assets/06976e91-1067-4121-b5f2-96c2c1a69ae2" />
</details>

---

## 📂 Repository Structure
```text
Egypt-Data-Skills-Gap-Analysis/
├── Python_Script/
│   └── (Contains the Web Scraper logic)
├── tanqeeb_jobs_dataset.csv              # Raw extracted dataset (Output of Scraper)
├── SQL_Scripts/
│   └── (Contains T-SQL scripts for Dimensions, Fact, Bridge tables, and Views)
└── Egypt_Data_Skills_Gap_Analysis.pbix   # Interactive Power BI Dashboard

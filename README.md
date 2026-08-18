# Bank-Analytics.
🏦 Bank Analytics Dashboard

Multi-tool bank analytics project analyzing loan performance and transaction (debit/credit) trends, built end-to-end using Excel, MySQL, Tableau, and Power BI — featuring 30+ KPIs across four interactive dashboards.

📌 Project Overview

This project simulates a real-world banking analytics scenario, covering two core datasets:

Loan Data — tracking loan disbursement, approval rates, defaults, and branch/state-level performance.
Transaction Data — tracking debit/credit activity, transaction volume, and credit-to-debit ratios.

Each dataset was queried, modeled, and visualized independently across all four tools to demonstrate proficiency in the complete analytics workflow — from raw data to a decision-ready dashboard.

🛠️ Tools & Skills Used
Tool	What it was used for
MySQL	Data querying, joins, aggregations, and validation before visualization
Excel	Loan analytics dashboard with KPI cards, PivotTables, PivotCharts, and slicers
Tableau	Interactive dashboards using LOD (Level of Detail) expressions, calculated fields, and dual data-source blending
Power BI	DAX measures, data modeling, and KPI dashboards
📊 What's Inside This Repository
File	Description
Bank data Analytics in SQL.sql	SQL queries for loan data extraction and analysis
Bank_Analytics_Dashboard_Excel_.xlsx	Excel dashboard with loan KPI cards, PivotTables, and slicers
Bank Analytics Dashboard in Tableau.twbx	Tableau workbook — loan KPIs and dashboard
Bank analytics File in Power BI.pbix	Power BI report — loan KPIs built with DAX
Debit & Credit file in SQL.sql	SQL queries for transaction data extraction and analysis
Debit_Credit_Excel_.xlsx	Excel dashboard for debit/credit transaction KPIs
Debit & Credit Data file in Tableau.twbx	Tableau workbook — debit/credit KPIs and dashboard
Debit & Credit data file in Power BI.pbix	Power BI report — debit/credit KPIs

🔑 Key KPIs Built

Loan Analytics (18 KPIs) — including Total Loan Amount, Branch-wise Performance, State-wise Loan Distribution, Default Loan Rate, Approval Rate, and Average Loan Tenure.

Debit/Credit Analytics (12 KPIs) — including Total Credit Amount, Total Debit Amount, Credit-to-Debit Ratio, Transaction Count, and Monthly Transaction Trends.

🧩 Real Problems Solved

Building this project surfaced real data-quality issues — solving them was as much a part of the work as the dashboards themselves:

Power BI phantom-row issue: Discovered that Excel's "used range" extended far beyond the actual data, causing Power BI to read thousands of blank phantom rows. Fixed by identifying and trimming the true data boundary before loading.
Tableau LOD expression fixes: Refined FIXED-level calculations to correctly aggregate KPIs across dimensions without being affected by view-level filters, ensuring dashboard numbers stayed accurate as users applied filters.
Dual data-source blending in Tableau: Connected and blended loan data with transaction data as two separate sources within the same workbook, resolving join-key mismatches along the way.
Excel data range issue: Resolved missing/incomplete fields in PivotTables caused by an incorrectly scoped source data range.

Author: Rithika Reddy Mallela 

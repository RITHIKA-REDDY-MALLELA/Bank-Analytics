USE bank_loan_project;

-- KPI 1: Total Loan Amount Funded
SELECT SUM(`Funded_ Amount`) AS total_loan_funded
FROM `bank_data_analytics`;

-- KPI 2: Total Loan 
SELECT COUNT(`Account ID`) AS total_loans
FROM `bank_data_analytics`;

-- KPI 3: Total Collection
SELECT ROUND(SUM(`Total Pymnt`),0) AS total_collection
FROM `bank_data_analytics`;

-- KPI 4: Total INTEREST
SELECT ROUND(SUM(`Total Rrec int`), 0) AS total_interest
FROM `bank_data_analytics`;

-- KPI 5: Branch-Wise Performance
SELECT `Branch Name`,
       ROUND(SUM(`Total Rrec int`), 0) AS interest,
       ROUND(SUM(`Total Fees`), 0) AS fees,
       ROUND(SUM(`Total Pymnt`), 0) AS total_revenue
FROM `bank_data_analytics`
GROUP BY `Branch Name`;

-- KPI 6: State-Wise Loan
SELECT `State Name`, ROUND(SUM(`Loan Amount`), 0) AS total_loan
FROM `bank_data_analytics`
GROUP BY `State Name`
ORDER BY total_loan DESC;

-- KPI 7: Religion-Wise Loan
SELECT Religion, ROUND(SUM(`Loan Amount`), 0) AS total_loan, COUNT(`Account ID`) AS loan_count
FROM `bank_data_analytics`
GROUP BY Religion;

-- KPI 8: Product Group-Wise Loan
SELECT `Purpose Category` AS product_group, ROUND(SUM(`Loan Amount`), 0) AS total_loan
FROM `bank_data_analytics`
GROUP BY `Purpose Category`;

-- KPI 9: Disbursement Trend
SELECT `Disbursement Date (Years)` AS period, ROUND(SUM(`Loan Amount`), 0) AS disbursed
FROM bank_data_analytics
GROUP BY `Disbursement Date (Years)`
ORDER BY period;

-- KPI 10: Grade-Wise Loan
SELECT Grrade AS grade, ROUND(SUM(`Loan Amount`), 0) AS total_loan, COUNT(`Account ID`) AS loan_count
FROM `bank_data_analytics`
GROUP BY Grrade;

-- KPI 11: Default Loan Count
SELECT COUNT(`Account ID`) AS default_loan_count
FROM `bank_data_analytics`
WHERE `Is Default Loan` = 'Y';

-- KPI 12: Delinquent Client Count
SELECT COUNT(DISTINCT `Client id`) AS delinquent_clients
FROM `bank_data_analytics`
WHERE `Is Delinquent Loan` = 'Y';




































































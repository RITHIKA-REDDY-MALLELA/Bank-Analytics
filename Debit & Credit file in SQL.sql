CREATE DATABASE banking_dashboard;
USE banking_dashboard;



CREATE TABLE banking_transactions (
    customer_id VARCHAR(50),
    customer_name VARCHAR(100),
    account_number VARCHAR(30),
    transaction_date DATE,
   transaction_type VARCHAR(20),
    amount DECIMAL(15,2),
    balance DECIMAL(15,2),
    description VARCHAR(255),
    branch VARCHAR(100),
    transaction_method VARCHAR(50),
    currency VARCHAR(10),
    bank_name VARCHAR(100)
);

show variables like 'local_infile';

show variables like 'secure_file-priv';


USE banking_dashboard;

/* =========================================================
   1st KPI - Total Credit Amount
   ========================================================= */
SELECT 
    SUM(amount) AS total_credit_amount
FROM banking_transactions
WHERE transaction_type = 'Credit';


/* =========================================================
   2nd KPI - Total Debit Amount
   ========================================================= */
SELECT 
    SUM(amount) AS total_debit_amount
FROM banking_transactions
WHERE transaction_type = 'Debit';


/* =========================================================
   3rd KPI - Credit to Debit Ratio
   ========================================================= */
SELECT 
    ROUND(
        SUM(CASE WHEN transaction_type = 'Credit' THEN amount ELSE 0 END) /
        NULLIF(SUM(CASE WHEN transaction_type = 'Debit' THEN amount ELSE 0 END), 0),
        2
    ) AS credit_to_debit_ratio
FROM banking_transactions;


/* =========================================================
   4th KPI - Net Transaction Amount
   (Credit Amount - Debit Amount)
   ========================================================= */
SELECT 
    SUM(CASE WHEN transaction_type = 'Credit' THEN amount ELSE -amount END)
    AS net_transaction_amount
FROM banking_transactions;


/* =========================================================
   5th KPI - Total Transaction Count
   ========================================================= */
SELECT 
    COUNT(*) AS total_transaction_count
FROM banking_transactions;


/* =========================================================
   6th KPI - Transactions Per Month
   ========================================================= */
SELECT 
    DATE_FORMAT(transaction_date,'%Y-%m') AS month,
    COUNT(*) AS transaction_count
FROM banking_transactions
GROUP BY DATE_FORMAT(transaction_date,'%Y-%m')
ORDER BY month;


/* =========================================================
   7th KPI - Total Transactions By Branch
   ========================================================= */
SELECT 
    branch,
    COUNT(*) AS total_transactions,
    SUM(amount) AS total_amount
FROM banking_transactions
GROUP BY branch
ORDER BY total_amount DESC;


/* =========================================================
   8th KPI - Transaction Volume By Bank
   ========================================================= */
SELECT 
    bank_name,
    COUNT(*) AS transaction_count,
    SUM(amount) AS transaction_volume
FROM banking_transactions
GROUP BY bank_name
ORDER BY transaction_volume DESC;


/* =========================================================
   9th KPI - Transaction Method Distribution
   ========================================================= */
SELECT 
    transaction_method,
    COUNT(*) AS transaction_count,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM banking_transactions),2)
    AS percentage_share
FROM banking_transactions
GROUP BY transaction_method
ORDER BY transaction_count DESC;


/* =========================================================
   10th KPI - Branch Transaction Growth (Month Wise)
   ========================================================= */
WITH branch_monthly AS
(
    SELECT
        branch,
        DATE_FORMAT(transaction_date,'%Y-%m') AS month,
        COUNT(*) AS transaction_count
    FROM banking_transactions
    GROUP BY branch, DATE_FORMAT(transaction_date,'%Y-%m')
)
SELECT
    branch,
    month,
    transaction_count,
    LAG(transaction_count) OVER
        (PARTITION BY branch ORDER BY month) AS previous_month_count,
    ROUND(
        (
            (transaction_count -
            LAG(transaction_count) OVER
                (PARTITION BY branch ORDER BY month))
            /
            NULLIF(
                LAG(transaction_count) OVER
                (PARTITION BY branch ORDER BY month),0
            )
        ) * 100,
        2
    ) AS growth_percentage
FROM branch_monthly;


/* =========================================================
   11th KPI - High Risk Transaction Flag
   Criteria:
   Amount > 100000
   ========================================================= */
SELECT
    customer_id,
    customer_name,
    account_number,
    transaction_date,
    amount,
    transaction_type,
    CASE
        WHEN amount > 100000 THEN 'High Risk'
        ELSE 'Normal'
    END AS risk_flag
FROM banking_transactions;


/* =========================================================
   12th KPI - Suspicious Transaction Count
   Criteria:
   Debit transactions above 100000
   ========================================================= */
SELECT
    COUNT(*) AS suspicious_transaction_count
FROM banking_transactions
WHERE transaction_type = 'Debit'
AND amount > 100000;



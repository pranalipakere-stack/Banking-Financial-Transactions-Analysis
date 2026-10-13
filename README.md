# Banking Financial Transactions Analysis using SQL

## Project Overview
This project analyzes banking financial transactions using MySQL to identify transaction patterns, compare transaction amounts, and understand account activity.

## Tools Used
- MySQL
- MySQL Workbench
- SQL
- GitHub

## Dataset
**Original Dataset:** [SFinDSet for Systematic Detection of FinCrimes — Kaggle](https://www.kaggle.com/dsv/11299085)

The original dataset is approximately 106 MB, so a sample of 1,000 rows is provided in this repository for reference. The SQL analysis was performed using the full dataset imported into MySQL Workbench.

**Sample Dataset:** [View Sample Transactions CSV](./sample_transactions.csv)

### Dataset Columns
- Transaction ID
- Account Number
- Account Name
- Transaction Amount
- Transaction Mode
- Transaction Type
- Transaction Date
- Transaction Source
- Transaction Destination

## SQL Concepts Covered
- SELECT and DISTINCT
- WHERE and BETWEEN
- ORDER BY and LIMIT
- Aggregate functions: COUNT, SUM, AVG, MAX
- GROUP BY and HAVING
- CASE statements
- Subqueries
- Date conversion using STR_TO_DATE()
- Duplicate identification
- Account-level transaction analysis

## Business Insights
- Identified the transaction modes with the highest number of transactions.
- Compared total transaction amounts across transaction modes and types.
- Analyzed average transaction amounts to understand differences in transaction activity.
- Classified transactions into incoming and outgoing categories.
- Identified high-value transactions exceeding three times the overall average transaction amount.
- Detected duplicate transaction IDs for further investigation.
- Identified accounts with average transaction amounts above the overall average.
- Analyzed recent transactions to understand transaction activity over time.
- Identified the five accounts with the highest total transaction amounts.

## Conclusion
This project demonstrates practical SQL skills in financial transaction analysis, data aggregation, transaction classification, duplicate detection, and account-level analysis using MySQL.

## Author
Aspiring Data Analyst | SQL | Python | Excel | Power BI

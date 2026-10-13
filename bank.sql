create database Bank;
use bank;
describe fbank;
select * from fbank;

-- Question 1: Find the Top 10 Highest-Value Transactions
-- Business Objective: Identify the 10 transactions with the highest transaction amounts.
select Transaction_ID,Account_Name,Transaction_Amount,
Transaction_Mode,Transaction_Date from fbank
order by Transaction_Amount desc limit 10;

-- Question 2: Transaction Mode Analysis
-- Business Objective: Identify the most frequently used transaction modes by counting transactions for each mode.
select Transaction_Mode,count(Transaction_Mode) as Total_Transactions
from fbank
group by Transaction_Mode order by Total_Transactions desc;

-- Question 3: Transaction Type Analysis
-- Business Objective: Calculate the total transaction amount for each transaction type to understand where the largest transaction value occurs.
select Transaction_Type,sum(Transaction_Amount) as Total_Amount 
from fbank
group by Transaction_Type order by Total_Amount desc;

-- Question 4: Average Transaction Amount by Mode
-- Business Objective: Compare the average transaction amount across different transaction modes.
select Transaction_Mode,avg(Transaction_Amount) as Average_Amount 
from fbank
group by Transaction_Mode order by Average_Amount desc;

-- Question 5: Transaction Count by Type
-- Business Objective: Count transactions for each transaction type
-- to identify which types occur most frequently.
select Transaction_Type,count(Transaction_Type) as Total_Transaction
from fbank
group by Transaction_Type order by Total_Transaction desc;

-- Question 6: Total Transaction Amount by Mode
-- Business Objective: Calculate the total transaction amount
-- for each transaction mode and identify which mode has
-- the highest total transaction value.
select Transaction_Mode, sum(Transaction_Amount) as Total_Amount
from fbank
group by Transaction_Mode order by Total_Amount desc;

-- Question 7: Identify High-Value Transactions
-- Business Objective: Find transactions with an amount
-- between 10,000 and 50,000 to analyse significant transactions.
select Transaction_ID, Account_Name,Transaction_Amount,
Transaction_Mode from fbank
where Transaction_Amount between 10000 and 50000 ;

-- Question 8: Identify Unique Transaction Modes
-- Business Objective: Find all distinct transaction modes
-- available in the dataset without repeating any mode.
select distinct Transaction_Mode from fbank;

-- Question 9: Identify High-Value Card Transactions
-- Business Objective: Find card transactions with an amount
-- greater than 10,000 to identify high-value card activity.
select Transaction_ID,Account_Name,Transaction_Amount,Transaction_Mode
from fbank
where Transaction_Mode = "Card Out" and Transaction_Amount > 10000;

-- Question 10: Transaction Amount Categorization
-- Business Objective: Classify transactions into High Value
-- and Regular based on their transaction amount.
-- High Value: Amount greater than 10,000
-- Regular: Amount less than or equal to 10,000
select Transaction_ID,Transaction_Amount,
  case
    when Transaction_Amount > 10000 
        Then 'High Value'
    else 'Regular'
end as Transaction_Category from fbank;

-- Question 11: Transaction Types with More Than 50 Transactions
-- Business Objective: Identify which transaction types occur
-- more than 50 times in the dataset.
select Transaction_Type,count(*) as Total_transaction
from fbank group by Transaction_Type
having count(*) > 50
order by Total_transaction  desc;

-- Question 12: Transaction Mode Classification
-- Business Objective: Classify transactions into Outgoing,
-- Incoming, and Other categories based on transaction mode.
-- Outgoing: Card Out and Cash Out
-- Incoming: Cash In and Transfer In
-- Other: All remaining transaction modes
-- Question 12: Transaction Mode Classification
-- Business Objective: Classify transactions as Outgoing, Incoming, or Other.
select Transaction_ID,Transaction_Mode,
    case
        when trim(Transaction_Mode) IN ('Card Out', 'Cash Out')
            then'Outgoing'
        when TRIM(Transaction_Mode) IN ('Cash In', 'Transfer In')
            then 'Incoming'
		else 'Other'
    end as Transaction_Direction
from fbank;

-- Question 13: Identify Unusually Large Transactions
-- Business Objective: Find transactions where the amount is
-- more than 3 times the average transaction amount.
-- Display Transaction_ID, Account_Name, Transaction_Amount.
select Transaction_ID,Account_Name,Transaction_Amount
from fbank 
where Transaction_Amount >(select avg(Transaction_Amount) * 3
from fbank);

-- Question 14: Above-Average Transactions by Account
-- Business Objective: Find accounts whose average transaction
-- amount is greater than the overall average transaction amount.
-- Display Account_Number and Average_Amount.
select Account_Number,avg(Transaction_Amount) as Average_Amount
from fbank
group by Account_Number having avg(Transaction_Amount) >(
select avg(Transaction_Amount) from fbank);
 
-- Question 15: Latest Transactions
-- Business Objective: Display the 10 most recent transactions.
-- Show Transaction_ID, Account_Name, Transaction_Amount,
-- and Transaction_Date.
-- Sort the results from newest to oldest.
select Transaction_ID,Account_Name, Transaction_amount,
Transaction_Date from fbank
order by STR_TO_DATE(Transaction_Date, '%m/%d/%Y %H:%i') desc limit 10;

-- Question 16: Duplicate Transaction IDs
-- Business Objective: Identify transaction IDs that appear
-- more than once in the dataset.
-- Display Transaction_ID and the number of times it appears.
select Transaction_ID,count(*) as Times_Appeared
from fbank group by Transaction_ID
having count(*) > 1;

-- Question 17: Second-Highest Transaction Amount
-- Business Objective: Find the second-highest distinct
-- transaction amount in the banking dataset.
-- Display the Transaction_Amount.
select max(Transaction_Amount) as Second_highest_amount from fbank
where Transaction_Amount < (select max(Transaction_Amount) from fbank );

-- Question 18: Accounts with Multiple Transactions
-- Business Objective: Identify accounts that have made
-- more than 1 transactions.
-- Display Account_Number and Total_Transactions.
-- Show only accounts with more than 1 transactions.
select Account_Number,count(*) as Total_Transactions 
from fbank group by Account_Number 
having count(*) > 1;

-- Question 19: Incoming vs Outgoing Transaction Analysis
-- Business Objective: Compare the total transaction amount
-- for Incoming and Outgoing transactions.
-- Incoming: Cash In, Transfer In
-- Outgoing: Card Out, Cash Out
-- Display Transaction_Direction and Total_Amount.
select
    case
        when trim(Transaction_Mode) IN ('Cash In', 'Transfer In')
            then 'Incoming'
        when trim(Transaction_Mode) IN ('Card Out', 'Cash Out')
            then 'Outgoing'
    end as Transaction_Direction,
    sum(Transaction_Amount) as Total_Amount
from fbank
where trim(Transaction_Mode) IN (
    'Cash In', 'Transfer In', 'Card Out', 'Cash Out'
)
group by Transaction_Direction;

-- question 20: top 5 accounts by total transaction amount
-- business objective: identify the 5 accounts with the highest
-- combined transaction amounts.
-- display account_number and total_transaction_amount.
-- sort from highest to lowest.
select Account_Number,sum(Transaction_Amount) as Total_Transaction_amount
from fbank group by Account_Number 
order by Total_Transaction_amount desc limit 5;
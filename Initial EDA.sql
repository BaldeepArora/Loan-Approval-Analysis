-- This query is mainly to explore the data initially

SELECT count(*) as total_loans from loans;
-- Total count is matching with the number of rows in excel

select loan_status, count(*) from loans group by loan_status;
-- Count Approved vs. Rejected Loans:

select Education as Average_Loan_Amount, avg(LoanAmount) from loans group by Education
-- Average Loan amount by Education

select * from loans limit 10
-- viewing the first 10 rows


SELECT
    COUNT(*) AS Total_Records,
    COUNT(*) FILTER (WHERE Gender IS NULL) AS Missing_Gender,
    COUNT(*) FILTER (WHERE Married IS NULL) AS Missing_Married,
    COUNT(*) FILTER (WHERE Dependents IS NULL) AS Missing_Dependents,
    COUNT(*) FILTER (WHERE Education IS NULL) AS Missing_Education,
    COUNT(*) FILTER (WHERE Self_Employed IS NULL) AS Missing_Self_Employed,
    COUNT(*) FILTER (WHERE ApplicantIncome IS NULL) AS Missing_ApplicantIncome,
    COUNT(*) FILTER (WHERE CoapplicantIncome IS NULL) AS Missing_CoapplicantIncome,
    COUNT(*) FILTER (WHERE LoanAmount IS NULL) AS Missing_LoanAmount,
    COUNT(*) FILTER (WHERE Loan_Amount_Term IS NULL) AS Missing_Loan_Amount_Term,
    COUNT(*) FILTER (WHERE Credit_History IS NULL) AS Missing_Credit_History,
    COUNT(*) FILTER (WHERE Property_Area IS NULL) AS Missing_Property_Area,
    COUNT(*) FILTER (WHERE Loan_Status IS NULL) AS Missing_Loan_Status
FROM loans;

-- There are various missing values to take care of first
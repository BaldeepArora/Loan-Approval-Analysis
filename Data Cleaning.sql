-- This query is for data cleaning

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

-- As seen before as well, there are various null values 

-- For categorical columns like these, we will choose to fill missing values
-- with the most frequent category (mode) or a placeholder such as 'Unknown'.
UPDATE loans
SET Gender = COALESCE(Gender, 'Unknown');

UPDATE loans
SET Married = COALESCE(Married, 'Unknown');

UPDATE loans
SET Dependents = COALESCE(Dependents, '0'); -- Assuming '0' is a common or default category

UPDATE loans
SET Education = COALESCE(Education, 'Unknown');

UPDATE loans
SET Self_Employed = COALESCE(Self_Employed, 'No'); -- 'No' is a reasonable default

UPDATE loans
SET Property_Area = COALESCE(Property_Area, 'Unknown');



-- For numeric columns, missing values can be replaced with the 
-- median value, as this is less sensitive to outliers compared to the mean.

SELECT 
    PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY ApplicantIncome) AS Median_ApplicantIncome,
    PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY CoapplicantIncome) AS Median_CoapplicantIncome,
    PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY LoanAmount) AS Median_LoanAmount,
    PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY Loan_Amount_Term) AS Median_Loan_Amount_Term,
    PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY Credit_History) AS Median_Credit_History
FROM loans;


-- We will be updating the median values accordingly 

UPDATE loans
SET ApplicantIncome = COALESCE(ApplicantIncome, 3812.5);

UPDATE loans
SET CoapplicantIncome = COALESCE(CoapplicantIncome, 1188.5);

UPDATE loans
SET LoanAmount = COALESCE(LoanAmount, 128);

UPDATE loans
SET Loan_Amount_Term = COALESCE(Loan_Amount_Term, 360);

UPDATE loans
SET Credit_History = COALESCE(Credit_History, 1.00);


-- Rechecking for missing values
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
-- There are no missing values



-- Looking for any duplicate records

select count(*), Loan_ID from loans group by Loan_ID having count(*)>1
-- There are no duplicate records






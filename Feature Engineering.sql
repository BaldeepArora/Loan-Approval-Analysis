-- Feature Engineernig

-- Debt to Income Ratio

ALTER TABLE loans
ADD COLUMN Debt_to_Income_Ratio DECIMAL(18,4);

UPDATE loans
SET Debt_to_Income_Ratio=(ApplicantIncome + CoapplicantIncome) / NULLIF(LoanAmount,0)
-- A higher ratio may indicate a better ability to repay the loan.



ALTER TABLE loans
ADD COLUMN Loan_Term_Years DECIMAL(18, 2);

UPDATE loans
SET Loan_Term_Years = Loan_Amount_Term / 12;
-- Makes it easier to analyze it in years


ALTER TABLE loans
ADD COLUMN Total_Income DECIMAL(18, 2);

UPDATE loans
SET Total_Income = ApplicantIncome + CoapplicantIncome;
-- A complete view of the household income


ALTER TABLE loans
ADD COLUMN Income_Bracket VARCHAR(50);

UPDATE loans
SET Income_Bracket = CASE
    WHEN Total_Income < 2500 THEN 'Low'
    WHEN Total_Income BETWEEN 2500 AND 5000 THEN 'Medium'
    ELSE 'High'
END;
-- Segragates the income amount into brackets



ALTER TABLE loans
ADD COLUMN Credit_History_Status VARCHAR(10);

UPDATE loans
SET Credit_History_Status = CASE
    WHEN Credit_History = 1 THEN 'Good'
    ELSE 'Bad'
END;
-- Renaming the credit history status from binary to categorical




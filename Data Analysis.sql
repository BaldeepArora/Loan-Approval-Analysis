SELECT Gender, Loan_Status, COUNT(*) AS Count
FROM loans
GROUP BY Gender, Loan_Status;


SELECT Education, Income_Bracket, Loan_Status, COUNT(*) AS Count
FROM loans
GROUP BY Education, Income_Bracket, Loan_Status;


SELECT Property_Area, AVG(LoanAmount) AS Average_LoanAmount
FROM loans
GROUP BY Property_Area;


SELECT Credit_History_Status, Loan_Status, COUNT(*) AS Count
FROM loans
GROUP BY Credit_History_Status, Loan_Status;



SELECT Income_Bracket, AVG(LoanAmount) AS Average_LoanAmount, Loan_Status
FROM loans
GROUP BY Income_Bracket, Loan_Status;


SELECT Loan_Term_Years, AVG(LoanAmount) AS Average_LoanAmount
FROM loans
GROUP BY Loan_Term_Years;




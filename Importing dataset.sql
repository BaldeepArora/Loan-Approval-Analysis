COPY loans(Loan_ID, Gender, Married, Dependents, Education, Self_Employed, ApplicantIncome, CoapplicantIncome, LoanAmount, Loan_Amount_Term, Credit_History, Property_Area, Loan_Status)
FROM 'C:\\Usersloan_prediction.csv'
WITH (FORMAT csv, HEADER true);

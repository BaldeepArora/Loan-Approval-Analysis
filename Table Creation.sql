CREATE TABLE loans (
    Loan_ID VARCHAR(50) PRIMARY KEY,
    Gender VARCHAR(10),
    Married VARCHAR(10),
    Dependents VARCHAR(10),
    Education VARCHAR(50),
    Self_Employed VARCHAR(10),
    ApplicantIncome DECIMAL(18, 2),
    CoapplicantIncome DECIMAL(18, 2),
    LoanAmount DECIMAL(18, 2),
    Loan_Amount_Term DECIMAL(18, 2),
    Credit_History DECIMAL(3, 2),
    Property_Area VARCHAR(50),
    Loan_Status VARCHAR(10)
);

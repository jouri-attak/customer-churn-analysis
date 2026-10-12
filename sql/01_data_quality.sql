USE CustomerChurn;
GO

-- =========================================================
-- CUSTOMER CHURN PROJECT
-- 01 - DATA QUALITY CHECKS
-- =========================================================


-- =========================================================
-- 1. CHECK FOR DUPLICATE CUSTOMER IDs
-- =========================================================

SELECT
    customerID,
    COUNT(*) AS NumberOfRows
FROM Customer
GROUP BY customerID
HAVING COUNT(*) > 1;

-- Result: No duplicate customer IDs.


-- =========================================================
-- 2. CHECK FOR MISSING VALUES
-- =========================================================

SELECT
    SUM(CASE WHEN customerID IS NULL THEN 1 ELSE 0 END) AS customerID_Missing,
    SUM(CASE WHEN gender IS NULL THEN 1 ELSE 0 END) AS gender_Missing,
    SUM(CASE WHEN SeniorCitizen IS NULL THEN 1 ELSE 0 END) AS SeniorCitizen_Missing,
    SUM(CASE WHEN Partner IS NULL THEN 1 ELSE 0 END) AS Partner_Missing,
    SUM(CASE WHEN Dependents IS NULL THEN 1 ELSE 0 END) AS Dependents_Missing,
    SUM(CASE WHEN tenure IS NULL THEN 1 ELSE 0 END) AS tenure_Missing,
    SUM(CASE WHEN PhoneService IS NULL THEN 1 ELSE 0 END) AS PhoneService_Missing,
    SUM(CASE WHEN MultipleLines IS NULL THEN 1 ELSE 0 END) AS MultipleLines_Missing,
    SUM(CASE WHEN InternetService IS NULL THEN 1 ELSE 0 END) AS InternetService_Missing,
    SUM(CASE WHEN OnlineSecurity IS NULL THEN 1 ELSE 0 END) AS OnlineSecurity_Missing,
    SUM(CASE WHEN OnlineBackup IS NULL THEN 1 ELSE 0 END) AS OnlineBackup_Missing,
    SUM(CASE WHEN DeviceProtection IS NULL THEN 1 ELSE 0 END) AS DeviceProtection_Missing,
    SUM(CASE WHEN TechSupport IS NULL THEN 1 ELSE 0 END) AS TechSupport_Missing,
    SUM(CASE WHEN StreamingTV IS NULL THEN 1 ELSE 0 END) AS StreamingTV_Missing,
    SUM(CASE WHEN StreamingMovies IS NULL THEN 1 ELSE 0 END) AS StreamingMovies_Missing,
    SUM(CASE WHEN Contract IS NULL THEN 1 ELSE 0 END) AS Contract_Missing,
    SUM(CASE WHEN PaperlessBilling IS NULL THEN 1 ELSE 0 END) AS PaperlessBilling_Missing,
    SUM(CASE WHEN PaymentMethod IS NULL THEN 1 ELSE 0 END) AS PaymentMethod_Missing,
    SUM(CASE WHEN MonthlyCharges IS NULL THEN 1 ELSE 0 END) AS MonthlyCharges_Missing,
    SUM(CASE WHEN TotalCharges IS NULL THEN 1 ELSE 0 END) AS TotalCharges_Missing,
    SUM(CASE WHEN Churn IS NULL THEN 1 ELSE 0 END) AS Churn_Missing
FROM Customer_Clean;

-- Result: No missing values in Customer_Clean.


-- =========================================================
-- 3. CHECK CATEGORICAL VALUES
-- =========================================================

SELECT DISTINCT gender
FROM Customer_Clean;

SELECT DISTINCT Churn
FROM Customer_Clean;

SELECT DISTINCT Contract
FROM Customer_Clean;

SELECT DISTINCT SeniorCitizen
FROM Customer_Clean;

SELECT DISTINCT Partner
FROM Customer_Clean;

SELECT DISTINCT Dependents
FROM Customer_Clean;

SELECT DISTINCT InternetService
FROM Customer_Clean;

SELECT DISTINCT PaymentMethod
FROM Customer_Clean;

SELECT DISTINCT PhoneService
FROM Customer_Clean;

SELECT DISTINCT MultipleLines
FROM Customer_Clean;

SELECT DISTINCT OnlineSecurity
FROM Customer_Clean;

SELECT DISTINCT OnlineBackup
FROM Customer_Clean;

SELECT DISTINCT DeviceProtection
FROM Customer_Clean;

SELECT DISTINCT TechSupport
FROM Customer_Clean;

SELECT DISTINCT StreamingTV
FROM Customer_Clean;

SELECT DISTINCT StreamingMovies
FROM Customer_Clean;

SELECT DISTINCT PaperlessBilling
FROM Customer_Clean;

-- Result: All observed categories are valid and expected.


-- =========================================================
-- 4. CHECK NUMERIC RANGES
-- =========================================================

SELECT
    MIN(tenure) AS MinimumTenure,
    MAX(tenure) AS MaximumTenure
FROM Customer_Clean;

SELECT
    MIN(MonthlyCharges) AS MinimumMonthlyCharges,
    MAX(MonthlyCharges) AS MaximumMonthlyCharges,
    MIN(TotalCharges) AS MinimumTotalCharges,
    MAX(TotalCharges) AS MaximumTotalCharges
FROM Customer_Clean;

-- Result:
-- tenure: 0 to 72 months
-- MonthlyCharges: 18.25 to 118.75
-- TotalCharges: 0.00 to 8684.80


-- =========================================================
-- 5. CHECK LOGICAL CONSISTENCY
-- =========================================================

-- Customers without internet service should not have
-- internet-dependent services.

SELECT *
FROM Customer_Clean
WHERE InternetService = 'No'
  AND (
      OnlineSecurity = 'Yes'
      OR OnlineBackup = 'Yes'
      OR DeviceProtection = 'Yes'
      OR TechSupport = 'Yes'
      OR StreamingTV = 'Yes'
      OR StreamingMovies = 'Yes'
  );

-- Result: No inconsistent records.


-- Customers without phone service should not have
-- multiple-line service.

SELECT *
FROM Customer_Clean
WHERE PhoneService = 'No'
  AND MultipleLines <> 'No phone service';

-- Result: No inconsistent records.
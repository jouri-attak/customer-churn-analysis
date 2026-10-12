USE CustomerChurn;
GO

-- =============================================
-- 1. OVERALL CHURN RATE
-- =============================================

SELECT
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    SUM(CASE WHEN Churn = 'No' THEN 1 ELSE 0 END) AS Retained_Customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS Churn_Rate_Percent
FROM Customer_Clean;

-- =============================================
-- 2A. CHURN BY GENDER
-- =============================================

SELECT
    gender,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS Churn_Rate_Percent
FROM Customer_Clean
GROUP BY gender
ORDER BY Churn_Rate_Percent DESC;

-- Gender doesn't appear to be a major churn differentiator in this dataset.

-- =============================================
-- 2B. CHURN BY SENIOR CITIZEN STATUS
-- =============================================

SELECT
    SeniorCitizen,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS Churn_Rate_Percent
FROM Customer_Clean
GROUP BY SeniorCitizen
ORDER BY Churn_Rate_Percent DESC;

-- Senior customers had a churn rate of 41.68%,
-- compared with 23.61% for non-senior customers,
-- a difference of 18.07 percentage points.

-- =============================================
-- 2C. CHURN BY PARTNER STATUS
-- =============================================

SELECT
    Partner,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS Churn_Rate_Percent
FROM Customer_Clean
GROUP BY Partner
ORDER BY Churn_Rate_Percent DESC;

-- Customers without a partner have a churn rate of 32.96%, compared with 19.66% for customers with a partner.
-- That's a 13.30 percentage-point difference.

-- =============================================
-- 2D. CHURN BY DEPENDENTS
-- =============================================

SELECT
    Dependents,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS Churn_Rate_Percent
FROM Customer_Clean
GROUP BY Dependents
ORDER BY Churn_Rate_Percent DESC;

-- Customers without dependents had a churn rate of 31.28%,
-- compared with 15.45% for customers with dependents.
-- Difference: 15.83 percentage points.

-- Gender showed little difference in observed churn rates, 
-- while SeniorCitizen, Partner, and Dependents show substantial differences in observed churn rates

-- =============================================
-- 3A. CHURN BY INTERNET SERVICE
-- =============================================

SELECT
    InternetService,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS Churn_Rate_Percent
FROM Customer_Clean
GROUP BY InternetService
ORDER BY Churn_Rate_Percent DESC;

-- =============================================
-- 3B. CHURN BY ONLINE SECURITY
-- =============================================

SELECT
    OnlineSecurity,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS Churn_Rate_Percent
FROM Customer_Clean
GROUP BY OnlineSecurity
ORDER BY Churn_Rate_Percent DESC;

-- =============================================
-- 3C. CHURN BY ONLINE BACKUP
-- =============================================

SELECT
    OnlineBackup,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS Churn_Rate_Percent
FROM Customer_Clean
GROUP BY OnlineBackup
ORDER BY Churn_Rate_Percent DESC;

-- =============================================
-- 3D. CHURN BY DEVICE PROTECTION
-- =============================================

SELECT
    DeviceProtection,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS Churn_Rate_Percent
FROM Customer_Clean
GROUP BY DeviceProtection
ORDER BY Churn_Rate_Percent DESC;

-- =============================================
-- 3E. CHURN BY TECH SUPPORT
-- =============================================

SELECT
    TechSupport,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS Churn_Rate_Percent
FROM Customer_Clean
GROUP BY TechSupport
ORDER BY Churn_Rate_Percent DESC;

-- =============================================
-- 3F. CHURN BY STREAMING TV
-- =============================================

SELECT
    StreamingTV,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS Churn_Rate_Percent
FROM Customer_Clean
GROUP BY StreamingTV
ORDER BY Churn_Rate_Percent DESC;

-- =============================================
-- 3G. CHURN BY STREAMING MOVIES
-- =============================================

SELECT
    StreamingMovies,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS Churn_Rate_Percent
FROM Customer_Clean
GROUP BY StreamingMovies
ORDER BY Churn_Rate_Percent DESC;

-- =============================================
-- 4A. CHURN BY CONTRACT TYPE
-- =============================================

SELECT
    Contract,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS Churn_Rate_Percent
FROM Customer_Clean
GROUP BY Contract
ORDER BY Churn_Rate_Percent DESC;

-- =============================================
-- 4B. CHURN BY PAYMENT METHOD
-- =============================================

SELECT
    PaymentMethod,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS Churn_Rate_Percent
FROM Customer_Clean
GROUP BY PaymentMethod
ORDER BY Churn_Rate_Percent DESC;

-- =============================================
-- 4C. CHURN BY PAPERLESS BILLING
-- =============================================

SELECT
    PaperlessBilling,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS Churn_Rate_Percent
FROM Customer_Clean
GROUP BY PaperlessBilling
ORDER BY Churn_Rate_Percent DESC;

-- =============================================
-- 5A. CHURN BY TENURE
-- =============================================

SELECT
    CASE
        WHEN tenure <= 6 THEN '0-6 months'
        WHEN tenure <= 12 THEN '7-12 months'
        WHEN tenure <= 24 THEN '13-24 months'
        WHEN tenure <= 36 THEN '25-36 months'
        WHEN tenure <= 48 THEN '37-48 months'
        WHEN tenure <= 60 THEN '49-60 months'
        ELSE '61-72 months'
    END AS Tenure_Group,

    COUNT(*) AS Total_Customers,

    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers,

    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS Churn_Rate_Percent

FROM Customer_Clean

GROUP BY
    CASE
        WHEN tenure <= 6 THEN '0-6 months'
        WHEN tenure <= 12 THEN '7-12 months'
        WHEN tenure <= 24 THEN '13-24 months'
        WHEN tenure <= 36 THEN '25-36 months'
        WHEN tenure <= 48 THEN '37-48 months'
        WHEN tenure <= 60 THEN '49-60 months'
        ELSE '61-72 months'
    END

ORDER BY
    MIN(tenure);

-- =============================================
-- 5B. CHURN BY MONTHLY CHARGES
-- =============================================

SELECT
    CASE
        WHEN MonthlyCharges < 30 THEN 'Under $30'
        WHEN MonthlyCharges < 50 THEN '$30-$49'
        WHEN MonthlyCharges < 70 THEN '$50-$69'
        WHEN MonthlyCharges < 90 THEN '$70-$89'
        ELSE '$90+'
    END AS Monthly_Charge_Group,

    COUNT(*) AS Total_Customers,

    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers,

    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS Churn_Rate_Percent

FROM Customer_Clean

GROUP BY
    CASE
        WHEN MonthlyCharges < 30 THEN 'Under $30'
        WHEN MonthlyCharges < 50 THEN '$30-$49'
        WHEN MonthlyCharges < 70 THEN '$50-$69'
        WHEN MonthlyCharges < 90 THEN '$70-$89'
        ELSE '$90+'
    END

ORDER BY
    MIN(MonthlyCharges);

-- =============================================
-- 5C. CHURN BY TOTAL CHARGES
-- =============================================

SELECT
    CASE
        WHEN TotalCharges < 1000 THEN 'Under $1,000'
        WHEN TotalCharges < 2500 THEN '$1,000-$2,499'
        WHEN TotalCharges < 5000 THEN '$2,500-$4,999'
        WHEN TotalCharges < 7500 THEN '$5,000-$7,499'
        ELSE '$7,500+'
    END AS Total_Charge_Group,

    COUNT(*) AS Total_Customers,

    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers,

    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS Churn_Rate_Percent

FROM Customer_Clean

GROUP BY
    CASE
        WHEN TotalCharges < 1000 THEN 'Under $1,000'
        WHEN TotalCharges < 2500 THEN '$1,000-$2,499'
        WHEN TotalCharges < 5000 THEN '$2,500-$4,999'
        WHEN TotalCharges < 7500 THEN '$5,000-$7,499'
        ELSE '$7,500+'
    END

ORDER BY
    MIN(TotalCharges);



-- Examine whether churn patterns differ across combinations
-- of contract type, internet service, tenure, and payment method.

-- =============================================
-- 6A. CHURN BY CONTRACT AND INTERNET SERVICE
-- =============================================

SELECT
    Contract,
    InternetService,

    COUNT(*) AS Total_Customers,

    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers,

    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS Churn_Rate_Percent

FROM Customer_Clean

GROUP BY
    Contract,
    InternetService

ORDER BY
    Churn_Rate_Percent DESC;

-- Month-to-month customers with Fiber optic internet had a
-- churn rate of 54.61% (1,162 out of 2,128 customers).
-- Churn rates were lower among customers with longer contracts.

-- =============================================
-- 6B. CHURN BY CONTRACT AND TENURE
-- =============================================

SELECT
    Contract,

    CASE
        WHEN tenure <= 6 THEN '0-6 months'
        WHEN tenure <= 12 THEN '7-12 months'
        WHEN tenure <= 24 THEN '13-24 months'
        WHEN tenure <= 36 THEN '25-36 months'
        WHEN tenure <= 48 THEN '37-48 months'
        WHEN tenure <= 60 THEN '49-60 months'
        ELSE '61-72 months'
    END AS Tenure_Group,

    COUNT(*) AS Total_Customers,

    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers,

    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS Churn_Rate_Percent

FROM Customer_Clean

GROUP BY
    Contract,
    CASE
        WHEN tenure <= 6 THEN '0-6 months'
        WHEN tenure <= 12 THEN '7-12 months'
        WHEN tenure <= 24 THEN '13-24 months'
        WHEN tenure <= 36 THEN '25-36 months'
        WHEN tenure <= 48 THEN '37-48 months'
        WHEN tenure <= 60 THEN '49-60 months'
        ELSE '61-72 months'
    END

ORDER BY
    Contract,
    MIN(tenure);

-- Month-to-month customers with 0-6 months of tenure had
-- a churn rate of 55.20% (780 out of 1,413 customers).
-- This identifies early-tenure, month-to-month customers
-- as a priority segment for retention efforts.

-- =============================================
-- 6C. CHURN BY CONTRACT AND PAYMENT METHOD
-- =============================================

SELECT
    Contract,
    PaymentMethod,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS Churn_Rate_Percent
FROM Customer_Clean
GROUP BY Contract, PaymentMethod
ORDER BY Churn_Rate_Percent DESC;

-- Month-to-month customers using electronic check had
-- a churn rate of 53.73% (994 out of 1,850 customers).
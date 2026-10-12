# customer-churn-analysis
Customer churn analysis using SQL Server and Power BI to identify high-risk customer segments and support retention decisions.

## Project Overview

Customer churn is a major challenge for subscription-based businesses because losing customers can reduce recurring revenue and increase customer acquisition costs.

This project analyzes customer churn using SQL Server and Power BI to identify customer segments with higher churn rates, explore patterns associated with customer attrition, and develop data-driven recommendations to support customer retention.

The analysis covers data quality validation, exploratory SQL analysis, customer segmentation, and an interactive Power BI dashboard.

**Project objective:** Identify high-risk customer segments and provide actionable insights that can help a business prioritize its customer retention efforts.

## Business Questions

This analysis investigates the following questions:

1. What is the overall customer churn rate?
2. Which customer segments have the highest churn rates based on customer characteristics, services, and contract types?
3. How does customer tenure relate to churn?
4. How do monthly charges relate to customer churn?
5. Which combinations of customer characteristics identify particularly high-risk segments?
6. What actionable recommendations can help the business prioritize customer retention efforts?

## Tools & Technologies

- **SQL Server & SQL Server Management Studio (SSMS):** Data quality validation, data exploration, and churn analysis.
- **Power BI:** Interactive dashboard development and data visualization.
- **GitHub:** Project documentation, version control, and portfolio presentation.

## Data Preparation & Quality Checks

Before performing the churn analysis, data quality checks were conducted using SQL Server to assess the reliability and consistency of the dataset.

The checks included:

- **Duplicate records:** Verified customer records for duplicates; no duplicate customer IDs were found.
- **Missing values:** Checked for missing and blank values in relevant columns and investigated missing `TotalCharges` values in the raw data.
- **Data consistency:** Validated categorical values and checked logical consistency across relevant fields.
- **Numeric validation:** Examined the ranges of key numeric variables, including tenure, monthly charges, and total charges.
- **Data cleaning:** Created and validated a cleaned table, `Customer_Clean`, for use in the subsequent analysis.

The cleaned dataset contained **7,043 customer records** and was used as the basis for the SQL analysis and Power BI dashboard.

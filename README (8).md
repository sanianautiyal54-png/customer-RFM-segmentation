# Customer RFM Segmentation

## Project Overview

This project performs **Customer RFM (Recency, Frequency, Monetary)
Segmentation** using the **Online Retail II** dataset.

The goal is to identify different customer groups based on their
purchasing behavior and provide practical recommendations for each
segment.

## Objective

-   Calculate customer **Recency, Frequency, and Monetary** values.
-   Assign RFM scores from **1 to 5**.
-   Segment customers based on their RFM scores.
-   Analyze the size and revenue contribution of each segment.
-   Provide business recommendations for customer engagement and
    retention.

## Tools & Technologies

-   **Python**
-   **Pandas**
-   **Matplotlib**
-   **SQL Server**
-   **Excel**
-   **Google Colab**

## Dataset

**Online Retail II** dataset.

The dataset contains retail transaction information such as:

-   Invoice
-   StockCode
-   Description
-   Quantity
-   InvoiceDate
-   Price
-   Customer_ID
-   Country

## Data Cleaning

The following cleaning steps were performed:

-   Removed transactions with missing Customer IDs.
-   Removed cancelled invoices.
-   Removed records with negative quantities.
-   Removed records with zero or negative prices.
-   Created `Total_Amount` using:

``` text
Total_Amount = Quantity × Price
```

## RFM Analysis

### Recency

Number of days since the customer's most recent purchase.

### Frequency

Number of unique invoices/orders made by the customer.

### Monetary

Total amount spent by the customer.

``` text
Monetary = Sum(Quantity × Price)
```

## RFM Scoring

Each RFM dimension was converted into a score from **1 to 5**.

-   Recency: more recent customers receive higher scores.
-   Frequency: more frequent customers receive higher scores.
-   Monetary: higher-spending customers receive higher scores.

The three scores were combined into an `RFM_Score`.

Example:

``` text
R_Score = 5
F_Score = 4
M_Score = 5

RFM_Score = 545
```

## Customer Segments

Customers were grouped using practical RFM rules:

  -----------------------------------------------------------------------
  Segment                             Description
  ----------------------------------- -----------------------------------
  Champions                           Recent, frequent, and high-value
                                      customers

  Loyal Customers                     Consistently active customers with
                                      strong RFM scores

  Potential Loyalists                 Recent customers who may become
                                      more loyal

  At Risk                             Previously valuable/active
                                      customers showing lower recency

  Need Attention                      Customers requiring targeted
                                      engagement

  Lost Customers                      Customers with low recent activity
                                      and weaker RFM scores
  -----------------------------------------------------------------------

## Segment Summary

The analysis produced six customer segments across **4,312 customers**.

  Segment                 Customers   Customer %
  --------------------- ----------- ------------
  At Risk                       509       11.80%
  Champions                     926       21.47%
  Lost Customers              1,558       36.13%
  Loyal Customers               767       17.79%
  Need Attention                185        4.29%
  Potential Loyalists           367        8.51%

## Business Recommendations

### Champions

Reward loyal customers with exclusive offers, early access, and loyalty
benefits.

### Loyal Customers

Encourage repeat purchases through loyalty rewards, personalized offers,
and cross-selling.

### Potential Loyalists

Use targeted promotions and product recommendations to encourage more
frequent purchases.

### At Risk

Use re-engagement campaigns, personalized discounts, and reminders.

### Need Attention

Provide targeted offers and relevant product recommendations to
encourage another purchase.

### Lost Customers

Use win-back campaigns with attractive offers and personalized
communication.

## Project Workflow

``` text
Online Retail II Dataset
        ↓
SQL Server
        ↓
Data Cleaning
        ↓
RFM Calculation
        ↓
Python / Pandas
        ↓
RFM Scoring
        ↓
Customer Segmentation
        ↓
Segment Summary
        ↓
Business Recommendations
```

## Project Deliverables

-   `Final_RFM_Segmentation.csv` --- customer-level RFM scores and
    segments
-   `Segment_Summary.csv` --- segment-level customer and revenue summary
-   `Recommendations.csv` --- recommended actions for each segment
-   SQL queries used for data cleaning and RFM calculation
-   Python/Colab notebook containing the analysis

## Key Skills Demonstrated

-   SQL data cleaning
-   SQL aggregation and grouping
-   Customer-level RFM analysis
-   Python data analysis with Pandas
-   Quantile-based scoring
-   Customer segmentation
-   Data visualization
-   Business interpretation and recommendations

## Conclusion

This project demonstrates how transaction-level retail data can be
transformed into actionable customer segments using SQL and Python. RFM
analysis helps organize customers according to purchase recency,
purchase frequency, and monetary value, providing a practical foundation
for customer retention, re-engagement, and loyalty strategies.

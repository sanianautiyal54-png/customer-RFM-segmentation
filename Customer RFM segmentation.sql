SELECT
    SUM(CASE WHEN Customer_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Customer_ID,
    SUM(CASE WHEN Description IS NULL THEN 1 ELSE 0 END) AS Missing_Description,
    SUM(CASE WHEN InvoiceDate IS NULL THEN 1 ELSE 0 END) AS Missing_InvoiceDate,
    SUM(CASE WHEN Price IS NULL THEN 1 ELSE 0 END) AS Missing_Price
FROM dbo.OnlineRetail;

SELECT COUNT(*) AS Cancelled_Invoices
FROM dbo.OnlineRetail
WHERE Invoice LIKE 'C%';

SELECT
    ROUND(SUM(Quantity * Price), 2) AS Total_Revenue
FROM dbo.OnlineRetail
WHERE Quantity > 0
  AND Price > 0
  AND Customer_ID IS NOT NULL
  AND Invoice NOT LIKE 'C%';

  SELECT COUNT(DISTINCT Customer_ID) AS Total_Customers
FROM dbo.OnlineRetail
WHERE Customer_ID IS NOT NULL;

SELECT
    Country,
    COUNT(DISTINCT Customer_ID) AS Customers,
    ROUND(SUM(Quantity * Price), 2) AS Revenue
FROM dbo.OnlineRetail
WHERE Quantity > 0
  AND Price > 0
  AND Customer_ID IS NOT NULL
  AND Invoice NOT LIKE 'C%'
GROUP BY Country
ORDER BY Revenue DESC;

SELECT TOP 10
    Customer_ID,
    COUNT(DISTINCT Invoice) AS Number_of_Orders,
    ROUND(SUM(Quantity * Price), 2) AS Total_Spending
FROM dbo.OnlineRetail
WHERE Quantity > 0
  AND Price > 0
  AND Customer_ID IS NOT NULL
  AND Invoice NOT LIKE 'C%'
GROUP BY Customer_ID
ORDER BY Total_Spending DESC;

CREATE OR ALTER VIEW vw_CleanTransactions AS
SELECT
    Invoice,
    StockCode,
    Description,
    Quantity,
    InvoiceDate,
    Price,
    Customer_ID,
    Country,
    Quantity * Price AS Total_Amount
FROM dbo.OnlineRetail
WHERE Customer_ID IS NOT NULL
  AND Quantity > 0
  AND Price > 0
  AND Invoice NOT LIKE 'C%';

SELECT TOP 10 *
FROM vw_CleanTransactions;


SELECT
    MAX(InvoiceDate) AS Last_Transaction_Date,
    DATEADD(DAY, 1, CAST(MAX(InvoiceDate) AS DATE)) AS Analysis_Date
FROM vw_CleanTransactions;

SELECT
    Customer_ID,

    DATEDIFF(
        DAY,
        CAST(MAX(InvoiceDate) AS DATE),
        '2009-12-11'
    ) AS Recency,

    COUNT(DISTINCT Invoice) AS Frequency,

    ROUND(SUM(Total_Amount), 2) AS Monetary

FROM vw_CleanTransactions
GROUP BY Customer_ID
ORDER BY Customer_ID;

SELECT
    Customer_ID,

    DATEDIFF(
        DAY,
        CAST(MAX(InvoiceDate) AS DATE),
        '2009-12-11'
    ) AS Recency,

    COUNT(DISTINCT Invoice) AS Frequency,

    ROUND(SUM(Total_Amount), 2) AS Monetary

INTO Customer_RFM
FROM vw_CleanTransactions
GROUP BY Customer_ID;

SELECT TOP 10 *
FROM Customer_RFM;

SELECT COUNT(*) AS Total_Customers
FROM Customer_RFM;

SELECT
    MIN(Recency) AS Min_Recency,
    MAX(Recency) AS Max_Recency,
    MIN(Frequency) AS Min_Frequency,
    MAX(Frequency) AS Max_Frequency,
    MIN(Monetary) AS Min_Monetary,
    MAX(Monetary) AS Max_Monetary
FROM Customer_RFM;
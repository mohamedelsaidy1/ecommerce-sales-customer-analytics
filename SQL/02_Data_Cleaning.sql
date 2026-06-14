SELECT *
INTO returns_data
FROM online_retail
WHERE Invoice LIKE 'C%'
OR Quantity < 0;

WITH SalesData AS
(
    SELECT *
    FROM online_retail
    WHERE Quantity > 0
      AND Price > 0
      AND Invoice NOT LIKE 'C%'
),
DeduplicatedData AS
(
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY Invoice, StockCode, Quantity, Price, Customer_ID
               ORDER BY Invoice
           ) AS rn
    FROM SalesData
)
SELECT
    Invoice,
    StockCode,
    Description,
    Quantity,
    InvoiceDate,
    Price,
    Customer_ID,
    Country,
    Quantity * Price AS Revenue
INTO sales_clean
FROM DeduplicatedData
WHERE rn = 1;
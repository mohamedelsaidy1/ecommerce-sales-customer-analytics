SELECT COUNT(*) AS TotalRows FROM online_retail;
SELECT COUNT(DISTINCT Customer_ID) AS UniqueCustomers FROM online_retail;
SELECT COUNT(DISTINCT StockCode) AS UniqueProducts FROM online_retail;
SELECT COUNT(DISTINCT Invoice) AS UniqueInvoices FROM online_retail;

SELECT COUNT(*) AS ReturnsRows
FROM online_retail
WHERE Invoice LIKE 'C%';

SELECT COUNT(*) AS NegativeQuantityRows
FROM online_retail
WHERE Quantity < 0;

SELECT COUNT(*) AS InvalidPriceRows
FROM online_retail
WHERE Price <= 0;

SELECT MIN(InvoiceDate) AS StartDate,
       MAX(InvoiceDate) AS EndDate
FROM online_retail;
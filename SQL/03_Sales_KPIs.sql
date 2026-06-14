SELECT COUNT(*) AS SalesRows FROM sales_clean;

SELECT SUM(Revenue) AS TotalRevenue
FROM sales_clean;

SELECT COUNT(DISTINCT Invoice) AS TotalOrders
FROM sales_clean;

SELECT COUNT(DISTINCT Customer_ID) AS TotalCustomers
FROM sales_clean
WHERE Customer_ID IS NOT NULL;

SELECT SUM(Revenue) / COUNT(DISTINCT Invoice) AS AOV
FROM sales_clean;

SELECT
CAST(COUNT(DISTINCT Invoice) AS FLOAT)
/
COUNT(DISTINCT Customer_ID) AS OrdersPerCustomer
FROM sales_clean
WHERE Customer_ID IS NOT NULL;

SELECT YEAR(InvoiceDate) AS SalesYear,
       MONTH(InvoiceDate) AS SalesMonth,
       ROUND(SUM(Revenue),2) AS Revenue
FROM sales_clean
GROUP BY YEAR(InvoiceDate), MONTH(InvoiceDate)
ORDER BY SalesYear, SalesMonth;
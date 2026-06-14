SELECT TOP 10
    Customer_ID,
    SUM(Revenue) AS TotalRevenue,
    COUNT(DISTINCT Invoice) AS OrdersCount
FROM sales_clean
WHERE Customer_ID IS NOT NULL
GROUP BY Customer_ID
ORDER BY TotalRevenue DESC;

SELECT COUNT(DISTINCT Customer_ID) AS Customers,
       COUNT(DISTINCT Invoice) AS Orders,
       ROUND(COUNT(DISTINCT Invoice)*1.0/COUNT(DISTINCT Customer_ID),2) AS AvgOrdersPerCustomer
FROM sales_clean
WHERE Customer_ID IS NOT NULL;

SELECT COUNT(*) AS OneOrderCustomers
FROM (
    SELECT Customer_ID
    FROM sales_clean
    WHERE Customer_ID IS NOT NULL
    GROUP BY Customer_ID
    HAVING COUNT(DISTINCT Invoice)=1
) t;
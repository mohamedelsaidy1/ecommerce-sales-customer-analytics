SELECT TOP 10
    Country,
    ROUND(SUM(Revenue),2) AS Revenue,
    COUNT(DISTINCT Invoice) AS Orders,
    COUNT(DISTINCT Customer_ID) AS Customers
FROM sales_clean
GROUP BY Country
ORDER BY Revenue DESC;
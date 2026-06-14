SELECT TOP 10
    StockCode,
    Description,
    ROUND(SUM(Revenue),2) AS TotalRevenue
FROM sales_clean
GROUP BY StockCode, Description
ORDER BY TotalRevenue DESC;

SELECT TOP 10
    StockCode,
    Description,
    SUM(Quantity) AS TotalQuantitySold
FROM sales_clean
GROUP BY StockCode, Description
ORDER BY TotalQuantitySold DESC;

SELECT COUNT(*) AS OneTimeProducts
FROM (
    SELECT StockCode
    FROM sales_clean
    GROUP BY StockCode
    HAVING SUM(Quantity)=1
) t;
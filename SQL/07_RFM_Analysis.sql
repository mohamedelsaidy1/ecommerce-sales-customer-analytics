WITH customer_rfm AS
(
SELECT
    Customer_ID,
    DATEDIFF(DAY,MAX(InvoiceDate),
    (SELECT MAX(InvoiceDate) FROM sales_clean)) AS Recency,
    COUNT(DISTINCT Invoice) AS Frequency,
    SUM(Revenue) AS Monetary
FROM sales_clean
WHERE Customer_ID IS NOT NULL
GROUP BY Customer_ID
)
SELECT * FROM customer_rfm;

WITH customer_rfm AS
(
SELECT
    Customer_ID,
    DATEDIFF(DAY,MAX(InvoiceDate),
    (SELECT MAX(InvoiceDate) FROM sales_clean)) AS Recency,
    COUNT(DISTINCT Invoice) AS Frequency,
    SUM(Revenue) AS Monetary
FROM sales_clean
WHERE Customer_ID IS NOT NULL
GROUP BY Customer_ID
)
SELECT
Customer_ID,
Recency,
Frequency,
Monetary,
NTILE(5) OVER(ORDER BY Recency DESC) AS R_Score,
NTILE(5) OVER(ORDER BY Frequency ASC) AS F_Score,
NTILE(5) OVER(ORDER BY Monetary ASC) AS M_Score
INTO customer_rfm_scores
FROM customer_rfm;

SELECT *,
CASE
WHEN R_Score >=4 AND F_Score >=4 AND M_Score >=4 THEN 'Champions'
WHEN R_Score >=3 AND F_Score >=4 THEN 'Loyal Customers'
WHEN R_Score >=4 AND F_Score >=2 THEN 'Potential Loyalists'
WHEN R_Score <=2 AND F_Score >=3 THEN 'At Risk'
WHEN R_Score <=2 AND F_Score <=2 THEN 'Lost Customers'
ELSE 'Others'
END AS CustomerSegment
INTO customer_segments
FROM customer_rfm_scores;
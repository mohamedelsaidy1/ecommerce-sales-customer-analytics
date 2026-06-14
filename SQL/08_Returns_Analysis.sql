SELECT COUNT(*) AS ReturnRows,
       SUM(ABS(Quantity * Price)) AS ReturnedValue
FROM returns_data;

SELECT
(
    SELECT SUM(ABS(Quantity * Price))
    FROM returns_data
) * 100.0
/
(
    SELECT SUM(Revenue)
    FROM sales_clean
) AS ReturnRate;
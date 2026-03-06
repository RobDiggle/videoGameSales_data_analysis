-- Time series analysis

SELECT
DATE_TRUNC('month', SaleDate) AS sale_month,
    SUM(GrossProfitAmount) AS total_profit,
    SUM(UnitsSold) AS total_units
FROM FactSales
GROUP BY sale_month
ORDER BY sale_month;
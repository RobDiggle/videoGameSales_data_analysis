-- Check the number of unique

SELECT COUNT(DISTINCT country ) AS market_countries
FROM dimcustomer

SELECT DISTINCT country AS market_countries
FROM dimcustomer

-- Determining highest and lowest sales by countries

SELECT country, COUNT(CustomerCode)
FROM dimcustomer
GROUP BY country
ORDER BY COUNT(customercode) desc

-- Are more sales made by hardcore or casual players?

SELECT segment, COUNT(CustomerCode)
FROM dimcustomer
GROUP BY segment
ORDER BY COUNT(customercode) desc

-- How many overall customers do we have?
SELECT COUNT(customercode) AS unique_customers
FROM dimcustomer

-- What is the age range of our customers on average?
SELECT ageband, COUNT(customercode) AS age_group
FROM dimcustomer
GROUP BY ageband
ORDER BY COUNT(customercode) desc
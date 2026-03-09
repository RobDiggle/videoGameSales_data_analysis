
-- Checking for null values in the facts table

SELECT COUNT(*) AS MissingValues
FROM factsales
where ordersource IS NULL

-- Check the number of unique countries we are selling products within.

SELECT COUNT(DISTINCT country ) AS market_countries
FROM dimcustomer;

SELECT DISTINCT country AS market_countries
FROM dimcustomer

-- How many sales do we have in total?

SELECT SUM(GrossProfitAmount) AS total_profit
FROM factsales

-- Determining highest and lowest sales by countries.
-- First, we will measure raw number of products sold and then
-- we will show total revenue by country regardless of quantity of products sold.

SELECT country, SUM(UnitsSold)
    FROM
        FactSales as f 
    JOIN 
        dimcustomer as d 
    ON f.CustomerKey = d.CustomerKey
    GROUP BY COUNTRY 
    ORDER BY SUM(unitssold) desc;

SELECT country, SUM(grossprofitamount)
    FROM 
        FactSales AS f
    JOIN 
        dimcustomer AS d 
    ON f.CustomerKey = d.CustomerKey
    GROUP BY country
    ORDER BY SUM(grossprofitamount) desc

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

-- What genre, platform and developer studios sell the best?

SELECT genre, COUNT(GameCode) AS best_selling_genre
FROM DimGame
GROUP BY genre
ORDER BY COUNT(GameCode) desc;

SELECT platform, COUNT(GameCode) AS best_selling_genre
FROM DimGame
GROUP BY platform
ORDER BY COUNT(GameCode) desc;

SELECT DeveloperStudio, COUNT(GameCode) AS best_selling_genre
FROM DimGame
GROUP BY DeveloperStudio
ORDER BY COUNT(GameCode) desc

-- Is there a notable difference in which genres sell better in which regions?

SELECT country, genre, COUNT(genre) AS genre_by_country
    FROM 
        dimcustomer AS c
    JOIN 
        factsales AS f
    JOIN 
        Dimgame AS d   
    ON f.gamekey = d.gamekey
    ON f.CustomerKey = c.CustomerKey
    GROUP BY Country, d.genre
    ORDER BY COUNT(genre) DESC

-- What kind of retail environments sell the best?

SELECT ChannelType, COUNT(RetailerCode)
FROM DimRetailer
GROUP BY ChannelType
ORDER BY COUNT(retailercode) desc;

SELECT country, ChannelType, COUNT(ChannelType)
FROM DimRetailer
GROUP BY country, ChannelType
ORDER BY COUNT(ChannelType) desc

SELECT * FROM FactSales
LIMIT 10;

-- Case expression
-- Used to apply conditional logic to transform 
-- or categorize data in the query output.
SELECT OrderSource,
    CASE    
        WHEN LOWER(OrderSource) LIKE '%ebsite%' THEN 'Online Sale'
        WHEN LOWER(OrderSource) LIKE '%etail%' THEN 'Retail Sale'
        WHEN LOWER(OrderSource) LIKE '%obile%' THEN 'Mobile Sale'
    ELSE 'Other'
END AS order_source_cleaned
FROM factsales

SELECT DISTINCT(OrderSource)
FROM factsales




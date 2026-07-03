USE SuperstoreDB;
-- WINDOW FUNCTION ANALYSIS

-- Rank Products by Revenue

SELECT
    Sub_Category,
    SUM(Sales) AS Revenue,

    RANK() OVER(
        ORDER BY SUM(Sales) DESC
    ) AS Revenue_Rank

FROM superstore_new

GROUP BY Sub_Category;

-- Dense Rank Customers

SELECT
    Customer_Name,
    SUM(Sales) AS Revenue,

    DENSE_RANK() OVER(
        ORDER BY SUM(Sales) DESC
    ) AS Customer_Rank

FROM superstore_new

GROUP BY Customer_Name;


-- Running Total Revenue

SELECT
    Order_Date,
    Sales,

    SUM(Sales) OVER(
        ORDER BY Order_Date
    ) AS Running_Revenue

FROM superstore_new;


-- Top Products Using CTE

WITH ProductSales AS (

    SELECT
        Sub_Category,
        SUM(Sales) AS Revenue

    FROM superstore_new

    GROUP BY Sub_Category
)

SELECT TOP 5 *
FROM ProductSales
ORDER BY Revenue DESC;


-- Average Regional Profit Using CTE

WITH RegionalProfit AS (

    SELECT
        Region,
        SUM(Profit) AS Profit

    FROM superstore_new

    GROUP BY Region
)

SELECT *
FROM RegionalProfit

WHERE Profit > (

    SELECT AVG(Profit)
    FROM RegionalProfit
);
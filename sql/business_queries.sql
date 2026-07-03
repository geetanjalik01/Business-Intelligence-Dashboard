-- BUSINESS KPI QUERIES

USE SuperstoreDB;

-- 1. Total Revenue

SELECT
    SUM(Sales) AS Total_Revenue
FROM superstore_new;

--2. Revenue by Region
SELECT
    Region,
    SUM(Sales) AS Revenue
FROM superstore_new
GROUP BY Region
ORDER BY Revenue DESC;

--3. Revenue by Category
SELECT
    Category,
    SUM(Sales) AS Revenue
FROM superstore_new
GROUP BY Category
ORDER BY Revenue DESC;

-- 4. Monthly Revenue Trend
SELECT
    FORMAT(TRY_CAST(Order_Date AS DATE), 'yyyy-MM') AS Month,
    SUM(Sales) AS Monthly_Revenue
FROM superstore_new
WHERE TRY_CAST(Order_Date AS DATE) IS NOT NULL
GROUP BY FORMAT(TRY_CAST(Order_Date AS DATE), 'yyyy-MM')
ORDER BY Month;

-- 5. Total Profit
SELECT
    SUM(Profit) AS Total_Profit
FROM superstore_new;

-- 6. Profit Margin %
SELECT
    SUM(Profit) * 100.0 / SUM(Sales)
    AS Profit_Margin_Percentage
FROM superstore_new;

-- 7. Profit by Category
SELECT
    Category,
    SUM(Profit) AS Total_Profit
FROM superstore_new
GROUP BY Category
ORDER BY Total_Profit DESC;

-- 8. Loss-Making Products
SELECT TOP 10
    Sub_Category,
    SUM(Profit) AS Loss
FROM superstore_new
GROUP BY Sub_Category
ORDER BY Loss ASC;

-- 9. Discount Impact on Profit
SELECT
    Discount,
    AVG(Profit) AS Avg_Profit
FROM superstore_new
GROUP BY Discount
ORDER BY Discount;

-- 10. Top Customers by Revenue
SELECT TOP 10
    Customer_Name,
    SUM(Sales) AS Revenue
FROM superstore_new
GROUP BY Customer_Name
ORDER BY Revenue DESC;

-- 11. Repeat Customers
SELECT
    Customer_Name,
    COUNT(DISTINCT Order_ID) AS Total_Orders
FROM superstore_new
GROUP BY Customer_Name
HAVING COUNT(DISTINCT Order_ID) > 1
ORDER BY Total_Orders DESC;

-- 12. Customer Lifetime Value (CLV)
SELECT
    SUM(Sales) /
    COUNT(DISTINCT Customer_ID)
    AS Customer_Lifetime_Value
FROM superstore_new;

-- 13. Segment Analysis
SELECT
    Segment,
    SUM(Sales) AS Revenue,
    SUM(Profit) AS Profit
FROM superstore_new
GROUP BY Segment
ORDER BY Revenue DESC;

-- 14. Best-Selling Products
SELECT TOP 10
    Sub_Category,
    SUM(Sales) AS Revenue
FROM superstore_new
GROUP BY Sub_Category
ORDER BY Revenue DESC;

-- 15. Most Profitable Products
SELECT TOP 10
    Sub_Category,
    SUM(Profit) AS Profit
FROM superstore_new
GROUP BY Sub_Category
ORDER BY Profit DESC;

-- 16. Quantity Sold Analysis
SELECT
    Sub_Category,
    SUM(Quantity) AS Quantity_Sold
FROM superstore_new
GROUP BY Sub_Category
ORDER BY Quantity_Sold DESC;
CREATE DATABASE sales_dashboard;
USE sales_dashboard;

SHOW TABLES;
SELECT COUNT(*) AS Total_Rows
FROM `sample - superstore`;
DESCRIBE `sample - superstore`;
RENAME TABLE `sample - superstore`
TO sample_superstore;
SELECT COUNT(*) AS Total_Rows
FROM sample_superstore;
DESCRIBE sample_superstore;
SELECT
SUM(`Row ID` IS NULL) AS Row_ID,
SUM(`Order ID` IS NULL) AS Order_ID,
SUM(`Order Date` IS NULL) AS Order_Date,
SUM(`Ship Date` IS NULL) AS Ship_Date,
SUM(`Ship Mode` IS NULL) AS Ship_Mode,
SUM(`Customer ID` IS NULL) AS Customer_ID,
SUM(`Customer Name` IS NULL) AS Customer_Name,
SUM(Segment IS NULL) AS Segment,
SUM(Country IS NULL) AS Country,
SUM(City IS NULL) AS City,
SUM(State IS NULL) AS State,
SUM(`Postal Code` IS NULL) AS Postal_Code,
SUM(Region IS NULL) AS Region,
SUM(`Product ID` IS NULL) AS Product_ID,
SUM(Category IS NULL) AS Category,
SUM(`Sub-Category` IS NULL) AS Sub_Category,
SUM(`Product Name` IS NULL) AS Product_Name,
SUM(Sales IS NULL) AS Sales,
SUM(Quantity IS NULL) AS Quantity,
SUM(Discount IS NULL) AS Discount,
SUM(Profit IS NULL) AS Profit
FROM sample_superstore;




SELECT *,
COUNT(*) AS Duplicate_Count
FROM sample_superstore
GROUP BY
`Row ID`,
`Order ID`,
`Order Date`,
`Ship Date`,
`Ship Mode`,
`Customer ID`,
`Customer Name`,
Segment,
Country,
City,
State,
`Postal Code`,
Region,
`Product ID`,
Category,
`Sub-Category`,
`Product Name`,
Sales,
Quantity,
Discount,
Profit
HAVING COUNT(*) > 1;

SELECT
`Order Date`,
`Ship Date`
FROM sample_superstore
LIMIT 10;

SELECT
ROUND(SUM(Sales),2) AS Total_Sales
FROM sample_superstore;

SELECT
ROUND(SUM(Profit),2) AS Total_Profit
FROM sample_superstore;

SELECT
COUNT(DISTINCT `Order ID`) AS Total_Orders
FROM sample_superstore;

SELECT
COUNT(DISTINCT `Customer ID`) AS Total_Customers
FROM sample_superstore;

SELECT
SUM(Quantity) AS Total_Quantity
FROM sample_superstore;

SELECT
ROUND((SUM(Profit) / SUM(Sales)) * 100, 2) AS Profit_Margin
FROM sample_superstore;

SELECT
    Region,
    ROUND(SUM(Sales),2) AS Total_Sales,
    ROUND(SUM(Profit),2) AS Total_Profit
FROM sample_superstore
GROUP BY Region
ORDER BY Total_Sales DESC;

SELECT
    Category,
    ROUND(SUM(Sales),2) AS Total_Sales,
    ROUND(SUM(Profit),2) AS Total_Profit
FROM sample_superstore
GROUP BY Category
ORDER BY Total_Sales DESC;

SELECT
    `Sub-Category`,
    ROUND(SUM(Sales),2) AS Total_Sales,
    ROUND(SUM(Profit),2) AS Total_Profit
FROM sample_superstore
GROUP BY `Sub-Category`
ORDER BY Total_Sales DESC;

SELECT
    `Customer Name`,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM sample_superstore
GROUP BY `Customer Name`
ORDER BY Total_Sales DESC
LIMIT 10;

SELECT
    `Product Name`,
    ROUND(SUM(Sales),2) AS Total_Sales,
    ROUND(SUM(Profit),2) AS Total_Profit
FROM sample_superstore
GROUP BY `Product Name`
ORDER BY Total_Sales DESC
LIMIT 10;

SELECT
    YEAR(STR_TO_DATE(`Order Date`, '%d-%m-%Y')) AS Year,
    MONTH(STR_TO_DATE(`Order Date`, '%d-%m-%Y')) AS Month,
    ROUND(SUM(Sales),2) AS Total_Sales
FROM sample_superstore
GROUP BY Year, Month
ORDER BY Year, Month;

SELECT
    Segment,
    ROUND(SUM(Sales),2) AS Total_Sales,
    ROUND(SUM(Profit),2) AS Total_Profit
FROM sample_superstore
GROUP BY Segment
ORDER BY Total_Sales DESC;

SELECT
    `Ship Mode`,
    COUNT(*) AS Orders,
    ROUND(SUM(Sales),2) AS Total_Sales,
    ROUND(SUM(Profit),2) AS Total_Profit
FROM sample_superstore
GROUP BY `Ship Mode`
ORDER BY Orders DESC;

USE sales_dashboard;

SHOW TABLES;
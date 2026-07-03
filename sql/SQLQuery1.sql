CREATE DATABASE SuperstoreDB;


USE SuperstoreDB;

CREATE TABLE Superstore (
    [Row ID] INT,
    [Order ID] VARCHAR(50),
    [Order Date] VARCHAR(20),
    [Ship Date] VARCHAR(20),
    [Ship Mode] VARCHAR(50),
    [Customer ID] VARCHAR(50),
    [Customer Name] VARCHAR(100),
    Segment VARCHAR(50),
    Country VARCHAR(50),
    City VARCHAR(50),
    State VARCHAR(50),
    [Postal Code] INT,
    Region VARCHAR(50),
    [Product ID] VARCHAR(50),
    Category VARCHAR(50),
    [Sub-Category] VARCHAR(50),
    [Product Name] VARCHAR(255),
    Sales FLOAT,
    Quantity INT,
    Discount FLOAT,
    Profit FLOAT,
    [Profit Margin %] FLOAT,
    [Shipping Days] INT,
    [Month-Year] VARCHAR(20)
);

select * from superstore_new;
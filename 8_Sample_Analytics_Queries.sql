-- 1. Average Property Values by Category
SELECT Category, AVG(PropertyValue) AS AverageValue
FROM Properties
GROUP BY Category;

-- 2. Property Sales Trends by Date
SELECT SaleDate, COUNT(*) AS TotalSales
FROM PropertySales
GROUP BY SaleDate
ORDER BY SaleDate;

-- 3. Market Analysis by Location
SELECT Location, SUM(PropertyValue) AS TotalMarketValue, COUNT(*) AS PropertyCount
FROM Properties
GROUP BY Location;

-- 4. School District Analysis
SELECT SchoolDistrict, AVG(PropertyValue) AS AverageValue
FROM Properties
GROUP BY SchoolDistrict;

-- 5. Category Distribution Analysis
SELECT Category, COUNT(*) AS NumberOfProperties
FROM Properties
GROUP BY Category;

-- 6. Top Properties by Value
SELECT TOP 10 PropertyName, PropertyValue
FROM Properties
ORDER BY PropertyValue DESC;

-- 7. Geographic Heatmaps (Example Query)
SELECT Latitude, Longitude, COUNT(*) AS Count
FROM Properties
GROUP BY Latitude, Longitude; 

-- 8. Time Series Analysis
SELECT DATEPART(YEAR, SaleDate) AS SaleYear, COUNT(*) AS TotalSales
FROM PropertySales
GROUP BY DATEPART(YEAR, SaleDate);

-- 9. Comprehensive Business Intelligence Query 1
SELECT AVG(PropertyValue) AS OverallAverage, COUNT(*) AS TotalProperties
FROM Properties;

-- 10. Comprehensive Business Intelligence Query 2
SELECT SaleDate, SUM(PropertyValue) AS DailySales
FROM PropertySales
GROUP BY SaleDate;

-- 11. Market Trends Over Years
SELECT DATEPART(YEAR, SaleDate) AS Year, SUM(PropertyValue) AS TotalValue
FROM PropertySales
GROUP BY DATEPART(YEAR, SaleDate);

-- 12. Average Days on Market by Category
SELECT Category, AVG(DATEDIFF(DAY, ListedDate, SaleDate)) AS AverageDaysOnMarket
FROM Properties
JOIN PropertySales ON Properties.PropertyID = PropertySales.PropertyID
GROUP BY Category;

-- 13. Sale Price vs. Listing Price Analysis
SELECT PropertyName, ListedPrice, SoldPrice
FROM PropertySales
JOIN Properties ON PropertySales.PropertyID = Properties.PropertyID;

-- 14. Yearly Change in Average Property Value
SELECT DATEPART(YEAR, SaleDate) AS Year, AVG(SoldPrice) AS AverageSoldPrice
FROM PropertySales
GROUP BY DATEPART(YEAR, SaleDate);

-- 15. Inventory Analysis per Location
SELECT Location, COUNT(*) AS PropertyCount
FROM Properties
GROUP BY Location;
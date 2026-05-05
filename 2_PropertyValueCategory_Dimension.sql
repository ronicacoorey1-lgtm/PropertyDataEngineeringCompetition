-- Create dimCategory Dimension Table
CREATE TABLE dimCategory (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(50) NOT NULL,
    MinValue DECIMAL(18, 2),
    MaxValue DECIMAL(18, 2)
);

-- Insert Value Tiers
INSERT INTO dimCategory (CategoryID, CategoryName, MinValue, MaxValue) VALUES 
(1, 'Budget', 0.00, 750000.00),
(2, 'Mid-Range', 750000.01, 1500000.00),
(3, 'Premium', 1500000.01, 2500000.00),
(4, 'Luxury', 2500000.01, NULL);

-- Stored Procedure to Assign Categories
CREATE PROCEDURE AssignCategory (
    @PropertyValue DECIMAL(18, 2),
    @CategoryName VARCHAR(50) OUTPUT
)
AS
BEGIN
    IF @PropertyValue >= 0 AND @PropertyValue <= 750000
        SET @CategoryName = 'Budget';
    ELSE IF @PropertyValue > 750000 AND @PropertyValue <= 1500000
        SET @CategoryName = 'Mid-Range';
    ELSE IF @PropertyValue > 1500000 AND @PropertyValue <= 2500000
        SET @CategoryName = 'Premium';
    ELSE IF @PropertyValue > 2500000
        SET @CategoryName = 'Luxury';
    ELSE
        SET @CategoryName = 'Unknown';
END;

-- Stored Procedure to Populate Dimensions
CREATE PROCEDURE PopulateCategories
AS
BEGIN
    -- Logic to populate categories based on existing property data
    -- This would typically involve inserting into dimCategory from another table
END;
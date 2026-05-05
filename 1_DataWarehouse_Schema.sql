-- Staging Tables
CREATE TABLE load_subcitydistrictstate (
    SubCityDistrictStateID INT PRIMARY KEY,
    SubCity VARCHAR(255) NOT NULL,
    City VARCHAR(255) NOT NULL,
    State VARCHAR(255) NOT NULL
);

CREATE TABLE load_propertymedianvalue (
    PropertyID INT PRIMARY KEY,
    MedianValue DECIMAL(18, 2) NOT NULL,
    EffectiveDate DATE NOT NULL,
    SubCityDistrictStateID INT,
    FOREIGN KEY (SubCityDistrictStateID) REFERENCES load_subcitydistrictstate(SubCityDistrictStateID)
);

CREATE TABLE load_publicschools (
    SchoolID INT PRIMARY KEY,
    SchoolName VARCHAR(255) NOT NULL,
    District VARCHAR(255) NOT NULL,
    SubCityDistrictStateID INT,
    FOREIGN KEY (SubCityDistrictStateID) REFERENCES load_subcitydistrictstate(SubCityDistrictStateID)
);

-- Dimension Tables
CREATE TABLE dimDate (
    DateKey INT PRIMARY KEY,
    FullDate DATE NOT NULL,
    Year INT NOT NULL,
    Month INT NOT NULL,
    Day INT NOT NULL
);

CREATE TABLE dimLocation (
    LocationKey INT PRIMARY KEY,
    SubCityDistrictStateID INT,
    FOREIGN KEY (SubCityDistrictStateID) REFERENCES load_subcitydistrictstate(SubCityDistrictStateID)
);

CREATE TABLE dimProperty (
    PropertyKey INT PRIMARY KEY,
    PropertyID INT,
    DimLocationKey INT,
    FOREIGN KEY (DimLocationKey) REFERENCES dimLocation(LocationKey)
);

CREATE TABLE dimSchool (
    SchoolKey INT PRIMARY KEY,
    SchoolID INT,
    DimLocationKey INT,
    FOREIGN KEY (DimLocationKey) REFERENCES dimLocation(LocationKey)
);

CREATE TABLE dimCategory (
    CategoryKey INT PRIMARY KEY,
    CategoryName VARCHAR(255) NOT NULL
);

-- Fact Tables
CREATE TABLE factPropertySales (
    SaleID INT PRIMARY KEY,
    PropertyKey INT,
    SalePrice DECIMAL(18, 2) NOT NULL,
    SaleDateKey INT,
    FOREIGN KEY (PropertyKey) REFERENCES dimProperty(PropertyKey),
    FOREIGN KEY (SaleDateKey) REFERENCES dimDate(DateKey)
);

CREATE TABLE factPropertyValues (
    ValueID INT PRIMARY KEY,
    PropertyKey INT,
    Value DECIMAL(18, 2) NOT NULL,
    ValueDateKey INT,
    FOREIGN KEY (PropertyKey) REFERENCES dimProperty(PropertyKey),
    FOREIGN KEY (ValueDateKey) REFERENCES dimDate(DateKey)
);
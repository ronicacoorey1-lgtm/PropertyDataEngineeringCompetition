# ETL Transformation Rules

## 1. Extraction Specifications
### a. Source 1: Property Listings
- **Data Fields:** Property ID, Address, City, State, Zip Code, Listing Date, Price, Bedrooms, Bathrooms, Square Footage
- **Extraction Method:** API call to listings service endpoint every 24 hours.

### b. Source 2: School Ratings
- **Data Fields:** School ID, School Name, District, Rating, Address
- **Extraction Method:** Daily CSV export from school database.

### c. Source 3: City Demographics
- **Data Fields:** City ID, Population, Median Income, Area Size
- **Extraction Method:** Weekly REST API pull from demographic service.

## 2. Transformation Logic
### a. Date Dimension
- **Standardization:** Convert all date fields to YYYY-MM-DD format.
- **Additional Fields:** Year, Quarter, Month, Day of Week derived from Listing Date.

### b. Location Dimension
- **Standardization:** Address components split into street, city, state, and zip.
- **Geolocation:** Enhance with latitude/longitude coordinates.

### c. Property Dimension
- **Filtering:** Exclude properties with missing or invalid fields (e.g., no Price, no Address).
- **Categorization:** Group properties into types (e.g., Residential, Commercial).

### d. School Dimension
- **Standardization:** Normalize school names by removing abbreviations and extra spaces.

### e. Category Dimension
- **Mapping:** Ensure categories are aligned with predefined taxonomy.

## 3. Fact Table Transformations
### a. Sales Fact Table
- **Numeric Transformations:** Calculate total sales and averages per property.
- **Linking Dimensions:** Incorporate keys from Date, Location, Property, and School dimensions.

### b. Values Fact Table
- **Aggregation:** Summarize data by different time periods (monthly, quarterly).
- **Price Adjustments:** Normalize prices based on inflation rates.

## 4. Data Quality Validations
- **Null Checks:** Ensure no critical fields (e.g., Price, Address, School Ratings) are null.
- **Range Validations:** Validate numeric fields fall within expected ranges (e.g., Price > 0).
- **Referential Integrity:** Ensure foreign keys correctly reference the dimension tables.

## 5. Error Handling Procedures
- **Logging:** Maintain error logs for any transformation failures.
- **Notifications:** Trigger alerts for user-defined thresholds of errors.

## 6. Reconciliation Steps
- **Data Consistency Check:** Compare source counts with the transformed dataset.
- **Monthly Reports:** Generate discrepancy reports and review with stakeholders.

---

This document serves as a blueprint for transforming raw property data into meaningful insights by ensuring well-defined extraction, transformation, and loading processes.
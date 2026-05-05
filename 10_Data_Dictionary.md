# Data Dictionary

## Staging Tables

### 1. `load_subcitydistrictstate`
- **Description**: This table holds the mapping of sub-city districts to their respective states.
- **Columns**:
  - `subcity_district_id`
    - **Data Type**: INT
    - **Constraints**: Primary Key
    - **Business Meaning**: Unique identifier for subcity district.
    - **Lineage Tracking**: Pulled from source XYZ.
    - **Transformation Rules**: None.
  - `subcity_name`
    - **Data Type**: VARCHAR(255)
    - **Constraints**: Not Null
    - **Business Meaning**: Name of the subcity district.
    - **Lineage Tracking**: Extracted from ABC reports.
    - **Transformation Rules**: Trim spaces.
  - `state_id`
    - **Data Type**: INT
    - **Constraints**: Foreign Key (References `states`)
    - **Business Meaning**: ID of the state where the subcity is located.
    - **Lineage Tracking**: Derived from state mapping.
    - **Transformation Rules**: Ensure valid state reference.

### 2. `load_propertymedianvalue`
- **Description**: Contains median property values based on different criteria.
- **Columns**:
  - `property_id`
    - **Data Type**: INT
    - **Constraints**: Primary Key
    - **Business Meaning**: Unique identifier for the property.
    - **Lineage Tracking**: Sourced from property evaluation system.
    - **Transformation Rules**: None.
  - `median_value`
    - **Data Type**: DECIMAL(10,2)
    - **Constraints**: Not Null
    - **Business Meaning**: Median market value of the property.
    - **Lineage Tracking**: Computed from sales data.
    - **Transformation Rules**: Calculated from final sale prices.

### 3. `load_publicschools`
- **Description**: Information about public schools.
- **Columns**:
  - `school_id`
    - **Data Type**: INT
    - **Constraints**: Primary Key
    - **Business Meaning**: Unique identifier for school.
    - **Lineage Tracking**: Collected from Department of Education data.
    - **Transformation Rules**: None.
  - `school_name`
    - **Data Type**: VARCHAR(255)
    - **Constraints**: Not Null
    - **Business Meaning**: Name of the school.
    - **Lineage Tracking**: Pulled from educational databases.
    - **Transformation Rules**: Format to title case.

## Dimension Tables

### 1. `dimDate`
- **Description**: Calendar dates to be used in reporting.
- **Columns**:
  - `date_id`
    - **Data Type**: INT
    - **Constraints**: Primary Key
    - **Business Meaning**: Unique identifier for a date.
    - **Lineage Tracking**: Based on a continuous calendar table.
    - **Transformation Rules**: None.
  - `date`
    - **Data Type**: DATE
    - **Constraints**: Not Null
    - **Business Meaning**: The actual date.
    - **Lineage Tracking**: Derived from system date.
    - **Transformation Rules**: None.

### 2. `dimLocation`
- **Description**: Geographical locations corresponding to properties.
- **Columns**:
  - `location_id`
    - **Data Type**: INT
    - **Constraints**: Primary Key
    - **Business Meaning**: Unique identifier for a location.
    - **Lineage Tracking**: Extracted from geographical data repository.
    - **Transformation Rules**: None.
  - `location_name`
    - **Data Type**: VARCHAR(255)
    - **Constraints**: Not Null
    - **Business Meaning**: Name of the location.
    - **Lineage Tracking**: Cross-referenced from city databases.
    - **Transformation Rules**: Normalize location names.

### 3. `dimProperty`
- **Description**: Details about properties.
- **Columns**:
  - `property_id`
    - **Data Type**: INT
    - **Constraints**: Primary Key
    - **Business Meaning**: Unique identifier for properties.
    - **Lineage Tracking**: Sourced from property listings.
    - **Transformation Rules**: None.
  - `property_type`
    - **Data Type**: VARCHAR(50)
    - **Constraints**: Not Null
    - **Business Meaning**: Type of the property (e.g., house, apartment).
    - **Lineage Tracking**: Taken from property registration system.
    - **Transformation Rules**: Standardize property types.

### 4. `dimSchool`
- **Description**: School-related attributes for analysis.
- **Columns**:
  - `school_id`
    - **Data Type**: INT
    - **Constraints**: Primary Key
    - **Business Meaning**: Unique identifier for schools.
    - **Lineage Tracking**: Gathered from educational records.
    - **Transformation Rules**: None.

### 5. `dimPropertyCategory`
- **Description**: Categories assigned to properties for analysis.
- **Columns**:
  - `category_id`
    - **Data Type**: INT
    - **Constraints**: Primary Key
    - **Business Meaning**: Unique identifier for property categories.
    - **Lineage Tracking**: Derived from categorization efforts.
    - **Transformation Rules**: Defined by property characteristics.
    
## Fact Tables

### 1. `factPropertySales`
- **Description**: Aggregated sales data for properties.
- **Columns**:
  - `sales_id`
    - **Data Type**: INT
    - **Constraints**: Primary Key
    - **Business Meaning**: Unique identifier for each sale transaction.
    - **Lineage Tracking**: Compiled from sales records.
    - **Transformation Rules**: None.

### 2. `factPropertyValues`
- **Description**: Historical property value records.
- **Columns**:
  - `value_id`
    - **Data Type**: INT
    - **Constraints**: Primary Key
    - **Business Meaning**: Unique identifier for property value records.
    - **Lineage Tracking**: Collated from valuation data.
    - **Transformation Rules**: None.
# SSIS Package 2 Transformation Design

## 1. Data Extraction
The SSIS package extracts data from the following three staging tables:
- Staging Table 1
- Staging Table 2
- Staging Table 3

## 2. Transformation Pipeline
The data undergoes a series of transformations, including data quality checks to ensure accuracy and consistency.

### Data Quality Checks
- Null Value Checks
- Format Validation
- Range Validation 

## 3. Dimensional Lookups
For the transformation, we perform dimensional lookups for the following:
- **Date Dimension**: Ensures that all date fields are accurate and in the correct format.
- **Location Dimension**: Validates location data against a master reference table.
- **Property Dimension**: Matches property IDs with detailed property information.
- **School Dimension**: Cross-references school IDs to link properties with their respective schools.
- **Category Dimension**: Matches property categories to known predefined categories.

## 4. Fact Tables Loading
The transformed data is loaded into two fact tables:
- **factPropertySales**: Holds sales transaction data.
- **factPropertyValues**: Stores updated property value information.

## 5. Dataflow Diagrams
- Diagram representation of the above processes to illustrate the flow of data from extraction to loading.
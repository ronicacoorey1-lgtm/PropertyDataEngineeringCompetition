# SSIS Package 1 Data Extraction Design

## Overview
This document outlines the design for SSIS Package 1, which focuses on data extraction from three Excel data sources and loading the data into staging tables.

### Data Sources
1. **AUS_SubCityDistrictState_Data.xlsx**
   - This file contains data related to subcity district states in Australia.
2. **NSW_PropertyMedianValue.xlsx**
   - This file includes median property values in New South Wales.
3. **NSW-Public-Schools-Master-Dataset.xlsx**
   - This file consists of comprehensive data on public schools in New South Wales.

### Dataflow Diagram Structure
Each data source will have its own data flow, as shown below:

#### 1. Data Extraction from AUS_SubCityDistrictState_Data.xlsx
   - **Task**: Extract data from AUS_SubCityDistrictState_Data.xlsx.
   - **Transformation**: Data validation and transformations as required.
   - **Load Process**: Load data into `load_subcitydistrictstate` staging table.

#### Dataflow Diagram:
![AUS_SubCityDistrictState_Data Dataflow Diagram](dataflow_aus_subcitydistrictstate.png)


#### 2. Data Extraction from NSW_PropertyMedianValue.xlsx
   - **Task**: Extract data from NSW_PropertyMedianValue.xlsx.
   - **Transformation**: Data validation and transformations as required.
   - **Load Process**: Load data into `load_propertymedianvalue` staging table.

#### Dataflow Diagram:
![NSW_PropertyMedianValue Dataflow Diagram](dataflow_nsw_propertymedianvalue.png)


#### 3. Data Extraction from NSW-Public-Schools-Master-Dataset.xlsx
   - **Task**: Extract data from NSW-Public-Schools-Master-Dataset.xlsx.
   - **Transformation**: Data validation and transformations as required.
   - **Load Process**: Load data into `load_publicschools` staging table.

#### Dataflow Diagram:
![NSW_Public_Schools Dataflow Diagram](dataflow_nsw_publicschools.png)

### Staging Tables
- **load_subcitydistrictstate**: Staging table for subcity district state data.
- **load_propertymedianvalue**: Staging table for property median values.
- **load_publicschools**: Staging table for public schools data.

### Conclusion
This SSIS package will ensure that data from the specified Excel sources is extracted efficiently, validated, and loaded into appropriate staging tables with the designated naming convention (i.e., load_ prefix).
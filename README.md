# Hotel Booking Analysis Project

## 📊 Project Overview

This project analyzes hotel booking performance data spanning from 2010 to 2019 using big data analytics techniques. The analysis identifies key drivers of profitability and consumer behavior patterns, providing actionable insights for hotel management and destination marketers.

## 🎯 Objectives

- Identify factors influencing hotel profitability and customer behavior
- Analyze booking patterns across demographics, origin countries, and destinations
- Forecast profit trends for future business planning
- Provide data-driven recommendations for revenue optimization

## 📈 Dataset

**Source:** Kaggle Hotel Dataset  
**Time Period:** 2010 - 2019  
**Record Count:** 66,535 cleaned records  
**Origin Countries:** 7 countries (Southeast Asia region)  
**Destination Countries:** 20 countries

### Key Metrics
- Booking ID
- Date of booking
- Gender, Age
- Origin & Destination countries
- Number of guests
- Booking price
- Discount usage
- GST (Goods and Services Tax)
- Profit margin

## 🛠️ Technologies & Tools

- **Data Cleaning:** Microsoft SQL Server
- **Data Visualization:** Tableau
- **Dataset Format:** CSV (converted from Excel)

## 🔧 Data Preparation Process

### Steps Performed
1. **Data Import:** Converted raw Excel data to CSV format
2. **Column Removal:** Dropped "No_of_Days" column (100% NULL values)
3. **Duplicate Detection & Removal:** Identified and removed 5 duplicate records
4. **Data Validation:** Removed invalid age values (< 0)
5. **Final Dataset:** 66,535 valid records

### SQL Queries Used
```sql
-- Remove columns with NULL values
ALTER TABLE dbo.[Hotel Dataset]
DROP COLUMN No_of_Days;

-- Find duplicates
SELECT * FROM dbo.[Hotel Dataset]
WHERE Booking_Id IN (
    SELECT Booking_Id FROM dbo.[Hotel Dataset]
    GROUP BY Booking_Id
);

-- Remove duplicate records
WITH deleteDuplicates as (
    SELECT *, ROW_NUMBER() OVER (PARTITION BY Booking_Id) As RowNo
    FROM dbo.[Hotel Dataset]
)
DELETE FROM deleteDuplicates WHERE RowNo > 1;

-- Remove invalid data
DELETE FROM dbo.[Hotel Dataset] WHERE Age < 0;
```

## 📊 Key Findings

### 1. Gender & Discount Usage
- Balanced distribution: Female (50.25%) vs Male (49.75%)
- Discount programs appeal universally to both genders

### 2. Booking Price & Gender
- Negligible difference between genders (209-219 currency units average)
- Germany, Iceland, and Israel show highest average prices
- Travel type (couples/families vs solo) influences spending

### 3. Top Destination Countries (by number of guests)
1. Egypt: 13,826 visitors
2. China: 13,628 visitors
3. Nepal: 13,624 visitors

### 4. Highest Profit Margin Destinations
1. Nepal: 656.45
2. New Zealand: 651.54
3. Other destinations: 592.24 - 650+

### 5. Top Profit-Contributing Origin Countries
1. Thailand: 2.305
2. Indonesia: 2.273
3. Singapore: 2.267
4. Malaysia: 2.265

### 6. Profit Trends (2010-2019)
- Consistent growth trajectory year-over-year
- Peak profit margin: 160.70 (August 2019)
- Dynamic pricing strategy observed during peak/low seasons

### 7. Forecast (2020-2024)
- Projected profit growth: 153 (early 2020) → 183 (late 2024)
- 95% confidence interval with widening fluctuation range (135-230)
- Indicates strong customer loyalty and improved distribution channels

## 💡 Recommendations

1. **Shift from Mass-Market to Personalized Strategy**
   - Implement targeted promotions and loyalty programs
   - Offer direct discounts and waived booking fees for specific customer segments

2. **Enhance Revenue Streams**
   - Develop high-quality local specialty menus
   - Expand ancillary services and experiences
   - Encourage repeat visits through premium offerings

3. **Leverage Big Data from Social Media**
   - Monitor real-time market trends and customer sentiments
   - Forecast demand patterns for specific customer groups
   - Optimize resource allocation and staffing based on predictions

## 📂 Project Structure

```
.
├── README.md                      # This file
├── hotel_analysis.sql             # SQL queries for data cleaning
├── tableau_dashboard.twbx         # Tableau workbook with visualizations
└── cleaned_data.csv               # Processed dataset
```

## 🚀 How to Use

1. **Review SQL Queries:** Check `hotel_analysis.sql` to understand data cleaning process
2. **Access Cleaned Data:** Use `cleaned_data.csv` for the processed dataset (66,535 records)
3. **Explore Visualizations:** Open `tableau_dashboard.twbx` in Tableau Public/Desktop to view interactive charts and dashboards

## 📝 Assignment Details

**Topic:** Hotel Performance Analysis & Profitability Drivers  
**Duration:** 10-year data analysis (2010-2019)

## Date

Report Period: October 2025 – December 2025

## 📄 License

This project is submitted as an academic assignment. All usage should comply with institutional policies.


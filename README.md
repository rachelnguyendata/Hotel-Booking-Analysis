# Hotel Booking Analysis Project

## 📊 Project Overview

This project analyzes hotel booking performance data spanning from 2010 to 2019 using big data analytics techniques. The analysis identifies key drivers of profitability and consumer behavior patterns, providing actionable insights for hotel management and destination marketers.

<img width="1048" height="559" alt="Không có tiêu đề 2" src="https://github.com/user-attachments/assets/cf0ca62f-f5c7-4b2a-af7d-b2f8421b61ed" />


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
<img width="1282" height="570" alt="Không có tiêu đề 3" src="https://github.com/user-attachments/assets/fe17e3e6-ba3a-4d7e-8538-68b4473140b7" />

- Balanced distribution: Female (50.25%) vs Male (49.75%)
- Discount programs appeal universally to both genders

### 2. Booking Price & Gender
<img width="1290" height="528" alt="Không có tiêu đề 4" src="https://github.com/user-attachments/assets/de9d7c03-9f7a-4fbb-b03f-138981ac3d94" />

- Negligible difference between genders (209-219 currency units average)
- Germany, Iceland, and Israel show highest average prices
- Travel type (couples/families vs solo) influences spending

### 3. Top Destination Countries (by number of guests)
<img width="1290" height="557" alt="Không có tiêu đề 5" src="https://github.com/user-attachments/assets/9f4de7a5-3eed-4439-a73e-460a860741e3" />

1. Egypt: 13,826 visitors
2. China: 13,628 visitors
3. Nepal: 13,624 visitors

### 4. Highest Profit Margin Destinations
<img width="1288" height="556" alt="Không có tiêu đề 7" src="https://github.com/user-attachments/assets/698ba0c8-8706-4bf1-bf6a-a4e1a5194284" />

1. Nepal: 656.45
2. New Zealand: 651.54
3. Other destinations: 592.24 - 650+

### 5. Top Profit-Contributing Origin Countries
<img width="1289" height="562" alt="Không có tiêu đề 6" src="https://github.com/user-attachments/assets/27c1952d-e196-4e0f-8614-569ae2673107" />

1. Thailand: 2.305
2. Indonesia: 2.273
3. Singapore: 2.267
4. Malaysia: 2.265

### 6. Profit Trends (2010-2019)
<img width="1220" height="511" alt="Không có tiêu đề 9" src="https://github.com/user-attachments/assets/1e6330b6-ba79-4857-b17a-c842759832ea" />

- Consistent growth trajectory year-over-year
- Peak profit margin: 160.70 (August 2019)
- Dynamic pricing strategy observed during peak/low seasons

### 7. Forecast (2020-2024)
<img width="1190" height="638" alt="Không có tiêu đề 10" src="https://github.com/user-attachments/assets/5402cd7b-4919-43c1-a5d8-07bf0c90965d" />

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
├── Microsoft SQL server.sql       # SQL queries for data cleaning
├── tableau.twb                    # Tableau workbook with visualizations
└── Hotel Dataset.xlsx             # Raw dataset
```

## 🚀 How to Use

1. **Review SQL Queries:** Check `Microsoft SQL server.sql` to understand data cleaning process
2. **Access Cleaned Data:** Use `Hotel Dataset.xlsx` for the processed dataset (66,535 records)
3. **Explore Visualizations:** Open `tableau.twb` in Tableau Public/Desktop to view interactive charts and dashboards

## 📝 Assignment Details

**Topic:** Hotel Performance Analysis & Profitability Drivers  
**Duration:** 10-year data analysis (2010-2019)

## Date

Report Period: October 2025 – December 2025

## 📄 License

This project is submitted as an academic assignment. All usage should comply with institutional policies.


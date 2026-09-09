SELECT * FROM dbo.[Hotel Dataset];

SELECT *
FROM dbo.[Hotel Dataset]
WHERE Booking_Id IN (
SELECT Booking_Id
FROM dbo.[Hotel Dataset]
GROUP BY Booking_Id
HAVING COUNT(Booking_Id) > 1
)
ORDER BY Booking_Id;

With deleteDuplicates as
(
	SELECT *,
	ROW_NUMBER() OVER (
	PARTITION BY Booking_ID
	Order by Booking_ID
	) As RowNo
	FROM dbo.[Hotel Dataset]
)

DELETE FROM deleteDuplicates
Where RowNo>1;


ALTER TABLE dbo.[Hotel Dataset]
ALTER COLUMN Booking_ID VARCHAR(50) NOT NULL;

ALTER TABLE dbo.[Hotel Dataset]
ADD PRIMARY KEY (Booking_ID);

ALTER TABLE dbo.[Hotel Dataset]
DROP COLUMN No_of_Days;

ALTER TABLE dbo.[Hotel Dataset]
ALTER COLUMN Date_of_Booking DATE NOT NULL;

ALTER TABLE dbo.[Hotel Dataset]
ALTER COLUMN Time TIME NOT NULL;

ALTER TABLE dbo.[Hotel Dataset]
ALTER COLUMN Customer_ID VARCHAR(50) NOT NULL;

ALTER TABLE dbo.[Hotel Dataset]
ALTER COLUMN Gender VARCHAR(10) NOT NULL;

DELETE FROM dbo.[Hotel Dataset]
WHERE Age < 0;

ALTER TABLE dbo.[Hotel Dataset]
ALTER COLUMN Age tinyint NOT NULL;

ALTER TABLE dbo.[Hotel Dataset]
ALTER COLUMN Origin_Country VARCHAR(50) NOT NULL;

ALTER TABLE dbo.[Hotel Dataset]
ALTER COLUMN State VARCHAR(100) NOT NULL;

ALTER TABLE dbo.[Hotel Dataset]
ALTER COLUMN Location VARCHAR(100) NOT NULL;

ALTER TABLE dbo.[Hotel Dataset]
ALTER COLUMN Destination_Country VARCHAR(50) NOT NULL;

ALTER TABLE dbo.[Hotel Dataset]
ALTER COLUMN Destination_City VARCHAR(50) NOT NULL;

ALTER TABLE dbo.[Hotel Dataset]
ALTER COLUMN No_of_People tinyint NOT NULL;

ALTER TABLE dbo.[Hotel Dataset]
ALTER COLUMN CHeck_in_Date DATE NOT NULL;

ALTER TABLE dbo.[Hotel Dataset]
ALTER COLUMN CHeck_Out_Date DATE NOT NULL;

ALTER TABLE dbo.[Hotel Dataset]
ALTER COLUMN Rooms tinyint NOT NULL;

ALTER TABLE dbo.[Hotel Dataset]
ALTER COLUMN Hotel_Name NVARCHAR(100) NOT NULL;

ALTER TABLE dbo.[Hotel Dataset]
ALTER COLUMN Hotel_Rating DECIMAL(3,1) NOT NULL;

ALTER TABLE dbo.[Hotel Dataset]
ALTER COLUMN Payment_Mode NVARCHAR(50) NOT NULL;

ALTER TABLE dbo.[Hotel Dataset]
ALTER COLUMN Booking_Price_SGD DECIMAL(10,2) NOT NULL;

ALTER TABLE dbo.[Hotel Dataset]
ALTER COLUMN Discount varchar(10) NOT NULL;

ALTER TABLE dbo.[Hotel Dataset]
ALTER COLUMN GST DECIMAL(10,2) NOT NULL;

ALTER TABLE dbo.[Hotel Dataset]
ALTER COLUMN Profit_Margin DECIMAL(10,2) NOT NULL;


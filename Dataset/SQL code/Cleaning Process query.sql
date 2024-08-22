
  --DATA CLEANING PROCESS (standard data Quality dimension)
  1.Removing irrelevant  COLUMNS
  2.Check for uniqueness within the column
  3.Removing  NULL VALUE
  4.Check for Consistency

  SELECT *
  FROM [Customer Address]
  ORDER BY customer_id
  ;

  --1.REMOVING DUPLICATE
 DELETE T
 FROM(SELECT *, DUPRANK= ROW_NUMBER() OVER(PARTITION BY CUSTOMER_ID ORDER BY(SELECT NULL) )
  FROM [Customer Address]) AS T
  WHERE DUPRANK >1

  SELECT *
  FROM [Customer Address]
  ORDER BY customer_id ASC
  

--REMOVING NULL VALUE
DELETE
FROM [Customer Address]
WHERE customer_id IS NULL
OR postcode IS NULL
OR property_valuation IS NULL;

SELECT * FROM [Customer Address]
ORDER BY property_valuation DESC;

--1.Adjusting the inconsistency in the data set

SELECT * 
FROM [Customer Address]

UPDATE [Customer Address]
SET state = 'Victoria'
where state = 'VIC';

update [Customer Address]
set state = 'New South Wales'
where state = 'NSW';

update [Customer Address]
set state = 'Queensland'
where state = 'Queens Island';

--1.REMOVE UNWANTED COLUMNS

ALTER TABLE [CUSTOMER ADDRESS]
DROP COLUMN address;

ALTER TABLE [CUSTOMER ADDRESS]
DROP COLUMN postcode;

select * 
from [Customer Address]
order by customer_id;

--DATA CLEANING FOR THE  TRANSACTION DATASET

--1.Adejust the inconsistency with the data

 select distinct product_class,concat(upper(substring(product_Class,1,1)), 
				lower(substring(product_class,2,len(Product_class)))) 
 from [Transaction];
 
 update [Transaction]
 set product_size = concat(upper(substring(product_size,1,1)), 
				lower(substring(product_size,2,len(product_size)))) 

select * 
from [transaction]
order by Transaction_id asc



 update [Transaction]
 set product_class = concat(upper(substring(product_class,1,1)), 
				lower(substring(product_class,2,len(Product_class)))) 
  FROM [SPROCKET].[dbo].[Transaction]

delete 
from [transaction]
where product_size is null
or product_class is null
or product_line is null

select* 
from [transaction]
order by customer_id asc

select *
from INFORMATION_SCHEMA.COLUMNS
where table_name ='transaction'

SELECT *
from [Demography]
order by customer_id;

DATA CLEANING PROCESS
1. REMOVING THE DUPLICATE VALUES

DELETE T
FROM (SELECT *, DUPLICATE = ROW_NUMBER() OVER(PARTITION BY CUSTOMER_ID ORDER BY (SELECT(NULL)))
fROM [Demography]) AS T
WHERE DUPLICATE >1;

SELECT *
FROM [Demography]
ORDER BY CUSTOMER_ID ASC

2. REMOVING UNWANTED COLUMN
ALTER TABLE [Demography]
DROP COLUMN [deceased_indicator]
 
--3. Remove the the null value
delete 
 from Demography
 where DOB is null
 or job_title is null
 or job_industry_category is null;


--4. Inconsistency
 select distinct gender
 from Demography; 

  update demography
  set gender = 'Female'
  where gender = 'F';

  update demography
  set gender = 'Female'

  where gender = 'Femal';

  update demography
set gender = 'Male'
  where gender = 'M';

  update demography
  set gender = 'Unspecified'
  where gender = 'U';

  update Demography
  set job_industry_category = 'N/A'
  where job_industry_category = 'n/a'


 -- Generatting Age Group Column


SELECT dob,
			DATEDIFF(month,DOB,GETDATE())/12 as Age,
case 
	when DATEDIFF(month,DOB,GETDATE())/12 < 39 then 'Young Adult'
	when DATEDIFF(month,DOB,GETDATE())/12  between 40 and 59 then 'Middle Age'
	when DATEDIFF(month,DOB,GETDATE())/12  > 60 then 'Old'
	 
End as Age_group
from Demography
  order by Age desc



select age,
case
			when age < 40 then 'Young Adult'
			when age between 40 and 59 then 'Middle Age'
			when age >60 then 'Old Adult'
	end as [Age group]
from demo
 

---Creating a View for it


 create view customer_Address as
 select *
 from [Customer Address]
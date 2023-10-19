create database credit_card;
use credit_card;


CREATE TABLE clean_credit_data 
(
	ID INT PRIMARY KEY,
	Gender VARCHAR(255) NOT NULL,
	Car_Owner VARCHAR(255) NOT NULL,
	Property_Owner VARCHAR(255) NOT NULL,	
	Children INT NOT NULL,	
	Annual_Income INT NOT NULL,	
	Income_Type VARCHAR(255) NOT NULL,	
	Education VARCHAR(255) NOT NULL,
	Marital_Status VARCHAR(255) NOT NULL,	
	Housing_Type VARCHAR(255) NOT NULL,
	Mobile_ph INT NOT NULL, 
	Work_ph	INT NOT NULL,
    ph INT NOT NULL,	
	Email_Id INT NOT NULL,
	Occupation_Type VARCHAR(255) NOT NULL,
	Family_Members INT NOT NULL,
	Age INT NOT NULL,
	Work_Experience DECIMAL(10 , 6 ) NULL,
	Outcome INT NOT NULL
);
SELECT * from clean_credit_data ;

LOAD DATA INFILE 
'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/clean_credit_database.csv' 
INTO TABLE clean_credit_data 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT * from clean_credit_data ;

-- 1. Group the customers based on their income type and find the average of their annual income.
SELECT Work_Experience, AVG(Annual_Income) as Average_income
FROM clean_credit_data 
GROUP BY Work_Experience;

-- 2.Find the female owners of cars and property.
SELECT *
FROM clean_credit_data 
WHERE Gender = 'F' AND Car_Owner = 'Y' AND Property_Owner = 'Y';


-- 3.Find the male customers who are staying with their families.

SELECT *
FROM clean_credit_data 
WHERE Gender = 'M' AND Family_Members > 1;

-- 4.Please list the top five people having the highest income.

SELECT *
FROM clean_credit_data 
ORDER BY Annual_Income DESC
LIMIT 5;


-- 5.How many married people are having bad credit?

SELECT COUNT(*)
FROM clean_credit_data 
WHERE Marital_Status = 'Married' AND Outcome = 1;

-- 6.What is the highest education level and what is the total count?

SELECT Education, COUNT(*) as Total_Count
FROM clean_credit_data 
GROUP BY Education
ORDER BY Total_Count DESC
LIMIT 1;

-- 7.Between married males and females, who is having more bad credit? 

SELECT Gender, COUNT(*) as Count
FROM clean_credit_data 
WHERE Marital_Status = 'Married' AND Outcome = 1
GROUP BY Gender;





# 🧹 Messy Indian Dataset - Data Cleaning Project
## 📌 Overview
This repository contains a messy dataset designed for **data cleaning** and **preprocessing** exercises. The dataset represents Indian users with inconsistencies such as **missing values**, **duplicate entries**, **incorrect formats**, and null fields. It provides an excellent opportunity to apply **data wrangling**, **transformation**, and quality checks before performing analysis.

## 📊 Table Schema

**Table Name:** messy_indian_dataset

**Total Records:** 30

**Columns:**

![Screenshot 2025-02-28 185900](https://github.com/user-attachments/assets/e2ae2ccd-fbda-4c21-b191-7292dcf331b0)
## 🔍 Data Cleaning Tasks
## The dataset requires multiple data cleaning operations, including:
**•** Handling missing values (NULLs in age, email, phone, etc.)

**•** Removing duplicates (Identical entries in name, email, etc.)

**•** Standardizing formats (Emails, phone numbers, state names)

**•** Correcting inconsistencies (Gender values, city-state mapping)

**•** Handling null purchase amounts

## Project Structure

### **1. Database Setup**
   **•** **Database Creation:** The project starts by creating a database named.

   
      CREATE DATABASE sports;
      USE sports;
      DROP TABLE IF EXISTS messy_indian_dataset;
      CREATE TABLE IF NOT EXISTS messy_indian_dataset (
          id INT PRIMARY KEY,
          name VARCHAR(50),
          age INT,
          gender VARCHAR(10),
          email VARCHAR(100),
          phone_number VARCHAR(15),
          city VARCHAR(50),
          state VARCHAR(50),
          purchase_amount DECIMAL(10, 2),
          purchase_date DATE
      );
### **2. Handling Missing Values**
  **• Find rows with missing values in any column?**
       
        SELECT * FROM messy_indian_dataset 
          WHERE name IS NULL OR age IS NULL OR gender IS NULL OR email IS NULL OR city IS NULL OR
            phone_number IS NULL OR state IS NULL OR purchase_amount IS NULL OR purchase_date IS NULL;

  **• Find rows without missing values?**
  
        SELECT * FROM messy_indian_dataset 
        	WHERE name IS NOT NULL AND age IS NOT NULL AND gender IS NOT NULL AND email IS NOT NULL AND city IS NOT NULL AND
            phone_number IS NOT NULL AND state IS NOT NULL AND purchase_amount IS NOT NULL AND purchase_date IS NOT NULL;
 
### **3. Filling Values In Their Dataset?**
  **• Filling null city with most frequent city?**

    UPDATE messy_indian_dataset 
    SET city = (			
            SELECT most_frequent_city FROM
                (
                  SELECT city AS most_frequent_city , COUNT(*)  AS 'frequency' 
                  FROM messy_indian_dataset
                  WHERE city IS NOT NULL
                  GROUP BY city
                  ORDER BY COUNT(*) DESC
                  LIMIT 1
                ) AS subquery
          ) WHERE city IS NULL;

### **4. Handling Duplicates**
**• Finding unique values based on multiple columns | Rajesh Patel & Patil?**

    SELECT id, name, age, gender, email, phone_number, city, state, purchase_amount, purchase_date FROM (
        SELECT *, ROW_NUMBER() OVER(PARTITION BY id, name ORDER BY id) AS 'rank' FROM messy_indian_dataset
    ) AS subtable
    WHERE subtable.rank = 1;

### **5. Handling Outliers**
**• Remove outliers based on specific Z-Score?**

    SELECT * FROM
        (
            SELECT *, 
                ABS(purchase_amount - AVG(purchase_amount) OVER()) / STDDEV(purchase_amount) OVER() AS 'z_score'
            FROM messy_indian_dataset
        ) AS sub_table WHERE sub_table.z_score < 3;

### **6. Data Cleaning**

**• Clean & Update email**
  
    UPDATE messy_indian_dataset 
        SET email = TRIM(REGEXP_REPLACE(LOWER(email), '[^a-z0-9@.]+' , ''));
  

**• Clean Phone Number**

    UPDATE messy_indian_dataset 
        SET phone_number = REGEXP_REPLACE(phone_number, '[^0-9]+' , '');

**• Removing rows with Invalid Phone Number**
  
    DELETE FROM messy_indian_dataset
        WHERE LENGTH(phone_number) != 10 OR phone_number REGEXP '[^0-9]';

**• Cleaning Gender even further**

    UPDATE messy_indian_dataset
        SET gender = CASE
                        WHEN gender IN ('M' ,'m', 'Male', 'MALE', 'male') THEN 'M'
                        WHEN gender IN ('F' ,'f', 'Female', 'FEMALE', 'female') THEN 'F'
                        ELSE 'other'
                     END;
    
    SELECT * FROM messy_indian_dataset;

## Cleaning Steps Implemented :
### Database Setup:
  **Created messy_indian_dataset table.**
### Handling Missing Values:

      Found missing values and filled them appropriately.
      
Filling Missing Cities:
Used the most frequently occurring city.
Handling Duplicates:
Identified unique records based on id and name.
Outlier Detection:
Removed extreme purchase_amount values using the Z-score method.
Standardizing & Cleaning Data:
Emails: Removed unwanted characters and standardized lowercase formatting.
Phone Numbers: Removed non-numeric characters and ensured a 10-digit length.
Gender: Standardized values to "M", "F", or "Other".

## **Final Outcome**
After cleaning, the dataset is structured, standardized, and ready for analysis. It ensures accuracy, consistency, and reliability for downstream analytics and insights.

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

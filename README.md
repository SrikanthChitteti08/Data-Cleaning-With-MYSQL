# 🧹 Messy Indian Dataset - Data Cleaning Project
## 📌 Overview
This repository contains a messy dataset designed for data cleaning and preprocessing exercises. The dataset represents Indian users with inconsistencies such as missing values, duplicate entries, incorrect formats, and null fields. It provides an excellent opportunity to apply data wrangling, transformation, and quality checks before performing analysis.

## 📊 Dataset Details

**Table Name:** messy_indian_dataset

**Total Records:** 30

**Columns:**

**id (INT, Primary Key)**

**name (VARCHAR)            -** Contains duplicates and null values

**age (INT)                 -** Some missing values

**gender (VARCHAR)          -** Some missing or incorrect entries

**email (VARCHAR)           -** Various domain formats, some missing values

**phone_number (VARCHAR)    -** Possible incorrect/missing values

**city (VARCHAR)            -** Some missing entries

**state (VARCHAR)           -** Some missing or inconsistent entries

**purchase_amount (DECIMAL) -** Null values present

**purchase_date (DATE)      -** Some missing values

## 🔍 Data Cleaning Tasks
## The dataset requires multiple data cleaning operations, including:
**•** Handling missing values (NULLs in age, email, phone, etc.)
**•** Removing duplicates (Identical entries in name, email, etc.)
**•** Standardizing formats (Emails, phone numbers, state names)
**•** Correcting inconsistencies (Gender values, city-state mapping)
**•** Handling null purchase amounts

SELECT * FROM messy_indian_dataset;

-- Update Name
UPDATE messy_indian_dataset 
    SET name = TRIM(name),
    name = LOWER(name);

SELECT * FROM messy_indian_dataset;

-- Update Gender
UPDATE messy_indian_dataset 
    SET gender = LOWER(TRIM(gender));

SELECT * FROM messy_indian_dataset;

-- Update City
UPDATE messy_indian_dataset 
    SET city = LOWER(TRIM(city));

SELECT * FROM messy_indian_dataset;

-- Update State
UPDATE messy_indian_dataset 
    SET state = LOWER(TRIM(state));

SELECT * FROM messy_indian_dataset;

-- Clean & Update email
UPDATE messy_indian_dataset 
    SET email = TRIM(REGEXP_REPLACE(LOWER(email), '[^a-z0-9@.]+' , ''));

SELECT * FROM messy_indian_dataset;

-- Clean Phone Number
UPDATE messy_indian_dataset 
    SET phone_number = REGEXP_REPLACE(phone_number, '[^0-9]+' , '');

SELECT * FROM messy_indian_dataset;

-- Extracting username
ALTER TABLE messy_indian_dataset 
    ADD COLUMN username VARCHAR(30);

UPDATE messy_indian_dataset 
    SET username = SUBSTRING_INDEX(email, '@' , 1);

SELECT * FROM messy_indian_dataset;

-- Create location
ALTER TABLE messy_indian_dataset 
    ADD COLUMN location VARCHAR(50);

UPDATE messy_indian_dataset 
    SET location = CONCAT(city ,', ', state);

SELECT * FROM messy_indian_dataset;

-- amount_without_gst
ALTER TABLE messy_indian_dataset 
    ADD COLUMN without_gst DECIMAL(10,2);

UPDATE messy_indian_dataset 
    SET without_gst = purchase_amount * .82;

SELECT * FROM messy_indian_dataset;

-- Adding Expiry Date
ALTER TABLE messy_indian_dataset 
    ADD COLUMN exp_date DATE;

UPDATE messy_indian_dataset 
    SET exp_date = DATE_ADD(purchase_date, INTERVAL 3 YEAR);

SELECT * FROM messy_indian_dataset;

-- Removing rows with Invalid Phone Number
DELETE FROM messy_indian_dataset
    WHERE LENGTH(phone_number) != 10 OR phone_number REGEXP '[^0-9]';

SELECT * FROM messy_indian_dataset;

-- Cleaning Gender even further
UPDATE messy_indian_dataset
    SET gender = CASE
                    WHEN gender IN ('M' ,'m', 'Male', 'MALE', 'male') THEN 'M'
                    WHEN gender IN ('F' ,'f', 'Female', 'FEMALE', 'female') THEN 'F'
                    ELSE 'other'
                 END;

SELECT * FROM messy_indian_dataset;

-- Cleaning/Validating Age
DELETE FROM messy_indian_dataset 
    WHERE age <= 0 OR age >= 100;

SELECT * FROM messy_indian_dataset;

SELECT * FROM messy_indian_dataset;

-- Find rows with missing values in any column
SELECT * FROM messy_indian_dataset 
	WHERE name IS NULL OR age IS NULL OR gender IS NULL OR email IS NULL OR city IS NULL OR
    phone_number IS NULL OR state IS NULL OR purchase_amount IS NULL OR purchase_date IS NULL;

-- Find rows without missing values
SELECT * FROM messy_indian_dataset 
	WHERE name IS NOT NULL AND age IS NOT NULL AND gender IS NOT NULL AND email IS NOT NULL AND city IS NOT NULL AND
    phone_number IS NOT NULL AND state IS NOT NULL AND purchase_amount IS NOT NULL AND purchase_date IS NOT NULL;

-- Saving table without null values
CREATE TABLE IF NOT EXISTS clean_table AS
	SELECT * FROM messy_indian_dataset 
		WHERE name IS NOT NULL AND age IS NOT NULL AND gender IS NOT NULL AND email IS NOT NULL AND city IS NOT NULL AND
		phone_number IS NOT NULL AND state IS NOT NULL AND purchase_amount IS NOT NULL AND purchase_date IS NOT NULL;
SELECT * FROM clean_table;

-- Filling missing age all with specific values
UPDATE messy_indian_dataset SET age = COALESCE(age, 0);
SELECT * FROM messy_indian_dataset;

-- Filling nulls with specific values
UPDATE messy_indian_dataset 
SET
	name = COALESCE(name, 'Unknown'),
    gender = COALESCE(gender, 'Unknown'),
    email = COALESCE(email, 'Unknown'),
    phone_number = COALESCE(phone_number, 'Unknown'),
    state = COALESCE(state, 'Unknown'),
    purchase_date = COALESCE(purchase_date, '2023-01-01');
SELECT * FROM messy_indian_dataset;

-- Filling null amount with average amount values
UPDATE messy_indian_dataset
SET purchase_amount = ( 
					SELECT avg_purchase_amount FROM 
						(
							SELECT AVG(purchase_amount) AS avg_purchase_amount FROM messy_indian_dataset
						)
					AS subquery
				) WHERE purchase_amount IS NULL;
                    
SELECT * FROM messy_indian_dataset;
    
-- Filling null city with most frequent city
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
	
SELECT * FROM messy_indian_dataset;
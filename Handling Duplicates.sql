SELECT * FROM messy_indian_dataset;

-- Finding only unique rows
SELECT DISTINCT * FROM messy_indian_dataset;

-- Finding unique values based on ID
SELECT id
FROM messy_indian_dataset
GROUP BY id
ORDER BY id;

-- Finding unique values based on name
SELECT name
FROM messy_indian_dataset
GROUP BY name
ORDER BY name;

-- Finding unique values based on id using rank
SELECT id, name, age, gender, email, phone_number, city, state, purchase_amount, purchase_date FROM (
    SELECT *, ROW_NUMBER() OVER(PARTITION BY id ORDER BY id) AS 'rank' FROM messy_indian_dataset
) AS subtable
WHERE subtable.rank = 1;

-- Finding unique values based on multiple columns | Rajesh Patel & Patil
SELECT id, name, age, gender, email, phone_number, city, state, purchase_amount, purchase_date FROM (
    SELECT *, ROW_NUMBER() OVER(PARTITION BY id, name ORDER BY id) AS 'rank' FROM messy_indian_dataset
) AS subtable
WHERE subtable.rank = 1;

-- Basic SELECT examples for QA data validation

-- 1. Select all records from a table
SELECT *
FROM patients;

-- 2. Select specific columns
SELECT patient_id, first_name, last_name, date_of_birth
FROM patients;

-- 3. Filter records by status
SELECT patient_id, status
FROM claims
WHERE status = 'PENDING';

-- 4. Filter records created today
SELECT claim_id, created_at, status
FROM claims
WHERE CAST(created_at AS DATE) = CAST(GETDATE() AS DATE);

-- 5. Order results by newest records first
SELECT claim_id, created_at, status
FROM claims
ORDER BY created_at DESC;

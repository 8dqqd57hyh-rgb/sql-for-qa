-- Duplicate detection examples for QA

-- 1. Find duplicate patients by email
SELECT 
    email,
    COUNT(*) AS duplicate_count
FROM patients
GROUP BY email
HAVING COUNT(*) > 1;

-- 2. Find duplicate claims by external claim number
SELECT
    external_claim_number,
    COUNT(*) AS duplicate_count
FROM claims
GROUP BY external_claim_number
HAVING COUNT(*) > 1;

-- 3. Show full duplicate records
SELECT *
FROM claims
WHERE external_claim_number IN (
    SELECT external_claim_number
    FROM claims
    GROUP BY external_claim_number
    HAVING COUNT(*) > 1
)
ORDER BY external_claim_number;

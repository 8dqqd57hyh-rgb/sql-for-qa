-- JOIN examples for QA validation

-- 1. Validate that each claim has a related patient
SELECT 
    c.claim_id,
    c.patient_id,
    p.first_name,
    p.last_name
FROM claims c
INNER JOIN patients p
    ON c.patient_id = p.patient_id;

-- 2. Find claims without a related patient
SELECT 
    c.claim_id,
    c.patient_id
FROM claims c
LEFT JOIN patients p
    ON c.patient_id = p.patient_id
WHERE p.patient_id IS NULL;

-- 3. Validate claim-provider relationship
SELECT
    c.claim_id,
    c.provider_id,
    pr.provider_name
FROM claims c
INNER JOIN providers pr
    ON c.provider_id = pr.provider_id;

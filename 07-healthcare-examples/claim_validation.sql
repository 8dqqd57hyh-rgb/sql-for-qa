-- Healthcare claim validation examples

-- 1. Find claims without diagnosis code
SELECT
    claim_id,
    patient_id,
    status
FROM claims
WHERE diagnosis_code IS NULL;

-- 2. Find claims without service date
SELECT
    claim_id,
    patient_id,
    service_date
FROM claims
WHERE service_date IS NULL;

-- 3. Validate paid claims with zero amount
SELECT
    claim_id,
    status,
    paid_amount
FROM claims
WHERE status = 'PAID'
  AND paid_amount = 0;

-- 4. Find rejected claims with missing rejection reason
SELECT
    claim_id,
    status,
    rejection_reason
FROM claims
WHERE status = 'REJECTED'
  AND rejection_reason IS NULL;

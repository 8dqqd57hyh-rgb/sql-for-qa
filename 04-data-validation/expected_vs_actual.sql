-- Expected vs Actual validation examples

-- 1. Compare expected claim status with actual claim status
SELECT
    e.claim_id,
    e.expected_status,
    a.actual_status
FROM expected_claim_status e
JOIN actual_claim_status a
    ON e.claim_id = a.claim_id
WHERE e.expected_status <> a.actual_status;

-- 2. Find missing records in actual results
SELECT
    e.claim_id
FROM expected_claims e
LEFT JOIN actual_claims a
    ON e.claim_id = a.claim_id
WHERE a.claim_id IS NULL;

-- 3. Find unexpected records in actual results
SELECT
    a.claim_id
FROM actual_claims a
LEFT JOIN expected_claims e
    ON a.claim_id = e.claim_id
WHERE e.claim_id IS NULL;

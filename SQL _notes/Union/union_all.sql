-- Get jobs from January
SELECT
    job_title_short,
    company_id,
    job_location
FROM 
    january_jobs

UNION ALL

-- Get jobs from February
SELECT
    job_title_short,
    company_id,
    job_location    
FROM 
    february_jobs

UNION ALL

-- Get jobs from March
SELECT
    job_title_short,
    company_id,
    job_location 
FROM 
    march_jobs
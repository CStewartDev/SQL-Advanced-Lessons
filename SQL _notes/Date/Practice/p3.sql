SELECT 
    comp.name as company_name
FROM job_postings_fact AS JP
LEFT JOIN company_dim AS comp
ON jp.company_id = comp.company_id
WHERE 
    EXTRACT(QUARTER FROM jp.job_posted_date) = 2 AND
    jp.job_health_insurance IS TRUE
GROUP BY company_name

/* find companies (include name) that have posted jobs offering health insurance, where these postings were made in the 2nd qtr of 2023. use date extraction to filter by quarter */ 

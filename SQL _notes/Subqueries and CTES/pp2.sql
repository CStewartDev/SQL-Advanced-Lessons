/*
Determine the size category (small, med, large) for each company by first identifying the number of job postings they have(Job posting fact). 
use a subquery to calc the total job postings per company. a company is considered ' small' if less than 10, 'medium' is between 10 and 50 and 'large' if it has more than 50
Implement a subquery to aggregate job counts per company before classifying them based on size

Bonus - Join company_dim to get name of companies from company ID

*/

SELECT 
    company.name,
    job_count.number_of_jobs,
    CASE
        WHEN job_count.number_of_jobs <10 THEN 'Small'
        WHEN job_count.number_of_jobs BETWEEN 10 AND 50 THEN 'Medium'
        WHEN job_count.number_of_jobs > 50 THEN 'Large'
        ELSE 'boop'
    END AS company_size
FROM (
    SELECT
        company_id,
        COUNT(*) AS number_of_jobs
    FROM 
        job_postings_fact
    GROUP BY company_id
) AS job_count
INNER JOIN company_dim AS company ON company.company_id = job_count.company_id
ORDER BY number_of_jobs DESC

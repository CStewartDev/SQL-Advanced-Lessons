/*
Get the correspoding skill and skill type for each job posting in q1
include those without any skills
why? look at the skills and the type for each job in the first Quarter that has a salary >70000
*/

WITH Q1_jobs as (
    SELECT
    job_id,
    job_title,
    salary_year_avg
FROM 
    january_jobs
UNION ALL
SELECT
    job_id,
    job_title,
    salary_year_avg    
FROM 
    february_jobs
UNION ALL
SELECT
    job_id,
    job_title,
    salary_year_avg 
FROM 
    march_jobs
)

SELECT 
    Q1_jobs.job_id,
    job_title,
    salary_year_avg,
    skills.skills,
    skills.type
FROM
    Q1_jobs
LEFT JOIN skills_job_dim as jobs ON jobs.job_id = Q1_jobs.job_id
LEFT JOIN skills_dim as skills ON jobs.skill_id = skills.skill_id
WHERE
    Q1_jobs.salary_year_avg >= 70000
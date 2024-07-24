/*
Question: What are the top-paying data analyst jobs?
-Identify the top 10 highest-paying Data Analyst roles that are available remotely.
-Focuses on Job postings with specified salaries(remove null).
-Why? highlight the top-paying opportunities for Data Analysts, offering insights into employment opportunities

Bonus Which company?
*/


SELECT
    job_id,
    name AS company_name,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date
FROM
    job_postings_fact
LEFT JOIN company_dim AS companies ON job_postings_fact.company_id = companies.company_id
WHERE
    (job_location = 'Anywhere' OR
    job_location = 'Tampa, FL' OR
    job_location = 'Orlando, FL')
    AND salary_year_avg IS NOT NULL
    AND salary_year_avg < 250000 --Removes some outliers in the data
    AND job_title_short = 'Data Analyst'
ORDER BY salary_year_avg DESC
LIMIT 10

/*
Find Job postings from the first quarter that have a salary greater than 70K
-Combine job postings tables from the first quarter of 2023 
gets job postings with an average salary > 70K
*/


SELECT 
    qtr1_job_postings.job_title_short,
    qtr1_job_postings.job_location,
    qtr1_job_postings.job_via,
    qtr1_job_postings.job_posted_date::date,
    qtr1_job_postings.salary_year_avg
FROM (
    SELECT *
    FROM january_jobs
    UNION ALL
    SELECT *
    FROM february_jobs
    UNION ALL
    SELECT *
    FROM march_jobs
) AS qtr1_job_postings
WHERE
    qtr1_job_postings.salary_year_avg > 70000 AND
    qtr1_job_postings.job_title_short = 'Data Analyst'
ORDER BY qtr1_job_postings.salary_year_avg DESC
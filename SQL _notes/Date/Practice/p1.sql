SELECT 
    AVG(salary_hour_avg) AS salary_hour,
    AVG(salary_year_avg) AS salary_year,
    job_schedule_type
FROM job_postings_fact
WHERE
    job_posted_date::DATE >= '2023-06-01'
GROUP BY
    job_schedule_type
/* write query to find avg yearly and hourly salary for job postings after june 1, 2023. group by job schedule type.
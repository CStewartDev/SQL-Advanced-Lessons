WITH january_jobs_cte AS ( --CTE Definition Starts here
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1
) -- CTE Definition ends here

SELECT *
FROM january_jobs_cte
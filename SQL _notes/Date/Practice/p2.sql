SELECT 
    COUNT(job_id) as count_ID,
    EXTRACT(MONTH FROM job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST') AS month
FROM job_postings_fact
WHERE
    job_posted_date BETWEEN '2023/01/01' AND '2023/12/31'
GROUP BY month
ORDER BY month;

/*write query to count # of jobs each month of 2023, 
adjusting the job posted date tp be NY before extracting the month
assume stored in 'UTC' group and order by month */

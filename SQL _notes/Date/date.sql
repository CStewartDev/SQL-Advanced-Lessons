SELECT 
job_title_short As title,
job_location AS location,
job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'CDT' AS date,
job_posted_date::DATE as clean_date,
EXTRACT(MONTH FROM job_posted_date) AS date_month,
EXTRACT(YEAR FROM job_posted_date) AS date_year
FROM job_postings_fact AS JP
LIMIT 10;
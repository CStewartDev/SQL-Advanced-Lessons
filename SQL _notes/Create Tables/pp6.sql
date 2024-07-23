-- January
CREATE TABLE january_jobs AS 
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1;

-- February    
CREATE TABLE february_jobs AS 
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 2;

--March    
CREATE TABLE march_jobs AS 
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 3;

SELECT job_posted_date
FROM march_jobs





/* 
*CREATE TABLES from other TABLES*
Create 3 tables; Jan 2023 jobs, Feb 2023 jobs, Mar 2023 jobs 
USE 'CREATE TABLE table_name AS'  syntax to create your table
look at a way to filter out specific months(EXTRACT)
*/
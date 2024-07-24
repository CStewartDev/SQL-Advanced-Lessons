/*
Question: What are the most in-demand skills for data analysts?
-Join job postinfs to inner join table similiar to query 2
-indentify the top 5 in-demand skills for a data analyst.
-Focus on all job postings.
-Why? retrieves the top 5 skills with the highest demand in the job market, providing insights into the most valuble skills for job seekers 
*/


SELECT 
    skills,
    COUNT(skills_job_dim.job_id) AS demand_for_skill
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    (job_location = 'Tampa, FL' OR
     job_location = 'Orlando, FL' OR
     job_work_from_home = TRUE)
GROUP BY skills
ORDER BY demand_for_skill DESC
Limit 5
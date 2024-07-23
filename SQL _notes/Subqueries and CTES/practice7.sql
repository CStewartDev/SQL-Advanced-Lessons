/*
Find the count of number of remote job postings per skill
    -Display the top 5 skills by their demand in remote jobs
    include skill ID, name and count of postings requiring the skill

Bonus: Update CTE to only include data analysts
*/


WITH remote_job_skills AS (
    SELECT
        skill_id,
        count(*) as skill_count
    FROM
        skills_job_dim as skills_to_jobs
    INNER JOIN job_postings_fact AS job_postings ON job_postings.job_id = skills_to_jobs.job_id
    WHERE
        job_postings.job_work_from_home = TRUE AND
        job_postings.job_title_short = 'Data Analyst'
    GROUP BY
        skill_id
)

SELECT 
    skills.skill_id,
    skills.skills as name,
    remote_job_skills.skill_count 
FROM remote_job_skills
INNER JOIN skills_dim AS skills ON skills.skill_id = remote_job_skills.skill_id
ORDER BY skill_count DESC
LIMIT 5;

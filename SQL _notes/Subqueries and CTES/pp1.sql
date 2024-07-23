/*

Identify the top 5 skills that are most frequently mentioned in job postings. 
USe a subquery to find the skill ID with the highest counts in the skill_job_dim
then join this result with the skills_dim table to get the names


*/

SELECT 
    skills.skill_id,
    skills_count,
    skills.skills
FROM (
    SELECT 
    count(*) AS skills_count,
    skill_id
    FROM skills_job_dim
    GROUP BY skill_id
) AS skill_number
INNER JOIN skills_dim AS skills ON skills.skill_id = skill_number.skill_id
ORDER BY skills_count DESC
LIMIT 5
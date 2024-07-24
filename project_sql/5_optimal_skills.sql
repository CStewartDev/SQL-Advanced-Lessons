/*
Answer: What are the most optimal skills to learn (aka it's in high demand and a high-paying skill)? 
-Identify skills in the high demand and associated with high average slaries for Data Analyst Roles
-Concentrates on remote positions with specified salaries
-Why? targets skills that offer job security(high demand) and financial benefits(high slaaries), offering strategic insights for career development in data analytics
*/

WITH demanded_skills AS (
    SELECT 
        skills_dim.skill_id,
        skills_dim.skills,
        COUNT(skills_job_dim.job_id) AS demand_count_skill
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst'
        AND salary_year_avg IS NOT NULL
        AND (job_location = 'Tampa, FL' OR
        job_location = 'Orlando, FL' OR
        job_work_from_home = TRUE)
    GROUP BY
        skills_dim.skill_id
), average_salary AS (
    SELECT 
        skills_job_dim.skill_id,
        ROUND(AVG(job_postings_fact.salary_year_avg),0) AS avg_salary
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst'
        AND salary_year_avg IS NOT NULL
        AND (job_location = 'Tampa, FL' OR
        job_location = 'Orlando, FL' OR
        job_work_from_home = TRUE)
    GROUP BY 
        skills_job_dim.skill_id
)

SELECT
    demanded_skills.skill_id,
    demanded_skills.skills,
    demand_count_skill,
    avg_salary
FROM 
    demanded_skills
INNER JOIN average_salary ON demanded_skills.skill_id = average_salary.skill_id
WHERE demand_count_skill > 10
ORDER BY 
    avg_salary DESC,
    demand_count_skill DESC
LIMIT 25

-- rewriting more consise

SELECT 
    skills_dim.skill_id,
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count,
    ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND (
            job_location = 'Tampa, FL' OR
            job_location = 'Orlando, FL' OR
            job_work_from_home = TRUE
        )
GROUP BY skills_dim.skill_id
HAVING 
    COUNT(skills_job_dim.job_id) >10
ORDER BY
    avg_salary DESC,
    demand_count DESC
LIMIT 25;

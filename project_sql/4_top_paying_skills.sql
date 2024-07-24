/*
Answer: What are the top skills based on salary?
-Look at the average salary associated with each skill for Data Analyst positions
-Focuses on roles with the specified salaries, regardless of location
-why? It reveals how different skills impact salary levels for data analysts and helps id the most financially rewarding skills to acquire or improve
*/

-- need job_postings_fact, Skills_job_dim and skills_dim tables. ignore Null values in salaries

SELECT 
    skills,
    AVG(salary_year_avg)::FLOAT(2) AS avg_salary,
    COUNT(skills_job_dim.job_id) AS number_of_jobs
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    salary_year_avg IS NOT NULL 
    AND job_title_short = 'Data Analyst'
GROUP BY skills
HAVING COUNT(skills_job_dim.job_id) >= 20    
ORDER BY avg_salary DESC
LIMIT 20

/*
CHAT GPT INSIGHTS
Key Insights:

    High-Paying Niche Skills: Skills like Kafka, PyTorch, and Perl offer top salaries, though they have fewer job postings, indicating high demand for specialized expertise.

    Cloud and Big Data Technologies: Skills such as GCP, Snowflake, Hadoop, and Spark are highly sought after, reflecting the industry's move towards cloud and big data solutions.

    Emerging and Traditional Skills: Tools like TensorFlow, Airflow, and Databricks show the importance of modern data pipeline management and AI, while traditional skills like Linux and Shell remain valuable
/*
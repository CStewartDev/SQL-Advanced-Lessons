SELECT 
    job_title,
    CASE
        WHEN salary_year_avg >= 120000 THEN 'High'
        WHEN salary_year_avg >= 70000 AND salary_year_avg < 120000 THEN 'Standard'
        WHEN salary_year_avg >= 40000 AND salary_year_avg < 70000 THEN 'Low'
        ELSE 'No salary listed'
    END AS Salary_bracket,    
    salary_year_avg
FROM job_postings_fact
WHERE
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC





/*
salaries from each job posting to see if in desired salary range

-Put salary into different bucket
    -define high, standard and low salary
        WHY? it is easy to determine which job postings are worth looking at based on salary
        Buckering is a common practice in data analysis whge viewing categories
-only data analyst roles
order highest to lowest

*/
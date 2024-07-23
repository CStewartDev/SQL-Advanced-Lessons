SELECT 
    name as company_name,
    company_id
FROM 
    company_dim
WHERE company_id IN (
    SELECT company_id
    FROM job_postings_fact
    WHERE job_no_degree_mention = TRUE
) 



/*
list of companys offering jobs that dont have a degree requirement

JPF - Degree needed and Company ID
Company_dim - company name

subquery JPF to get company id who dont have Degree then filter company dim for name
*/
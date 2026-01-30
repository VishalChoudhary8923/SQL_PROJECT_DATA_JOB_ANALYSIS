-- What are the top paying paying data analyst jobs?

SELECT
    jp.job_id,
    jp.job_title,
    jp.job_location,
    jp.job_schedule_type,
    jp.salary_year_avg,
    jp.job_posted_date,
    cd.name AS company_name
FROM
    job_postings_fact jp
LEFT JOIN company_dim cd
ON jp.company_id = cd.company_id
WHERE 
    jp.job_title_short = 'Data Analyst' AND
    jp.job_location = 'Anywhere' AND
    jp.salary_year_avg IS NOT NULL
ORDER BY
    jp.salary_year_avg DESC
LIMIT 10
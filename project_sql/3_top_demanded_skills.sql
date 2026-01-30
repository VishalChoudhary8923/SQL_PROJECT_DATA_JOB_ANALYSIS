-- What are the most in-demand skills for data analysts?

SELECT *
FROM job_postings_fact jp
INNER JOIN skills_job_dim sj
ON jp.job_id = sj.job_id
INNER JOIN skills_dim sd
ON sj.skill_id = sd.skill_id
ORDER BY jp.salary_year_avg DESC 
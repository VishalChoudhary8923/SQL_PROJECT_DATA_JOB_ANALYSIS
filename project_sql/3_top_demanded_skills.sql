-- What are the most in-demand skills for data analysts?

SELECT 
    sd.skills,
    COUNT(sj.skill_id) AS demand_count
FROM job_postings_fact jp
INNER JOIN skills_job_dim sj
ON jp.job_id = sj.job_id
INNER JOIN skills_dim sd
ON sj.skill_id = sd.skill_id
WHERE 
    jp.job_title_short = 'Data Analyst' AND
    jp.job_work_from_home = 'True'
GROUP BY
    sd.skills
ORDER BY
    demand_count DESC
LIMIT 5
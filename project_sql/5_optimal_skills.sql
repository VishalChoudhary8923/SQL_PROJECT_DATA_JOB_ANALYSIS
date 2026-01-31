-- What are the most optimal skills to learn (aka its high demand and high paying skill)?

WITH skills_demand AS (
    SELECT 
        sd.skill_id,
        sd.skills,
        COUNT(sj.skill_id) AS demand_count
    FROM job_postings_fact jp
    INNER JOIN skills_job_dim sj
        ON jp.job_id = sj.job_id
    INNER JOIN skills_dim sd
        ON sj.skill_id = sd.skill_id
    WHERE 
        jp.job_title_short = 'Data Analyst'
        AND jp.salary_year_avg IS NOT NULL
        AND jp.job_work_from_home = 'True'
    GROUP BY
        sd.skill_id,
        sd.skills
),
average_salary AS ( 
    SELECT 
        sd.skill_id,
        sd.skills,
        ROUND(AVG(jp.salary_year_avg), 0) AS average_salary
    FROM job_postings_fact jp
    INNER JOIN skills_job_dim sj
        ON jp.job_id = sj.job_id
    INNER JOIN skills_dim sd
        ON sj.skill_id = sd.skill_id
    WHERE 
        jp.job_title_short = 'Data Analyst'
        AND jp.salary_year_avg IS NOT NULL
        AND jp.job_work_from_home = 'True'
    GROUP BY
        sd.skill_id,
        sd.skills
)

SELECT 
    sd.skill_id,
    sd.skills,
    sd.demand_count,
    av.average_salary
FROM skills_demand sd
INNER JOIN average_salary av
    ON sd.skill_id = av.skill_id
WHERE sd.demand_count >= 10
ORDER BY
    av.average_salary DESC,
    sd.demand_count DESC
   
LIMIT 25;

-- rewriting the same query more concisely

SELECT 
    sd.skill_id,
    sd.skills,
    COUNT(sd.skill_id) AS demand_count,
    ROUND(AVG(jp.salary_year_avg), 0) AS average_salary
FROM job_postings_fact jp
INNER JOIN skills_job_dim sj
    ON jp.job_id = sj.job_id    
INNER JOIN skills_dim sd
    ON sj.skill_id = sd.skill_id        
WHERE 
    jp.job_title_short = 'Data Analyst'
    AND jp.salary_year_avg IS NOT NULL
    AND jp.job_work_from_home = 'True'
GROUP BY
    sd.skill_id
HAVING
    COUNT(sd.skill_id) >= 10
ORDER BY
    average_salary DESC,
    demand_count DESC
LIMIT 25;
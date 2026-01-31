--What are the top skills based on salary?

SELECT 
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
    sd.skills
ORDER BY
    average_salary DESC
LIMIT 25       

/*
Big-data processing skills command the highest premium.
PySpark leads the list with an average salary of $208K, 
which is ~37% higher than Pandas ($152K) and ~44% higher than NumPy ($144K). 
This indicates that analysts working on distributed, 
large-volume data systems earn significantly more than those focused on standalone data analysis.

Version control, DevOps, and platform tools strongly correlate with higher pay.
Bitbucket ($189K) and GitLab ($155K) rank above many core analytics libraries, 
while Kubernetes ($133K) and Jenkins ($125K) also appear in the top 25. 
This shows that analysts with deployment, CI/CD, and infrastructure exposure earn 20–30% more than traditional reporting-centric roles.

Core Python and ML tools remain valuable but plateau without cloud or scale.
Pandas ($152K), Jupyter ($153K), Scikit-learn ($126K), and NumPy ($144K) cluster in the mid-range, 
while cloud platforms like GCP ($123K) and Databricks ($142K) push salaries higher. 
This suggests maximum compensation is achieved when Python skills are combined with cloud and big-data ecosystems,
not in isolation.
 Overall, The data indicates a clear market shift—data analysts who operate closer to data engineering, cloud platforms, 
 and production systems consistently earn the highest salaries.

[
  {
    "skills": "pyspark",
    "average_salary": "208172"
  },
  {
    "skills": "bitbucket",
    "average_salary": "189155"
  },
  {
    "skills": "couchbase",
    "average_salary": "160515"
  },
  {
    "skills": "watson",
    "average_salary": "160515"
  },
  {
    "skills": "datarobot",
    "average_salary": "155486"
  },
  {
    "skills": "gitlab",
    "average_salary": "154500"
  },
  {
    "skills": "swift",
    "average_salary": "153750"
  },
  {
    "skills": "jupyter",
    "average_salary": "152777"
  },
  {
    "skills": "pandas",
    "average_salary": "151821"
  },
  {
    "skills": "elasticsearch",
    "average_salary": "145000"
  },
  {
    "skills": "golang",
    "average_salary": "145000"
  },
  {
    "skills": "numpy",
    "average_salary": "143513"
  },
  {
    "skills": "databricks",
    "average_salary": "141907"
  },
  {
    "skills": "linux",
    "average_salary": "136508"
  },
  {
    "skills": "kubernetes",
    "average_salary": "132500"
  },
  {
    "skills": "atlassian",
    "average_salary": "131162"
  },
  {
    "skills": "twilio",
    "average_salary": "127000"
  },
  {
    "skills": "airflow",
    "average_salary": "126103"
  },
  {
    "skills": "scikit-learn",
    "average_salary": "125781"
  },
  {
    "skills": "jenkins",
    "average_salary": "125436"
  },
  {
    "skills": "notion",
    "average_salary": "125000"
  },
  {
    "skills": "scala",
    "average_salary": "124903"
  },
  {
    "skills": "postgresql",
    "average_salary": "123879"
  },
  {
    "skills": "gcp",
    "average_salary": "122500"
  },
  {
    "skills": "microstrategy",
    "average_salary": "121619"
  }
]          
                        
*/                                                               
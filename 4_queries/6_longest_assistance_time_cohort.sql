CREATE VIEW average_time AS
SELECT cohorts.name, avg(completed_at - started_at) AS average_assistance_time
FROM assistance_requests
JOIN students ON student_id = students.id
JOIN cohorts ON cohort_id = cohorts.id
GROUP BY cohorts.name;

SELECT *
FROM average_time
WHERE average_assistance_time = (
  SELECT max(average_assistance_time)
  FROM average_time
);
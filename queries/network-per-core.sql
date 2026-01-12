SELECT
  floor(release_year) AS year,
  category,
  round(avg(net_gbitps / NULLIF(cores,0)), 3) AS avg_gbitps_per_core,
  count(*) AS n
FROM aws_all
WHERE is_current AND cores > 0 AND net_gbitps > 0
GROUP BY ALL
ORDER BY year, category;
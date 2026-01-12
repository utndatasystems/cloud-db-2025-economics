SELECT
  floor(release_year) AS year,
  category,
  round(avg(ram_gib / NULLIF(net_gbitps,0)), 3)    AS avg_gib_per_gbitps,
  round(median(ram_gib / NULLIF(net_gbitps,0)), 3) AS med_gib_per_gbitps,
  count(*) AS n
FROM aws_all
WHERE is_current
  AND ram_gib > 0
  AND net_gbitps > 0
  AND category IN (
    'Compute optimized',
    'General purpose',
    'Memory optimized',
    'Storage optimized'
  )
GROUP BY ALL
ORDER BY year, category;
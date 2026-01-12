SELECT
  family, instance, release_year,
  net_gbitps AS baseline,
  net_peak_gbitps AS peak,
  round(net_peak_gbitps / NULLIF(net_gbitps,0), 2) AS burst_ratio,
  price_hour,
  round((3600 * net_gbitps / 8) / price_hour, 2) AS baseline_GB_per_dollar,
  round((3600 * net_peak_gbitps / 8) / price_hour, 2) AS peak_GB_per_dollar
FROM aws_all
WHERE is_current
  AND net_peak_gbitps IS NOT NULL
  AND net_gbitps > 0
ORDER BY burst_ratio DESC, peak_GB_per_dollar DESC
LIMIT 50;
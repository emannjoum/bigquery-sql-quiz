
-- This query shows a list of the daily top Google Search terms.
SELECT
 week AS week,
 term AS Top_Term,
 region = region
 rank
FROM `bigquery-public-data.google_trends.top_terms`
WHERE
 rank IN (1,2,3)
 AND region = 'UK'
 -- Choose the top 3 terms.
 AND refresh_date >= DATE_SUB(CURRENT_DATE(), INTERVAL 1 MONTH)
 -- Filter to the last 1 month.
GROUP BY week, Top_Term, rank
ORDER BY week DESC
 -- Show the weeks in reverse chronological order.
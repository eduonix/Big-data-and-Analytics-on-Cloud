-- Looking at confirmed cases by date on the public dataset

select date, SUM(confirmed) num_reports
FROM `bigquery-public-data.covid19_open_data.compatibility_view`
WHERE country_region = 'India'
GROUP BY date
HAVING num_reports IS NOT NULL
ORDER BY date ASC;
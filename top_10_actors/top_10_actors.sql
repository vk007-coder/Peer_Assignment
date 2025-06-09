SELECT
    name AS actor_name,
    COUNT(DISTINCT id) AS number_of_titles
FROM
    netflix_data
WHERE
    role_name like '%ACTOR%'
GROUP BY
    name
ORDER BY
    number_of_titles DESC
LIMIT 10;
SELECT
    c.name AS actor_name,
    COUNT(DISTINCT m.id) AS number_of_high_score_titles
FROM
    netflix_data c
JOIN
    movies m ON c.id = m.id
WHERE
    c.role_name like '%ACTOR%'
    AND m.imdb_score > 8
    AND m.imdb_score IS NOT NULL
GROUP BY
    c.name
HAVING
    COUNT(DISTINCT m.id) >= 3
ORDER BY
    number_of_high_score_titles DESC, actor_name ASC;
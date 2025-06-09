SELECT
    actor_credit.name AS actor_name,
    director_credit.name AS director_name,
    COUNT(DISTINCT actor_credit.id) AS number_of_collaborations
FROM
    netflix_data AS actor_credit
JOIN
    netflix_data AS director_credit
ON
    actor_credit.id = director_credit.id -- Join on the same title ID
WHERE
    actor_credit.role_name like '%ACTOR%'
    AND director_credit.role_name like '%DIRECTOR%'
GROUP BY
    actor_name,
    director_name
ORDER BY
    number_of_collaborations DESC
LIMIT 10; -- Adjust this limit to see more or fewer top collaborations
SELECT
    title,
    release_year,
    next_netflix_release_year,
    (next_netflix_release_year - release_year) AS gap_in_years
FROM (
    SELECT
        title,
        release_year,
        LEAD(release_year, 1) OVER (ORDER BY release_year ASC) AS next_netflix_release_year
    FROM
        movies
    WHERE
        release_year IS NOT NULL
    GROUP BY -- Grouping by release_year and title to handle cases where multiple titles might have the same release_year
        release_year, title
) AS subquery
WHERE
    next_netflix_release_year IS NOT NULL
ORDER BY
    gap_in_years DESC
LIMIT 10; -- You can adjust this limit to see more or fewer top results
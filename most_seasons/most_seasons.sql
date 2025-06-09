SELECT
    title,
    seasons
FROM
    movies
WHERE
    type = 'SHOW' -- Filter for TV shows
    AND seasons IS NOT NULL -- Ensure seasons data exists
    AND seasons > 0 -- Exclude shows with 0 seasons if any
ORDER BY
    seasons DESC
LIMIT 10;
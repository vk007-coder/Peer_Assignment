SELECT
    genre,
    AVG(imdb_score) AS average_imdb_score
FROM (
    SELECT
        m.imdb_score,
        TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(m.genres, ',', n.num), ',', -1)) AS genre
    FROM
        movies m
    JOIN (
        -- Simulate a numbers table for splitting comma-separated genres
        SELECT 1 AS num UNION ALL
        SELECT 2 UNION ALL
        SELECT 3 UNION ALL
        SELECT 4 UNION ALL
        SELECT 5 -- Extend this if you expect more than 5 genres per title
    ) AS n
    ON CHAR_LENGTH(m.genres) - CHAR_LENGTH(REPLACE(m.genres, ',', '')) >= n.num - 1
    WHERE
        m.imdb_score IS NOT NULL
        AND m.genres IS NOT NULL
        AND m.genres != ''
) AS individual_genres
WHERE
    genre != '' -- Ensure no empty strings from trimming or splitting are counted as genres
GROUP BY
    genre
ORDER BY
    average_imdb_score DESC
LIMIT 5;
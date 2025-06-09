SELECT
    type,
    AVG(imdb_score) AS average_imdb_score
FROM
    movies
WHERE
    type IN ('MOVIE', 'SHOW') -- Assuming 'type' column contains 'MOVIE' for movies and 'SHOW' for TV shows
    AND imdb_score IS NOT NULL -- Exclude titles without an IMDb score
GROUP BY
    type
ORDER BY
    average_imdb_score DESC;
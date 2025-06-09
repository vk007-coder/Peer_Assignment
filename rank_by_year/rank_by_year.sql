SELECT
    title,
    release_year,
    imdb_score,
    RANK() OVER (PARTITION BY release_year ORDER BY imdb_score DESC) AS imdb_rank_within_year
FROM
    movies
WHERE
    imdb_score IS NOT NULL
    AND release_year IS NOT NULL
ORDER BY
    release_year DESC,
    imdb_rank_within_year ASC;
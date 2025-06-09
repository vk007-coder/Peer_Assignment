SELECT
    age_certification,
    COUNT(*) AS number_of_titles,
    (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM movies WHERE age_certification IS NOT NULL AND age_certification != '')) AS percentage
FROM
    movies
WHERE
    age_certification IS NOT NULL AND age_certification != '' -- Exclude titles with missing or empty age certifications
GROUP BY
    age_certification
ORDER BY
    percentage DESC;
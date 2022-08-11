--counts total bib records by bib location
--by Kevin Cretsos
-- University of Dayton
-- 08/11/2022

SELECT
rl.location_code,
COUNT (b.id) AS total_bib_count

FROM
sierra_view.bib_view AS b

LEFT OUTER JOIN
sierra_view.bib_record_location AS rl
ON b.id = rl.bib_record_id


GROUP BY
rl.location_code

ORDER BY
rl.location_code
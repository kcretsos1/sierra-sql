--counts patrons by patron type
-- by Kevin Cretsos
-- University of Dayton
--08/11/2022

SELECT
p.ptype_code as patron_type_code,
COUNT (p.id) AS total_item_count

FROM
sierra_view.patron_view AS p

GROUP BY
p.ptype_code
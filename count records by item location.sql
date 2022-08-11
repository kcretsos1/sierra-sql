--counts total records by item location
--by Kevin Cretsos
-- University of Dayton
-- 08/11/2022

SELECT
i.location_code,
COUNT (i.id) AS total_item_count

FROM
sierra_view.item_view AS i

GROUP BY 
i.location_code
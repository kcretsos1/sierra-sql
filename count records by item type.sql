--counts items by item type
--by Kevin Cretsos
-- University of Dayton
-- 08/11/2022

SELECT
i.itype_code_num as item_type_number,
COUNT (i.id) AS total_item_count

FROM
sierra_view.item_view AS i

GROUP BY
i.itype_code_num
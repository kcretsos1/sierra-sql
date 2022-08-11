--identify orphan items with no bib record attached
--by Kevin Cretsos
--University of Dayton
-- 08/11/2022

SELECT
'i'||iv.record_num||'a' as item_record_number,
iv.barcode

FROM
sierra_view.item_view AS iv

LEFT OUTER JOIN
sierra_view.item_record AS i
ON iv.id = i.record_id

LEFT OUTER JOIN
sierra_view.bib_record_item_record_link AS l
ON i.record_id = l.item_record_id

LEFT OUTER JOIN
sierra_view.bib_record AS b
ON l.bib_record_id = b.record_id

LEFT OUTER JOIN
sierra_view.bib_view AS bv
ON b.record_id = bv.id

WHERE
bv.record_num IS NULL

LIMIT 1000
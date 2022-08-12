--identify active holds (not including holdshelf)
--by Kevin Cretsos
--University of Dayton
-- 08/12/2022

SELECT
brp.best_title as title,
'b'||bv.record_num||'a' as bib_record_number,
'i'||iv.record_num||'a' as item_record_number,
iv.barcode,
i.location_code,
UPPER(irp.call_number_norm) AS call_number,
i.item_status_code,
h.placed_gmt,
h.pickup_location_code

FROM
sierra_view.hold AS h

LEFT OUTER JOIN
sierra_view.item_view AS iv
ON h.record_id = iv.id

LEFT OUTER JOIN
sierra_view.item_record AS i
ON iv.id = i.record_id

LEFT OUTER JOIN
sierra_view.item_record_property AS irp
ON i.record_id = irp.item_record_id

LEFT OUTER JOIN
sierra_view.bib_record_item_record_link AS l
ON i.record_id = l.item_record_id

LEFT OUTER JOIN
sierra_view.bib_record_property AS brp
ON l.bib_record_id = brp.bib_record_id

LEFT OUTER JOIN
sierra_view.bib_view AS bv
ON brp.bib_record_id = bv.id

WHERE
h.placed_gmt IS NOT NULL
AND h.is_ir IS FALSE -- item is not INNREACH
AND i.item_status_code != '!' -- holdshelf status

ORDER BY
h.placed_gmt ASC,
i.item_status_code ASC

LIMIT 1000

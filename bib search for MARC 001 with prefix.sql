--Search for MARC 001 control numbers starting with prefix letter 'o'
-- by Kevin Cretsos
-- University of Dayton
-- 08/11/2022
SELECT
m.record_type_code||m.record_num||'a' as record_num,
v.varfield_type_code,
v.marc_tag as marc,
v.marc_ind1 as ind_1,
v.marc_ind2 as ind_2,
v.field_content AS marc_data,
brp.best_title as title

FROM
sierra_view.record_metadata as m

JOIN
sierra_view.bib_record_property as brp
ON m.id = brp.bib_record_id

JOIN
sierra_view.varfield as v
ON v.record_id = m.id

WHERE
m.record_type_code = 'b' AND
v.marc_tag LIKE '001%' AND 
v.field_content LIKE 'o%'

ORDER BY 1
ASC

LIMIT 1000 -- limit in case too many results, if 1000, change to a higher limit



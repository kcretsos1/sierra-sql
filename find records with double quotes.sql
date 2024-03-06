/*
Kevin Cretsos
University of Dayton
03/06/2024
Find record numbers that have double quotes in variable-length fields based on record type
Note: change "m.record_type_code" value to record type
o = order
i = item
p = patron
c = checkin
e = resource
r = reserve
v = vendor
n = invoice
l = license
t = contact
*/

SELECT
m.record_type_code||m.record_num||'a' as record_num
--v.field_content

FROM
sierra_view.record_metadata as m

LEFT OUTER JOIN
sierra_view.varfield v
ON v.record_id = m.id

WHERE
m.record_type_code = 'o' AND
v.field_content ~ '["]'

ORDER BY 1 ASC

LIMIT 100000
/*
Search for Bib Records with Double Quotes in MARC Fields
Kevin Cretsos
University of Dayton
2/12/2024
*/

SELECT DISTINCT
m.record_type_code||m.record_num||'a' AS record_num,
/* <-- UNCOMMENT THESE LINES TO SEE WHICH MARC FIELDS HAVE DOUBLE QUOTES
v.varfield_type_code,
v.marc_tag||v.marc_ind1||v.marc_ind2 as marc,
v.field_content as field_with_subfields,
--> */
m.record_type_code AS record_type_code

FROM
sierra_view.record_metadata AS m

LEFT OUTER JOIN
sierra_view.varfield AS v
ON v.record_id = m.id

WHERE
m.record_type_code = 'b' AND
v.field_content ~ '["]' 
/*  <-- UNCOMMENT THESE LINES TO SPECIFY CERTAIN MARC FIELDS AND VARIABLE-LENGTH FIELD CODES 
AND v.marc_tag ~'[5][0-9][0-9]' -- MARC 5XX
AND v.varfield_type_code = 'n' -- variable-length 'n' for notes
--> */

LIMIT 1000 -- limit in case too many results, if 1000, change to a higher limit




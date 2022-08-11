--Record Count by Record Index
--by Kevin Cretsos
--University of Dayton
--08/11/2022

-- a = authority
-- b =  bibliographic
-- i = item
-- o = order
-- p = patron
--etc.
SELECT
r.record_type_code,
COUNT(r.id)
FROM
sierra_view.record_metadata as r
GROUP BY
r.record_type_code
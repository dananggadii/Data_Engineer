-- Count (total seluruh data)
SELECT COUNT(field_name) AS name_alias
FROM name_table;

-- Count multiple fields
SELECT COUNT(field_name) AS name_alias, COUNT(field_name) AS name_alias 
FROM name_table;

-- Count all fields
SELECT COUNT(*) AS name_alias
FROM name_table;

-- Distinct (menghapus seluruh data duplikat)
SELECT DISTINCT field_name
FROM name_table;

-- Count with Distinct (total seluruh nilai tanpa nilai duplikat)
SELECT COUNT(DISTINCT field_name) AS name_alias
FROM name_table;


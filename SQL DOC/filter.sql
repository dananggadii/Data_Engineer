-- ORDER BY (ASC = Up, DESC = Down)
SELECT field_name, field_name
FROM name_table
ORDER BY field_name;

SELECT field_name, field_name
FROM name_table
ORDER BY field_name ASC, field_name DESC;

-- Group BY single field
SELECT field_name, COUNT(field_name) AS name_alias
FROM name_table
GROUP BY field_name, field_name
ORDER BY field_name ASC, field_name DESC
LIMIT number_limit;

-- Filtering Grouped data
SELECT
    field_name
    COUNT(field_name) AS name_alias
FROM name_table
GROUP BY field_name
HAVING COUNT(field_name) > number_filtered;
-- Aggregate function (AVG(), SUM(), MIN(), MAX(), COUNT())
SELECT Aggregate_function(field_name) AS name_alias
FROM name_table;

-- Aggregate function with WHERE Condition
SELECT Aggregate_function(field_name) AS name_alias
FROM name_table
WHERE field_name >= value;

-- ROUND() = number specified decimal
SELECT ROUND(AVG(field_name), number_places_after_coma) AS name_alias
FROM name_table
WHERE field_name >= value;

-- No number after decimal
SELECT ROUND(AVG(field_name)) AS name_alias
FROM name_table
WHERE field_name >= value;

-- Aliasing with arithmatic (+, -, /, *)
SELECT (field_name - field_name) AS name_alias
FROM name_table;
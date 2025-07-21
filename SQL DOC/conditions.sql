-- WHERE (mencari letak query)
SELECT field_name
FROM name_table
WHERE field_name = 'value';

-- WHERE with comparison operators (>, <, >=, <=) noted (<> artinya !=)
SELECT field_name
FROM name_table
WHERE field_name > 'value';

-- WHERE multiple criteria OR, AND, BETWEEN 
SELECT field_name
FROM name_table
WHERE field_name = 'value' OR field_name = 'value';

-- WHERE OR, AND operator
SELECT field_name
FROM name_table
WHERE field_name = 'value'
  OR field_name = 'value';

-- WHERE AND, OR
SELECT field_name
FROM name_table
WHERE (field_name = 'value' OR field_name = 'value') 
  AND (field_name = 'value' OR field_name = 'value');

-- WHERE BETWEEN, AND
SELECT field_name
FROM name_table
WHERE field_name 
  BETWEEN value1 AND value2;

-- WHERE BETWEEN, AND, OR
SELECT field_name
FROM name_table
WHERE field_name 
  BETWEEN value1 AND value2 AND field_name = 'value';

-- LIKE Query 
SELECT field_name 
FROM name_table
WHERE field_name LIKE 'value%' -- value mencari value.....
WHERE field_name LIKE '__value%' -- value mencari karakter value ketiga.....
WHERE field_name LIKE '%value'; -- value mencari .....value

-- NOT LIKE Query 
SELECT field_name 
FROM name_table
WHERE field_name NOT LIKE 'value%' -- value mencari kecuali value.....
WHERE field_name NOT LIKE '%value'; -- value mencari kecuali .....value

-- WHERE, IN
SELECT field_name
FROM name_table
WHERE field_name IN (value1, value2, value3);

-- NULL values
SELECT field_name
FROM name_table
WHERE field_name IS NULL; -- Include nilai null
WHERE field_name IS NOT NULL; -- Not include nilai null

-- LIMIT (membatasi query view/output)
SELECT field_name 
FROM name_table
WHERE field_name > 'value';
LIMIT number_limit;
-- Subquery = Menampilkan hasil dengan kondisi pada table lain nya
SELECT name, country_code, urbanarea_pop
FROM cities
WHERE name IN 
    (
        SELECT capital
        FROM countries)
ORDER BY urbanarea_pop DESC;

-- Subquery in SELECT
SELECT countries.name AS country,  
  (SELECT COUNT(*) AS cities_num
  FROM cities
  WHERE cities.country_code = countries.code) AS cities_num
FROM countries
ORDER BY cities_num DESC, country
LIMIT 9;

-- Subquery in FROM
SELECT DISTINCT monarch.continent, sub.most_recent 
FROM monarch, 
  (SELECT continent, MAX(indep_year) AS most_recent
  FROM states 
  GROUP BY continent) AS sub
WHERE monarch.continent = sub.continent
ORDER BY continent;

SELECT local_name, sub.lang_num
FROM countries,
  (SELECT code, COUNT(*) AS lang_num
    FROM languages
    GROUP BY code) AS sub
WHERE countries.code = sub.code
ORDER BY lang_num DESC;
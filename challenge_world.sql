USE world;

--  1. Using COUNT, get the number of cities in the USA.

SELECT CountryCode, COUNT(*) city_count FROM city
GROUP BY CountryCode
HAVING CountryCode = 'USA';

--  2. Find out the population and life expectancy for people in Argentina.

SELECT `Name`, Population, LifeExpectancy FROM country
WHERE `Name` = 'Argentina';

--  3. Using IS NOT NULL, ORDER BY, and LIMIT, which country has the highest life expectancy?

SELECT `Name`, LifeExpectancy FROM country
HAVING LifeExpectancy IS NOT NULL
ORDER BY LifeExpectancy DESC LIMIT 1;

--  4. Using JOIN ... ON, find the capital city of Spain.

SELECT co.Capital capital_id, ci.`Name` capital_city, co.`Name` country FROM city ci
INNER JOIN country co ON ci.CountryCode = co.`Code`
WHERE co.Capital = ci.ID AND co.`Name` = 'Spain';

--  5. Using JOIN ... ON, list all the languages spoken in the Southeast Asia region.

SELECT co.`Name` Country, cl.`Language` FROM countrylanguage cl
INNER JOIN country co ON cl.CountryCode = co.`Code`
WHERE co.Region = 'Southeast Asia';

--  6. Using a single query, list 25 cities around the world that start with the letter F.

SELECT `Name` AS City From city
WHERE `Name` LIKE 'F%' LIMIT 25;

--  7. Using COUNT and JOIN ... ON, get the number of cities in China.

SELECT co.`Name` Country, COUNT(ci.`Name`) CityCount FROM city ci
INNER JOIN country co ON ci.CountryCode = co.`Code`
GROUP BY co.`Name`
HAVING co.`Name` = 'China';

--  8. Using IS NOT NULL, ORDER BY, and LIMIT, which country has the lowest population? Discard zero populations.

SELECT `Name`, Population FROM country
HAVING Population IS NOT NULL AND Population != 0
ORDER BY Population ASC LIMIT 1;

--  9. Using aggregate functions, return the number of countries the database contains.

SELECT DISTINCT COUNT(*) Country_Count FROM country;

-- 10. What are the top ten largest countries by area?

SELECT `Name` AS Country, SurfaceArea FROM country
ORDER BY SurfaceArea DESC LIMIT 10;

-- 11. List the five largest cities by population in Japan.

SELECT CountryCode, `Name`, Population FROM city
WHERE CountryCode = 'JPN'
ORDER BY Population DESC LIMIT 5;

-- 12. List the names and country codes of every country with Elizabeth II as its Head of State. You will need to fix the mistake first!

UPDATE country
SET HeadOfState = 'Elizabeth II'
WHERE HeadOfState = 'Elisabeth II';

SELECT `Name` Country, `Code` `Country Code`, HeadOfState FROM country
WHERE HeadOfState = 'Elizabeth II';

-- 13. List the top ten countries with the smallest population-to-area ratio. Discard any countries with a ratio of 0.

SELECT `Name` AS Country, (1/(Population/SurfaceArea)) AS 'Ratio' FROM country
-- WHERE 'Ratio' != 0
ORDER BY Ratio ASC LIMIT 10;                                                        -- NEED TO COMPLETE


-- 14. List every unique world language.

SELECT DISTINCT `Language` FROM countrylanguage;

-- 15. List the names and GNP of the world's top 10 richest countries.

SELECT `Name` Country, GNP FROM country
ORDER BY GNP DESC LIMIT 10;

-- 16. List the names of, and number of languages spoken by, the top ten most multilingual countries.

SELECT c.`Name` Country, COUNT(*) Languages FROM countrylanguage cl
INNER JOIN country c ON cl.CountryCode = c.`Code`
GROUP BY cl.CountryCode
ORDER BY Languages DESC LIMIT 10;

-- 17. List every country where over 50% of its population can speak German.

SELECT `Name` Country, cl.Percentage FROM country c
INNER JOIN countrylanguage cl ON c.`Code` = cl.CountryCode
WHERE cl.Percentage >= 50 AND cl.`Language` = 'German';

-- 18. Which country has the worst life expectancy? Discard zero or null values.

SELECT `Name` Country, LifeExpectancy FROM country
HAVING LifeExpectancy IS NOT NULL AND LifeExpectancy != 0
ORDER BY LifeExpectancy ASC LIMIT 1;

-- 19. List the top three most common government forms.

SELECT GovernmentForm, COUNT(*) gov_count FROM country
GROUP BY GovernmentForm
ORDER BY gov_count DESC LIMIT 3;

-- 20. How many countries have gained independence since records began?

SELECT COUNT(IndepYear) indep_count FROM country
WHERE IndepYear IS NOT NULL;


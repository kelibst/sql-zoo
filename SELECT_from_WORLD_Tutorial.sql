-- show the name, continent and population of all countries. 
SELECT name, continent, population FROM world;

-- Show the name for the countries that have a population of at least 200 million. 200 million is 200000000, there are eight zeros.

SELECT name FROM world
WHERE population >= 200000000;

-- Give the name and the per capita GDP for those countries with a population of at least 200 million. 

SELECT name, gdp/population FROM world WHERE population >= 200000000;

4.

-- Show the name and population in millions for the countries of the continent 'South America'. Divide the population by 1000000 to get population in millions. 
SELECT name, population/1000000 FROM world WHERE continent = 'South America';

-- Show the name and population for France, Germany, Italy 
SELECT name, population FROM world WHERE name IN ('France', 'Germany', 'Italy')

-- Show the countries which have a name that includes the word 'United'

SELECT name FROM world WHERE name LIKE '%United%';

-- Show the countries that are big by area or big by population. Show name, population and area.

SELECT name, population, area FROM world HAVING population > 250000000 OR area > 3000000;

-- Exclusive OR (XOR). Show the countries that are big by area (more than 3 million) or big by population (more than 250 million) but not both. Show name, population and area.

SELECT name, population, area FROM world HAVING population > 250000000 XOR area > 3000000;

-- For South America show population in millions and GDP in billions both to 2 decimal places.

SELECT name, ROUND(population/1000000, 2), ROUND(gdp/1000000000, 2) FROM world WHERE continent = 'South America';

-- Trillion dollar economies

-- Show per-capita GDP for the trillion dollar countries to the nearest $1000.

SELECT name, ROUND((gdp/population),-3) FROM world WHERE gdp >= 1000000000000;

-- Name and capital have the same length
-- Show the name and capital where the name and the capital have the same number of characters.

SELECT name, capital
  FROM world
 WHERE LENGTH (name) = LENGTH(capital);

--  Matching name and capital

-- Show the name and the capital where the first letters of each match. Don't include countries where the name and the capital are the same word.

SELECT name, capital
FROM world 
WHERE LEFT(name,1) = LEFT(capital,1) AND name <> capital;

-- Equatorial Guinea and Dominican Republic have all of the vowels (a e i o u) in the name. They don't count because they have more than one word in the name.

-- Find the country that has all the vowels and no spaces in its name.


/* The following query returns the id, name, host_name of all the apartments that are located in ΑΜΠΕΛΟΚΗΠΟΙ or ΣΤΑΔΙΟ.
*/

SELECT "Listings".id, "Listings".name, "Listings".host_name, "Neighbourhoods".neighbourhood
FROM "Listings"
JOIN "Neighbourhoods"
ON "Listings".neighbourhood_cleansed = "Neighbourhoods".neighbourhood
WHERE "Neighbourhoods".neighbourhood = 'ΑΜΠΕΛΟΚΗΠΟΙ' OR "Neighbourhoods".neighbourhood = 'ΣΤΑΔΙΟ'
ORDER BY "Neighbourhoods".neighbourhood;


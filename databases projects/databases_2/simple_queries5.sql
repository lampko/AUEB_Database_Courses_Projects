/* The following query returns the neighbourhoods and overviews about them​.
*/

SELECT DISTINCT "Neighbourhoods".neighbourhood, "Listings".neighborhood_overview
FROM "Listings"
JOIN "Neighbourhoods"
ON "Listings".neighbourhood_cleansed = "Neighbourhoods".neighbourhood
ORDER BY "Neighbourhoods".neighbourhood;

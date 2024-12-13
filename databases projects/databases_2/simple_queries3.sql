/* The following query returns the id, name, and geolocation data of the first 100 apartments ordered by their price
*/

SELECT "Listings-Summary".id, "Listings-Summary".name, "Listings-Summary".price, "Geolocation".*
FROM "Listings-Summary"
JOIN "Geolocation"
ON "Listings-Summary".neighbourhood = "Geolocation".properties_neighbourhood
ORDER BY "Listings-Summary".price
LIMIT 100;


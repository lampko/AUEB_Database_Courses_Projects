/* The following query returns the average price of apartments in each neighbourhood
*/

SELECT AVG(price) AS AVERAGE_PRICE, "Neighbourhoods".neighbourhood
FROM "Listings-Summary"
JOIN "Neighbourhoods"
ON "Listings-Summary".neighbourhood = "Neighbourhoods".neighbourhood
GROUP BY "Neighbourhoods".neighbourhood;


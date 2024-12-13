/* The following query returns the id, name of the apartments with the minimum price in each neighbourhood.
*/

SELECT "Listings-Summary".id, "Listings-Summary".name, "M8".minimum_price, "M8".neighbourhood
FROM "Listings-Summary"
JOIN(SELECT MIN(price) AS minimum_price, "Neighbourhoods".neighbourhood
    FROM "Listings-Summary"
    JOIN "Neighbourhoods"
    ON "Listings-Summary".neighbourhood = "Neighbourhoods".neighbourhood
    GROUP BY "Neighbourhoods".neighbourhood) "M8"
ON "Listings-Summary".price = "M8".minimum_price;


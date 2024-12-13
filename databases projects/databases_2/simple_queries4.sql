/* The following query returns the id, name of the apartments that are available between the dates of 2020-04-01 and 2020-04-31.
*/

SELECT "Listings".id,"Listings".name, "Calendar".date
FROM "Listings"
JOIN "Calendar"
ON "Listings".id = "Calendar".listing_id
WHERE ("Calendar".date BETWEEN '2020-04-01' AND '2020-04-30')
AND "Calendar".available=true;



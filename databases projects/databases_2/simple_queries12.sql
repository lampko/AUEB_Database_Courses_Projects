/* The following query returns the id,name of the apartments that have the maximum availability.
*/

SELECT "M11".max_availability_365,"Listings-Summary".id ,"Listings-Summary".name
FROM "Listings-Summary"
JOIN(SELECT MAX(availability_365) AS max_availability_365
    FROM "Listings-Summary") "M12"
ON "Listings-Summary".availability_365 = "M11".max_availability_365
ORDER BY "Listings-Summary".id;
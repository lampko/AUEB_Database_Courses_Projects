/* The following query returns the id, name and the number of reviews of the apartments in descending order.
*/

SELECT "Listings".id, "Listings".name, "Listings".number_of_reviews
FROM "Listings"
ORDER BY "Listings".number_of_reviews DESC ;


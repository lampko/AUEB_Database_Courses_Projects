/* The following query returns the id, name, last review, price of the apartments whose last review was published in the year 2020.
*/

SELECT "Listings-Summary".id, "Listings-Summary".name, "Listings-Summary".last_review, "Listings-Summary".price
FROM "Listings-Summary"
WHERE "Listings-Summary".last_review LIKE '2020%';
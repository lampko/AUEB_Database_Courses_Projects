/* The following query returns the id, name of the apartments located in either ΑΚΡΟΠΟΛΗ or ΠΛΑΚΑ, and reviews about them as well as the name of the reviewer .
*/

Select "Listings".id,"Listings".name,"Reviews".reviewer_name,"Reviews".comments
FROM "Listings"
FULL OUTER JOIN "Reviews"
ON "Listings".id="Reviews".listing_id
WHERE ("Listings".neighbourhood_cleansed='ΑΚΡΟΠΟΛΗ' OR "Listings".neighbourhood_cleansed='ΠΛΑΚΑ') ;




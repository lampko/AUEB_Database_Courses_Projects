/* The following query returns the id, name and comments about apartments that are Private rooms.
*/

SELECT "Listings-Summary".id,"Listings-Summary".name, "Reviews".comments
FROM "Listings-Summary" 
FULL OUTER JOIN "Reviews"
ON "Listings-Summary".id = "Reviews".listing_id
WHERE "Listings-Summary".room_type ='Private room';

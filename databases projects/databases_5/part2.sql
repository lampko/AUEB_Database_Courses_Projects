/*The following query returns the name, neighbourhood, street and zipcode of the listings
that are located in 'ΠΕΤΡΑΛΩΝΑ' or 'ΚΕΡΑΜΕΙΚΟΣ'*/
SELECT name, neighbourhood_cleansed, street, zipcode
FROM "Listing-copy"
JOIN "Location-copy"
ON "Listing-copy".id = "Location-copy".id
WHERE neighbourhood_cleansed = 'ΠΕΤΡΑΛΩΝΑ' OR neighbourhood_cleansed = 'ΚΕΡΑΜΕΙΚΟΣ';

/*The following query returns the id, beds, bathrooms, price, security_deposit, cleaning_fee, maximum_nights with price lower than 50*/
SELECT "Room-copy".id, beds, bathrooms, "Price-copy".price, "Price-copy".security_deposit, cleaning_fee, maximum_nights
FROM "Price-copy"
FULL OUTER JOIN "Room-copy"
ON "Room-copy".id = "Price-copy".id
WHERE "Price-copy".price < 50;

/*The following query returns the amenity id, name and number of rooms that provide it*/
SELECT c.amenity_id, "Amenity".amenity_name, c.room_count
FROM "Amenity"
JOIN(
SELECT amenity_id, COUNT(room_id) AS room_count
FROM "Connection"
GROUP BY amenity_id
HAVING COUNT(room_id) > 10) AS c
ON c.amenity_id = "Amenity".amenity_id;

/*The following query returns the geolocation data for the neighbourhood that the host with a specific name and id lives in.*/
SELECT "Host-copy".id, "Host-copy".name, i.*
FROM (SELECT "Geolocation-copy".*, "Location-copy".neighbourhood
FROM "Geolocation-copy"
JOIN "Location-copy"
ON "Geolocation-copy".properties_neighbourhood = "Location-copy".neighbourhood) AS i
FULL OUTER JOIN "Host-copy"
ON "Host-copy".neighbourhood = i.neighbourhood;

/*The following query returns the names of the hosts whose number of reviewed apartments is greater than 5*/
SELECT "Host-copy".name, COUNT(t.id) AS number_of_reviewed_apartments
FROM "Host-copy"
JOIN (
SELECT "Listing-copy".host_id, "Review-copy".id
FROM "Listing-copy"
JOIN "Review-copy"
ON "Listing-copy".id = "Review-copy".listing_id) AS t
ON "Host-copy".id = t.host_id
GROUP BY name
HAVING COUNT(t.id) > 5;
CREATE TABLE "Amenity" AS(
SELECT DISTINCT amenity_name.*
FROM (SELECT amenities
FROM "Room-copy") AS a
CROSS JOIN regexp_split_to_table(a.amenities , ',') AS amenity_name
);

UPDATE "Amenity" SET amenity_name = REPLACE(amenity_name, '{','');
UPDATE "Amenity" SET amenity_name = REPLACE(amenity_name, '"','');
UPDATE "Amenity" SET amenity_name = REPLACE(amenity_name, '}','');

ALTER TABLE "Room-copy" DROP COLUMN amenities;

ALTER TABLE "Amenity" ADD COLUMN amenity_id SERIAL PRIMARY KEY;

CREATE TABLE "Connection" AS(
SELECT amenity_id, r.id AS room_id
FROM "Amenity"
JOIN(
SELECT id
FROM "Room-copy") AS r 
ON r.amenities LIKE '%' || "Amenity".amenity_name || '%');

ALTER TABLE "Connection" ADD FOREIGN KEY(amenity_id) REFERENCES "Amenity"(amenity_id);
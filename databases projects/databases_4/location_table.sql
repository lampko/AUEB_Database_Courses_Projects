CREATE TABLE "Location" AS SELECT DISTINCT id, street, neighbourhood, neighbourhood_cleansed, city, state,
zipcode, market, smart_location, country_code, country, latitude, longitude, is_location_exact
FROM "Listings";

/*ALTER TABLE "Listings" DROP COLUMN street;
ALTER TABLE "Listings" DROP COLUMN neighbourhood;
ALTER TABLE "Listings" DROP COLUMN neighbourhood_cleansed;
ALTER TABLE "Listings" DROP COLUMN city; 
ALTER TABLE "Listings" DROP COLUMN zipcode;
ALTER TABLE "Listings" DROP COLUMN market;
ALTER TABLE "Listings" DROP COLUMN smart_location;
ALTER TABLE "Listings" DROP COLUMN country_code;
ALTER TABLE "Listings" DROP COLUMN country;
ALTER TABLE "Listings" DROP COLUMN latitude;
ALTER TABLE "Listings" DROP COLUMN longitude;
ALTER TABLE "Listings" DROP COLUMN is_location_exact;*/

ALTER TABLE "Location" ADD FOREIGN KEY(id) REFERENCES "Listings"(id);

ALTER TABLE "Listings" DROP CONSTRAINT "Listings_neighbourhood_cleansed_fkey";;

ALTER TABLE "Location" ADD FOREIGN KEY(neighbourhood_cleansed) REFERENCES "Neighbourhoods"(neighbourhood);
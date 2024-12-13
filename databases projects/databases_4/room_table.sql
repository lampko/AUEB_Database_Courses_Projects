CREATE TABLE "Room" AS SELECT DISTINCT id, accommodates, bathrooms, bedrooms, beds, bed_type,
amenities, square_feet, price, weekly_price, monthly_price, security_deposit
FROM "Listings";

/*ALTER TABLE "Listings" DROP COLUMN accommodates;
ALTER TABLE "Listings" DROP COLUMN bathrooms;
ALTER TABLE "Listings" DROP COLUMN bedrooms;
ALTER TABLE "Listings" DROP COLUMN beds;
ALTER TABLE "Listings" DROP COLUMN bed_type;
ALTER TABLE "Listings" DROP COLUMN amenities;
ALTER TABLE "Listings" DROP COLUMN square_feet;
ALTER TABLE "Listings" DROP COLUMN price;
ALTER TABLE "Listings" DROP COLUMN weekly_price;
ALTER TABLE "Listings" DROP COLUMN monthly_price;
ALTER TABLE "Listings" DROP COLUMN security_deposit;*/

ALTER TABLE "Room" ADD FOREIGN KEY(id) REFERENCES "Listings"(id);
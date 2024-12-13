/*The following query returns the id, name and host name of all the apartments that are located in ΑΜΠΕΛΟΚΗΠΟΙ or ΣΤΑΔΙΟ.*/
SELECT "Listings".id, "Listings".name, "Listings".host_name, "Neighbourhoods".neighbourhood
FROM "Listings"
JOIN "Neighbourhoods"
ON "Listings".neighbourhood_cleansed = "Neighbourhoods".neighbourhood
WHERE "Neighbourhoods".neighbourhood = 'ΑΜΠΕΛΟΚΗΠΟΙ' OR "Neighbourhoods".neighbourhood = 'ΣΤΑΔΙΟ'
ORDER BY "Neighbourhoods".neighbourhood;*/

/*The following query returns the id and names of the apartments, located in either 'ΑΝΩ ΚΥΨΕΛΗ' OR 'ΚΕΡΑΜΕΙΚΟΣ', with the maximum nights*/
SELECT "M2".max_of_all, "M2".neighbourhood_cleansed, "Listings".id, "Listings".name
FROM "Listings"
JOIN(SELECT MAX(maximum_nights) AS max_of_all, "Listings".neighbourhood_cleansed
	FROM "Listings"
	JOIN "Neighbourhoods"
	ON "Listings".neighbourhood_cleansed = "Neighbourhoods".neighbourhood
	WHERE "Neighbourhoods".neighbourhood = 'ΑΝΩ ΚΥΨΕΛΗ' OR "Neighbourhoods".neighbourhood = 'ΚΕΡΑΜΕΙΚΟΣ'
	GROUP BY "Listings".neighbourhood_cleansed) "M2"
ON "Listings".neighbourhood_cleansed = "M2".neighbourhood_cleansed
ORDER BY "M2".neighbourhood_cleansed;*/

/*The following query returns the id, name, and geolocation data of the first 100 apartments ordered by their price*/
SELECT "Listings-Summary".id, "Listings-Summary".name, "Listings-Summary".price, "Geolocation".*
FROM "Listings-Summary"
JOIN "Geolocation"
ON "Listings-Summary".neighbourhood = "Geolocation".properties_neighbourhood
ORDER BY "Listings-Summary".price
LIMIT 100;*/

/*The following query returns the id, name of the apartments that are available between the dates of 2020-04-01 and 2020-04-30*/
SELECT "Listings".id, "Listings".name, "Calendar".date
FROM "Listings"
JOIN "Calendar"
ON "Listings".id = "Calendar".listing_id
WHERE ("Calendar".date BETWEEN '2020-04-01' AND '2020-04-30') AND ("Calendar".available = true);*/

The following query returns the neighbourhoods and overviews about them
SELECT DISTINCT "Neighbourhoods".neighbourhood, "Listings".neighborhood_overview
FROM "Listings"
JOIN "Neighbourhoods"
ON "Listings".neighbourhood_cleansed = "Neighbourhoods".neighbourhood
ORDER BY "Neighbourhoods".neighbourhood;*/

/*The following query returns the average price of apartments in each neighbourhood*/
SELECT AVG(price) AS average_price, "Neighbourhoods".neighbourhood
FROM "Listings-Summary"
JOIN "Neighbourhoods"
ON "Listings-Summary".neighbourhood = "Neighbourhoods".neighbourhood
GROUP BY "Neighbourhoods".neighbourhood;*/

/*The following query returns the id, name of the apartments located in either ΑΚΡΟΠΟΛΗ or ΠΛΑΚΑ, and reviews about them as well as the name of the reviewer*/
SELECT "Listings".id, "Listings".name, "Reviews".reviewer_name, "Reviews".comments
FROM "Listings"
FULL OUTER JOIN "Reviews"
ON "Listings".id = "Reviews".listing_id
WHERE "Listings".neighbourhood_cleansed = 'ΑΚΡΟΠΟΛΗ' OR "Listings".neighbourhood_cleansed = 'ΠΛΑΚΑ';

/*The following query returns the id, name of the apartments with the minimum price in each neighbourhood*/
SELECT "Listings-Summary".id, "Listings-Summary".name, "M8".minimum_price, "M8".neighbourhood
FROM "Listings-Summary"
JOIN(SELECT MIN(price) AS minimum_price, "Neighbourhoods".neighbourhood
	FROM "Listings-Summary"
	JOIN "Neighbourhoods"
	ON "Listings-Summary".neighbourhood = "Neighbourhoods".neighbourhood
	GROUP BY "Neighbourhoods".neighbourhood) "M8"
ON "Listings-Summary".price = "M8".minimum_price;

/*The following query returns the id, name, last review and price of the apartments whose last review was published in the year 2020*/
SELECT "Listings-Summary".id, "Listings-Summary".name, "Listings-Summary".last_review, "Listings-Summary".price
FROM "Listings-Summary"
WHERE "Listings-Summary".last_review LIKE '2020%';

/*The following query returns the id, name and comments about apartments that are private rooms*/
SELECT "Listings-Summary".id, "Listings-Summary".name, "Reviews".comments
FROM "Listings-Summary" 
FULL OUTER JOIN "Reviews"
ON "Listings-Summary".id = "Reviews".listing_id
WHERE "Listings-Summary".room_type = 'Private room';

/*The following query returns the id, name and the number of reviews of the apartments in descending order*/
SELECT "Listings".id, "Listings".name, "Listings".number_of_reviews
FROM "Listings"
ORDER BY "Listings".number_of_reviews DESC;

/*The following query returns the id,name of the apartments that have the maximum availability*/
SELECT "M12".max_availability_365,"Listings-Summary".id, "Listings-Summary".name
FROM "Listings-Summary"
JOIN(SELECT MAX(availability_365) AS max_availability_365
	FROM "Listings-Summary") "M12"
ON "Listings-Summary".availability_365 = "M11".max_availability_365
ORDER BY "Listings-Summary".id;
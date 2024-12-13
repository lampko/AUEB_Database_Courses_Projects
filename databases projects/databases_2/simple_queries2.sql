/* The following query returns the id and names of the apartments located in either ΑΝΩ ΚΥΨΕΛΗ or ΚΕΡΜΑΕΙΚΟΣ with the maximum nights available. 
*/

SELECT "M2".max_of_all, "M2".neighbourhood_cleansed,"Listings".id, "Listings".name
FROM "Listings"
JOIN(SELECT max(maximum_nights) AS max_of_all, "Listings".neighbourhood_cleansed
    FROM "Listings"
    JOIN "Neighbourhoods"
    ON "Listings".neighbourhood_cleansed = "Neighbourhoods".neighbourhood
    WHERE "Neighbourhoods".neighbourhood = 'ΑΝΩ ΚΥΨΕΛΗ' OR "Neighbourhoods".neighbourhood = 'ΚΕΡΑΜΕΙΚΟΣ'
    GROUP BY "Listings".neighbourhood_cleansed) "M2"
ON "Listings".neighbourhood_cleansed = "M2".neighbourhood_cleansed
ORDER BY "M2".neighbourhood_cleansed;


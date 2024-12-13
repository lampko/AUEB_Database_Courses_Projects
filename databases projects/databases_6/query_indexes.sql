/*Query 6.1: w/out index: 1002.400 ms; w/index: 49.841 ms*/
/*CREATE INDEX idx_61
ON "Listing-copy"(host_id, id);*/

/*Query 6.2: w/out index: 1991.507 ms; w/index w/out price: 1988.770 ms; w/index w/price:  1975.893 ms*/
/*CREATE INDEX idx_62
ON "Price-copy"(id, price, guests_included)
WHERE price > 40 AND guests_included > 5;*/
/*The running time of the query depends on the accessibility of the attribute price, which is easier accessible when it is included in the index, compared to when it is not, hence the decrease in running time*/

/*Query 5.1: w/out index: 3.855 ms; w/index: 222.306 ms*/
/*CREATE INDEX idx_51
ON "Location-copy"(neighbourhood_cleansed, zipcode)
WHERE neighbourhood_cleansed = 'ΠΕΤΡΑΛΩΝΑ' OR neighbourhood_cleansed = 'ΚΕΡΑΜΕΙΚΟΣ';*/
/*The running time of the query depends on the accessibility of the attributes neighbourhood_cleansed and zipcode, which are easier accessible when they are included in the index, compared to when they are not, hence the decrease in running time*/

/*Query 5.2: w/out index: 182.664 ms; w/index: 133.089 ms*/
/*CREATE INDEX idx_52
ON "Price-copy"(id, price)
WHERE price < 50;*/
/*The running time of the query depends on the accessibility of the attributes id(listing_id) and price, which are easier accessible when they are included in the index, compared to when they are not, hence the decrease in running time*/

/*Query 5.3: w/out index 1069.235 ms; w/index: 888.149 ms*/
/*CREATE INDEX idx_53
ON "Amenity"(amenity_id, amenity_name);*/
/*The running times in the two cases are roughly the same, due to the fact that the index does not increase the accessibility of the required attributes*/

/*Query 5.4: w/out index 134.790 ms; w/index: 45.662 ms*/
/*CREATE INDEX idx_54
ON "Location-copy"(neighbourhood);*/
/*There is a slight decrease on the running time of the query, with index, meaning that the index had a small contribution to the decrease of the running time*/

/*Query 5.5: w/out index 1508.367 ms; w/index 1436.514 ms*/
/*USES THE INDEX idx_61*/
/*The running time of the query depends on the accessibility of the attributes listing_id and host_id, which is easier accessible when it is included in the index, compared to when it is not, hence the decrease in running time*/
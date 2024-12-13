create table "Location-copy" as select distinct id, street, neighbourhood, neighbourhood_cleansed, city, state, zipcode, market, smart_location, country_code, country, latitude, longitude, is_location_exact
from "Listings-copy";


alter table "Location-copy"
add foreign key (id) references "Listings-copy"(id);


alter table "Listings-copy"
drop constraint "Listings-copy_neighbourhood_cleansed_fkey";

alter table "Location-copy"
add foreign key (neighbourhood_cleansed) references "Neighbourhoods-copy"(neighbourhood);



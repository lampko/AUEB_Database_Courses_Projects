create table "Room-copy" as select distinct id, accommodates, bathrooms, bedrooms, beds, bed_type, amenities, square_feet, price, weekly_price, monthly_price, security_deposit
from "Listings-copy";




alter table "Room-copy"
add foreign key (id) references "Listings-copy"(id);
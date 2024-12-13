create table "Host-copy" as select distinct host_id, host_url, host_name, host_since, host_location, host_about, host_response_time, host_response_rate, host_acceptance_rate, host_is_superhost, host_thumbnail_url, host_picture_url, 
host_neighbourhood, host_listings_count, host_total_listings_count, host_verifications, host_has_profile_pic, 
host_identity_verified, calculated_host_listings_count
from "Listings-copy";

alter table "Host-copy"
rename column host_id to id; 

alter table "Host-copy"
rename column host_url to url; 

alter table "Host-copy"
rename column host_name to name; 

alter table "Host-copy"
rename column host_since to since; 

alter table "Host-copy"
rename column host_location to location; 

alter table "Host-copy"
rename column host_about to about; 

alter table "Host-copy"
rename column host_response_time to response_time; 

alter table "Host-copy"
rename column host_response_rate to response_rate; 

alter table "Host-copy"
rename column host_acceptance_rate to acceptance_rate; 

alter table "Host-copy"
rename column host_is_superhost to is_superhost; 

alter table "Host-copy"
rename column host_thumbnail_url to thumbnail_url; 

alter table "Host-copy"
rename column host_picture_url to picture_url; 

alter table "Host-copy"
rename column host_neighbourhood to neighbourhood; 

alter table "Host-copy"
rename column host_listings_count to listings_count; 

alter table "Host-copy"
rename column host_total_listings_count to total_listings_count; 

alter table "Host-copy"
rename column host_verifications to verifications; 

alter table "Host-copy"
rename column host_has_profile_pic to has_profile_pic; 

alter table "Host-copy"
rename column host_identity_verified to identity_verified; 

alter table "Host-copy"
rename column calculated_host_listings_count to calculated_listings_count; 









alter table "Host-copy"
add primary key (id);

alter table "Listings-copy"
add foreign key (host_id) references "Host-copy"(id);
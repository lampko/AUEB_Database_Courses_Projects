create table "Price-copy" as select distinct id, price, weekly_price, monthly_price, security_deposit, cleaning_fee, guests_included, extra_people, minimum_nights, maximum_nights, minimum_minimum_nights, 
maximum_minimum_nights, minimum_maximum_nights, maximum_maximum_nights, minimum_nights_avg_ntm, maximum_nights_avg_ntm
from "Listings";


UPDATE "Price-copy" SET price = REPLACE(price, '$','');
UPDATE "Price-copy" SET price = REPLACE(price, ',','');

UPDATE "Price-copy" SET weekly_price = REPLACE(weekly_price, '$','');
UPDATE "Price-copy" SET weekly_price = REPLACE(weekly_price, ',','');

UPDATE "Price-copy" SET monthly_price = REPLACE(monthly_price, '$','');
UPDATE "Price-copy" SET monthly_price = REPLACE(monthly_price, ',','');

UPDATE "Price-copy" SET security_deposit = REPLACE(security_deposit, '$','');
UPDATE "Price-copy" SET security_deposit = REPLACE(security_deposit, ',','');

UPDATE "Price-copy" SET cleaning_fee = REPLACE(cleaning_fee, '$','');
UPDATE "Price-copy" SET cleaning_fee = REPLACE(cleaning_fee, ',','');

UPDATE "Price-copy" SET extra_people = REPLACE(extra_people, '$','');
UPDATE "Price-copy" SET extra_people = REPLACE(extra_people, ',','');



alter table "Price-copy"
alter column price type float USING price::double precision;

alter table "Price-copy"
alter column  weekly_price type float USING weekly_price::double precision;

alter table "Price-copy"
alter column monthly_price type float USING monthly_price::double precision;

alter table "Price-copy"
alter column security_deposit type float USING security_deposit::double precision;

alter table "Price-copy"
alter column cleaning_fee type float USING cleaning_fee::double precision;

alter table "Price-copy"
alter column minimum_nights_avg_ntm type float USING minimum_nights_avg_ntm::double precision;

alter table "Price-copy"
alter column maximum_nights_avg_ntm type float USING maximum_nights_avg_ntm::double precision;

alter table "Price-copy"
alter column extra_people type float USING extra_people::double precision;







alter table "Price-copy"
add foreign key (id) references "Listings-copy"(id);
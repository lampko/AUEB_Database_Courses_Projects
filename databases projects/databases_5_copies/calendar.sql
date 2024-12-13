UPDATE "Calendar-copy" SET price = REPLACE(price, '$','');
UPDATE "Calendar-copy" SET price = REPLACE(price, ',','');

UPDATE "Calendar-copy" SET adjusted_price = REPLACE(adjusted_price, '$','');
UPDATE "Calendar-copy" SET adjusted_price = REPLACE(adjusted_price, ',','');



alter table "Calendar-copy"
alter column price type float USING price::double precision;

alter table "Calendar-copy"
alter column adjusted_price type float USING adjusted_price::double precision;

alter table "Calendar-copy"
alter column available type boolean;
UPDATE "Calendar" SET price = REPLACE(price, '$','');
UPDATE "Calendar" SET adjustable_price = REPLACE(adjusted_price, '$', '');

UPDATE "Calendar" SET price = REPLACE(price, ',','');
UPDATE "Calendar" SET adjustable_price = REPLACE(adjusted_price, ',','');

ALTER TABLE "Calendar" ALTER COLUMN price TYPE float;
ALTER TABLE "Calendar" ALTER COLUMN adjustable_price TYPE float;

ALTER TABLE "Calendar" ALTER COLUMN available TYPE boolean;
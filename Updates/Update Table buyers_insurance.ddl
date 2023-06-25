SELECT column_name, data_type, character_maximum_length
FROM information_schema.columns
WHERE table_schema = 'public' AND table_name = 'buyer_insurance';

ALTER TABLE buyer_insurance
DROP CONSTRAINT buyer_insurance_buyer_id_fkey;

ALTER TABLE buyer_insurance
ADD customer_id integer REFERENCING customer_id(id);

ALTER TABLE buyer_insurance
DROP buyer_id;

ALTER TABLE buyer_insurance
RENAME COLUMN customer_id TO buyer_id;

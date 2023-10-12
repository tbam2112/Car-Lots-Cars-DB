/*Updated Tables for Codeacademy project*/
CREATE TABLE company (
  id integer PRIMARY KEY,
  company_name varchar(30),
  country varchar(20)
  );
  
CREATE TABLE car_type (
  type_id integer PRIMARY KEY
  type varchar(25),
  seating integer
  );

CREATE TABLE car_inventory (
  vin varchar(30) PRIMARY KEY,
  company_id integer REFERENCES company(id),
  model varchar(30) NOT NULL,
  car_type integer REFERENCES car_type(type_id),
  cargo_space integer,
  msrp money NOT NULL
  );

CREATE TABLE insurance_company (
  id integer PRIMARY KEY,
  name varchar(30) NOT NULL, 
  address varchar(100) NOT NULL
  );

CREATE TABLE financing (
  payment_id integer REFERENCES payment(id) PRIMARY KEY,
  institution_id integer UNIQUE,
  institution_name varchar(50) NOT NULL,
  address varchar(100) NOT NULL
  );

CREATE TABLE payment (
  id integer PRIMARY KEY,
  type varchar(30) NOT NULL
  );
  
CREATE TABLE customer_id (
  id integer PRIMARY KEY,
  name varchar(50) NOT NULL,
  address varchar(100) NOT NULL
);

CREATE TABLE drivers_license (
    customer_id integer REFERENCES customer_id(id) PRIMARY KEY,
    dl_number varchar(50),
    dl_state varchar (2),
    current BOOL
);
  
CREATE TABLE buyer_insurance (
  buyer_id integer REFERENCES customer_id(id),
  buyer_insurance integer REFERENCES insurance_company(id),
  PRIMARY KEY(buyer_id, buyer_insurance)
  );
 
CREATE TABLE purchase_order (
   buyer_id integer REFERENCES customer_id(id) NOT NULL,
   car_vin varchar(30) REFERENCES car_inventory(vin) NOT NULL,
   order_id integer PRIMARY KEY,
   price money NOT NULL,
   payment_id integer REFERENCES payment(id) NOT NULL
   );


-- Inserting data
INSERT INTO company VALUES (1, 'Ford', 'USA');
INSERT INTO company VALUES (2, 'Chevrolet', 'USA');
INSERT INTO company VALUES (3, 'Jeep', 'USA');
INSERT INTO company VALUES (4, 'Honda', 'Japan');
INSERT INTO company VALUES (5, 'Toyota', 'Japan');
INSERT INTO company VALUES (6, 'Volkswagen', 'Germany');
INSERT INTO company VALUES (7, 'BMW', 'Germany');
INSERT INTO company VALUES (8, 'FIAT', 'Italy');

-- Inserting car types
INSERT INTO car_type VALUES (1,'Coupe', 2);
INSERT INTO car_type VALUES (2,'Truck', 4);
INSERT INTO car_type VALUES (3,'Sedan', 5);
INSERT INTO car_type VALUES (4,'SUV', 5);
INSERT INTO car_type VALUES (5,'Van', 8);

-- Car Lots Cars inventory
INSERT INTO car_inventory VALUES ('FC121212USA', 1, 'Mustang', 60000.00, 1);
INSERT INTO car_inventory VALUES ('FS989898USA', 1, 'Explorer', 75000.00, 4);
INSERT INTO car_inventory VALUES ('CC6969CMUSA', 2, 'Camaro', 80000.00, 1);
INSERT INTO car_inventory VALUES ('CT17762023USA', 2, 'Silverado', 70000.00, 2);
INSERT INTO car_inventory VALUES ('JR19422011USA', 3, 'Wrangler', 60000.00, 1);
INSERT INTO car_inventory VALUES ('HC19441207JPA', 4, 'Accord', 50000.00, 3);
INSERT INTO car_inventory VALUES ('TC010110010JP', 5, 'Corrolla', 45000.00, 3);
INSERT INTO car_inventory VALUES ('TP00000210HYB', 5, 'Prius', 32000.00, 3);
INSERT INTO car_inventory VALUES ('VW999999WW2L', 6, 'Jetta', 30000.00, 3);
INSERT INTO car_inventory VALUES ('BAVMW9999WW1L', 7, 'M4', 90000.00, 1);
INSERT INTO car_inventory VALUES ('FIXITAGAINTONY', 8, '124 Spider', 31000.00, 1);

--General information for financing and insurance
INSERT INTO payment VALUES (1, 'Cash');
INSERT INTO payment VALUES (2, 'Dealer Financing');
INSERT INTO payment VALUES (3, 'Bank Financing');
INSERT INTO payment VALUES (4, 'Credit Union');

INSERT INTO financing VALUES (1, 1, 'Cash', 'Cash');
INSERT INTO financing VALUES (2, 2, 'Car Lots Cars', '123 Speedy Ln');
INSERT INTO financing VALUES (3, 3, 'Bank of America', '1776 Revolution Drive');
INSERT INTO financing VALUES (4, 4, 'Navy Federal', '1994 Shipway');

INSERT INTO insurance_company VALUES (1, 'Geico', '4545 Insured ave');
INSERT INTO insurance_company VALUES (2, 'General', '855 General Now Blvd');
INSERT INTO insurance-company VALUES (3, 'State Farm', '965 Arrow Head Stadium');

--Customer information 
INSERT INTO customer_id VALUES (1, 'Tyler John', '1234 West St');
INSERT INTO customer_id VALUES (2, 'Drew James', '1457 South Blvd');
INSERT INTO customer_id VALUES (3, 'Anthonly Rush', '2121 Rush Ln');
INSERT INTO customer_id VALUES (4, 'Trey Hugs', '3211 Medow Way');

INSERT INTO drivers_license VALUES (1, 'KS1548-4654', 'KS', TRUE);
INSERT INTO drivers_license VALUES (2, 'AZ4535455', 'AZ', TRUE);
INSERT INTO drivers_license VALUES (3, 'KS6548785', 'KS', FALSE);
INSERT INTO drivers_license VALUES (4);

INSERT INTO buyer_insurance VALUES (1,3);
INSERT INTO buyer_insurance VALUES (2,2);
INSERT INTO buyer_insurance VALUES (3,3);
INSERT INTO buyer_insurance VALUES (4,2);

-- Our customers bought cars
INSERT INTO purchase_order VALUES (1, 'HC19441207JPA', 1, 78000.00, 1);
INSERT INTO purchase_order VALUES (2, 'CT17762023USA', 2, 72000.00, 3);
INSERT INTO purchase_order VALUES (3, 'CC6969CMUSA', 3, 99999.99, 3);
INSERT INTO purchase_order VALUES (4, 'TP00000210HYB', 4, 29000.00, 1);

-- I need to look into the relationship of payment id between financing and purchase order. I'm curious about turning the payment table into a many-many table called purchase_financing.

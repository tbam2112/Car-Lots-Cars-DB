/*Codecademy Design a Database
original tables skeleton*/
CREATE TABLE company (
  company_name varchar(30) PRIMARY KEY,
  country varchar(20)
  );
  
CREATE TABLE car_type (
  type varchar(25) PRIMARY KEY,
  seating integer
  );

CREATE TABLE car (
  vin varchar(30) PRIMARY KEY,
  make varchar(30) REFERENCES company(company_name),
  model varchar(30),
  car_type varchar(25) REFERENCES car_type(type),
  cargo_space integer,
  msrp money
  );

CREATE TABLE insurance_company (
  name varchar(30) PRIMARY KEY,
  address varchar(100)
  );

CREATE TABLE financing (
  payment_id integer REFERENCES payment(id),
  institution_id integer PRIMARY KEY,
  institution_name varchar(50),
  address varchar(100)
  );

CREATE TABLE payment (
  id integer PRIMARY KEY,
  type varchar(30)
  );
  
CREATE TABLE buyer_information (
  name varchar(50),
  address varchar(100),
  drivers_license_number varchar(100) PRIMARY KEY
);
  
CREATE TABLE buyer_insurance (
  buyer_id varchar(100) REFERENCES buyer_information(drivers_license_number),
  buyer_insurance varchar(30) REFERENCES insurance_company(name),
  PRIMARY KEY(buyer_id, buyer_insurance)
  );
 
CREATE TABLE buyers_order (
   buyer_id varchar(100) REFERENCES buyer_information(drivers_license_number),
   car_vin varchar(30) REFERENCES car(vin),
   order_id integer,
   price money,
   payment_id integer REFERENCES payment(id)
   );

ALTER TABLE car
	RENAME TO car_inventory;

ALTER TABLE buyer_information
  RENAME TO customer_id;
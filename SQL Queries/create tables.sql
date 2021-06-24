-- CREATE TABLE CONTRACTS 
-- (
--     number INT NOT NULL,
--     category VARCHAR(20) NOT NULL,
--     starting_date DATE NOT NULL,
--     end_date DATE NOT NULL,
--     price INT NOT NULL,
--     CUSTOMER_email VARCHAR(45) NOT NULL,
--     VEHICLES_plates VARCHAR(10) NOT NULL,
--     
--     primary key(number,CUSTOMER_email,VEHICLES_plates),
-- 	unique(CUSTOMER_email),
-- 	unique(VEHICLES_plates),
-- 	unique(number)
-- );

-- CREATE TABLE CUSTOMER
-- (
--     firstname VARCHAR(30) NOT NULL,
--     lastname VARCHAR(30) NOT NULL,
--     gender VARCHAR(6) NOT NULL,
--     date_of_birth DATE NOT NULL,
--     license_number BIGINT NOT NULL,
--     email VARCHAR(45) NOT NULL,
--     CONTRACTS_number INT NOT NULL,
--     primary key(license_number,email,CONTRACTS_number),
-- 	unique(license_number),
-- 	unique(email),
-- 	unique(CONTRACTS_number)
-- );

-- CREATE TABLE VEHICLES
-- (
--     plates VARCHAR(10) NOT NULL,
--     registry_number INT NOT NULL,
--     color VARCHAR(10) NOT NULL,
--     year SMALLINT NOT NULL,
--     current_price INT NOT NULL,
--     contract_number INT NOT NULL,
--     caregory VARCHAR(20) NOT NULL,
--     CUSTOMER_email VARCHAR(45) NOT NULL,
--     MODEL_model VARCHAR(20) NOT NULL,
--     PRIMARY KEY (plates,registry_number,contract_number,CUSTOMER_email),
--     unique(plates),
--     unique(contract_number),
--     unique(registry_number),
-- 	unique(CUSTOMER_email)
-- );

-- CREATE TABLE DRIVER
-- (
--     firstname VARCHAR(30) NOT NULL,
--     lastname VARCHAR(30) NOT NULL,
--     gender VARCHAR(6) NOT NULL,
--     date_of_birth DATE NOT NULL,
--     license_number BIGINT NOT NULL,
--     primary key(license_number)
-- );

-- CREATE TABLE DRIVER_VEHICLE
-- (
--     DRIVER_license_number BIGINT NOT NULL,
--     VEHICLES_plates VARCHAR(10) NOT NULL,
--     primary key(DRIVER_license_number,VEHICLES_plates)
-- );

-- CREATE TABLE DRIVER_CONTRACT
-- (
--     DRIVER_license_number BIGINT NOT NULL,
--     CONTRACTS_number INT NOT NULL,
--     primary key(DRIVER_license_number,CONTRACTS_number)
-- );

-- CREATE TABLE ACCIDENT
-- (
--     id INT NOT NULL,
--     date DATE NOT NULL,
--     time TIME NOT NULL,
--     description VARCHAR(50) NOT NULL,
--     primary key(id)
-- );

-- CREATE TABLE DRIVER_AND_VEHICLE_IN_ACCIDENT
-- (
--     ACCIDENT_id INT NOT NULL,
--     VEHICLES_plates VARCHAR(10) NOT NULL,
--     DRIVER_license_number BIGINT NOT NULL,
--     primary key(ACCIDENT_id,VEHICLES_plates,DRIVER_license_number),
--     unique(ACCIDENT_id,VEHICLES_plates),
--     unique(ACCIDENT_id,DRIVER_license_number)
-- );

-- CREATE TABLE ADDRESS
-- (
--     zip_code INT NOT NULL,
--     city VARCHAR(30) NOT NULL,
--     country VARCHAR(30) NOT NULL,
--     street VARCHAR(45) NOT NULL,
--     number INT NOT NULL,
--     license BIGINT NOT NULL,
--     type VARCHAR(8) NOT NULL,
--     primary key(license)
-- );

-- CREATE TABLE PHONE_NUMBERS
-- (
--     number BIGINT NOT NULL,
--     CUSTOMER_email VARCHAR(45) NOT NULL,
--     primary key(number,CUSTOMER_email)    
-- );

-- CREATE TABLE MODEL
-- (
--     model VARCHAR(20) NOT NULL,
--     type VARCHAR(15) NOT NULL,
--     manufacturer VARCHAR(20) NOT NULL,
--     primary key(model)
-- );

DROP TABLE address, accident, contracts, customer, driver, driver_and_vehicle_in_accident, driver_contract, driver_vehicle, phone_numbers, vehicles, model;

CREATE TABLE CONTRACTS 
(
    number BIGINT NOT NULL,
    category VARCHAR(20) NOT NULL,
    starting_date DATE NOT NULL,
    end_date DATE NOT NULL,
    price INT NOT NULL,
    CUSTOMER_email VARCHAR(45) NOT NULL,
    VEHICLES_plates VARCHAR(10) NOT NULL,
    
    primary key(number,CUSTOMER_email,VEHICLES_plates),
	unique(CUSTOMER_email),
	unique(VEHICLES_plates),
	unique(number)
);

CREATE TABLE CUSTOMER
(
    firstname VARCHAR(30) NOT NULL,
    lastname VARCHAR(30) NOT NULL,
    gender VARCHAR(6) NOT NULL,
    date_of_birth DATE NOT NULL,
    license_number BIGINT NOT NULL,
    email VARCHAR(45) NOT NULL,
    CONTRACTS_number INT NOT NULL,
    primary key(license_number,email,CONTRACTS_number),
	unique(license_number),
	unique(email),
	unique(CONTRACTS_number)
);

CREATE TABLE VEHICLES
(
    plates VARCHAR(10) NOT NULL,
    registry_number INT NOT NULL,
    color VARCHAR(10) NOT NULL,
    year INT NOT NULL,
    current_price INT NOT NULL,
    contract_number INT NOT NULL,
    caregory VARCHAR(20) NOT NULL,
    CUSTOMER_email VARCHAR(45) NOT NULL,
    MODEL_model VARCHAR(20) NOT NULL,
    PRIMARY KEY (plates,registry_number,contract_number,CUSTOMER_email),
    unique(plates),
    unique(contract_number),
    unique(registry_number),
	unique(CUSTOMER_email)
);

CREATE TABLE DRIVER
(
    firstname VARCHAR(30) NOT NULL,
    lastname VARCHAR(30) NOT NULL,
    gender VARCHAR(6) NOT NULL,
    date_of_birth DATE NOT NULL,
    license_number BIGINT NOT NULL,
    primary key(license_number)
);

CREATE TABLE DRIVER_VEHICLE
(
    DRIVER_license_number BIGINT NOT NULL,
    VEHICLES_plates VARCHAR(10) NOT NULL,
    primary key(DRIVER_license_number,VEHICLES_plates)
);

CREATE TABLE DRIVER_CONTRACT
(
    DRIVER_license_number BIGINT NOT NULL,
    CONTRACTS_number INT NOT NULL,
    primary key(DRIVER_license_number,CONTRACTS_number)
);

CREATE TABLE ACCIDENT
(
    id INT NOT NULL,
    date DATE NOT NULL,
    time TIME NOT NULL,
    description VARCHAR(50) NOT NULL,
    primary key(id)
);

CREATE TABLE DRIVER_AND_VEHICLE_IN_ACCIDENT
(
    ACCIDENT_id INT NOT NULL,
    VEHICLES_plates VARCHAR(10) NOT NULL,
    DRIVER_license_number BIGINT NOT NULL,
    primary key(ACCIDENT_id,VEHICLES_plates,DRIVER_license_number),
    unique(ACCIDENT_id,VEHICLES_plates),
    unique(ACCIDENT_id,DRIVER_license_number)
);

CREATE TABLE ADDRESS
(
    zip_code INT NOT NULL,
    city VARCHAR(30) NOT NULL,
    country VARCHAR(30) NOT NULL,
    street VARCHAR(45) NOT NULL,
    number INT NOT NULL,
    license BIGINT NOT NULL,
    type VARCHAR(8) NOT NULL,
    primary key(license)
);

CREATE TABLE PHONE_NUMBERS
(
    number BIGINT NOT NULL,
    CUSTOMER_email VARCHAR(45) NOT NULL,
    primary key(number,CUSTOMER_email)    
);

CREATE TABLE MODEL
(
    model VARCHAR(20) NOT NULL,
    type VARCHAR(15) NOT NULL,
    manufacturer VARCHAR(20) NOT NULL,
    primary key(model)
);

ALTER TABLE CONTRACTS ADD
foreign key(CUSTOMER_email)
references CUSTOMER(email);

ALTER TABLE CONTRACTS ADD
foreign key(VEHICLES_plates)
references VEHICLES(plates);

ALTER TABLE CUSTOMER ADD
foreign key(license_number)
references DRIVER(license_number);

ALTER TABLE CUSTOMER ADD
foreign key(CONTRACTS_number)
references CONTRACTS(number);

ALTER TABLE VEHICLES ADD
foreign key(contract_number)
references CONTRACTS(number);

ALTER TABLE VEHICLES ADD
foreign key(CUSTOMER_email)
references CUSTOMER(email);

ALTER TABLE DRIVER ADD
foreign key(license_number)
references ADDRESS(license);

ALTER TABLE DRIVER_VEHICLE ADD
foreign key(DRIVER_license_number)
references DRIVER(license_number);

ALTER TABLE DRIVER_VEHICLE ADD
foreign key(VEHICLES_plates)
references VEHICLES(plates);

ALTER TABLE DRIVER_CONTRACT ADD
foreign key(DRIVER_license_number)
references DRIVER(license_number);

ALTER TABLE DRIVER_CONTRACT ADD
foreign key(CONTRACTS_number)
references CONTRACTS(number);

ALTER TABLE PHONE_NUMBERS ADD
foreign key(CUSTOMER_email)
references CUSTOMER(email);

ALTER TABLE DRIVER_AND_VEHICLE_IN_ACCIDENT ADD
foreign key(ACCIDENT_id)
references ACCIDENT(id);

ALTER TABLE DRIVER_AND_VEHICLE_IN_ACCIDENT ADD
foreign key(VEHICLES_plates)
references VEHICLES(plates);

ALTER TABLE DRIVER_AND_VEHICLE_IN_ACCIDENT ADD
foreign key(DRIVER_license_number)
references DRIVER(license_number);
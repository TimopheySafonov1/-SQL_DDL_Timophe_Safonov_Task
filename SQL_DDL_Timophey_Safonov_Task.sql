CREATE DATABASE CLIMBING_CLUB;


DROP TABLE IF EXISTS CLIMBER CASCADE;
DROP TABLE IF EXISTS MOUNTAIN CASCADE;
DROP TABLE IF EXISTS EQUIPMENT CASCADE;
DROP TABLE IF EXISTS ROUTE CASCADE;
DROP TABLE IF EXISTS CLIMBER_EQUIPMENT CASCADE;
DROP TABLE IF EXISTS GUID CASCADE;
DROP TABLE IF EXISTS PRICE CASCADE;
DROP TABLE IF EXISTS CLIMBER_MOUNTAIN CASCADE;
DROP TABLE IF EXISTS CLIMB CASCADE;
DROP TABLE IF EXISTS WEATHER CASCADE;
DROP TABLE IF EXISTS FEEDBACK CASCADE;

 CREATE TABLE CLIMBER (
  CLIMBER_ID serial primary key,
  FIRST_NAME varchar NOT NULL,
  LAST_NAME varchar NOT NULL,
  EMAIL_ADDRESS varchar NOT NULL,
  PHONE_NUMBER varchar NOT NULL UNIQUE
 );




  CREATE TABLE MOUNTAIN (
    MOUNTAIN_ID serial primary key,
    NAME varchar NOT NULL,
    HEIGHT int NOT NULL,
    UNIT_HEIGHT varchar NOT NULL,
    COUNTRY varchar NOT NULL,
    AREA varchar NOT NULL,
    LATITUDE DECIMAL(9,6) NOT NULL,
    LONGITUDE DECIMAL(9,6) NOT NULL,
    CONSTRAINT chk_height CHECK (HEIGHT >= 0)
 );




    CREATE TABLE EQUIPMENT (
        EQUIPMENT_ID serial primary key,
        NAME varchar NOT NULL,
        STATE integer NOT NULL CHECK (STATE IN (1,2,3)),
        QUANTITY int NOT NULL
    );
	
	 CREATE TABLE ROUTE (
    ROUTE_ID serial primary key,
    NAME varchar NOT NULL,
    LEVEL int NOT NULL CHECK (LEVEL >= 1 AND LEVEL <= 10),
    DURATION DECIMAL(5,2) NOT NULL,
    UNIT_DURATION varchar NOT NULL,
    CONSTRAINT chk_duration CHECK (DURATION >= 0)
 );


   CREATE TABLE CLIMBER_EQUIPMENT  (
    CLIMBER_EQUIPMENT_ID serial primary key,
    CLIMBER_ID int,
    EQUIPMENT_ID int,
    CONSTRAINT fk_climber_id FOREIGN KEY (CLIMBER_ID)
            REFERENCES CLIMBER (CLIMBER_ID)
            ON DELETE CASCADE,
    CONSTRAINT fk_equipment_id FOREIGN KEY (EQUIPMENT_ID)
            REFERENCES EQUIPMENT (EQUIPMENT_ID)
            ON DELETE CASCADE
    );

  CREATE TABLE GUID (
    GUID_ID serial primary key,
    FIRST_NAME varchar NOT NULL,
    LAST_NAME varchar NOT NULL,
    PHONE_NUMBER varchar NOT NULL UNIQUE,
    EXPERIENCE integer NOT NULL,
    UNIT_EXPERIENCE varchar NOT NULL,
    CONSTRAINT chk_experience CHECK (EXPERIENCE >= 0)
 );



 CREATE TABLE PRICE (
    PRICE_ID serial primary key,
    PRICE money NOT NULL,
    CURRENCY varchar NOT NULL,
    SALE_PERACANTGE int NOT NULL,
    CONSTRAINT chk_sale_percantage CHECK (SALE_PERACANTGE >= 0)
 );


 
  CREATE TABLE CLIMBER_MOUNTAIN (
  CLIMBER_MOUNTAIN_ID serial primary key,
  CLIMBER_ID  int,
  MOUNTAIN_ID int,
  CONSTRAINT fk_climber_id FOREIGN KEY (CLIMBER_ID)
        REFERENCES CLIMBER (CLIMBER_ID)
        ON DELETE CASCADE,
  CONSTRAINT fk_mountain_id FOREIGN KEY (MOUNTAIN_ID)
        REFERENCES MOUNTAIN (MOUNTAIN_ID)
        ON DELETE CASCADE
 );
 
   CREATE TABLE CLIMB (
  CLIMB_ID serial primary key,
  CLIMBER_MOUNTAIN_ID int,
  ROUTE_ID int,
  GUID_ID int,
  PRICE_ID int,
  START_DATE date NOT NULL DEFAULT CURRENT_DATE,
  END_DATE date NOT NULL DEFAULT CURRENT_DATE,
  CONSTRAINT fk_climber_mountain_id FOREIGN KEY (CLIMBER_MOUNTAIN_ID)
        REFERENCES CLIMBER_MOUNTAIN (CLIMBER_MOUNTAIN_ID)
        ON DELETE CASCADE,
  CONSTRAINT fk_route_id FOREIGN KEY (ROUTE_ID)
        REFERENCES ROUTE (ROUTE_ID)
        ON DELETE CASCADE,
  CONSTRAINT fk_guid_id FOREIGN KEY (GUID_ID)
        REFERENCES GUID (GUID_ID)
        ON DELETE CASCADE,
  CONSTRAINT fk_price_id FOREIGN KEY (PRICE_ID)
        REFERENCES PRICE (PRICE_ID)
        ON DELETE CASCADE,
  CONSTRAINT chk_start_date CHECK (START_DATE > '2000-01-01')
 );
 
  CREATE TABLE WEATHER (
    WEATHER_ID serial primary key,
    CLIMB_ID int,
    TEMPERATURE int NOT NULL,
    UNIT_TEMPERATURE varchar NOT NULL,
    PRESSURE int NOT NULL,
    UNIT_PRESSURE varchar NOT NULL,
    PROBABILITY_OF_RAIN integer NOT NULL,
    WIND_SPEED integer NOT NULL,
    UNIT_WIND_SPEED varchar NOT NULL,
    CONSTRAINT fk_climb_id FOREIGN KEY (CLIMB_ID)
        REFERENCES CLIMB (CLIMB_ID)
        ON DELETE CASCADE,
    CONSTRAINT chk_probability_of_rain CHECK (PROBABILITY_OF_RAIN >= 0),
    CONSTRAINT chk_wind_speed CHECK (WIND_SPEED >= 0)
 );

 CREATE TABLE FEEDBACK (
    FEEDBACK_ID serial primary key,
    CLIMB_ID int NOT NULL,
    TITLE varchar NOT NULL,
    BODY TEXT NOT NULL,
    CONSTRAINT fk_climb_id FOREIGN KEY (CLIMB_ID)
        REFERENCES CLIMB (CLIMB_ID)
        ON DELETE CASCADE
 );

 DROP TABLE IF EXISTS CLIMBER CASCADE;
DROP TABLE IF EXISTS MOUNTAIN CASCADE;
DROP TABLE IF EXISTS EQUIPMENT CASCADE;
DROP TABLE IF EXISTS ROUTE CASCADE;
DROP TABLE IF EXISTS CLIMBER_EQUIPMENT CASCADE;
DROP TABLE IF EXISTS GUID CASCADE;
DROP TABLE IF EXISTS PRICE CASCADE;
DROP TABLE IF EXISTS CLIMBER_MOUNTAIN CASCADE;
DROP TABLE IF EXISTS CLIMB CASCADE;
DROP TABLE IF EXISTS WEATHER CASCADE;
DROP TABLE IF EXISTS FEEDBACK CASCADE;



 CREATE TABLE CLIMBER (
  CLIMBER_ID serial primary key,
  FIRST_NAME varchar NOT NULL,
  LAST_NAME varchar NOT NULL,
  EMAIL_ADDRESS varchar NOT NULL,
  PHONE_NUMBER varchar NOT NULL UNIQUE
 );




  CREATE TABLE MOUNTAIN (
    MOUNTAIN_ID serial primary key,
    NAME varchar NOT NULL,
    HEIGHT int NOT NULL,
    UNIT_HEIGHT varchar NOT NULL,
    COUNTRY varchar NOT NULL,
    AREA varchar NOT NULL,
    LATITUDE DECIMAL(9,6) NOT NULL,
    LONGITUDE DECIMAL(9,6) NOT NULL,
    CONSTRAINT chk_height CHECK (HEIGHT >= 0)
 );




    CREATE TABLE EQUIPMENT (
        EQUIPMENT_ID serial primary key,
        NAME varchar NOT NULL,
        STATE integer NOT NULL CHECK (STATE IN (1,2,3)),
        QUANTITY int NOT NULL
    );
	
	 CREATE TABLE ROUTE (
    ROUTE_ID serial primary key,
    NAME varchar NOT NULL,
    LEVEL int NOT NULL CHECK (LEVEL >= 1 AND LEVEL <= 10),
    DURATION DECIMAL(5,2) NOT NULL,
    UNIT_DURATION varchar NOT NULL,
    CONSTRAINT chk_duration CHECK (DURATION >= 0)
 );


   CREATE TABLE CLIMBER_EQUIPMENT  (
    CLIMBER_EQUIPMENT_ID serial primary key,
    CLIMBER_ID int,
    EQUIPMENT_ID int,
    CONSTRAINT fk_climber_id FOREIGN KEY (CLIMBER_ID)
            REFERENCES CLIMBER (CLIMBER_ID)
            ON DELETE CASCADE,
    CONSTRAINT fk_equipment_id FOREIGN KEY (EQUIPMENT_ID)
            REFERENCES EQUIPMENT (EQUIPMENT_ID)
            ON DELETE CASCADE
    );

  CREATE TABLE GUID (
    GUID_ID serial primary key,
    FIRST_NAME varchar NOT NULL,
    LAST_NAME varchar NOT NULL,
    PHONE_NUMBER varchar NOT NULL UNIQUE,
    EXPERIENCE integer NOT NULL,
    UNIT_EXPERIENCE varchar NOT NULL,
    CONSTRAINT chk_experience CHECK (EXPERIENCE >= 0)
 );



 CREATE TABLE PRICE (
    PRICE_ID serial primary key,
    PRICE money NOT NULL,
    CURRENCY varchar NOT NULL,
    SALE_PERACANTGE int NOT NULL,
    CONSTRAINT chk_sale_percantage CHECK (SALE_PERACANTGE >= 0)
 );


 
  CREATE TABLE CLIMBER_MOUNTAIN (
  CLIMBER_MOUNTAIN_ID serial primary key,
  CLIMBER_ID  int,
  MOUNTAIN_ID int,
  CONSTRAINT fk_climber_id FOREIGN KEY (CLIMBER_ID)
        REFERENCES CLIMBER (CLIMBER_ID)
        ON DELETE CASCADE,
  CONSTRAINT fk_mountain_id FOREIGN KEY (MOUNTAIN_ID)
        REFERENCES MOUNTAIN (MOUNTAIN_ID)
        ON DELETE CASCADE
 );
 
   CREATE TABLE CLIMB (
  CLIMB_ID serial primary key,
  CLIMBER_MOUNTAIN_ID int,
  ROUTE_ID int,
  GUID_ID int,
  PRICE_ID int,
  START_DATE date NOT NULL DEFAULT CURRENT_DATE,
  END_DATE date NOT NULL DEFAULT CURRENT_DATE,
  CONSTRAINT fk_climber_mountain_id FOREIGN KEY (CLIMBER_MOUNTAIN_ID)
        REFERENCES CLIMBER_MOUNTAIN (CLIMBER_MOUNTAIN_ID)
        ON DELETE CASCADE,
  CONSTRAINT fk_route_id FOREIGN KEY (ROUTE_ID)
        REFERENCES ROUTE (ROUTE_ID)
        ON DELETE CASCADE,
  CONSTRAINT fk_guid_id FOREIGN KEY (GUID_ID)
        REFERENCES GUID (GUID_ID)
        ON DELETE CASCADE,
  CONSTRAINT fk_price_id FOREIGN KEY (PRICE_ID)
        REFERENCES PRICE (PRICE_ID)
        ON DELETE CASCADE,
  CONSTRAINT chk_start_date CHECK (START_DATE > '2000-01-01')
 );
 
  CREATE TABLE WEATHER (
    WEATHER_ID serial primary key,
    CLIMB_ID int,
    TEMPERATURE int NOT NULL,
    UNIT_TEMPERATURE varchar NOT NULL,
    PRESSURE int NOT NULL,
    UNIT_PRESSURE varchar NOT NULL,
    PROBABILITY_OF_RAIN integer NOT NULL,
    WIND_SPEED integer NOT NULL,
    UNIT_WIND_SPEED varchar NOT NULL,
    CONSTRAINT fk_climb_id FOREIGN KEY (CLIMB_ID)
        REFERENCES CLIMB (CLIMB_ID)
        ON DELETE CASCADE,
    CONSTRAINT chk_probability_of_rain CHECK (PROBABILITY_OF_RAIN >= 0),
    CONSTRAINT chk_wind_speed CHECK (WIND_SPEED >= 0)
 );

 CREATE TABLE FEEDBACK (
    FEEDBACK_ID serial primary key,
    CLIMB_ID int NOT NULL,
    TITLE varchar NOT NULL,
    BODY TEXT NOT NULL,
    CONSTRAINT fk_climb_id FOREIGN KEY (CLIMB_ID)
        REFERENCES CLIMB (CLIMB_ID)
        ON DELETE CASCADE
 );
 
 
 
 INSERT INTO CLIMBER (FIRST_NAME, LAST_NAME, EMAIL_ADDRESS, PHONE_NUMBER) 
VALUES 
    ('John', 'Doe', 'john@example.com', '1234567890'),
    ('Jane', 'Smith', 'jane@example.com', '0987654321');
--
INSERT INTO MOUNTAIN (NAME, HEIGHT, UNIT_HEIGHT, COUNTRY, AREA, LATITUDE, LONGITUDE) 
VALUES 
    ('Mount Everest', 8848, 'meters', 'Nepal', 'Himalayas', 27.9881, 86.9250),
    ('K2', 8611, 'meters', 'Pakistan', 'Karakoram', 35.8815, 76.5137);

INSERT INTO EQUIPMENT (NAME, STATE, QUANTITY)
VALUES 
    ('Rope', 2, 10),
    ('Harness', 1, 5);

INSERT INTO GUID (FIRST_NAME, LAST_NAME, PHONE_NUMBER, EXPERIENCE, UNIT_EXPERIENCE)
VALUES 
    ('Michael', 'Johnson', '555-1234', 5, 'years'),
    ('Sarah', 'Williams', '555-5678', 8, 'years');

INSERT INTO ROUTE (NAME, LEVEL, DURATION, UNIT_DURATION)
VALUES 
    ('Standard Route', 5, 2.5, 'hours'),
    ('Advanced Route', 8, 4.0, 'hours');

INSERT INTO PRICE (PRICE, CURRENCY, SALE_PERACANTGE)
VALUES 
    (100.00, 'USD', 10),
    (200.00, 'USD', 15);

INSERT INTO CLIMBER_MOUNTAIN (CLIMBER_ID, MOUNTAIN_ID)
VALUES 
    (1, 1),
    (2, 2);
INSERT INTO CLIMBER_EQUIPMENT (CLIMBER_ID, EQUIPMENT_ID)
VALUES 
    (1, 1),
    (2, 2);

-- Assuming CLIMBER_MOUNTAIN_ID, ROUTE_ID, GUID_ID, and PRICE_ID are valid foreign keys
INSERT INTO CLIMB (CLIMBER_MOUNTAIN_ID, ROUTE_ID, GUID_ID, PRICE_ID, START_DATE, END_DATE)
VALUES 
    (1, 1, 1, 1, '2024-05-06', '2024-05-07'),
    (2, 2, 2, 2, '2024-05-08', '2024-05-09');

-- Assuming CLIMBER_ID and MOUNTAIN_ID are valid foreign keys


-- Assuming CLIMB_ID is a valid foreign key
INSERT INTO WEATHER (CLIMB_ID, TEMPERATURE, UNIT_TEMPERATURE, PRESSURE, UNIT_PRESSURE, PROBABILITY_OF_RAIN, WIND_SPEED, UNIT_WIND_SPEED)
VALUES 
    (1, 10, 'C', 1013, 'hPa', 20, 15, 'km/h'),
    (2, 5, 'C', 1005, 'hPa', 30, 20, 'km/h');

-- Assuming CLIMB_ID is a valid foreign key
INSERT INTO FEEDBACK (CLIMB_ID, TITLE, BODY)
VALUES 
    (1, 'Great experience', 'The climb was amazing!'),
    (2, 'Challenging but rewarding', 'The advanced route pushed our limits but was worth it!');


ALTER TABLE CLIMBER
ADD COLUMN record_ts DATE DEFAULT CURRENT_DATE;


UPDATE CLIMBER
SET record_ts = CURRENT_DATE
WHERE record_ts IS NULL;


ALTER TABLE CLIMB
ADD COLUMN record_ts DATE DEFAULT CURRENT_DATE;


UPDATE CLIMB
SET record_ts = CURRENT_DATE
WHERE record_ts IS NULL;


ALTER TABLE CLIMBER_MOUNTAIN
ADD COLUMN record_ts DATE DEFAULT CURRENT_DATE;


UPDATE CLIMBER_MOUNTAIN
SET record_ts = CURRENT_DATE
WHERE record_ts IS NULL;


ALTER TABLE MOUNTAIN
ADD COLUMN record_ts DATE DEFAULT CURRENT_DATE;


UPDATE MOUNTAIN
SET record_ts = CURRENT_DATE
WHERE record_ts IS NULL;

-
ALTER TABLE WEATHER
ADD COLUMN record_ts DATE DEFAULT CURRENT_DATE;


UPDATE WEATHER
SET record_ts = CURRENT_DATE
WHERE record_ts IS NULL;

ALTER TABLE EQUIPMENT
ADD COLUMN record_ts DATE DEFAULT CURRENT_DATE;


UPDATE EQUIPMENT
SET record_ts = CURRENT_DATE
WHERE record_ts IS NULL;


ALTER TABLE CLIMBER_EQUIPMENT
ADD COLUMN record_ts DATE DEFAULT CURRENT_DATE;


UPDATE CLIMBER_EQUIPMENT
SET record_ts = CURRENT_DATE
WHERE record_ts IS NULL;


ALTER TABLE GUID
ADD COLUMN record_ts DATE DEFAULT CURRENT_DATE;


UPDATE GUID
SET record_ts = CURRENT_DATE
WHERE record_ts IS NULL;


ALTER TABLE ROUTE
ADD COLUMN record_ts DATE DEFAULT CURRENT_DATE;


UPDATE ROUTE
SET record_ts = CURRENT_DATE
WHERE record_ts IS NULL;


ALTER TABLE PRICE
ADD COLUMN record_ts DATE DEFAULT CURRENT_DATE;

UPDATE PRICE
SET record_ts = CURRENT_DATE
WHERE record_ts IS NULL;

ALTER TABLE FEEDBACK
ADD COLUMN record_ts DATE DEFAULT CURRENT_DATE;


UPDATE FEEDBACK
SET record_ts = CURRENT_DATE
WHERE record_ts IS NULL;




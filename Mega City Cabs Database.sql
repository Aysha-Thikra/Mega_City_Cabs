CREATE DATABASE MegaCityCabs_db;

use MegaCityCabs_db;
DROP database MegaCityCabs_db;

CREATE TABLE users (
    userID VARCHAR(08) PRIMARY KEY,
    firstName VARCHAR(100),
    lastName VARCHAR(100),
    address TEXT,
    NIC VARCHAR(12),
    phoneNumber VARCHAR(10),
    email VARCHAR(100),
    licenseNumber VARCHAR(100),
    username VARCHAR(100),
    password VARCHAR(255),
    userLevel int(1)
);


CREATE TABLE car (
    carID VARCHAR(10) PRIMARY KEY,
    license_plate VARCHAR(20) NOT NULL,
    car_name VARCHAR(100) NOT NULL,
    description TEXT,
    passengers VARCHAR(50),
    type VARCHAR(50),
    luggages VARCHAR(50),
    price_per_minute DECIMAL(10, 2)
);


CREATE TABLE booking (
    booking_id VARCHAR(10) PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    userID VARCHAR(08),
    email VARCHAR(100),
    phone VARCHAR(15),
    pickup_location VARCHAR(255),
    drop_location VARCHAR(255),
    pickup_time VARCHAR(50),
    route VARCHAR(10),
    carID VARCHAR(10),
    car_name VARCHAR(100),
    estimated_time time,
    price_per_minute DECIMAL(10, 2),
    card_number VARCHAR(19),
    fare double,
    driver_name VARCHAR(50),
    status VARCHAR(20)
);

CREATE TABLE feedback (
    feedbackID VARCHAR(08) PRIMARY KEY,
    userID VARCHAR(08),
    feedback TEXT,
    username VARCHAR(100)
);

CREATE TABLE contact (
    contactID VARCHAR(50) PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255),
    subject VARCHAR(255),
    message TEXT
);




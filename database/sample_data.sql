CREATE DATABASE automobile_db;
USE automobile_db;
CREATE TABLE manufacturer (
    manufacturer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    country VARCHAR(50) NOT NULL
);
INSERT INTO manufacturer (name, country) VALUES
('Audi', 'Germany'),
('Mazda', 'Japan'),
('Mercedes-Benz', 'Germany'),
('Alfa-Romeo', 'Italy'),
('Toyota', 'Japan');
CREATE TABLE engine (
    engine_id INT PRIMARY KEY AUTO_INCREMENT,
    engine_type VARCHAR(20),
    num_of_cylinders VARCHAR(10),
    engine_size INT,
    horsepower INT
);
INSERT INTO engine (engine_type, num_of_cylinders, engine_size, horsepower) VALUES
('DOHC', '4', 2000, 150),
('SOHC', '4', 1800, 140),
('V6', '6', 3000, 250),
('V8', '8', 5000, 400);
CREATE TABLE fuel (
    fuel_id INT PRIMARY KEY AUTO_INCREMENT,
    fuel_type VARCHAR(20),
    fuel_system VARCHAR(20)
);
INSERT INTO fuel (fuel_type, fuel_system) VALUES
('Petrol', 'MPFI'),
('Diesel', 'CRDI'),
('Hybrid', 'Electric+Petrol');
CREATE TABLE automobile (
    automobile_id INT PRIMARY KEY AUTO_INCREMENT,
    make VARCHAR(50),
    price INT,
    city_mpg INT,
    highway_mpg INT,

    manufacturer_id INT,
    engine_id INT,
    fuel_id INT,

    FOREIGN KEY (manufacturer_id) REFERENCES manufacturer(manufacturer_id),
    FOREIGN KEY (engine_id) REFERENCES engine(engine_id),
    FOREIGN KEY (fuel_id) REFERENCES fuel(fuel_id)
);
INSERT INTO automobile 
(make, price, city_mpg, highway_mpg, manufacturer_id, engine_id, fuel_id)
VALUES
('Audi A4', 35000, 24, 32, 1, 1, 1),
('Mazda 3', 22000, 30, 38, 2, 2, 1),
('Mercedes C-Class', 42000, 22, 30, 3, 3, 1),
('Alfa Romeo Giulia', 40000, 23, 31, 4, 3, 1),
('Toyota Corolla', 21000, 32, 41, 5, 2, 3);
CREATE VIEW fuel_efficient_cars AS
SELECT 
    a.make,
    m.name AS manufacturer,
    a.city_mpg,
    a.highway_mpg,
    a.price
FROM automobile a
JOIN manufacturer m ON a.manufacturer_id = m.manufacturer_id
WHERE a.city_mpg >= 25;
SELECT * FROM fuel_efficient_cars;
CREATE INDEX idx_make ON automobile(make);
SHOW INDEX FROM automobile;
SELECT 
    a.make,
    m.name AS manufacturer,
    e.engine_type,
    f.fuel_type,
    a.price
FROM automobile a
JOIN manufacturer m ON a.manufacturer_id = m.manufacturer_id
JOIN engine e ON a.engine_id = e.engine_id
JOIN fuel f ON a.fuel_id = f.fuel_id;
SELECT COUNT(*) AS total_cars FROM automobile;
UPDATE automobile
SET price = price + 1000
WHERE make = 'audi';

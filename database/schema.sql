SELECT COUNT(*) FROM automobile;
SELECT * FROM automobile LIMIT 10;
SELECT make, ROUND(AVG(price), 2) AS avg_price
FROM automobile
GROUP BY make
ORDER BY avg_price DESC;
SELECT make, body_style, city_mpg, highway_mpg
FROM automobile
WHERE city_mpg >= 30
ORDER BY city_mpg DESC;
SELECT make, horsepower
FROM automobile
ORDER BY horsepower DESC
LIMIT 5;
CREATE VIEW fuel_efficient_cars AS
SELECT make, body_style, city_mpg, highway_mpg
FROM automobile
WHERE city_mpg >= 25;
ALTER TABLE automobile
ADD car_age INT;
CREATE INDEX idx_make ON automobile(make);
ALTER TABLE automobile
ADD automobile_id INT PRIMARY KEY AUTO_INCREMENT;
CREATE TABLE manufacturer (
    manufacturer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    country VARCHAR(50)
);
CREATE TABLE engine (
    engine_id INT PRIMARY KEY AUTO_INCREMENT,
    engine_type VARCHAR(20),
    num_of_cylinders VARCHAR(10),
    engine_size INT,
    horsepower INT
);
CREATE TABLE fuel (
    fuel_id INT PRIMARY KEY AUTO_INCREMENT,
    fuel_type VARCHAR(20),
    fuel_system VARCHAR(20)
);
ALTER TABLE automobile
ADD manufacturer_id INT,
ADD engine_id INT,
ADD fuel_id INT;
ALTER TABLE automobile
ADD CONSTRAINT fk_manufacturer
FOREIGN KEY (manufacturer_id)
REFERENCES manufacturer(manufacturer_id);

ALTER TABLE automobile
ADD manufacturer_id INT,
ADD CONSTRAINT fk_manufacturer
FOREIGN KEY (manufacturer_id)
REFERENCES manufacturer(manufacturer_id);


ALTER TABLE automobile
ADD CONSTRAINT fk_fuel
FOREIGN KEY (fuel_id)
REFERENCES fuel(fuel_id);

SELECT a.make, m.name AS manufacturer, e.engine_type, f.fuel_type
FROM automobile a
JOIN manufacturer m ON a.manufacturer_id = m.manufacturer_id
JOIN engine e ON a.engine_id = e.engine_id
JOIN fuel f ON a.fuel_id = f.fuel_id
LIMIT 10;

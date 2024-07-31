CREATE DATABASE LAB4;
USE LAB4;


CREATE TABLE client_master
(
    _client_no VARCHAR(20) PRIMARY KEY,
    _name VARCHAR(30),
    _address1 VARCHAR(30),
    _address2 VARCHAR(30),
    _city VARCHAR(15),
    _state VARCHAR(15),
    _pincode INT,
    _bal_due FLOAT
);


CREATE TABLE product_master
(
    _product_no VARCHAR(30) PRIMARY KEY,
    _description VARCHAR(30),
    _profit_percent FLOAT,
    _unit_measure VARCHAR(30),
    _qty_on_hand INT,
    _Reoder_1v1 INT,
    _sell_price INT,
    _cost_price INT
);

INSERT INTO client_master VALUES
('0001', 'Ivan', NULL, NULL, 'Bombay','Maharashtra', 400054 , 15000),
('0002', 'Vandana', NULL, NULL, 'Madras','Tamilnadu', 780001 , 0),
('0003', 'Pramada', NULL, NULL, 'Bombay','Maharashtra', 400057 , 5000),
('0004', 'Basu', NULL, NULL, 'Bombay','Maharashtra', 400056, 0),
('0005', 'Ravi', NULL, NULL, 'Dehli',NULL, 100001, 2000),
('0006', 'Rukmini', NULL, NULL, 'Bombay','Maharashtra', 400050 , 0);


INSERT INTO product_master VALUES
('P00001', '1.44 Floppies', 5, 'piece', 100, 20, 525, 500),
('P03453', 'Monitors', 6, 'piece', 10, 3, 12000, 11200),
('P06734', 'Mouse', 5, 'piece', 20, 5, 1050, 500),
('P07865', '1.22 Floppies', 5, 'piece', 100, 20, 525, 500),
('P07868', 'Keyboards', 2, 'piece', 10, 3, 3150, 3050),
('P07885', 'CD Drive', 2.5, 'piece', 10, 3, 5250, 5100),
('P07965', '540 HDD', 4, 'piece', 10, 3, 8400, 8000),
('P07975', '1.44 Drive', 5, 'piece', 10, 3, 1050, 1000),
('P08865', '1.22 Drive', 5, 'piece', 2, 3, 1050, 1000);

-- Query 1
SELECT _name 
FROM client_master;

-- Query 2
SELECT _name, _city 
FROM client_master;

-- Query 3
SELECT DISTINCT(_description) 
FROM product_master;

-- Query 4
SELECT *
FROM client_master
WHERE _city='Bombay';

-- Query 5
SELECT *
FROM client_master
WHERE _client_no='0001' OR _client_no='0002';

-- Query 6
SELECT _product_no
FROM product_master
WHERE _description='1.44 Floppies' OR _description='1.22 Floppies';

-- Query 7
SELECT *
FROM product_master
WHERE _sell_price>5000;

-- Query 8
SELECT *
FROM client_master
WHERE _city='Bombay' OR _city='Mardras' OR _city='Dehli';

-- Query 9
SELECT *
FROM product_master
WHERE _sell_price BETWEEN 2001 AND 5000;

-- Query 10
SELECT _name, _city, _state
FROM client_master
WHERE _state='Maharashtra';







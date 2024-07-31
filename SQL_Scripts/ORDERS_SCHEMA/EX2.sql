DROP DATABASE LAB4;
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
UPDATE product_master
SET _sell_price=1150
WHERE _description='1.44 Floppy Drive';

-- Query 2
DELETE FROM client_master
WHERE _client_no='0001';

-- Query 3
UPDATE client_master
SET _city = 'Bombay'
WHERE _client_no='0005';

-- Query 4
UPDATE client_master
SET _bal_due = 1000
WHERE _client_no='0001';

-- Query 5 
SELECT *, _sell_price*15 AS _sell_price15
FROM product_master
WHERE _sell_price>1500;

-- Query 6
SELECT * 
FROM client_master
WHERE _city LIKE '_a%';

-- Query 7
SELECT _name 
FROM client_master
WHERE _name LIKE '_a%';

-- Query 8
SELECT *
FROM product_master
ORDER BY _description;

-- Query 9
SELECT SUM(_Reoder_1v1) AS TotalOrders
FROM product_master;

-- Query 10
SELECT AVG(_sell_price) AS AvgSellPrice, AVG(_cost_price) AS AvgCostPrice
FROM product_master;

-- Query 11
SELECT MIN(_sell_price) AS MinSellPrice, MIN(_cost_price) AS MinCostPrice
FROM product_master;

-- Query 12
SELECT MIN(_sell_price) AS MinSellPrice, MIN(_cost_price) AS MinCostPrice, MAX(_sell_price) AS MaxSellPrice, MAX(_cost_price) AS MaxCostPrice
FROM product_master;

-- Query 13
SELECT COUNT(*)
FROM product_master
WHERE _sell_price>1500;













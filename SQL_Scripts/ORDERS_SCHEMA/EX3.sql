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


CREATE TABLE sales_master
(
    _salesman_no VARCHAR(6) PRIMARY KEY,
    _sal_name VARCHAR(20) NOT NULL,
    _address VARCHAR(30) NOT NULL,
    _city VARCHAR(20),
    _state VARCHAR(20),
    _pincode INT,
    _sal_amt INT NOT NULL,
    _tgt_to_get INT NOT NULL,
    _ytd_sales INT NOT NULL,
    _remarks VARCHAR(30),
    CHECK (_tgt_to_get>0),
    CHECK (_ytd_sales>0),
    CHECK (_sal_amt>0),
    CHECK (_salesman_no LIKE 's%') 
);


CREATE TABLE sales_order
(
    _s_order_no VARCHAR(6) PRIMARY KEY,
    _s_order_date DATE,
    _client_no VARCHAR(25),
    _dely_add VARCHAR(6),
    _salesman_no VARCHAR(6),
    _dely_type CHAR(1),
    _billed_yn CHAR(1),
    _dely_date DATE,
    _order_status VARCHAR(10),
    CHECK (_s_order_no LIKE '0%'),
    FOREIGN KEY (_client_no) REFERENCES client_master(_client_no),
    FOREIGN KEY (_salesman_no) REFERENCES sales_master(_salesman_no),
    CHECK (_dely_type='p' OR _dely_type='f'),
    CHECK (_dely_date>=_s_order_date),
    CHECK (_order_status IN ('IP', 'F', 'B', 'C'))
);

CREATE TABLE sales_order_details
(
    _s_order_no VARCHAR(6),
    _product_no VARCHAR(6),
    _qty_order INT,
    _qty_disp INT,
    _product_rate FLOAT,
    FOREIGN KEY (_s_order_no) REFERENCES sales_order(_s_order_no),
    FOREIGN KEY (_product_no) REFERENCES product_master(_product_no)
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


INSERT INTO sales_master VALUES
('S00001', 'Kiran', 'A/14 Worli', 'Bombay', 'Mah', 400002, 3000, 100, 50, 'Good'),
('S00002', 'Manish', '65, Narim', 'Bombay', 'Mah', 400001, 3000, 200, 100, 'Good'),
('S00003', 'Ravi', 'P-7 Bandra', 'Bombay', 'Mah', 400032, 3000, 200, 100, 'Good'),
('S00004', 'Ashish', 'A/5 Juhu', 'Bombay', 'Mah', 400044, 3500, 200, 150, 'Good');


INSERT INTO sales_order VALUES
('019001', '1996-01-12', '0001', NULL, 'S00001', 'f', 'N','1996-01-20', 'IP'),
('019002', '1996-01-25', '0002', NULL, 'S00002', 'p', 'N','1996-01-27', 'C'),
('016865', '1996-02-18', '0003', NULL, 'S00003', 'f', 'Y','1996-02-20', 'F'),
('019003', '1996-04-03', '0001', NULL, 'S00001', 'f', 'Y','1996-04-07', 'F'),
('046866', '1996-05-20', '0004', NULL, 'S00002', 'p', 'N','1996-05-22', 'C'),
('010008', '1996-05-24', '0005', NULL, 'S00004', 'f', 'N','1996-05-26', 'IP');


INSERT INTO sales_order_details VALUES
('019001', 'P00001', 4, 4, 525),
('019001', 'P07965', 2, 1, 8400),
('019001', 'P07885', 2, 1, 5250),
('019002', 'P00001', 10, 0, 525),
('016865', 'P07868', 3, 3, 3150),
('016865', 'P07885', 10, 10, 5250),
('019003', 'P00001', 4, 4, 1050),
('019003', 'P03453', 2, 2, 1050),
('046866', 'P06734', 1, 1, 120000),
('046866', 'P07965', 1, 0, 8400),
('010008', 'P07975', 1, 0, 1050),
('010008', 'P00001', 10, 5, 525);


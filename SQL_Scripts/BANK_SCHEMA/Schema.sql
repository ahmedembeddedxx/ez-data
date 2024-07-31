DROP DATABASE BOOK_STORE;
CREATE DATABASE BOOK_STORE;
USE BOOK_STORE;

CREATE TABLE CustomerType
(
    CustomerTypeID INT PRIMARY KEY,
    CustomerOfType VARCHAR(30) NOT NULL
);
CREATE TABLE AccountType
(
    AccountTypeID INT PRIMARY KEY,
    AccountOfType VARCHAR(30) NOT NULL
);
CREATE TABLE Customer
(
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(30) NOT NULL,
    Gender CHAR,
    ContactNo INT NOT NULL,
    CustomerAddress VARCHAR(30),
    CustomerTypeID INT NOT NULL,
    FOREIGN KEY (CustomerTypeID) REFERENCES CustomerType(CustomerTypeID),
    CHECK (CustomerID<=0)
);
CREATE TABLE Account
(
    CustomerID INT UNIQUE,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    AccountID INT PRIMARY KEY,
    AccountTypeID INT,
    FOREIGN KEY (AccountTypeID) REFERENCES AccountType(AccountTypeID),
    CurrentBalance INT,
    CHECK (CurrentBalance >= 0)
);
CREATE TABLE Transaction
(
    TransactionID INT PRIMARY KEY,
    AccountID INT,
    FOREIGN KEY (AccountID) REFERENCES Account(AccountID),
    TransactionDate DATE,
    Amount INT,
    CHECK (Amount <> 0)
);
CREATE TABLE ProductCategory
(
    ProductCategoryID INT PRIMARY KEY,
    ProductCategoryName VARCHAR(40)
);
CREATE TABLE Product
(
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR (40),
    ProductDescription VARCHAR (40),
    ProductCategory INT,
    FOREIGN KEY (ProductCategory) REFERENCES ProductCategory(ProductCategoryID)
);


DROP DATABASE ATM;
CREATE DATABASE ATM;

CREATE TABLE UserType(
    userTypeID INT PRIMARY KEY,
    [name] VARCHAR(20) NOT NULL
);


CREATE TABLE [User]
(
    [userID] INT PRIMARY KEY,
    [name] VARCHAR(20) NOT NULL,
    [userType] INT,
    FOREIGN KEY ([userType]) REFERENCES UserType(userTypeID),
    [phoneNum] VARCHAR(15) NOT NULL,
    [city] VARCHAR(20) NOT NULL
);

CREATE TABLE CardType(
    [cardTypeID] INT PRIMARY KEY,
    [name] VARCHAR(15),
    [description] VARCHAR(40) NULL
);

CREATE TABLE [Card](
    cardNum VARCHAR(20) PRIMARY KEY,
    cardTypeID INT,
    PIN VARCHAR(4) NOT NULL,
    [expireDate] DATE NOT NULL,
    balance FLOAT NOT NULL,
    FOREIGN KEY (cardTypeID) REFERENCES CardType([cardTypeID])
);

CREATE TABLE UserCard(
    userID INT,
    FOREIGN KEY (userID) REFERENCES [User]([userID]),
    cardNum VARCHAR(20),
    FOREIGN KEY (cardNum) REFERENCES [Card](cardNum),
    PRIMARY KEY(userID, cardNum)
);

CREATE TABLE TransactionType(
    transTypeID INT PRIMARY KEY,
    typeName VARCHAR(20) NOT NULL,
    [description] VARCHAR (40) NULL
);


CREATE TABLE [Transaction](
    transId INT PRIMARY KEY,
    transDate DATE NOT NULL,
    cardNum VARCHAR(20),
    FOREIGN KEY (cardNum) REFERENCES [Card](cardNum),
    amount INT NOT NULL,
    transType INT,
    FOREIGN KEY (transType) REFERENCES TransactionType(transTypeID)
);

INSERT [UserType] ([userTypeID], [name]) VALUES (1, N'Silver');
INSERT [UserType] ([userTypeID], [name]) VALUES (2, N'Gold');
INSERT [UserType] ([userTypeID], [name]) VALUES (3, N'Bronze');
INSERT [UserType] ([userTypeID], [name]) VALUES (4, N'Common');
INSERT [User] ([userID], [name], [userType], [phoneNum], [city]) VALUES (1, N'Ali', 2, N'03036067000', N'Narowal');
INSERT [User] ([userID], [name], [userType], [phoneNum], [city]) VALUES (2, N'Ahmed', 1, N'03036047000', N'Lahore');
INSERT [User] ([userID], [name], [userType], [phoneNum], [city]) VALUES (3, N'Aqeel', 3, N'03036063000', N'Karachi');
INSERT [User] ([userID], [name], [userType], [phoneNum], [city]) VALUES (4, N'Usman', 4, N'03036062000', N'Sialkot');
INSERT [User] ([userID], [name], [userType], [phoneNum], [city]) VALUES (5, N'Hafeez', 2, N'03036061000', N'Lahore');
INSERT [CardType] ([cardTypeID], [name], [description]) VALUES (1, N'Debit', N'Spend Now, Pay Now');
INSERT [CardType] ([cardTypeID], [name], [description]) VALUES (2, N'Credit', N'Spend Now, Pay later');
INSERT [CardType] ([cardTypeID], [name], [description]) VALUES (3, N'Gift', N'Enjoy');
INSERT [Card] ([cardNum], [cardTypeID], [PIN], [expireDate], [balance]) VALUES (N'1324327436569', 3, N'1770', CAST(N'2022-07-01' AS Date), 43025.31);
INSERT [Card] ([cardNum], [cardTypeID], [PIN], [expireDate], [balance]) VALUES (N'2324325423336', 3, N'0234', CAST(N'2020-03-02' AS Date), 14425.62);
INSERT [Card] ([cardNum], [cardTypeID], [PIN], [expireDate], [balance]) VALUES (N'2324325436566', 1, N'1234', CAST(N'2019-02-06' AS Date), 34325.52);
INSERT [Card] ([cardNum], [cardTypeID], [PIN], [expireDate], [balance]) VALUES (N'2324325666456', 2, N'1200', CAST(N'2021-02-05' AS Date), 24325.3);
INSERT [Card] ([cardNum], [cardTypeID], [PIN], [expireDate], [balance]) VALUES (N'2343243253436', 2, N'0034', CAST(N'2020-09-02' AS Date), 34025.12);
INSERT [UserCard] ([userID], [cardNum]) VALUES (1, N'1324327436569');
INSERT [UserCard] ([userID], [cardNum]) VALUES (1, N'2343243253436');
INSERT [UserCard] ([userID], [cardNum]) VALUES (2, N'2324325423336');
INSERT [UserCard] ([userID], [cardNum]) VALUES (2, N'2343243253436');
INSERT [UserCard] ([userID], [cardNum]) VALUES (3, N'2324325436566');
INSERT [UserCard] ([userID], [cardNum]) VALUES (5, N'2324325423336');
INSERT [TransactionType] ([transTypeID], [typeName], [description]) VALUES (1, N'Withdraw', NULL);
INSERT [TransactionType] ([transTypeID], [typeName], [description]) VALUES (2, N'Deposit', NULL);
INSERT [TransactionType] ([transTypeID], [typeName], [description]) VALUES (3, N'ScheduledDeposit', NULL);
INSERT [TransactionType] ([transTypeID], [typeName], [description]) VALUES (4, N'Failed', NULL);
INSERT [Transaction] ([transId], [transDate], [cardNum], [amount], [transType]) VALUES (1, CAST(N'2017-02-02' AS Date), N'1324327436569', 500, 1);
INSERT [Transaction] ([transId], [transDate], [cardNum], [amount], [transType]) VALUES (2, CAST(N'2018-02-03' AS Date), N'2343243253436', 3000, 3);
INSERT [Transaction] ([transId], [transDate], [cardNum], [amount], [transType]) VALUES (3, CAST(N'2024-05-06' AS Date), N'2324325436566', 2500, 2);
INSERT [Transaction] ([transId], [transDate], [cardNum], [amount], [transType]) VALUES (4, CAST(N'2016-09-09' AS Date), N'2324325436566', 2000, 1);
INSERT [Transaction] ([transId], [transDate], [cardNum], [amount], [transType]) VALUES (5, CAST(N'2015-02-10' AS Date), N'2324325423336', 6000, 4);



-- QUERY 1
SELECT [name]
FROM [User]
WHERE City='Lahore'
ORDER BY [name] DESC;

-- QUERY 2
SELECT C.*, CT.name
FROM [Card] AS C, CardType AS CT
WHERE C.cardTypeID = CT.cardTypeID AND CT.[name]='Credit'
ORDER BY C.cardNum;

-- QUERY 3
SELECT U.*, UT.*
FROM [User] AS U, UserType AS UT
WHERE U.userType = UT.userTypeID AND UT.[name]='Gold';

-- QUERY 4
SELECT U.*, UC.* 
FROM [User] AS U, UserCard AS UC
WHERE U.[userID] = UC.userID AND UC.cardNum LIKE '%6';

-- Query 5
SELECT U.city
FROM [User] AS U, UserCard AS UC, [Card] AS C
WHERE U.[userID] = UC.userID 
AND UC.cardNum = C.cardNum 
AND C.balance BETWEEN 20000.0 AND 35000;

-- QUERY 6
SELECT * 
FROM [User]
WHERE [userID] NOT IN
(SELECT U.userID
FROM [User] AS U, UserCard AS UC, [Card] AS C, [Transaction] AS T
WHERE U.[userID] = UC.userID 
AND UC.cardNum = C.cardNum
AND C.cardNum = T.cardNum);

-- QUERY 7
SELECT C.cardNum
FROM [Card] AS C
WHERE C.[expireDate] LIKE '2020%';

-- QUERY 8
SELECT U.[name]
FROM [User] AS U, UserCard AS UC, [Card] AS C, [Transaction] AS T, TransactionType AS TT
WHERE U.[userID] = UC.userID 
AND UC.cardNum = C.cardNum
AND C.cardNum = T.cardNum
AND T.transType = TT.transTypeID
AND TT.typeName = 'Failed';

-- QUERY 9
SELECT U.[name], C.cardNum, TT.typeName
FROM [User] AS U, UserCard AS UC, [Card] AS C, [Transaction] AS T, TransactionType AS TT
WHERE U.[userID] = UC.userID 
AND UC.cardNum = C.cardNum
AND C.cardNum = T.cardNum
AND T.transType = TT.transTypeID
AND TT.typeName = 'ScheduledDeposit'

UNION
SELECT [name], NULL, NULL
FROM [User]
WHERE [name] NOT IN 
(
    SELECT U.[name]
    FROM [User] AS U, UserCard AS UC, [Card] AS C, [Transaction] AS T, TransactionType AS TT
    WHERE U.[userID] = UC.userID 
    AND UC.cardNum = C.cardNum
    AND C.cardNum = T.cardNum
    AND T.transType = TT.transTypeID
    AND TT.typeName = 'ScheduledDeposit'
);

-- QUERY 10
SELECT U.[name], U.[phoneNum]
FROM [User] AS U, UserCard AS UC, [Card] AS C
WHERE U.[userID] = UC.userID 
AND UC.cardNum = C.cardNum 
AND C.[expireDate] < '2019-02-02';

-- QUERY 11
SELECT U.[userID], U.[name], C.cardNum
FROM [User] AS U, UserCard AS UC, [Card] AS C, [Transaction] AS T
WHERE U.[userID] = UC.userID 
AND UC.cardNum = C.cardNum
AND C.cardNum = T.cardNum
AND CONVERT(date, T.transDate) = CONVERT(date, GETDATE());

-- QUERY 12
SELECT U.[name], CT.[name]
FROM [User] AS U, UserCard AS UC, [Card] AS C, CardType AS CT
WHERE U.[userID] = UC.userID 
AND UC.cardNum = C.cardNum 
AND C.cardTypeID = CT.[cardTypeID]

UNION

SELECT [name], NULL 
FROM [User]
WHERE [name] NOT IN 
    (SELECT U.[name]
    FROM [User] AS U, UserCard AS UC, [Card] AS C, CardType AS CT
    WHERE U.[userID] = UC.userID 
    AND UC.cardNum = C.cardNum 
    AND C.cardTypeID = CT.[cardTypeID]);

-- QUERY 13
SELECT U.[name], CT.[name]
FROM [User] AS U, UserCard AS UC, [Card] AS C, CardType AS CT
WHERE U.[userID] = UC.userID 
AND UC.cardNum = C.cardNum 
AND C.cardTypeID = CT.[cardTypeID]

INTERSECT

SELECT [name], NULL 
FROM [User]
WHERE [name] NOT IN 
    (SELECT U.[name]
    FROM [User] AS U, UserCard AS UC, [Card] AS C, CardType AS CT
    WHERE U.[userID] = UC.userID 
    AND UC.cardNum = C.cardNum 
    AND C.cardTypeID = CT.[cardTypeID]);

-- QUERY 1
SELECT MAX(Users.Age) AS MaxAge, MIN(Users.Age) AS MinAge, STDEV(Users.Age) AS StdevAge
FROM Users;



-- QUERY 2
SELECT F.FollowedUserName AS UserName, COUNT(F.FollowedUserName) AS NoOfFollowers
FROM Following AS F
GROUP BY F.FollowedUserName
HAVING COUNT(F.FollowedUserName) =
(
    SELECT TOP 1 COUNT(F.FollowedUserName)
    FROM Following AS F
    GROUP BY F.FollowedUserName
    ORDER BY COUNT(F.FollowedUserName) DESC
);



-- QUERY 3
SELECT *
FROM (
    SELECT F.FollowedUserName AS UserName, COUNT(F.FollowedUserName) AS NoOfFollowers
    FROM Following AS F
    GROUP BY F.FollowedUserName
    HAVING COUNT(F.FollowedUserName) !=
        (SELECT TOP 1 COUNT(F2.FollowedUserName)
         FROM Following AS F2
         GROUP BY F2.FollowedUserName
         ORDER BY COUNT(F2.FollowedUserName) DESC)
) AS SecMAX;


-- QUERY 4
SELECT DISTINCT(U.UserName)
FROM Users AS U
WHERE U.UserName NOT IN 
(
    SELECT T.UserName
    FROM Tweets AS T
);

-- Read SUBSTRING & CHARINDEX from Internet 
-- https://www.w3schools.com/sql/func_sqlserver_substring.asp
-- https://www.w3schools.com/sql/func_sqlserver_charindex.asp

-- QUERY 5
SELECT Extracted.Hashtag, UserName, COUNT(Extracted.Hashtag) AS noOfTimes
FROM
(SELECT UserName,
    SUBSTRING(
        Tweets.Text,
        CHARINDEX('#', Tweets.Text),
        CHARINDEX(' ', Tweets.Text + ' ', CHARINDEX('#', Tweets.Text)) - CHARINDEX('#', Tweets.Text)
    ) AS Hashtag
FROM Tweets
WHERE Tweets.Text LIKE '%#%') AS Extracted
GROUP BY UserName, Extracted.Hashtag
ORDER BY UserName;


-- QUERY 6
SELECT DISTINCT(Tweets.UserName)
FROM Tweets
WHERE Tweets.UserName
NOT IN 
(
    SELECT UserName
    FROM Tweets
    WHERE Tweets.Text LIKE '%#Census%'
);

-- QUERY 7
SELECT U.UserName 
FROM Users AS U
EXCEPT
SELECT F.FollowedUserName
FROM Following AS F;

-- QUERY 8
SELECT UserName
FROM Users
WHERE NOT EXISTS
(
    SELECT * 
    FROM Following
    WHERE FollowedUserName = UserName
)

-- QUERY 9
SELECT InterestID, COUNT(InterestID) AS MAXIntrests
FROM UserInterests
GROUP BY InterestID
HAVING COUNT(InterestID)
= 
(
    SELECT TOP 1 COUNT(InterestID)
    FROM UserInterests
    GROUP BY InterestID
    ORDER BY COUNT(InterestID) DESC
);

SELECT InterestID, COUNT(InterestID) AS MinIntrest
FROM UserInterests
GROUP BY InterestID
HAVING COUNT(InterestID)
= 
(
    SELECT TOP 1 COUNT(InterestID)
    FROM UserInterests
    GROUP BY InterestID
    ORDER BY COUNT(InterestID)
);


-- QUERY 10
SELECT JoinedTweets.Country, COUNT(JoinedTweets.Country) AS totalNoOfTweets
FROM
(SELECT Country
FROM Users AS U, Tweets AS T
WHERE U.UserName = T.UserName) AS JoinedTweets
GROUP BY JoinedTweets.Country;

-- QUERY 11
SELECT UserName, COUNT(UserName) AS NumberOfTweets
FROM Tweets
GROUP BY UserName
HAVING COUNT(UserName)
>
(
    SELECT AVG(Counts.TweetCounts) AS AverageTweets
    FROM 
    (
        SELECT COUNT(UserName) AS TweetCounts
        FROM Tweets
        GROUP BY UserName
    ) AS Counts
);

-- QUERY 12
SELECT DISTINCT(FollowedUserName)
FROM Following AS F, Users AS U
WHERE F.FollowerUserName = U.UserName AND U.Country = 'Pakistan';

-- QUERY 13
SELECT MaxID.InterestID,I.Description, MaxID.CountIntrests
FROM
(SELECT InterestID, COUNT(InterestID) AS CountIntrests
FROM UserInterests
GROUP BY InterestID
HAVING COUNT(InterestID)
= 
(
    SELECT TOP 1 COUNT(InterestID)
    FROM UserInterests
    GROUP BY InterestID
    ORDER BY COUNT(InterestID) DESC
)) AS MaxID, Interests as I
WHERE MaxID.InterestID = I.InterestID;




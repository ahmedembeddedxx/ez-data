

-- Populate TEAM table
INSERT INTO TEAM (TEAMNUM, TEAMNAME, CITY, MANAGER) VALUES
(1, 'Team A', 'Lahore', 'Ahmed'),
(2, 'Team B', 'Karachi', 'Khalid'),
(3, 'Team C', 'Islamabad', 'Imran');

-- Populate PLAYER table
INSERT INTO PLAYER (PLAYERNUM, PLAYERNAME, AGE) VALUES
(101, 'Player 1', 25),
(102, 'Player 2', 28),
(103, 'Player 3', 23),
(104, 'Player 4', 30);

-- Populate COACH table
INSERT INTO COACH (TEAMNUM, COACHNAME) VALUES
(1, 'Coach X'),
(2, 'Coach Y'),
(3, 'Coach Z');

-- Populate WORK_EXPERIENCE table
INSERT INTO WORK_EXPERIENCE (TEAMNUM, COACHNAME, EXPERIENCETYPE, YEARSEXPERIENCE) VALUES
(1, 'Coach X', 'Head Coach', 10),
(2, 'Coach Y', 'Assistant Coach', 5),
(3, 'Coach Z', 'Head Coach', 8);

-- Populate BATS table
INSERT INTO BATS (TEAMNUM, SERIALNUM, MANUFACTURER) VALUES
(1, '12345', 'Brand X'),
(2, '67890', 'Brand Y'),
(3, '54321', 'Brand Z');

-- Populate AFFILIATION table
INSERT INTO AFFILIATION (PLAYERNUM, TEAMNUM, YEARS, BATTINGAVG) VALUES
(101, 1, 3, 45.67),
(102, 2, 5, 39.28),
(103, 3, 2, 42.15),
(104, 1, 4, 50.75);
-- Insert additional data into TEAM table
INSERT INTO TEAM (TEAMNUM, TEAMNAME, CITY, MANAGER) VALUES
(4, 'Team D', 'Rawalpindi', 'Sami'),
(5, 'Team E', 'Faisalabad', 'Fahad'),
(6, 'Team F', 'Multan', 'Munir'),
(7, 'Team G', 'Peshawar', 'Parvez'),
(8, 'Team H', 'Quetta', 'Qasim'),
(9, 'Team I', 'Sialkot', 'Saeed'),
(10, 'Team J', 'Gujranwala', 'Gulzar'),
(11, 'Team K', 'Hyderabad', 'Haider'),
(12, 'Team L', 'Sukkur', 'Salman'),
(13, 'Team M', 'Gwadar', 'Ghulam'),
(14, 'Team N', 'Bahawalpur', 'Bilal'),
(15, 'Team O', 'Mirpur', 'Majid'),
(16, 'Team P', 'Abbottabad', 'Amin'),
(17, 'Team Q', 'Mardan', 'Mansoor'),
(18, 'Team R', 'Sargodha', 'Sajid');

-- Insert additional data into PLAYER table
INSERT INTO PLAYER (PLAYERNUM, PLAYERNAME, AGE) VALUES
(105, 'Player 5', 27),
(106, 'Player 6', 29),
(107, 'Player 7', 24),
(108, 'Player 8', 26),
(109, 'Player 9', 31),
(110, 'Player 10', 22),
(111, 'Player 11', 33),
(112, 'Player 12', 25),
(113, 'Player 13', 30),
(114, 'Player 14', 28),
(115, 'Player 15', 23),
(116, 'Player 16', 27),
(117, 'Player 17', 32),
(118, 'Player 18', 29),
(119, 'Player 19', 26);

-- Insert additional data into COACH table
INSERT INTO COACH (TEAMNUM, COACHNAME) VALUES
(4, 'Coach AA'),
(5, 'Coach BB'),
(6, 'Coach CC'),
(7, 'Coach DD'),
(8, 'Coach EE'),
(9, 'Coach FF'),
(10, 'Coach GG'),
(11, 'Coach HH'),
(12, 'Coach II'),
(13, 'Coach JJ'),
(14, 'Coach KK'),
(15, 'Coach LL'),
(16, 'Coach MM'),
(17, 'Coach NN'),
(18, 'Coach OO');

-- Insert additional data into WORK_EXPERIENCE table
INSERT INTO WORK_EXPERIENCE (TEAMNUM, COACHNAME, EXPERIENCETYPE, YEARSEXPERIENCE) VALUES
(4, 'Coach AA', 'Assistant Coach', 3),
(5, 'Coach BB', 'Head Coach', 8),
(6, 'Coach CC', 'Assistant Coach', 5),
(7, 'Coach DD', 'Head Coach', 10),
(8, 'Coach EE', 'Head Coach', 6),
(9, 'Coach FF', 'Assistant Coach', 4),
(10, 'Coach GG', 'Head Coach', 7),
(11, 'Coach HH', 'Assistant Coach', 2),
(12, 'Coach II', 'Head Coach', 9),
(13, 'Coach JJ', 'Assistant Coach', 6),
(14, 'Coach KK', 'Head Coach', 11),
(15, 'Coach LL', 'Head Coach', 5),
(16, 'Coach MM', 'Assistant Coach', 3),
(17, 'Coach NN', 'Head Coach', 7),
(18, 'Coach OO', 'Assistant Coach', 4);

-- Insert additional data into BATS table
INSERT INTO BATS (TEAMNUM, SERIALNUM, MANUFACTURER) VALUES
(4, '23456', 'Brand AA'),
(5, '78901', 'Brand BB'),
(6, '65432', 'Brand CC'),
(7, '09876', 'Brand DD'),
(8, '12321', 'Brand EE'),
(9, '54545', 'Brand FF'),
(10, '78787', 'Brand GG'),
(11, '98989', 'Brand HH'),
(12, '76767', 'Brand II'),
(13, '45454', 'Brand JJ'),
(14, '12121', 'Brand KK'),
(15, '34343', 'Brand LL'),
(16, '56565', 'Brand MM'),
(17, '87878', 'Brand NN'),
(18, '09090', 'Brand OO');

-- Insert additional data into AFFILIATION table
INSERT INTO AFFILIATION (PLAYERNUM, TEAMNUM, YEARS, BATTINGAVG) VALUES
(105, 4, 3, 41.23),
(106, 5, 5, 36.78),
(107, 6, 2, 39.45),
(108, 7, 4, 44.67),
(109, 8, 6, 49.80),
(110, 9, 1, 35.60),
(111, 10, 7, 52.40),
(112, 11, 2, 38.90),
(113, 12, 8, 48.20),
(114, 13, 3, 42.30),
(115, 14, 6, 46.50),
(116, 15, 4, 40.80),
(117, 16, 5, 47.60),
(118, 17, 7, 51.20),
(119, 18, 3, 43.70);


--ADDING WARNING COUNT, DROPPING PHONE-NUMBER

ALTER TABLE STUDENT
DROP COLUMN PHONENUMBER,
ADD COLUMN WARNING_COUNT INT;
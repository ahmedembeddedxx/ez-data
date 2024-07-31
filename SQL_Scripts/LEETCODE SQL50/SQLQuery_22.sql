SELECT * 
FROM Students S1
JOIN Students S2
ON S1.age = S2.age AND S1.department = S2.department AND S1.id != S2.id

-- f. Ποιος είναι ο μέσος όρος συμβάντων-παραβάσεων ανά ηλικιακή ομάδα οδηγών (18-
-- 24, 25-49, 50-69, 70+).

SELECT COUNT(license_number),extract(year FROM CURRENT_DATE)- extract(year FROM date_of_birth) BETWEEN 18 AND 24 AS "18-24",
extract(year FROM CURRENT_DATE)- extract(year FROM date_of_birth) BETWEEN 25 AND 49 AS "25-49" ,
extract(year FROM CURRENT_DATE)- extract(year FROM date_of_birth) BETWEEN 50 AND 69 AS "50-69",
extract(year FROM CURRENT_DATE)- extract(year FROM date_of_birth) >= 70 AS "70+" 
FROM DRIVER ,DRIVER_AND_VEHICLE_IN_ACCIDENT
WHERE DRIVER_license_number = license_number
group by extract(year FROM CURRENT_DATE)- extract(year FROM date_of_birth) BETWEEN 18 AND 24 ,
extract(year FROM CURRENT_DATE)- extract(year FROM date_of_birth) BETWEEN 25 AND 49 ,
extract(year FROM CURRENT_DATE)- extract(year FROM date_of_birth) BETWEEN 50 AND 69 ,
extract(year FROM CURRENT_DATE)- extract(year FROM date_of_birth) >= 70 
order by COUNT(license_number) desc ;
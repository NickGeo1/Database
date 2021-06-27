-- f. Ποιος είναι ο μέσος όρος συμβάντων-παραβάσεων ανά ηλικιακή ομάδα οδηγών (18-
-- 24, 25-49, 50-69, 70+).

SELECT COUNT(license_number) AS accidents_in_age_group,
COUNT(DISTINCT extract(year FROM CURRENT_DATE)- extract(year FROM date_of_birth)) AS distinct_ages_in_age_group,
COUNT(license_number)/COUNT(DISTINCT extract(year FROM CURRENT_DATE)- extract(year FROM date_of_birth)) AS average_accidents_per_age_in_group,
extract(year FROM CURRENT_DATE)- extract(year FROM date_of_birth) BETWEEN 18 AND 24 AS "age_group 18-24",
extract(year FROM CURRENT_DATE)- extract(year FROM date_of_birth) BETWEEN 25 AND 49 AS "age_group 25-49" ,
extract(year FROM CURRENT_DATE)- extract(year FROM date_of_birth) BETWEEN 50 AND 69 AS "age_group 50-69",
extract(year FROM CURRENT_DATE)- extract(year FROM date_of_birth) >= 70 AS "age_group 70+" 
FROM DRIVER ,DRIVER_AND_VEHICLE_IN_ACCIDENT
WHERE DRIVER_license_number = license_number
group by extract(year FROM CURRENT_DATE)- extract(year FROM date_of_birth) BETWEEN 18 AND 24 ,
extract(year FROM CURRENT_DATE)- extract(year FROM date_of_birth) BETWEEN 25 AND 49 ,
extract(year FROM CURRENT_DATE)- extract(year FROM date_of_birth) BETWEEN 50 AND 69 ,
extract(year FROM CURRENT_DATE)- extract(year FROM date_of_birth) >= 70 
order by COUNT(license_number) desc ;
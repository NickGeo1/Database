
-- a. Ποια (νέα) συμβόλαια υπεγράφησαν τον τελευταίο μήνα και ποιοι είναι οι πελάτες και οι οδηγοί που σχετίζονται με αυτά.

SELECT number AS contract_number, starting_date AS last_month_starting_date, license_number AS customer_license, DRIVER_license_number AS driver_license
FROM CONTRACTS, CUSTOMER, DRIVER_CONTRACT
WHERE extract(month from starting_date)
IN
(
	select extract(month from max(starting_date))
	from CONTRACTS
)
AND extract(year from starting_date) 
IN
(
	select extract(year from max(starting_date))
	from CONTRACTS
)
AND
email=CUSTOMER_email
AND 
DRIVER_CONTRACT.CONTRACTS_number=number



-- b. Ποια συμβόλαια αναμένεται να λήξουν τον επόμενο μήνα και ποια είναι τα τηλέφωνα
-- επικοινωνίας των πελατών που σχετίζονται με αυτά.

SELECT CONTRACTS.number AS contract_number,end_date AS next_month_end_date, PHONE_NUMBERS.number AS customer_phone_number, license_number AS customer_license
FROM CONTRACTS,CUSTOMER,PHONE_NUMBERS
WHERE extract(month from end_date) = extract(month from CURRENT_DATE) + 1 
AND extract(year from end_date) = extract(year from CURRENT_DATE)
AND CONTRACTS_number = CONTRACTS.number
AND CONTRACTS.CUSTOMER_email = PHONE_NUMBERS.CUSTOMER_email



-- c. Ποιος είναι ο αριθμός των συμβολαίων που υπεγράφησαν (παραλλαγή: που δεν
-- ανανεώθηκαν) ανά ασφαλιστική κατηγορία και ανά έτος για την πενταετία 2016-2020.


--παραλλαγή 1

SELECT extract( year from starting_date) AS starting_year, category, COUNT(number)
FROM CONTRACTS
WHERE extract( year FROM starting_date ) BETWEEN 2016 AND 2020
group by category , extract( year from starting_date)  


--παραλλαγή 2

SELECT extract( year from end_date) AS non_renewed_year, category, COUNT(number)
FROM CONTRACTS
WHERE extract( year FROM end_date) BETWEEN 2016 AND 2020
group by category , extract( year from end_date) 



-- d. Ποια κατηγορία ασφάλισης παρουσιάζει βάσει των συμβολαίων τον μεγαλύτερο τζίρο
-- (2 παραλλαγές: σε απόλυτους αριθμούς, με αναγωγή βάσει πλήθους συμβολαίων).

SELECT category , sum(price) AS total_profit , COUNT(number) AS total_contracts
FROM CONTRACTS  
group by category
order by sum(price) desc
limit 1;


-- e. Ποιος είναι ο μέσος όρος συμβολαίων ανά ηλικιακή ομάδα οχημάτων (παλαιότητα 0-4
-- έτη, 5-9 έτη, 10-19 έτη, 20+ έτη).

SELECT COUNT(plates) AS "contracts_in_age_group",
count(DISTINCT YEAR) AS distinct_years_in_group,
count(plates)/count(DISTINCT YEAR) AS average_contracts_per_year_in_group,
extract (year FROM CURRENT_DATE)-year BETWEEN 0 AND 4 AS "age_group 0-4",
extract (year FROM CURRENT_DATE)-year BETWEEN 5 AND 9 AS "age_group 5-9",
extract (year FROM CURRENT_DATE)- year BETWEEN 10 AND 19 AS "age_group 10-19", 
extract (year FROM CURRENT_DATE)- year >= 20 AS "age_group 20+"
FROM VEHICLES 
group by extract (year FROM CURRENT_DATE)-year BETWEEN 0 AND 4 , extract (year FROM CURRENT_DATE)-year BETWEEN 5 AND 9 ,extract (year FROM CURRENT_DATE)- year BETWEEN 10 AND 19, extract (year FROM CURRENT_DATE)- year >= 20 
order by COUNT(plates) desc;



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



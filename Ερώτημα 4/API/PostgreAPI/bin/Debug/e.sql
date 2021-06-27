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
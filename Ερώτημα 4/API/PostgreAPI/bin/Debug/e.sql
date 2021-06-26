-- e. Ποιος είναι ο μέσος όρος συμβολαίων ανά ηλικιακή ομάδα οχημάτων (παλαιότητα 0-4
-- έτη, 5-9 έτη, 10-19 έτη, 20+ έτη).

SELECT COUNT(plates) ,extract (year FROM CURRENT_DATE)-year BETWEEN 0 AND 4 AS "0-4", extract (year FROM CURRENT_DATE)-year BETWEEN 5 AND 9 AS "5-9" ,extract (year FROM CURRENT_DATE)- year BETWEEN 10 AND 19 AS "10-19", extract (year FROM CURRENT_DATE)- year >= 20 AS "20+"
FROM VEHICLES 
group by extract (year FROM CURRENT_DATE)-year BETWEEN 0 AND 4 , extract (year FROM CURRENT_DATE)-year BETWEEN 5 AND 9 ,extract (year FROM CURRENT_DATE)- year BETWEEN 10 AND 19, extract (year FROM CURRENT_DATE)- year >= 20 
order by COUNT(plates) desc;
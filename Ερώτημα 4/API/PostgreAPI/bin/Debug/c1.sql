-- c. Ποιος είναι ο αριθμός των συμβολαίων που υπεγράφησαν (παραλλαγή: που δεν
-- ανανεώθηκαν) ανά ασφαλιστική κατηγορία και ανά έτος για την πενταετία 2016-2020.
-- παραλλαγή 1

SELECT extract( year from starting_date) AS starting_year, category, COUNT(number)
FROM CONTRACTS
WHERE extract( year FROM starting_date ) BETWEEN 2016 AND 2020
group by category , extract( year from starting_date)   
-- c. Ποιος είναι ο αριθμός των συμβολαίων που υπεγράφησαν (παραλλαγή: που δεν
-- ανανεώθηκαν) ανά ασφαλιστική κατηγορία και ανά έτος για την πενταετία 2016-2020.
-- παραλλαγή 2

SELECT extract( year from end_date) AS non_renewed_year, category, COUNT(number)
FROM CONTRACTS
WHERE extract( year FROM end_date) BETWEEN 2016 AND 2020
group by category , extract( year from end_date) 
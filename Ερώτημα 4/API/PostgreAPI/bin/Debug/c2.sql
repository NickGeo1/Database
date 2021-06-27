-- c. Ποιος είναι ο αριθμός των συμβολαίων που υπεγράφησαν (παραλλαγή: που δεν
-- ανανεώθηκαν) ανά ασφαλιστική κατηγορία και ανά έτος για την πενταετία 2016-2020.
-- παραλλαγή 2

SELECT end_date, category, COUNT(number)
FROM CONTRACTS
WHERE extract( year FROM end_date ) BETWEEN 2016 AND 2020
group by category ,end_date 
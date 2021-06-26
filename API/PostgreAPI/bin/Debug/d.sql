-- d. Ποια κατηγορία ασφάλισης παρουσιάζει βάσει των συμβολαίων τον μεγαλύτερο τζίρο
-- (2 παραλλαγές: σε απόλυτους αριθμούς, με αναγωγή βάσει πλήθους συμβολαίων).
SELECT category, sum(price), COUNT(number)
FROM CONTRACTS  
group by category
order by sum(price) desc;
-- d. Ποια κατηγορία ασφάλισης παρουσιάζει βάσει των συμβολαίων τον μεγαλύτερο τζίρο
-- (2 παραλλαγές: σε απόλυτους αριθμούς, με αναγωγή βάσει πλήθους συμβολαίων).

SELECT category , sum(price) AS total_profit , COUNT(number) AS total_contracts
FROM CONTRACTS  
group by category
order by sum(price) desc
limit 1;
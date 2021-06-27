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
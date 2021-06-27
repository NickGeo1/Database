-- b. Ποια συμβόλαια αναμένεται να λήξουν τον επόμενο μήνα και ποια είναι τα τηλέφωνα
-- επικοινωνίας των πελατών που σχετίζονται με αυτά.
SELECT CONTRACTS.number AS contract_number, next_month_end_date, PHONE_NUMBERS.number AS customer_phone_number, license_number AS customer_license
FROM CONTRACTS,CUSTOMER,PHONE_NUMBERS
WHERE extract(month from end_date) = extract(month from CURRENT_DATE) + 1 
AND extract(year from end_date) = extract(year from CURRENT_DATE)
AND CONTRACTS_number = CONTRACTS.number
AND CONTRACTS.CUSTOMER_email = PHONE_NUMBERS.CUSTOMER_email
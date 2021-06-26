--Η ασκηση αυτη επιστρεφει τον πινακα του ερωτηματος 2c (πρωτη εκδοχη)

CREATE FUNCTION get_contract()
RETURNS TABLE	
(
	contract_starting_date DATE,
	contract_category VARCHAR(20),	
	how_many BIGINT
)
AS $$

DECLARE
	rec_contract RECORD;

	cur_contract CURSOR FOR 
		SELECT starting_date, category, COUNT(number)
		FROM CONTRACTS
		WHERE extract( year FROM starting_date ) BETWEEN 2016 AND 2020
		group by category ,starting_date;
		
BEGIN
	OPEN cur_contract;
	
	LOOP
		FETCH cur_contract INTO rec_contract;
		
		EXIT WHEN NOT FOUND;
		
		contract_starting_date:=rec_contract.starting_date;
		contract_category:=rec_contract.category;
		how_many=rec_contract.count;
		
		RETURN NEXT;
		
	END LOOP;
	
	CLOSE cur_contract;
	
END;$$
LANGUAGE plpgsql;

SELECT * FROM get_contract()
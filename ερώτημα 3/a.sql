CREATE FUNCTION contract_refresh1() RETURNS TRIGGER 
LANGUAGE PLPGSQL AS $$
BEGIN
UPDATE CONTRACTS 
SET end_date = end_date + interval '1 YEAR'
WHERE (category = 'Professional' AND end_date>=CURRENT_DATE);
RETURN NEW;
END;
$$;

CREATE TRIGGER contract_refresh1 AFTER INSERT ON CONTRACTS
FOR EACH ROW EXECUTE PROCEDURE contract_refresh1();
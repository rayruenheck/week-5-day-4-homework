CREATE OR REPLACE FUNCTION change_first_name(
	_customer_id INTEGER,
	_first_name VARCHAR,
	_last_name VARCHAR,
	new_first_name varchar
)

RETURNS varchar AS
$$
	BEGIN 
		UPDATE customer
		SET first_name = new_first_name
		WHERE last_name = _last_name AND first_name = _first_name AND customer_id = _customer_id;
		RETURN first_name FROM customer WHERE first_name = new_first_name;
	END;
	
$$
LANGUAGE plpgsql;

SELECT *
FROM customer

SELECT change_first_name(1,'sean','currie','stephon');

SELECT *
FROM customer
WHERE customer_id = 1

SELECT *
FROM orders

CREATE OR REPLACE PROCEDURE update_order_shipped(
	_order_id INTEGER,
	_customer_id INTEGER
)
AS $$
	BEGIN
		UPDATE orders
		SET order_shipped = current_date
		WHERE order_id = _order_id AND customer_id = _customer_id;
		COMMIT; 
	END;
	
$$
LANGUAGE plpgsql;

CALL update_order_shipped(3,2)

SELECT *
FROM orders
WHERE order_id = 3
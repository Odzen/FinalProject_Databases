-- actualiza la última hora de conección y la ultima ip de conección. 


CREATE OR REPLACE PROCEDURE update_lasttime(id INTEGER ,l_ip INET,l_login DATE)
LANGUAGE plpgsql
AS $BODY$
BEGIN 
	UPDATE "user"
	SET last_ip="@l_ip",
		last_login="@l_login" 
	WHERE id_user="@id"; 	
END;
$BODY$


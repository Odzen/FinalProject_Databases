
CREATE OR REPLACE FUNCTION insert_user(id VARCHAR(30), creator VARCHAR(30))
RETURNS void as $BODY$
DECLARE 
	adm VARCHAR(30):= 'admin';
	staf VARCHAR(30):='staff';
BEGIN 
	IF (SELECT "@creator" IN (select id_admin from admin where id_admin="@creator"))
		BEGIN
			IF(NEW.user_type = adm) THEN
				BEGIN
					IF()
					INSERT INTO admin(id_admin,id_user,created_by_admin) VALUES ("@id",NEW.id_user,"@creator");
				END;
			ELSIF(NEW.user_type = staf) THEN
				INSERT INTO staff(id_staff,id_user,created_by_admin) VALUES ("@id",NEW.id_user,"@creator");
			ELSE
				INSERT INTO student(id_student,id_user,created_by_admin) VALUES ("@id",NEW.id_user,"@creator");
			END IF;
		END;
	ELSE
		RAISE EXCEPTION 'El admin % no existe' "@creator";
	END IF;
END;
$BODY$
LANGUAGE plpgsql




CREATE OR REPLACE PROCEDURE insert_user(id VARCHAR(30), creator VARCHAR(30))
LANGUAGE plpgsql
as $BODY$
DECLARE 
	adm VARCHAR(30):= 'admin';
	staf VARCHAR(30):='staff';
BEGIN 
	IF (SELECT "@creator" IN (select id_admin from admin where id_admin="@creator")) THEN
		BEGIN
			IF (NEW.user_type = adm)THEN
				BEGIN 
					INSERT INTO admin(id_admin,id_user,created_by_admin) VALUES ("@id",NEW.id_user,"@creator");
					IF(SELECT "@id" IN (select id_admin from admin where id_admin="@id"))THEN
						ROLLBACK;
					ELSE
						COMMIT;
					END IF;
				END;
			ELSIF(NEW.user_type = staf)THEN
				BEGIN
					INSERT INTO staff(id_staff,id_user,created_by_admin) VALUES ("@id",NEW.id_user,"@creator");
					IF(SELECT "@id" IN (select id_staff from admin where id_staff="@id"))THEN
						ROLLBACK;
					ELSE
						COMMIT;
					END IF;
				END;
			ELSE
				BEGIN
					INSERT INTO student(id_student,id_user,created_by_admin) VALUES ("@id",NEW.id_user,"@creator");
					IF(SELECT "@id" IN (select id_staff from admin where id_staff="@id"))THEN
						ROLLBACK;
					ELSE
						COMMIT;
					END IF;
				END;
			END IF;
		END;
	ELSE
		RAISE EXCEPTION 'El admin % no existe', "@creator";
	END IF;
END;
$BODY$




-- Trigger 3

-- No dejar responder un test para marcar asistencia a un curso que esta inactivo, esto lo revisamos con el campo
-- status en la relacion 'test'


-- DROP TRIGGER IF EXISTS attendance_check ON attendance;

CREATE OR REPLACE FUNCTION attendance_check() 
    RETURNS TRIGGER AS $attendance_check$
BEGIN
    IF  THEN
		RAISE EXCEPTION '';
	ELSIF () THEN
		IF () THEN
			RAISE EXCEPTION '', ;
		END IF;
	ELSE
		BEGIN
			RETURN NEW;
			RAISE NOTICE 'La insercion o actualizacion de attendance ha sido exitosa';
		END;
	END IF;
    RETURN NULL;
END;
  $attendance_check$ LANGUAGE plpgsql;

CREATE TRIGGER attendance_check BEFORE INSERT OR UPDATE
	ON attendance
    FOR EACH ROW 
        EXECUTE PROCEDURE attendance_check();

-- TESTS TRIGGER 3
-- LUEGO DE EJECUTAR CADA TEST, VOLVER A EJECUTAR EL ARCHIVO DE INSERCION DE RECORDS PARA
-- MANTENER LA INTEGRIDAD REFERENCIAL Y RESTABLECER LAS SECUENCIAS

-- Invalido por Trigger porque el test con id 3 esta inactivo
-- INSERT INTO attendance (id_test, id_student, date)
-- 	VALUES 
-- 		(3,'201744936', '2022-02-12');

-- Invalido por Trigger porque el test con id 4 esta inactivo
-- UPDATE attendance
-- 	SET id_test=4
-- 	WHERE id_test =7  AND id_student='202244936';

-- Valido por Trigger porque el test con id 2 esta inactivo
-- INSERT INTO attendance (id_test, id_student, date)
-- 	VALUES 
-- 		(2,'201744936', '2022-03-12');

	
--SELECT * FROM answer;
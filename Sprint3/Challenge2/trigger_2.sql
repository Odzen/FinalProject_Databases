-- Trigger 2

-- No dejar matricular estudiantes a un curso que esta inactivo

DROP TRIGGER IF EXISTS enroll_check ON enrolls;

CREATE OR REPLACE FUNCTION enroll_check() 
    RETURNS TRIGGER AS $enroll_check$
BEGIN
	IF (SELECT NEW.id_course NOT IN (SELECT id_course FROM course WHERE status=TRUE AND id_course=NEW.id_course)) THEN
		RAISE EXCEPTION 'El curso con el id % no esta disponible, por eso no puede matricular al estudiante con el codigo %', NEW.id_course, NEW.id_student;
	ELSE
		BEGIN
			RETURN NEW;
			RAISE NOTICE 'La insercion o actualizacion de enroll ha sido exitosa';
		END;
	END IF;
    RETURN NULL;
END;
  $enroll_check$ LANGUAGE plpgsql;

CREATE TRIGGER enroll_check BEFORE INSERT OR UPDATE
	ON enrolls
    FOR EACH ROW 
        EXECUTE PROCEDURE enroll_check();

-- TESTS TRIGGER 2
-- LUEGO DE EJECUTAR CADA TEST, VOLVER A EJECUTAR EL ARCHIVO DE INSERCION DE RECORDS PARA
-- MANTENER LA INTEGRIDAD REFERENCIAL Y RESTABLECER LAS SECUENCIAS

-- -- Invalido por Trigger porque el curso con 111051M NO esta inactivo
-- INSERT INTO enrolls(id_course, id_student, date)
-- 	VALUES
-- 		('111051M', '201744936', '2022-02-12');

-- -- Invalido por Trigger porque el curso con 106012C NO esta inactivo
-- UPDATE enrolls
-- 	SET id_course = '106012C'
-- 	WHERE id_course = '750006C' AND id_student = '201544936';

-- --Valido por trigger por el curso con id 761130M SI esta activo
-- INSERT INTO enrolls(id_course, id_student, date)
-- 	VALUES
-- 		('761130M', '202144936', '2022-03-12');
	
-- SELECT * FROM enrolls;
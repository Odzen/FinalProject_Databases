-- Trigger 2

-- Cada vez que se inserta o actualiza un registro en enroll mirar si el id del  profesor que quiero matricular al estudiante a un curso, 
-- es el mismo id del profesor que enseña este curso. Si lo es, insertar sin problema, si no, que salte una advertencia.

DROP TRIGGER IF EXISTS enroll_check ON enrolls;

CREATE OR REPLACE FUNCTION enroll_check() 
    RETURNS TRIGGER AS $enroll_check$
BEGIN
    IF (SELECT NEW.id_course NOT IN (SELECT id_course FROM course WHERE id_staff=NEW.id_staff )) THEN
		RAISE EXCEPTION 'El profesor con el id: % no enseña el curso %',NEW.id_staff,NEW.id_course;
	ELSE
		BEGIN
			RETURN NEW;
			RAISE NOTICE 'La insercion o actualizacion de la matricula ha sido exitosa';
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

-- Error por trigger ya que el curso al que quiero matricular NO lo enseña el profesor
-- INSERT INTO enrolls(id_course, id_student, id_staff, date)
-- 	VALUES('111023C', '201744936', '67463956', '2022-02-12' );

-- Valido por trigger ya que el curso al que quiero matricular SI lo enseña el profesor
--INSERT INTO enrolls(id_course, id_student, id_staff, date)
--	VALUES('750001C', '202144936', '26373945', '2022-02-12' );
	
-- Error por trigger ya que el curso al que quiero matricular NO lo enseña el profesor
-- UPDATE enrolls
-- 	SET id_staff='26373945'
-- 	WHERE id_course='761130M';

--SELECT * FROM enrolls;

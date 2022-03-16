-- Trigger 1

-- Una option esta asociada a una pregunta si y solo si esta pregunta es de tipo cerrada. Ademas se tiene que verificar 
-- que el literal se inserte o se quiera actualizar solo si este literal no esta asociado antes con una pregunta

DROP TRIGGER IF EXISTS option_check ON option;

CREATE OR REPLACE FUNCTION option_check() 
    RETURNS TRIGGER AS $option_check$
BEGIN
	-- Certifica que la pregunta sea cerrada
    IF (SELECT (SELECT id_question FROM question WHERE type='close' AND id_question=NEW.id_question) IS NULL) THEN
        RAISE EXCEPTION 'El valor de id_question % es incorrecto o invalido, no existe una pregunta cerrada con id',NEW.id_question;
	--Certifica que el literal no este asociado a la pregunta
	ELSIF (SELECT (SELECT id_question FROM option WHERE literal=NEW.literal AND id_question=NEW.id_question) IS NULL) THEN
		RAISE EXCEPTION 'El valor del literal  % es incorrecto o invalido, ya existe una opcion asociada a la pregunta % con ese literal',NEW.literal,NEW.id_question;
    ELSE
		BEGIN
			RETURN NEW;
			RAISE NOTICE 'La insercion o actualizacion de la opcion ha sido exitosa';
		END;
	END IF;
    RETURN NULL;
END;
  $option_check$ LANGUAGE plpgsql;

CREATE TRIGGER option_check BEFORE INSERT OR UPDATE
	ON option
    FOR EACH ROW 
        EXECUTE PROCEDURE option_check();
		
--TESTS
-- Error por trigger: Sale la exception porque id_question es de una pregunta abierta
--UPDATE option
--SET id_question=5
--WHERE id_option=2;

--- Error por Trigger: Sale la exception porque id_question es de una pregunta abierta
--INSERT INTO option (literal, id_question, description)
--	VALUES ('a', 11, 'OpcionN');

-- Valido por Trigger: Porque el id_question es de una pregunta cerrada 
--UPDATE option
--SET id_question=4
--WHERE id_option=2;

-- Eror por Trigger: Invalido por trigger porque ya existe el literal 'a' para la pregunta 4
UPDATE option
SET literal='x'
WHERE id_question=6;

SELECT (SELECT id_question FROM option WHERE literal='a' AND id_question=4) IS NULL;
SELECT id_question FROM option WHERE literal='e' AND id_question=4;
SELECT * FROM option;
SELECT(SELECT id_question FROM option WHERE literal='g' AND id_question=4) IS NOT NULL;

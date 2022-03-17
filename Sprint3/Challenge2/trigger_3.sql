-- Trigger 3

-- Para la relacion answer revisar que campo Text es NULL o OptionSelected es NULL, pero no pueden ser los dos NULL.
-- Revisar si OptionSelected NO es NULL, entonces que efectivamente el id_question exista en la tabla option, o mejor dicho, 
-- que la pregunta sea cerrada ya que sabemos que todas las preguntas en la tabla option son cerradas puesto lo verificamos en el Trigger 1.

DROP TRIGGER IF EXISTS answer_check ON answer;

CREATE OR REPLACE FUNCTION answer_check() 
    RETURNS TRIGGER AS $answer_check$
BEGIN
    IF (NEW.option_selected IS NULL AND NEW.text IS NULL) THEN
		RAISE EXCEPTION 'La opcion elegida y el texto no pueden ser NULL al mismo tiempo, toda pregunta al menos debe de tener una respuesta';
	ELSIF (NEW.option_selected IS NOT NULL) THEN
		IF (SELECT NEW.option_selected NOT IN (SELECT id_option FROM option WHERE id_question=NEW.id_question)) THEN
			RAISE EXCEPTION 'La opcion elegida con el id: % no existe o no tiene una pregunta asociada con el id: %', NEW.option_selected, NEW.id_question;
		END IF;
	ELSE
		BEGIN
			RETURN NEW;
			RAISE NOTICE 'La insercion o actualizacion de answer ha sido exitosa';
		END;
	END IF;
    RETURN NULL;
END;
  $answer_check$ LANGUAGE plpgsql;

CREATE TRIGGER answer_check BEFORE INSERT OR UPDATE
	ON answer
    FOR EACH ROW 
        EXECUTE PROCEDURE answer_check();

-- TESTS TRIGGER 3
-- LUEGO DE EJECUTAR CADA TEST, VOLVER A EJECUTAR EL ARCHIVO DE INSERCION DE RECORDS PARA
-- MANTENER LA INTEGRIDAD REFERENCIAL Y RESTABLECER LAS SECUENCIAS

-- Invalido por Trigger porque los dos valores son NULL
-- INSERT INTO answer (date, text, option_selected, id_student, id_question)
-- 	VALUES
-- 		('2022-12-16 12:21:13',NULL, NULL, '201744936',4);

-- Invalido por Trigger porque estoy seteando la respuesta a NULL
-- UPDATE answer
-- 	SET option_selected=NULL
-- 	WHERE id_answer = 1;
	
-- Invalido por Trigger porque estoy seteando la respuesta a NULL
-- UPDATE answer
-- 	SET text=NULL
-- 	WHERE id_answer = 7;

-- Invalido por Trigger porque la opcion no esta asociada con alguna pregunta segun la relacion option
-- INSERT INTO answer (date, text, option_selected, id_student, id_question)
-- 	VALUES
-- 		('2022-12-16 12:21:13',NULL, 15, '201744936',1);
	
--SELECT * FROM answer;
----------------------------- OPEN ANSWER -------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE insert_open_answer(datep TIMESTAMP,text TEXT, id_student VARCHAR(30),id_question INT, id_test INT)
lANGUAGE plpgsql
AS $BODY$
DECLARE
	number_answered_open INTEGER=(select count(id_question) from answer_open inner join question_test 
									on answer_open.id_question=question_test.id_question and question_test.id_test="@id_test");
	number_answered_close INTEGER =(select count id_question from answer_close inner join question_test 
									on answer_close.id_question=question_test.id_question and question_test.id_test="@id_test");
	number_of_questions INTEGER=(select count(id_test) from question_test where id_test='@id_test');
BEGIN
	INSERT INTO answer_open(date,text,id_student,id_question) VALUES ('@datep','@text','@id_student','@id_question');
	COMMIT;
	INSERT INTO attendance (id_test,id_student,date) VALUES ('@id_test','@id_student', DATE('@datep'));
	IF( (number_answered_close + number_answered_open +1) = number_of_questions)THEN 
		COMMIT;
	ELSE
		ROLLBACK;
	END IF;
END;
$BODY$;

----------------------------- CLOSE ANSWER -------------------------------------------------------------------
 CREATE OR REPLACE PROCEDURE insert_close_answer(datep TIMESTAMP,o_s INT, id_student VARCHAR(30),id_question INT, id_test INT)
lANGUAGE plpgsql
AS $BODY$
DECLARE
	number_answered_open INTEGER=(select count(id_question) from answer_open inner join question_test 
									on answer_open.id_question=question_test.id_question and question_test.id_test="@id_test");
	number_answered_close INTEGER =(select count id_question from answer_close inner join question_test 
									on answer_close.id_question=question_test.id_question and question_test.id_test="@id_test");
	number_of_questions INTEGER=(select count(id_test) from question_test where id_test='@id_test');
BEGIN
	INSERT INTO answer_close(date,option_selected,id_student,id_question) VALUES ('@datep','@o_s','@id_student','@id_question');
	COMMIT;
	INSERT INTO attendance (id_test,id_student,date) VALUES ('@id_test','@id_student', DATE('@datep'));
	IF( (number_answered_close + number_answered_open +1) = number_of_questions)THEN 
		COMMIT;
	ELSE
		ROLLBACK;
	END IF;
END;
$BODY$



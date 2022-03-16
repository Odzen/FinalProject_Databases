-- RESTART SERIAL FIELDS FOR TESTING

ALTER SEQUENCE user_id_user_seq RESTART;
ALTER SEQUENCE campus_id_campus_seq RESTART;
ALTER SEQUENCE test_id_test_seq RESTART;
ALTER SEQUENCE option_list_id_option_list_seq RESTART;
ALTER SEQUENCE question_id_question_seq RESTART;
ALTER SEQUENCE option_id_option_seq RESTART;
ALTER SEQUENCE answer_id_answer_seq RESTART;

-- DELETE RECORDS FOR TESTING
TRUNCATE "user",admin,campus,staff, student,course,enrolls,test,option_list,attendance,question,option,answer,question_test  CASCADE;

-- Inserting Dummy Values into tables
INSERT INTO "user" (password,email,first_name,last_name,modified,last_ip,last_login,avatar,description,joined,user_type)
	VALUES ('123456','laydohorte@vusra.com','Alirio','Lopez','2022-02-12','192.168.1.5','2022-08-12',NULL,NULL,'2022-02-12','student');

SELECT * from "user";
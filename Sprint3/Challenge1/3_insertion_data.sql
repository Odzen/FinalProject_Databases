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
	VALUES ('123456','laydohorte@vusra.com','Alirio','Lopez','2022-02-12','192.168.1.5','2022-08-12',NULL,NULL,'2022-02-12','student'),
	('123456','laydohorte1@vusra.com','Miguel','Peñaloza','2022-02-12','192.168.1.5','2022-08-12',NULL,NULL,'2022-02-12','admin'),
	('45645','sirop35923@mail.com','Alvaro','Uribe','2018-02-12','192.167.1.5','2022-08-12',NULL,NULL,'2022-02-12','admin'),
	('345jksdf','ttirop23981@gmail.com','Luis','Velez','2008-02-12','192.166.1.5','2022-08-12',NULL,NULL,'2022-02-12','staff'),
	('sff67','iirop345981@yandex.com','Gustavo','Petro','2012-02-12','192.163.1.6','2022-08-12',NULL,NULL,'2022-02-12','student'),
	('345kjbdsf','laydohorte234@vusra.com','Camilo','Gomez','2019-02-12','192.131.1.1','2022-08-12',NULL,NULL,'2022-02-12','staff'),
	('4j35b34kjb','sirop35981@fdgtourcc.com','Valeria','Franco','2017-02-12','192.148.1.4','2022-08-12',NULL,NULL,'2022-02-12','student'),
	('34kn5b34jhb','pirop35981@todfgurcc.com','Isabela','Vasquez','2022-11-12','192.168.1.6','2022-08-12',NULL,NULL,'2022-02-12','admin'),
	('53jk45bj','jsebastian.va@gmail.com','Juan','Velasquez','2022-06-12','192.168.1.2','2022-08-12',NULL,NULL,'2022-02-12','student'),
	('4k5b43','tirop35981@tsdfurcc.com','Luisa','Montoya','2016-02-23','192.234.1.6','2022-08-12',NULL,NULL,'2022-02-12','staff'),
	('kjdrgfb','laydohorte@amazon.com','Pepito','Perez','2022-02-12','192.233.1.7','2022-08-12',NULL,NULL,'2022-02-12','staff');

SELECT * from "user";
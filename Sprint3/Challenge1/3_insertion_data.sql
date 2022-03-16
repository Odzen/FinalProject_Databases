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
	VALUES 
		('123456','laydohorte@vusra.com','Alirio','Lopez','2022-02-12','192.168.1.5','2022-08-12',NULL,NULL,'2022-02-12','student'),
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

INSERT INTO "admin" (id_admin, id_user, created_by_admin)
	VALUES 
		('39485435', 2, '564563433'),
		('564563433', 3, '39485435'),
		('546767575', 8, '564563433');
		
INSERT INTO campus (location, name, id_admin)
	VALUES 
		('Cali', 'Meledez', '39485435'),
		('Cali', 'San Fernando', '39485435'),
		('Bogota', 'Sede1', '546767575'),
		('Medellin', 'Sede2', '564563433'),
		('Cali', 'Sede3', '546767575'),
		('Bogota', 'Sede4', '564563433');

INSERT INTO staff (id_staff, id_user, created_by_admin)
	VALUES 
		('1005869667', 4, '201744936'),
		('67463956', 6, '201744936'),
		('82475835', 10, '201544936'),
		('26373945', 11, '202244936');

INSERT INTO student (id_student, id_user, created_by_staff)
	VALUES
		('201744936', 1, '1005869667'),
		('202244936', 5, '67463956'),
		('201544936', 7, '82475835'),
		('202144936', 9, '1005869667');

INSERT INTO course (id_course, status, number_credits, name, id_staff, created_by_admin)
	VALUES
		('111023C', TRUE, 2, 'Matematicas', '1005869667', '39485435'),
		('111048M', TRUE, 1, 'Algebra', '1005869667', '564563433'),
		('111051M ', FALSE, 3, 'CalculoII', '67463956', '39485435')
		('750006C', TRUE, 3, 'Bases de Datos', '67463956', '564563433')
		('761130M', TRUE, 3, 'Estadistica', '67463956', '39485435')
		('750001C ', TRUE, 3, 'Sistemas Operativos', '26373945', '564563433')
		('106012C', FALSE, 2, 'FisicaI', '26373945', '564563433')

INSERT INTO enrolls(id_course, id_student, id_staff, date)
	VALUES('111023C', '201744936', '1005869667', '2022-02-12'),
		('761130M', '201744936', '67463956', '2022-02-12'),
		('111023C', '201744936', '1005869667', '2018-02-12'),
		('111048M', '201744936', '1005869667', '2017-02-12'),
		('111048M', '201744936', '1005869667', '2016-02-12'),
		('111048M', '201744936', '1005869667', '2022-02-12'),
		('750006C', '201744936', '67463956', '2020-02-12'),
		('106012C', '201744936', '26373945', '2022-02-12'),
		('750001C', '201744936', '26373945', '2022-02-12');
	
INSERT INTO test

--INSERT INTO option_list

--INSERT INTO attendance

--INSERT INTO question

--INSERT INTO option

--INSERT INTO answer

--INSERT INTO question_test




-- SELECT FOR CHECK THE CONTENT OF EACH TABLE TESTING
SELECT * from "user";
SELECT * from "admin";
SELECT * from campus;
SELECT * from staff;
SELECT * from student;
SELECT * from course;
SELECT * from enrolls;
SELECT * from test;
SELECT * from option_list;
SELECT * from attendance;
SELECT * from question;
SELECT * from option;
SELECT * from answer;
SELECT * from question_test;

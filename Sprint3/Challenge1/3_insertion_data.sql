-- RESTART SERIAL FIELDS FOR TESTING

ALTER SEQUENCE user_id_user_seq RESTART;
ALTER SEQUENCE campus_id_campus_seq RESTART;
ALTER SEQUENCE test_id_test_seq RESTART;
ALTER SEQUENCE option_list_id_option_list_seq RESTART;
ALTER SEQUENCE question_id_question_seq RESTART;
ALTER SEQUENCE option_id_option_seq RESTART;
ALTER SEQUENCE answer_open_id_answer_open_seq RESTART;
ALTER SEQUENCE answer_close_id_answer_close_seq RESTART;

-- DELETE RECORDS FOR TESTING
TRUNCATE "user",admin,campus,staff, student,course,enrolls,test,option_list,attendance,question,option,answer_close, answer_open,question_test  CASCADE;

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
		('1005869667', 4, '39485435'),
		('67463956', 6, '564563433'),
		('82475835', 10, '564563433'),
		('26373945', 11, '546767575');

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
		('111051M', FALSE, 3, 'CalculoII', '67463956', '39485435'),
		('750006C', TRUE, 3, 'Bases de Datos', '67463956', '564563433'),
		('761130M', TRUE, 3, 'Estadistica', '67463956', '39485435'),
		('750001C', TRUE, 3, 'Sistemas Operativos', '26373945', '564563433'),
		('106012C', FALSE, 2, 'FisicaI', '26373945', '564563433');

INSERT INTO enrolls(id_course, id_student, date)
	VALUES
		('111023C', '201744936', '2022-02-12'),
		('761130M', '202244936', '2022-02-12'),
		('111023C', '202144936', '2018-02-12'),
		('111048M', '201744936', '2017-02-12'),
		('111048M', '201544936', '2016-02-12'),
		('111048M', '202144936', '2022-02-12'),
		('750006C', '201544936', '2020-02-12'),
		('750001C', '201744936', '2022-02-12');
	
INSERT INTO test (name, status, description, release_date,id_course)
	VALUES
		('attendance1', TRUE, NULL, '2022-02-12', '111023C'),
		('attendance2', TRUE, NULL, '2022-02-12', '111048M'),
		('attendance3', FALSE, NULL, '2022-02-12', '111051M'),
		('attendance4', FALSE, NULL, '2022-02-12', '111051M'),
		('attendance5', TRUE, NULL, '2022-02-12', '750006C'),
		('attendance6', TRUE, NULL, '2022-02-12', '750006C'),
		('attendance7', TRUE, NULL, '2022-02-12', '761130M'),
		('attendance8', FALSE, NULL, '2022-02-12', '750001C');
	
INSERT INTO option_list (name)
	VALUES
		('option_list_1'),
		('option_list_2'),
		('option_list_3'),
		('option_list_4'),
		('option_list_5'),
		('option_list_6'),
		('option_list_7');

INSERT INTO attendance (id_test, id_student, date)
	VALUES 
		(1,'201744936', '2022-02-12'),
		(7,'202244936', '2022-03-12'),
		(2,'201544936', '2022-04-12'),
		(2,'202144936', '2022-02-12'),
		(2,'201744936', '2022-02-12'),
		(5,'201544936', '2022-01-12');
	
	
INSERT INTO question (description, type, id_option_list)
	VALUES
		('Enunciado1', 'open', NULL),
		('Enunciado2', 'open', NULL),
		('Enunciado3', 'open', NULL),
		('Enunciado4', 'close', 4),
		('Enunciado5', 'open', NULL),
		('Enunciado6', 'close', 6),
		('Enunciado7', 'close', 7),
		('Enunciado8', 'close', 1),
		('Enunciado9', 'close', 2),
		('Enunciado10', 'close', 3),
		('Enunciado11', 'open', NULL);

INSERT INTO option (literal, id_question, description, correct)
	VALUES 
		('a',4,'Opcion1', TRUE),
		('b',4,'Opcion2', FALSE),
		('c',4,'Opcion3', TRUE),
		('d',4, 'Opcion4', FALSE),
		('a',6, 'Opcion5', FALSE),
		('b',6, 'Opcion6', FALSE),
		('c',6, 'Opcion7', TRUE),
		('d',6, 'Opcion8', FALSE),
		('a',7, 'Opcion9', TRUE),
		('a',8, 'Opcion10', TRUE),
		('b',7, 'Opcion11', FALSE),
		('b',8, 'Opcion12', FALSE),
		('b',9, 'Opcion13', TRUE),
		('b',10, 'Opcion14', TRUE),
		('a',9, 'Opcion15', FALSE);


INSERT INTO answer_open (date, text, id_student, id_question)
	VALUES
		('2022-02-16 20:38:40','Answer3', '201744936',1),
		('2022-02-16 20:38:40','Answer4', '201544936',2),
		('2022-02-16 20:38:40','Answer5', '201744936',3),
		('2022-02-16 20:38:40','Answer6', '202144936',5),
		('2022-02-16 20:38:40','Answer7', '202244936',11);

INSERT INTO answer_close (date, option_selected, id_student)
	VALUES
		('2022-12-16 12:21:13', 1, '201744936'),
		('2021-12-16 12:21:13', 8, '202244936'),
		('2011-02-16 20:38:40', 12, '201544936'),
		('2022-02-16 20:38:40', 15, '202144936'),
		('2022-02-16 20:38:40', 14, '201744936'),
		('2022-02-16 20:38:40', 11, '202144936');

INSERT INTO question_test(id_question, id_test)
	VALUES
		(4,1), --close
		(6,7), --close
		(8,2), --close
		(9,2), --close
		(7,2), --close
		(10,1), --close
		(1,6), --open
		(2,5), --open
		(3,1), --open
		(5,2), --open
		(11,7); --open
		
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
SELECT * from answer_open;
SELECT * from answer_close;
SELECT * from question_test;
SELECT * from option;

-- Dropping tables for testing

DROP TABLE IF EXISTS "admin" CASCADE;
DROP TABLE IF EXISTS campus CASCADE;
DROP TABLE IF EXISTS staff CASCADE;
DROP TABLE IF EXISTS student CASCADE;
DROP TABLE IF EXISTS course CASCADE;
DROP TABLE IF EXISTS enrolls CASCADE;
DROP TABLE IF EXISTS "user" CASCADE;
DROP TABLE IF EXISTS test CASCADE;
DROP TABLE IF EXISTS option_list CASCADE;
DROP TABLE IF EXISTS attendance CASCADE;
DROP TABLE IF EXISTS question CASCADE;
DROP TABLE IF EXISTS option CASCADE;
DROP TABLE IF EXISTS answer_open CASCADE;
DROP TABLE IF EXISTS answer_close CASCADE;
DROP TABLE IF EXISTS question_test CASCADE;

--Table creation

CREATE TABLE "user"(
  id_user SERIAL,
  password VARCHAR(30) NOT NULL,
  email VARCHAR(30) NOT NULL,
  first_name VARCHAR(30) NOT NULL,
  last_name VARCHAR(30) NOT NULL,
  modified DATE NOT NULL,
  last_ip INET NOT NULL,
  last_login DATE NOT NULL,
  avatar bytea,
  description TEXT,
  joined DATE NOT NULL,
  user_type VARCHAR(30) NOT NULL,
  PRIMARY KEY (id_user)
);

CREATE TABLE admin(
  id_admin VARCHAR(30),
  id_user INT,
  created_by_admin VARCHAR(30),
  PRIMARY KEY (id_admin),
  CONSTRAINT "FK_admin.created_by_admin"
    FOREIGN KEY (created_by_admin)
      REFERENCES admin(id_admin)
		ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT "FK_staff.id_user"
    FOREIGN KEY (id_user)
	  REFERENCES "user"(id_user)
		ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE campus(
  id_campus SERIAL,
  location VARCHAR(30) NOT NULL,
  name VARCHAR(30) NOT NULL,
  id_admin VARCHAR(30),
  PRIMARY KEY (id_campus),
  CONSTRAINT "FK_campus.id_admin"
    FOREIGN KEY (id_admin)
      REFERENCES admin(id_admin)
		ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE staff (
  id_staff VARCHAR(30),
  id_user INT,
  created_by_admin VARCHAR(30),
  PRIMARY KEY (id_staff),
  CONSTRAINT "FK_staff.created_by_admin"
    FOREIGN KEY (created_by_admin)
      REFERENCES admin(id_admin)
		ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT "FK_staff.id_user"
    FOREIGN KEY (id_user)
	  REFERENCES "user"(id_user)
		ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE student (
  id_student VARCHAR(30),
  id_user INT,
  created_by_staff VARCHAR(30),
  PRIMARY KEY (id_student),
  CONSTRAINT "FK_student.created_by_staff"
    FOREIGN KEY (created_by_staff)
      REFERENCES staff(id_staff)
		ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT "FK_staff.id_user"
    FOREIGN KEY (id_user)
	  REFERENCES "user"(id_user)
		ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE course (
  id_course VARCHAR(30),
  status BOOLEAN NOT NULL,
  number_credits INT NOT NULL,
  name VARCHAR(30) NOT NULL,
  id_staff VARCHAR(30),
  created_by_admin VARCHAR(30),
  PRIMARY KEY (id_course),
  CONSTRAINT "FK_course.created_by_admin"
    FOREIGN KEY (created_by_admin)
      REFERENCES admin(id_admin)
		ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT "FK_course.id_staff"
    FOREIGN KEY (id_staff)
      REFERENCES staff(id_staff)
		ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE enrolls (
  id_course VARCHAR(30),
  id_student VARCHAR(30),
  date DATE NOT NULL,
  PRIMARY KEY (id_course, id_student),
  CONSTRAINT "FK_enrolls.id_student"
    FOREIGN KEY (id_student)
      REFERENCES student(id_student)
		ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT "FK_enrolls.id_course"
    FOREIGN KEY (id_course)
      REFERENCES course(id_course)
		ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE test (
  id_test SERIAL,
  name VARCHAR(30) NOT NULL,
  status BOOLEAN NOT NULL,
  description TEXT,
  release_date DATE NOT NULL,
  id_course VARCHAR(30),
  PRIMARY KEY (id_test),
  CONSTRAINT "FK_test.id_course"
    FOREIGN KEY (id_course)
      REFERENCES course(id_course)
		ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE option_list (
  id_option_list SERIAL,
  name VARCHAR(30) NOT NULL,
  PRIMARY KEY (id_option_list)
);

CREATE TABLE attendance (
  id_test INT,
  id_student VARCHAR(30),
  date DATE NOT NULL,
  PRIMARY KEY (id_test, id_student, date),
  CONSTRAINT "FK_attendance.id_student"
    FOREIGN KEY (id_student)
      REFERENCES student(id_student)
		ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT "FK_attendance.id_test"
    FOREIGN KEY (id_test)
      REFERENCES test(id_test)
		ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE question (
  id_question SERIAL,
  description TEXT NOT NULL,
  type VARCHAR(30) NOT NULL,
  id_option_list INT,
  PRIMARY KEY (id_question),
  CONSTRAINT "FK_question.id_option_list"
    FOREIGN KEY (id_option_list)
      REFERENCES option_list(id_option_list) 
		ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE option (
  id_option SERIAL,
  literal VARCHAR(1) NOT NULL,
  id_question INT,
  description VARCHAR(30) NOT NULL,
  correct BOOLEAN NOT NULL,
  PRIMARY KEY (id_option),
  CONSTRAINT "FK_option.id_question"
    FOREIGN KEY (id_question)
      REFERENCES question(id_question)
		ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE answer_close (
  id_answer_close SERIAL,
  date TIMESTAMP,
  option_selected INT,
  id_student VARCHAR(30),
  PRIMARY KEY (id_answer_close),
  CONSTRAINT "FK_answer.option_selected"
    FOREIGN KEY (option_selected)
      REFERENCES option(id_option)
		ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT "FK_answer.id_student"
    FOREIGN KEY (id_student)
      REFERENCES student(id_student)
		ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE answer_open (
  id_answer_open SERIAL,
  date TIMESTAMP,
  text TEXT NOT NULL,
  id_student VARCHAR(30),
  id_question INT,
  PRIMARY KEY (id_answer_open),
  CONSTRAINT "FK_answer.id_student"
    FOREIGN KEY (id_student)
      REFERENCES student(id_student)
		ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT "FK_answer.id_question"
    FOREIGN KEY (id_question)
      REFERENCES question(id_question)
		ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE question_test (
  id_question INT,
  id_test INT,
  PRIMARY KEY (id_question, id_test),
  CONSTRAINT "FK_question_test.id_question"
    FOREIGN KEY (id_question)
      REFERENCES question(id_question)
		ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT "FK_question_test.id_test"
    FOREIGN KEY (id_test)
      REFERENCES test(id_test)
		ON DELETE SET NULL ON UPDATE CASCADE
);




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
DROP TABLE IF EXISTS answer CASCADE;
DROP TABLE IF EXISTS question_test CASCADE;

--Table creation

CREATE TABLE "user" (
  id_user SERIAL,
  password VARCHAR(30),
  email VARCHAR(30),
  first_name VARCHAR(30),
  last_name VARCHAR(30),
  modified DATE,
  last_ip INET,
  last_login DATE,
  avatar TEXT,
  description TEXT,
  joined DATE,
  user_type VARCHAR(30),
  PRIMARY KEY (id_user)
);

CREATE TABLE admin (
  id_admin VARCHAR(30),
  id_user INT,
  created_by_admin VARCHAR(30),
  PRIMARY KEY (id_admin),
  CONSTRAINT "FK_admin.created_by_admin"
    FOREIGN KEY (created_by_admin)
      REFERENCES admin(id_admin),
  CONSTRAINT "FK_staff.id_user"
    FOREIGN KEY (id_user)
	  REFERENCES "user"(id_user)
);

CREATE TABLE campus (
  id_campus SERIAL,
  location VARCHAR(30),
  name VARCHAR(30),
  id_admin VARCHAR(30),
  PRIMARY KEY (id_campus),
  CONSTRAINT "FK_campus.id_admin"
    FOREIGN KEY (id_admin)
      REFERENCES admin(id_admin)
);

CREATE TABLE staff (
  id_staff VARCHAR(30),
  id_user INT,
  created_by_admin VARCHAR(30),
  PRIMARY KEY (id_staff),
  CONSTRAINT "FK_staff.created_by_admin"
    FOREIGN KEY (created_by_admin)
      REFERENCES admin(id_admin),
  CONSTRAINT "FK_staff.id_user"
    FOREIGN KEY (id_user)
	  REFERENCES "user"(id_user)
);

CREATE TABLE student (
  id_student VARCHAR(30),
  id_user INT,
  created_by_staff VARCHAR(30),
  PRIMARY KEY (id_student),
  CONSTRAINT "FK_student.created_by_staff"
    FOREIGN KEY (created_by_staff)
      REFERENCES staff(id_staff),
  CONSTRAINT "FK_staff.id_user"
    FOREIGN KEY (id_user)
	  REFERENCES "user"(id_user)
);

CREATE TABLE course (
  id_course VARCHAR(30),
  status BOOLEAN,
  number_credits INT,
  name VARCHAR(30),
  id_staff VARCHAR(30),
  created_by_admin VARCHAR(30),
  PRIMARY KEY (id_course),
  CONSTRAINT "FK_course.created_by_admin"
    FOREIGN KEY (created_by_admin)
      REFERENCES admin(id_admin),
  CONSTRAINT "FK_course.id_staff"
    FOREIGN KEY (id_staff)
      REFERENCES staff(id_staff)
);

CREATE TABLE enrolls (
  id_course VARCHAR(30),
  id_student VARCHAR(30),
  id_staff VARCHAR(30),
  date DATE,
  PRIMARY KEY (id_course, id_student, id_staff),
  CONSTRAINT "FK_enrolls.id_student"
    FOREIGN KEY (id_student)
      REFERENCES student(id_student),
  CONSTRAINT "FK_enrolls.id_course"
    FOREIGN KEY (id_course)
      REFERENCES course(id_course),
  CONSTRAINT "FK_enrolls.id_staff"
    FOREIGN KEY (id_staff)
      REFERENCES staff(id_staff)
);

CREATE TABLE test (
  id_test SERIAL,
  name VARCHAR(30),
  status BOOLEAN,
  description TEXT,
  release_date DATE,
  created_by_staff VARCHAR(30),
  id_course VARCHAR(30),
  PRIMARY KEY (id_test),
  CONSTRAINT "FK_test.created_by_staff"
    FOREIGN KEY (created_by_staff)
      REFERENCES staff(id_staff),
  CONSTRAINT "FK_test.id_course"
    FOREIGN KEY (id_course)
      REFERENCES course(id_course)
);

CREATE TABLE option_list (
  id_option_list SERIAL,
  name VARCHAR(30),
  PRIMARY KEY (id_option_list)
);

CREATE TABLE attendance (
  id_test INT,
  id_course VARCHAR(30),
  id_student VARCHAR(30),
  date DATE,
  PRIMARY KEY (id_test, id_course, id_student),
  CONSTRAINT "FK_attendance.id_student"
    FOREIGN KEY (id_student)
      REFERENCES student(id_student),
  CONSTRAINT "FK_attendance.id_course"
    FOREIGN KEY (id_course)
      REFERENCES course(id_course),
  CONSTRAINT "FK_attendance.id_test"
    FOREIGN KEY (id_test)
      REFERENCES test(id_test)
);

CREATE TABLE question (
  id_question SERIAL,
  description TEXT,
  type VARCHAR(30),
  id_option_list INT,
  PRIMARY KEY (id_question),
  CONSTRAINT "FK_question.id_option_list"
    FOREIGN KEY (id_option_list)
      REFERENCES option_list(id_option_list) ON DELETE SET NULL
);

CREATE TABLE option (
  id_option SERIAL,
  id_option_list INT,
  PRIMARY KEY (id_option),
  CONSTRAINT "FK_option.id_option_list"
    FOREIGN KEY (id_option_list)
      REFERENCES option_list(id_option_list)
);

CREATE TABLE answer (
  id_answer SERIAL,
  date DATE DEFAULT CAST(NOW() AS DATE),
  text TEXT,
  option_selected INT,
  id_student VARCHAR(30),
  id_question INT,
  PRIMARY KEY (id_answer),
  CONSTRAINT "FK_answer.option_selected"
    FOREIGN KEY (option_selected)
      REFERENCES option(id_option),
  CONSTRAINT "FK_answer.id_student"
    FOREIGN KEY (id_student)
      REFERENCES student(id_student),
  CONSTRAINT "FK_answer.id_question"
    FOREIGN KEY (id_question)
      REFERENCES question(id_question)
);

CREATE TABLE question_test (
  id_question INT,
  id_test INT,
  PRIMARY KEY (id_question, id_test),
  CONSTRAINT "FK_question_test.id_question"
    FOREIGN KEY (id_question)
      REFERENCES question(id_question),
  CONSTRAINT "FK_question_test.id_test"
    FOREIGN KEY (id_test)
      REFERENCES test(id_test)
);




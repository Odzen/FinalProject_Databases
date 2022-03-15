# Web-based Attendance Management System
## Problem and Motivation
Nowadays, due to the sanitary emergence  of COVID-19, classrooms have moved to distance education and keeping track of large numbers of students is difficult. It is common and at some institutions it is mandatory for attendance to be monitored. In several Universidad del Valle centers the attendance is taken manually or with unofficial computer tools. It is not only time consuming for teachers and students in every class, it is also insecure and unreliable. Attendance is a key element in educational research. It may reveal relationships between student family background, location, resources and university attendance.

To overcome these problems a web based system to keep safe the students attendance information of all courses, teachers and particular students. With easy access and report download automatically.

## Purpose, Scope and objectives
Its purpose is to make a web based attendance management for a center of Universidad del Valle to register the student details; name, student code, enroll courses and so forth. Attendance is taken automatically, the student gets a URL from the teacher and types their student code and answers a validation question. The attendance report will be generated automatically by the teacher without time consuming.

### Objectives
Design  a conceptual diagram using ER model
Design  a conceptual diagram using Relational model
Apply 1NF,2NF,3NF and BCNF to Relational diagram
Improve a prototype of system for attendance management

## General description:
Administrators can configure the attendance management authority, add other admins or staff users, view and export the attendance data from the Attendance Admin Module. Although the administrator can view all modules the Staff members can enroll students to the courses in the system. All users have an id, a name, email, password, description, avatar. The system also has control over joined, modified, last login, last IP from user access and who created the user. To check attendance a student accesses through the browser and with his/her student code the system shows a validation test. The test has between 1 and 3 questions of type open or close, the open questions presents an input box while close could be dichotomous (YES or NOT) or polyatomics (A scale of 1 to N or A,B,C,D). Each Test has an id, name, status description, release date according to the course. All questions have an id, description, type. All option lists have an id and name and each option has a relation with options list to which it belongs. The student attendance and answers are saved by the system. The student attendance has a user who checks attendance, course, date and test. The student answer has a user  who responds to the test, question identifier, option selected o text and answer date.

## System actors:
The attendance system has three main actors.
Administrator who runs, manages and adds other system users. The admin creates the courses and adds staff. 
Staff can add students to the system and enroll to courses, create test, questions and options list
Students after login select a course, check your attendance and answer a short question. The students can manage his account, change avatar, view his attendance reports.



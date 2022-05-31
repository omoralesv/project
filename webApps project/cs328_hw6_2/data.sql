/*
Omar Morales
CS 328
Last modified: 4/26/22
*/

prompt
prompt create tables
prompt


drop table quiz cascade constraints;

create table quiz
(
  fname		varchar2(30),
  lname		varchar2(50),
  q1		varchar2(25),
  q2		varchar2(25),
  q3 		varchar2(25),
  q4		varchar2(25),
  q5		varchar2(25),
  q6		varchar2(25),
  score		integer,
  quiz_date	date,
  primary key  (lname,fname,quiz_date)
);


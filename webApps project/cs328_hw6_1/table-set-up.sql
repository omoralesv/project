/*
Omar Morales
CS 328
Last modified: 4/26/22
*/

prompt
prompt create tables
prompt


drop table arch cascade constraints;

create table arch
(
  fname		varchar2(30),
  lname		varchar2(50),
  address	varchar2(70),
  city		varchar2(70),
  state		char(2),
  telephone	varchar2(13),
  email		varchar2(70),
  bname		varchar2(70),
  bheight	number,
  brooms	number,
  description	varchar(500),
  form_date	date,
  primary key  (lname,bname,form_date)
);



insert into arch
values ('John','Smith','123 street','Arcata','CA','123 123 1234','abc@email.com','house',10,2,'description','10-FEB-22');


insert into arch
values ('Jane','Smith','345 street','Arcata','CA','678 912 3456','efg@email.com','bank',20,2,'description','17-DEC-21');


insert into arch
values ('Jerry','Seinfeld','789 street','New York','NY','111 111 1111','asdf@email.com','apartment',10,4,'description','17-DEC-96');


insert into arch
values ('George','Costanza','567 street','New York','NY','222 222 2222','ghjk@email.com','office',40,10,'description','17-JAN-87');




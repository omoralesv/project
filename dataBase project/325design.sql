/* 
Omar Morales
Cs 325 - Fall 2021
Last modified: 12/8/2021
*/

prompt 
prompt 325 design
prompt

 
--keeps track of all empolyees

drop table empl cascade constraints;

create table empl
(empl_id	char(5),
 position	varchar2(15) not null,
 primary key (empl_id)
);



-- keeps track of sales rep. information

drop table sales_rep cascade constraints; 

create table sales_rep
(empl_id	char(5), 
 date_hired	date,
 fname		varchar2(15) not null,
 lname		varchar2(15) not null,
 email		varchar2(25),
 primary key 	(empl_id,date_hired),
 foreign key 	(empl_id) references empl
);



--keeps track of owner info
--store id is the store that the owner is in charge of

drop table owner cascade constraints;

create table owner
(empl_id	char(5),
 store_id	char(3),
 fname		varchar2(15) not null,
 lname		varchar2(15) not null,
 email		varchar2(25) not null,
 primary key	(empl_id, store_id),
 foreign key 	(empl_id) references empl
);



--keeps track of all employee phone numbers

drop table phone_nums cascade constraints;

create table phone_nums
(empl_id	char(5),
 phone		char(7),
 phone_type	varchar2(15),
 primary key	(empl_id,phone),
 foreign key	(empl_id) references empl
);




/*
-list of all popsicle flavors
-ohc stands for on hand count or the
 amount of that produce that the store currenly has 
 availbe for purchase
*/

drop table popsicles cascade constraints;

create table popsicles
(stock_id	char(4),
 pop_type	varchar2(20),
 flavor 	varchar2(35),
 ohc		number check(ohc between 0 and 500),
 primary key	(stock_id)
);



--keeps track of reward customers

drop table r_customer;

create table r_customer
(cust_id	char(6),
 lname		varchar2(20),
 fname		varchar2(20),
 email		varchar2(30),
 pop_bought	number check(pop_bought > 0),
 primary key 	(cust_id)
);



--keeps track of sales

drop table sales cascade constraints;

create table sales
(empl_id	char(5),
 stock_id	char(4),
 date_sold	date,
 primary key	(empl_id,stock_id),
 foreign key 	(empl_id) references empl,
 foreign key	(stock_id) references popsicles
);



--keeps track of vendors

drop table vendor cascade constraints;

create table vendor
(vend_id	char(5),
 comp_name	varchar2(35),
 pop_type	varchar2(20),
 primary key	(vend_id)
);



-- keeps track of vendor phone numbers

drop table vend_phones cascade constraints;

create table vend_phones
(vend_id	char(5),
 vendor_phone	char(10),
 primary key	(vend_id,vendor_phone),
 foreign key	(vend_id) references vendor
);

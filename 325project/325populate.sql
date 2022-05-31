/*
Omar Morales
Cs 325 - Fall 2021
Last modified: 12/9/21
*/

prompt 
prompt 325 Populate 
prompt


delete from vend_phones;
delete from vendor;
delete from sales;
delete from r_customer;
delete from popsicles;
delete from phone_nums;
delete from owner;
delete from sales_rep;
delete from empl;


insert into empl
values
('11111','sales rep');


insert into empl
values
('22222','sales rep');

insert into empl
values
('33333','sales rep');

insert into empl
values
('44444','sales rep');

insert into empl
values
('55555','sales rep');

insert into empl
values
('66666','sales rep');

insert into empl
values
('77777','sales rep');

insert into empl
values
('88888','sales rep');

insert into empl
values
('99999','sales rep');

insert into empl
values
('00000','sales rep');

insert into empl
values
('12345','owner');

insert into empl
values
('67890','owner');



insert into sales_rep
values
('11111','01-JAN-2010','Jerry','Seinfeld','jSeinfeld@gmail.com');

insert into sales_rep
values
('22222','02-FEB-2011','George','Costanza','gCostanza@gmail.com');

insert into sales_rep
values
('33333','03-Mar-2012','Elaine','Benes','eBenes@gmail.com');

insert into sales_rep
values
('44444','04-APR-2013','Cosmo','Kramer','cKramer@gmail.com');

insert into sales_rep
values
('55555','05-MAY-2014','Frank','Costanza','fCostanza@gmail.com');

insert into sales_rep
values
('66666','06-JUN-2015','Estelle','Costanza','eCostanza@gmail.com');

insert into sales_rep
values
('77777','07-JUL-2016','Morty','Seinfeld','mSeinfeld@gmail.com');

insert into sales_rep
values
('88888','08-AUG-2017','Helen','Seinfeld','hSeinfeld@gmail.com');

insert into sales_rep
values
('99999','09-Sep-2018','Susan','Ross','sRoss@gmail.com');

insert into sales_rep
values
('00000','10-OCT-2019','Newman','Newman','newman@gmail.com');



insert into owner
values
('12345', '111', 'George', 'Steinbrenner', 'gSteinbrenner@gmail.com');   

insert into owner
values
('67890', '222', 'Jackie', 'Chiles', 'jChiles@gmail.com');




insert into phone_nums
values
('11111','1234567','cell');

insert into phone_nums
values
('11111','1234589','home');

insert into phone_nums
values
('22222','1111111','cell');

insert into phone_nums
values
('22222','1111222','cell');

insert into phone_nums
values
('67890','2222222','cell');

insert into phone_nums
values
('67890','3333333','work');

insert into phone_nums
values
('67890','4444444','home');

insert into phone_nums
values
('12345','5555555','cell');

insert into phone_nums
values
('12345','6666666','work');

insert into phone_nums
values
('55555','5667778','cell');

insert into phone_nums
values
('66666','1223334','work');



insert into popsicles
values
('1111','water', 'strawberry', 100);

insert into popsicles 
values
('2222','milk', 'strawberry', 150);

insert into popsicles 
values
('3333','water', 'lime', 300);

insert into popsicles 
values
('4444','milk', 'coconut', 200);

insert into popsicles 
values
('5555','milk', 'Cookies and cream', 300);

insert into popsicles 
values
('6666','chile', 'pepino con chile', 100);

insert into popsicles 
values
('7777','chile', 'mangonada', 200);

insert into popsicles 
values
('8888','water', 'Jamaica', 400);

insert into popsicles 
values
('9999','milk', 'rum raisin', 100);

insert into popsicles 
values
('1337','water', 'Guava', 100);

insert into popsicles
values
('2000','milk', 'cream', 170);

insert into popsicles
values
('9876','milk', 'chocolate', 150);




insert into r_customer
values
('111111','The', 'Egg', 'tEgg@gmail.com',5);

insert into r_customer
values
('222222','Bat', 'Boy',	'bBoy@gmail.com',6);

insert into r_customer
values
('333333','Burgah', 'Boy','burgah@gmail.com',20);

insert into r_customer
values
('444444','Danny', 'Devito','dDavito@gmail.com',7);

insert into r_customer
values
('55555','Glue', 'Man',	'gMan@gmail.com',5);

insert into r_customer
values
('666666','Pac', 'Man',	'pacMan@gmail.com',15);

insert into r_customer
values
('777777','Gabe', 'Newell','gaben@gmail.com',30);

insert into r_customer
values
('888888','Martin Van', 'Buren','mvBuren@gmail.com',1);

insert into r_customer
values
('999999','Frank', 'Pizza','fPizza@gmail.com',5);

insert into r_customer
values
('123456','Giant', 'Rat','gRat@gmail.com',40);



insert into sales 
values
('11111','1111', sysdate);

insert into sales
values
('11111','2222', sysdate);

insert into sales
values
('11111','3333', sysdate);

insert into sales
values
('11111','4444', sysdate);

insert into sales
values
('22222','1111', sysdate);

insert into sales
values
('22222','5555', sysdate);

insert into sales
values
('22222','6666', sysdate);

insert into sales
values
('33333','6666', sysdate);

insert into sales
values
('33333','7777', sysdate);

insert into sales
values
('33333','1111', sysdate);

insert into sales
values
('44444','9999', sysdate);

insert into sales
values
('44444','6666', sysdate);

insert into sales
values
('44444','7777', sysdate);

insert into sales
values
('44444','1111', sysdate);



insert into vendor
values
('11111', 'fruit yup', 'water');

insert into vendor
values
('22222', 'Jolly goods', 'water');

insert into vendor
values
('33333', 'water pops', 'water');

insert into vendor
values
('44444', 'cows? sure', 'milk');

insert into vendor
values
('55555', 'cream and stuff', 'milk');

insert into vendor
values
('66666', 'dare-E', 'milk');

insert into vendor
values
('77777', 'spicy nugget', 'chile');

insert into vendor
values
('88888', 'Aww mustard', 'chile');

insert into vendor
values
('99999', 'Cafe pop', 'milk');

insert into vendor
values
('00000', 'Air pops', 'chile');



insert into vend_phones
values
('11111','1234567890');

insert into vend_phones
values
('11111','1111111111');

insert into vend_phones
values
('22222','2222222222');

insert into vend_phones
values
('33333','3333333333');

insert into vend_phones
values
('44444','4444444444');

insert into vend_phones
values
('55555','5555555555');

insert into vend_phones
values
('66666','6666666666');

insert into vend_phones
values
('77777','7777777777');

insert into vend_phones
values
('88888','8888888888');

insert into vend_phones
values
('99999','9999999999');

insert into vend_phones
values
('00000','1234561234');

insert into vend_phones
values
('00000','7539512365');

insert into vend_phones
values
('00000','1472583690');









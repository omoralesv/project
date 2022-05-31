/*
Omar Morales
Cs 325 - Fall 2021
Last Modified: 12/10/21
*/

spool 325query-results.txt

prompt 
prompt 325 Queries
prompt


prompt 
prompt Query #1  
prompt Who are all the employees at the Business and what are their positions?
prompt

 (select fname,lname ,position
 from empl e,sales_rep s
 where e.empl_id = s.empl_id)
union
 (select fname, lname ,position
 from empl e, owner o
 where e.empl_id = o.empl_id)
order by position;



prompt
prompt 
prompt Query #2	
prompt How many popsicles have been sold?

select count(*) "Popsicles Sold"
from sales;




prompt
prompt
prompt Query #3
prompt How many of each flavor has been sold?

select stock_id, count(*) "Sold"
from sales
group by stock_id;




prompt
prompt
prompt Query #4
prompt Who is the newest hire with the position of sales rep?

select *
from sales_rep
where date_hired =(select max(date_hired)
		   from sales_rep);



prompt
prompt
prompt Query #5
prompt Which vendors sell water type popsicles?

select vend_id,comp_name Name
from vendor
where pop_type = 'water';




prompt
prompt
prompt Query #6
prompt Which reward customers buy more popsicles than average?

select cust_id id, lname,fname,pop_bought
from r_customer
where pop_bought > (select avg(pop_bought)
		    from r_customer);

 


prompt
prompt
prompt Query #7
prompt Which milk based flavors have an on hand count of more than 150?

select stock_id id,flavor, ohc
from popsicles
where pop_type = 'milk' and ohc > 150;




prompt
prompt
prompt Query #8
prompt What are the phone numbers of the vendors that sell chile popsicles?

select v.vend_id id,comp_name name,vendor_phone phone
from vendor v,vend_phones p
where v.vend_id = p.vend_id and pop_type = 'chile'
order by name;

spool off

/*
Omar Morales
Cs 325 - Fall 2021
Last modified: 12/10/21
*/

prompt 
prompt 325 Table Contents
prompt


spool 325result-contents.txt

prompt
prompt ========
prompt Empl
prompt ========

select empl_id ID, position 
from empl;



prompt
prompt ==========
prompt Sales_rep  
prompt ==========

select * 
from sales_rep;



prompt
prompt ========
prompt owner  
prompt ========

select * 
from owner;



prompt
prompt ===========
prompt phone_nums  
prompt ===========

select * 
from phone_nums;


prompt
prompt ===========
prompt r_customer  
prompt ===========

select cust_id id,lname,fname,email
from r_customer;

select cust_id, pop_bought
from r_customer;



prompt
prompt ========
prompt Popsicles  
prompt ========

select *
from popsicles;



prompt
prompt ========
prompt Sales  
prompt ========


select * 
from sales;



prompt
prompt ========
prompt Vendor  
prompt ========


select * 
from vendor;



prompt
prompt ============
prompt vend_phones  
prompt ============


select *
from vend_phones;


spool off


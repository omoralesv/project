/*
Omar Morales
Cs 325 - Fall 2021
Last modified: 12/10/21
*/

spool 325report3-results.txt

ttitle "Top Patrons"
set pagesize 40
col pop_bought heading "Popsicles Bought"
col name format a20 tru

select lname || ' '|| fname "Name",pop_bought 
from r_customer
order by pop_bought desc;

ttitle off


ttitle "Average Popsicles Bought per Customer"
col average format 99999.99

select avg(pop_bought) "Average"
from r_customer;



clear
ttitle off

spool off

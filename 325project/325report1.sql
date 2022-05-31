/*
Omar Morales
Cs 325 - Fall 2021
Last modified: 12/10/21
*/

spool 325report1-results.txt

ttitle "List of all Employees: | with Job Tiles "
set pagesize 20
prompt

col position heading "Job Title"
break on position skip 1

(select fname || ' ' || lname "Name" ,position
 from empl e,sales_rep s
 where e.empl_id = s.empl_id)
union
 (select fname || ' ' || lname "Name",position
 from empl e, owner o
 where e.empl_id = o.empl_id)
order by position;



clear
ttitle off
set pagesize 14

spool off

/*
Omar Morales
Cs 325 - Fall 2021
Last modified: 12/10/21
*/

spool 325report2-result.txt

ttitle "Popsicles that need| to be resupplied"
set pagesize 40
set linesize 130
col stock_id heading "Stock| ID" format a5 TRU
col flavor heading "Flavor" format a23
col comp_name heading "Company| Name" format a23 TRU
col vendor_phone heading "Phone"
break on flavor skip 2
compute count label 'Number of Vendors' of comp_name on flavor
col ohc format 999
col phone format 9999999999



select stock_id,flavor,ohc,comp_name,vendor_phone
from popsicles p,vendor v,vend_phones vp
where ohc <= 150 and v.vend_id = vp.vend_id and v.pop_type = p.pop_type
order by stock_id; 


set heading on
ttitle off
clear
set pagesize 14
set linesize 80

spool off

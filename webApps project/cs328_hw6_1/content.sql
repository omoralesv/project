ttitle "Submissions"
set pagesize 40
set linesize 150
col fname heading "First|Name" format a10 TRU
col lname heading "Last |Name" format a15 TRU
col city heading "City" format a10
col state heading "State" format a5 TRU
col bname heading "Building | Name" format a15 
col bheight heading "Height | (meters)" format 999
col brooms heading "Rooms" format 999
col form_date heading "Date|Entered"
col address heading "Address" format a15
col email format a15
col description heading "Description" format a15 


select * 
from arch
order by state,lname;



set heading on
ttitle off
clear
set pagesize 14
set linesize 80

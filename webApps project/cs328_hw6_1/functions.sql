/*
Omar Morales 
Cs 328
project problem 1
last modified: 4/27/2022
*/

set serveroutput on

Create or Replace Procedure clean
is
	
Begin
	
	delete from arch 
	where form_date < TRUNC(ADD_MONTHS(sysdate,-12)); 
	

end clean;
/


create or Replace Function inState (value char)
return integer is

total integer;

Begin
	total:=0;

	select count(*)
	into total
	from arch
	where state = value;

	return total;
end;
 
	
/

show errors

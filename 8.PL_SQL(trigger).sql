--TRIGGER
set serveroutput on
create or replace TRIGGER tr before update or insert on Ambulance for each row
declare
    min_rating constant number(3,2):=3.00;
    max_rating constant number(3,2):=5.00;
begin
  if :new.rating<min_rating 
      OR 
    :new.rating>max_rating 
  then
  raise_application_error(-20000, 'Rating is too low or high');
  end if;
end;
/
insert into Ambulance values(6,'arjun',12345,2.44);
insert into Ambulance values(6,'arjun',12345,4.44);
insert into Ambulance values(6,'arjun',12345,5.44);
drop TRIGGER tr;



-- Transaction Manager
commit;

delete from Doctor;
select * from Doctor;

rollback;
select * from Doctor;


-- SavePoint

savepoint S1;
delete from Doctor;
select * from Doctor;
savepoint S2;

rollback to S1;
select * from Doctor;


--date & time
select sysdate from dual;
select current_date from dual;
select systimestamp from dual;

select doctorID,speciality,DOB 
from Doctor
where DOB>(select sysdate from dual);
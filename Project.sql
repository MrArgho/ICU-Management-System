drop table chamber;
drop table Ambulance_service;
drop table BloodBank_service;
drop table providingICU;
drop table Blood_bank;
drop table ICU_facilities;
drop table Doctor;
drop table Ambulance;
drop table Hospital;

create table Blood_bank(
  blood_type varchar(3) not null,
  quantity_available number(4),
  primary key(blood_type)
);

create table Doctor(
  doctorID number(3) not null,
  Name varchar(30),
  contact number(15),
  speciality varchar(35),
  DOB date,
  primary key(doctorID)
);

create table ICU_facilities(
  EquipmentID number(3) not null,
  Name varchar(50),
  Description varchar(300),
  primary key(EquipmentID)
);

create table Ambulance(
  ambulanceID number(3) not null,
  Driver_name varchar(30),
  contact number(15),
  rating number(2,1),
  primary key(ambulanceID)
);

create table Hospital(
  HospitalID number(3) not null,
  Name varchar(70),
  Address varchar(20),
  contact number(15),
  Available_ICU number(3),
  cost_per_hour number(6),
  primary key(HospitalID)
);

create table chamber(
  doctorID number(3) not null,
  HospitalID number(3) not null,
  primary key(doctorID,HospitalID),
  foreign key(doctorID) references Doctor(doctorID) on delete CASCADE,
  foreign key(HospitalID) references Hospital(HospitalID) on delete CASCADE
);

create table Ambulance_service(
  ambulanceID number(3) not null,
  HospitalID number(3) not null,
  primary key(ambulanceID,HospitalID),
  foreign key(ambulanceID) references Ambulance(ambulanceID) on delete CASCADE,
  foreign key(HospitalID) references Hospital(HospitalID) on delete CASCADE
);

create table BloodBank_service(
  blood_type varchar(3) not null,
  HospitalID number(3) not null,
  primary key(blood_type,HospitalID),
  foreign key(blood_type) references Blood_bank(blood_type) on delete CASCADE,
  foreign key(HospitalID) references Hospital(HospitalID) on delete CASCADE
);

create table providingICU(
  EquipmentID number(3) not null,
  HospitalID number(3) not null,
  primary key(EquipmentID,HospitalID),
  foreign key(EquipmentID) references ICU_facilities(EquipmentID) on delete CASCADE,
  foreign key(HospitalID) references Hospital(HospitalID) on delete CASCADE
);

describe chamber;
describe Ambulance_service;
describe BloodBank_service;
describe providingICU;
describe Blood_bank;
describe ICU_facilities;
describe Doctor;
describe Ambulance;
describe Hospital;



insert into Blood_bank values ('A+',55);
insert into Blood_bank values ('A-',49);
insert into Blood_bank values ('B+',95);
insert into Blood_bank values ('B-',32);
insert into Blood_bank values ('O+',66);
insert into Blood_bank values ('O-',30);
insert into Blood_bank values ('AB+',27);
insert into Blood_bank values ('AB-',71);

insert into Doctor values (1,'Dr. Argho Deb Das',01758567895,'Pathology','21-JUL-98');
insert into Doctor values (2,'Dr. Pushpita Das',01301343673,'Neurology','21-JAN-25');
insert into Doctor values (3,'Dr. Taslima Joty',01234567891,'Ophthalmology','19-FEB-99');
insert into Doctor values (4,'Dr. Hriddhi Sarker',01758562345,'Psychiatry','19-MAY-10');
insert into Doctor values (5,'Dr. Arjun Singh',01758567805,'Surgery','19-FEB-19');

insert into ICU_facilities values (1,'ICU BEDSIDE MONITORS','provides real-time information like heart rate, blood pressure, body temperature etc');
insert into ICU_facilities values (2,'INDWELLING URINARY CATHETER (IDC)','measures the amount of urine they produce');
insert into ICU_facilities values (3,'SEQUENTIAL COMPRESSION DEVICES','Used in intensive care to reduce the risk of deep vein thrombosis(DVT)');
insert into ICU_facilities values (4,'BEDS','Specially designed to be able to meet the unique needs of critically ill patients');
insert into ICU_facilities values (5,'VENTILATOR','Supports patients to breathe for themselves');

insert into Ambulance values (1,'Mahadi Ankon',01123456144,4.5);
insert into Ambulance values (2,'Mahmood Shafin',01123456441,4.6);
insert into Ambulance values (3,'Hefzul Papon',01123145644,4.1);
insert into Ambulance values (4,'Faiaz Sadi',01112345644,3.9);
insert into Ambulance values (5,'Nur Mehedi',01123145644,4.7);

insert into Hospital values (1,'Khulna Medical College Hospital','Khulna',041761531,23,1500);
insert into Hospital values (2,'Khulna City Medical College','Khulna',01999099099,33,3000);
insert into Hospital values (3,'Jashore Police Hospital','Jashore',041723505,23,1000);
insert into Hospital values (4,'Jashore Nursing Home','Jashore',041723572,10,1700);
insert into Hospital values (5,'City Nursing Home','dhaka',041724329,12,1300);

insert into chamber values (1,1);
insert into chamber values (1,2);
insert into chamber values (3,2);
insert into chamber values (4,2);
insert into chamber values (5,5);

insert into Ambulance_service values (1,2);
insert into Ambulance_service values (2,2);
insert into Ambulance_service values (3,4);
insert into Ambulance_service values (1,5);
insert into Ambulance_service values (3,2);

insert into BloodBank_service values ('A+',1);
insert into BloodBank_service values ('A-',1);
insert into BloodBank_service values ('B+',2);
insert into BloodBank_service values ('B-',3);
insert into BloodBank_service values ('O+',2);
insert into BloodBank_service values ('O-',3);
insert into BloodBank_service values ('AB+',5);
insert into BloodBank_service values ('AB-',4);

insert into providingICU values (1,2);
insert into providingICU values (2,2);
insert into providingICU values (5,2);
insert into providingICU values (3,2);
insert into providingICU values (5,4);

select * from chamber;
select * from Ambulance_service;
select * from BloodBank_service;
select * from providingICU;
select * from Blood_bank;
select * from ICU_facilities;
select * from Doctor;
select * from Ambulance;
select * from Hospital;


---------------------------------------------------------------------------


--DML
--add column
alter table Hospital add Founding_Date varchar(5);
describe Hospital;

--rename column
alter table Hospital rename column Founding_Date to F_Date;
describe Hospital;

--modify column
alter table Hospital modify F_Date number(4);
describe Hospital;

--drop column
alter table Hospital drop column F_Date;
describe Hospital;

--update value
select * from Doctor;
update Doctor set contact=01234569 where doctorID=1;
select * from Doctor;

-- delete values
select * from Doctor;
delete from Doctor where doctorID=5;
select * from Doctor;
insert into Doctor values (5,'Dr. Arjun Singh',01758567805,'Surgery');

--view
CREATE VIEW Hospital_OF_Jashore AS
SELECT hospitalID, address, contact
FROM Hospital
WHERE address = 'Jashore';
SELECT * FROM Hospital_OF_Jashore;
DROP VIEW Hospital_OF_Jashore;


--------------------------------------------------------------------------------


--select & aggregate
-- Applying Conditions using select
select HospitalID,address, contact from Hospital where HospitalID=1;

-- Applying range search
select HospitalID,address,cost_per_hour from Hospital where cost_per_hour between 1000 and 1700;
select HospitalID,Address,cost_per_hour from Hospital where cost_per_hour IN(1000,1700);

-- Sort by columns
select HospitalID, address,cost_per_hour from Hospital order by cost_per_hour;

--mathematic Calculation and use of AS
select HospitalID, (cost_per_hour/10) as NEW_COST from Hospital where cost_per_hour>1000; 

-- String Matching
select HospitalID, cost_per_hour, Available_ICU,address from Hospital where address like '%ul%';

-- Aggregate Functions
select max(cost_per_hour) from Hospital;
select min(rating) from Ambulance;
select sum(quantity_available) from Blood_bank;
select count(doctorID) from Doctor;
select count(distinct(doctorID)) from Doctor;
select avg(cost_per_hour) from Hospital;
select avg(nvl(cost_per_hour,0)) from Hospital;

-- Group By
select max(cost_per_hour),address from Hospital 
group by address;

-- Having Clause
select address,max(cost_per_hour) from Hospital 
group by address
having address='Khulna';



------------------------------------------------------------------------------



--UNIONSSSS
-- Nested Query 
select blood_type, quantity_available
from Blood_bank
where blood_type IN(
    select blood_type
    from Blood_bank
    where blood_type like '%A%'
);

-- Union All
select blood_type, quantity_available
from  Blood_bank
where quantity_available>50
union all
select blood_type, quantity_available
from  Blood_bank
where quantity_available<60;

-- Union 
select blood_type, quantity_available
from  Blood_bank
where quantity_available>50
union 
select blood_type, quantity_available
from  Blood_bank
where quantity_available<60;

-- Intersect
select blood_type, quantity_available
from  Blood_bank
where quantity_available>50
intersect
select blood_type, quantity_available
from  Blood_bank
where quantity_available<60;

-- Minus
select blood_type, quantity_available
from  Blood_bank
where quantity_available>50
minus
select blood_type, quantity_available
from  Blood_bank
where quantity_available<60;

--NESTED
select blood_type, quantity_available
from  Blood_bank
where quantity_available>50
intersect
(select blood_type, quantity_available
from  Blood_bank
where quantity_available>50
union
select blood_type, quantity_available
from  Blood_bank
where quantity_available<60);



------------------------------------------------------------------------------------


--joinsss
--join
select blood_type, bb.quantity_available, bbs.HospitalID
  from Blood_bank bb join BloodBank_service bbs
using (blood_type);

--natural join
select blood_type, bb.quantity_available, bbs.HospitalID
  from Blood_bank bb natural join BloodBank_service bbs;

-- Inner Join
select blood_type, bb.quantity_available, bbs.HospitalID
  from Blood_bank bb Inner Join BloodBank_service bbs
using (blood_type);

-- Cross Join
select bb.quantity_available, bbs.HospitalID
  from Blood_bank bb Cross Join BloodBank_service bbs;

-- Left Outer Join
select blood_type, bb.quantity_available, bbs.HospitalID
  from Blood_bank bb Left Outer Join BloodBank_service bbs
using (blood_type);

-- Right Outer Join
select blood_type, bb.quantity_available, bbs.HospitalID
  from Blood_bank bb Right Outer Join BloodBank_service bbs
using (blood_type);

-- Full Outer Join
select blood_type, bb.quantity_available, bbs.HospitalID
  from Blood_bank bb Full Outer Join BloodBank_service bbs
using (blood_type);

--self join
select p.speciality, q.name
from Doctor p join Doctor q
on p.doctorID=q.doctorID;


-----------------------------------------------------------------------------------



--PL/SQL(LOOPS)
--print a string
set serveroutput on
begin
  dbms_output.put_line('Database Project');
end;
/

--find max value
set serveroutput on
declare
    max_cost Hospital.cost_per_hour%type;
begin
  select max(cost_per_hour) into max_cost
    from Hospital;
   dbms_output.put_line(max_cost);
end;
/


--using IF statement
--No discount if the price is less than 1500/-, 
--25% discount if the price is less than 2000/-,  
--For any other price, the discount is 50%
--Of hospitalID=2
set serveroutput on
declare
    cost Hospital.cost_per_hour%type;
    new_cost Hospital.cost_per_hour%type;
    id Hospital.hospitalID%type;
begin
    id:=2;
    select cost_per_hour into cost
    from Hospital
    WHERE hospitalID=id;

    IF cost<1500 then
        new_cost:=cost;
    elsif cost<2000 then
        new_cost:=cost*0.75;
    else
        new_cost:=cost*0.5;
    end If;

    dbms_output.put_line('hospitalID= '||id|| ' newCost= '||new_cost);
end;
/


--CURSOR
set serveroutput on
declare
    CURSOR cur is select blood_type,quantity_available from Blood_bank;
    blood_record cur%rowtype;
begin
    open cur;
    loop
      fetch cur into blood_record;
      exit when cur%rowcount>5;
      dbms_output.put_line(blood_record.blood_type||' -> '||blood_record.quantity_available);
    end loop;
    close cur;
end;
/



--FOR loop
set serveroutput on
declare
    cost Hospital.cost_per_hour%type;
    new_cost Hospital.cost_per_hour%type;
    id Hospital.hospitalID%type;
    namee Hospital.Name%type;
begin
    for id in 1..5
    loop
      select cost_per_hour,name into cost,namee
        from Hospital
        WHERE hospitalID=id;

    IF cost<1500 then
        new_cost:=cost;
    elsif cost<2000 then
        new_cost:=cost*0.75;
    else
        new_cost:=cost*0.5;
    end If;

    dbms_output.put_line('Hospital= '||namee|| 'newCost= '||new_cost);
    end loop;
end;
/


-------------------------------------------------------------------------------


--PL/SQL(fnc)
--procedure
set serveroutput on
create or replace procedure CostReduction is
    cost Hospital.cost_per_hour%type;
    new_cost Hospital.cost_per_hour%type;
    id Hospital.hospitalID%type;

begin
      id:=2;
    select cost_per_hour into cost
    from Hospital
    WHERE hospitalID=id;

    IF cost<1500 then
        new_cost:=cost;
    elsif cost<2000 then
        new_cost:=cost*0.75;
    else
        new_cost:=cost*0.5;
    end If;

    dbms_output.put_line('hospitalID= '||id|| ' newCost= '||new_cost);
end;
/
show errors;

set serveroutput on
begin
  CostReduction;
end;
/


--FUNCTION
set serveroutput on
create or replace FUNCTION max_cost return int is 
    max_cost Hospital.cost_per_hour%type;
begin
  select max(cost_per_hour) into max_cost
  from Hospital;
  return max_cost;
end;
/
set serveroutput on
begin
  dbms_output.put_line('max Cost= '||max_cost);
end;
/



---------------------------------------------------------------------------------



--PL/SQL(trigger)
--TRIGGER
set serveroutput on
create or replace TRIGGER tr before update or insert on Ambulance for each row
declare
    min_rating constant number(3,2):=3.00;
    max_rating constant number(3,2):=5.00;
begin
  if :new.rating<min_rating OR :new.rating>max_rating then
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
where DOB<(select sysdate from dual);

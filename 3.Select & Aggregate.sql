-- Applying Conditions using select
select HospitalID,address, contact from Hospital where HospitalID=1;

-- Applying range search
select HospitalID,address,cost_per_hour from Hospital where cost_per_hour between 1000 and 1700;
select HospitalID,Address,cost_per_hour from Hospital where cost_per_hour IN(1000,1700);

-- Sort by columns
select HospitalID, address,cost_per_hour from Hospital order by cost_per_hour;
select HospitalID, address,cost_per_hour from Hospital order by cost_per_hour desc;

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
select max(cost_per_hour),address 
from Hospital 
group by address;

-- Having Clause
select address,max(cost_per_hour) 
from Hospital 
group by address
having address='Khulna';

--constrain applied on table_creation
DROP TABLE course_contents;
CREATE TABLE course_contents(
	course_id	varchar(10) NOT NULL,
	course_name	varchar(20) UNIQUE,
	credit		integer CHECK(credit>0 AND credit<5),
	passmark	integer DEFAULT 40,
	PRIMARY KEY(course_id)
);

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


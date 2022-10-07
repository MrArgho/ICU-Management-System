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



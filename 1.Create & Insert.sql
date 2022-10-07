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
insert into Doctor values (5,'Dr. Arjun Singh',01758567805,'Surgery','19-FEB-24');

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


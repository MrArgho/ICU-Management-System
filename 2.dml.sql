--add column
alter table Hospital add Founding_Date varchar(5);

--modify column
alter table Hospital modify F_Date number(4);

--rename column
alter table Hospital rename column Founding_Date to F_Date;

--drop column
alter table Hospital drop column F_Date;


--update value
update Doctor set contact=01234569 where doctorID=1;

-- delete values
delete from Doctor where doctorID=5;

--view
CREATE VIEW Hospital_OF_Jashore AS
SELECT hospitalID, address, contact
FROM Hospital
WHERE address = 'Jashore';
SELECT * FROM Hospital_OF_Jashore;
DROP VIEW Hospital_OF_Jashore;

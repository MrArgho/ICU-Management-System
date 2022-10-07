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
    CURSOR cur is 
        select blood_type,quantity_available from Blood_bank;
    record cur%rowtype;
begin
    open cur;
    loop
      fetch cur into record;
      exit when cur%rowcount>5;
      --exit when cur%notfound;
      dbms_output.put_line(record.blood_type||' -> '||record.quantity_available);
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
    dbms_output.put_line('hospital: '||namee||' cost: '||new_cost);
  end loop;
end;
/

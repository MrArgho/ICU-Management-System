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


set serveroutput on
create or replace procedure fncc is
  cost hospital.cost_per_hour%type;
begin
  select max(cost_per_hour) into cost 
  from hospital;
  dbms_output.put_line('cost='||cost);
end;
/
set serveroutput on
begin
  fncc;
end;
/



--FUNCTION
set serveroutput on
create or replace FUNCTION max_cost return int is 
    cost Hospital.cost_per_hour%type;
begin
  select max(cost_per_hour) into cost
  from Hospital;
  return cost;
end;
/
set serveroutput on
begin
  dbms_output.put_line('max Cost= '||max_cost);
end;
/


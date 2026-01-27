create table my_schemas (
    id serial primary key,
    schema_name varchar(50),
    violation_count int
);
insert into my_schemas (schema_name, violation_count) values
('alpha', 0),
('beta', 2),
('gamma', 5),
('delta', 10),
('epsilon', 1);
SELECT * from my_schemas;


select 
    schema_name,
    violation_count,
    case 
        when violation_count = 0 then 'no violation'
        when violation_count between 1 and 3 then 'minor violation'
        else 'critical violation'
    end as violation_status
from my_schemas;


alter table my_schemas add column approval_status varchar(20);
update my_schemas
set approval_status = case
    when violation_count = 0 then 'approved'
    when violation_count between 1 and 3 then 'needs review'
    else 'rejected'
end;
select * from my_schemas;


do $$
declare
    v_count int := 6;
begin
    if v_count = 0 then
        raise notice 'no violation';
    elsif v_count between 1 and 3 then
        raise notice 'minor violation';
    else
        raise notice 'critical violation';
    end if;
end;
$$;


create table student_marks (
    id serial primary key,
    student_name varchar(50),
    marks int
);
insert into student_marks (student_name, marks) values
('amit', 85),
('bobby', 60),
('chaman', 40),
('daksh', 95);
select 
    student_name,
    marks,
    case
        when marks >= 80 then 'grade a'
        when marks >= 60 then 'grade b'
        when marks >= 40 then 'grade c'
        else 'fail'
    end as grade
from student_marks;


select 
    schema_name,
    violation_count
from my_schemas
order by case
    when violation_count = 0 then 1
    when violation_count between 1 and 3 then 2
    else 3
end;
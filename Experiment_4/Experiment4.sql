------ example 1-----
DO $$
BEGIN
  FOR i IN 1..6 LOOP
    RAISE NOTICE 'Number: %', i;
  END LOOP;
END $$;

------- example 2 -----
do $$
declare
    emp_record record;
begin
    for emp_record in
        select emp_id, emp_name, salary from employee
    loop
        raise notice 'Employee: %, Salary: %',
        emp_record.emp_name, emp_record.salary;
    end loop;
end;
$$;

---- example 3 ---
do $$
declare
    v_count int := 0;
begin
    while v_count < 3 loop
        raise notice 'Validation attempt: %', v_count;
        v_count := v_count + 1;
    end loop;
end;
$$;

--- example 4 ----
do $$
declare
    v_count int := 0;
begin
    loop
        raise notice 'Checking schema iteration: %', v_count;
        if v_count = 2 then
            exit;
        end if;
        v_count := v_count + 1;
    end loop;
end;
$$;

------- example 5 ----
do $$
declare
    emp_record record;
begin
    for emp_record in
        select emp_id, salary from employee
    loop
        update employee
        set salary = salary + 2000
        where emp_id = emp_record.emp_id;
    end loop;
end;
$$;
select * from employee;

----- example 6 -----
do $$
declare
    order_rec record;
begin
    for order_rec in
        select customer_name, price from orders
    loop
        if order_rec.price > 50000 then
            raise notice 'High value order by %', order_rec.customer_name;
        else
            raise notice 'Normal order by %', order_rec.customer_name;
        end if;
    end loop;
end;
$$;


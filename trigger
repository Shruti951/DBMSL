## Before delete on each row

SQL> create or replace
  2  trigger tr1
  3  before delete
  4  on student2 
  5  for each row
  6  declare
  7  begin
  8  insert into alumni2 values(:old.rollno, :old.name, :old.dateofadmission,:old.branch, :old.percent, :old.status);
  9  end;
 10  /

Trigger created.


SQL> delete from student2 where name='Prajakta';

1 row deleted.

SQL> select * from alumni2;

    ROLLNO NAME 		DATEOFADMISSION    BRANCH
---------- -------------------- ------------------ --------------------
   PERCENT     STATUS
---------- ----------
      3150 Prajakta		15-JUL-16	   Comp
      99.9	    
SQL> 


### Before update on each row

SQL> create or replace 
trigger tr2
before update
on student2
for each row
when(new.status=0)
declare
begin
insert into alumni2 values(:old.rollno, :old.name, :old.dateofadmission, :old.branch, :old.percent, :old.status);
end;
/  2    3    4    5    6    7    8    9   10   11  

Trigger created.


SQL> update student2 set status=0 where rollno=3149;

1 row updated.

SQL> select * from alumni2;

    ROLLNO NAME 		DATEOFADMISSION    BRANCH
---------- -------------------- ------------------ --------------------
   PERCENT     STATUS
---------- ----------
      3150 Prajakta		15-JUL-16	   Comp
      99.9	    1

      3149 Aditya		15-JUL-16	   Comp
      91.4	    1


SQL> 

create or replace trigger tr1 before update on student2 for each row when(:new.status0)
declare
begin
insert into alumni2 values(:old.rollno, :old.name, :old.dateofadmission, :old.branch, :old.percent, :old.status);
end;
/

create or replace trigger tr2 before delete on student2 for each row when(new.rollno>0)
declare
begin
insert into alumni2 values(:old.rollno, :old.name, :old.dateofadmission, :old.branch, :old.percent, :old.status);
end;
/

create or replace trigger tr3 after update on student2 for each row when(new.rollno>0)
declare
begin
insert into alumni2 values(:old.rollno, :old.name, :old.dateofadmission, :old.branch, :old.percent, :old.status);
end;
/

create or replace trigger tr4 after delete on student2 for each row when(new.rollno>0)
declare
begin
insert into alumni2 values(:old.rollno, :old.name, :old.dateofadmission, :old.branch, :old.percent, :old.status);
end;
/


######### Statement level

create or replace 
trigger tr2
before update
of status
on student2
declare
begin
insert into alumni2 values(rollno, name, dateofadmission, branch, percent, status);
end;

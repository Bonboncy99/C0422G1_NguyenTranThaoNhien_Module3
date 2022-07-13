create database demo;
use demo;
create table student(
id_student int auto_increment primary key,
name_student varchar(45),
date_of_birth date
);

select * from student;

alter table student add description_student text;
alter table student 
drop column description;

insert into student (name_student,date_of_birth)
values ("bon","1998-11-23"), ("ben","1997-10-24");


set sql_safe_updates = 0;
update student set description_student = "Nha trang family"
where name_student = "bon";
set sql_safe_updates = 1;

set sql_safe_updates = 0;
delete from student 
where date_of_birth = "1998-01-01";
set sql_safe_updates = 1;
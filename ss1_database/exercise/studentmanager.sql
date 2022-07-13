create database student_management; 
use student_management;
create table student(
id int auto_increment primary key,
name varchar(50),
age int,
country varchar(50)
);

create table class(
id int auto_increment primary key,
name varchar(50)
);

create table teacher(
id int  auto_increment primary key,
name varchar(50),
age int,
country varchar(50)
);

insert into student (name, age, country) values ("Bon", 23, "VietNam"),("Ben",24,"VN");
insert into class (name) values ("C0422G1"),("C0522G1");
insert into teacher (name, age, country) values ("mom", 50, "BUBU"),("Dad",50,"BOBO");

select * from student;
select * from class;
select * from teacher;
DROP DATABASE IF EXISTS student_management;
create database student_management; 
use student_management;

CREATE TABLE student (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    country VARCHAR(50)
);

CREATE TABLE class (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE teacher (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    country VARCHAR(50)
);

insert into student (name, age, country) 
values ("Bon", 23, "VietNam"),("Ben",24,"VN");

insert into class (name)
 values ("C0422G1"),("C0522G1");
 
insert into teacher (name, age, country) 
values ("mom", 50, "BUBU"),("Dad",50,"BOBO");

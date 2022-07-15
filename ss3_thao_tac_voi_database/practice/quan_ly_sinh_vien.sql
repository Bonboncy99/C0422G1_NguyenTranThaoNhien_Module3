drop database if exists quan_ly_sinh_vien;
create database quan_ly_sinh_vien;
use quan_ly_sinh_vien;

CREATE TABLE class (
    class_id INT PRIMARY KEY AUTO_INCREMENT,
    class_name VARCHAR(60) NOT NULL,
    start_date DATETIME NOT NULL,
    status BIT
);

CREATE TABLE student (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(30) NOT NULL,
    address VARCHAR(50),
    phone VARCHAR(20),
    status BIT,
    class_id INT NOT NULL,
    FOREIGN KEY (class_id)
        REFERENCES class (class_id)
);

CREATE TABLE subject (
    sub_id INT PRIMARY KEY AUTO_INCREMENT,
    sub_name VARCHAR(30) NOT NULL,
    credit TINYINT NOT NULL DEFAULT 1 CHECK (credit >= 1),
    status BIT DEFAULT 1
);

CREATE TABLE mark (
    mark_id INT PRIMARY KEY AUTO_INCREMENT,
    sub_id INT NOT NULL,
    student_id INT NOT NULL,
    mark FLOAT DEFAULT 0 CHECK (mark BETWEEN 0 AND 100),
    exam_times TINYINT DEFAULT 1,
    FOREIGN KEY (sub_id)
        REFERENCES subject (sub_id),
    FOREIGN KEY (student_id)
        REFERENCES student (student_id)
);

INSERT INTO class (class_name,start_date,status)
VALUES  ('A1', '2008-12-20', 1),
		('A2', '2008-12-22', 1),
		('B3', CURRENT_DATE, 0);

INSERT INTO student(student_name,address,phone,status,class_id)
VALUES  ('Hung', 'Ha Noi', '0912113113', 1, 1),
		('Manh', 'HCM', '0123123123', 0, 2);
INSERT INTO student (student_name,address,phone,class_id)
VALUES ('Hoa', 'Hai phong', 1, 1);

INSERT INTO subject(sub_name,credit,status)
VALUES ('CF', 5, 1),
       ('C', 6, 1),
       ('HDJ', 5, 1),
       ('RDBMS', 10, 1);
       
INSERT INTO mark(sub_id,student_id,mark,exam_times)
	VALUES (1, 1, 8, 1),
       (1, 2, 10, 2),
       (2, 1, 12, 1);
       
       
select * 
from student;

select * 
from student 
where status = 1;

select * 
from  subject
where credit <10;

select s.student_id, s.student_name,c.class_name
from student s
inner join class c
on (s.class_id=c.class_id)
where c.class_name = "A1";

 select s.student_id,s.student_name,su.sub_name,m.mark
 from student s
 join  mark m
 on s.student_id = m.student_id 
 join subject su
 on m.sub_id = su.sub_id;
 
 select s.student_id,s.student_name,su.sub_name,m.mark
 from student s
 join  mark m
 on s.student_id = m.student_id 
 join subject su
 on m.sub_id = su.sub_id
 where su.sub_name = 'CF';
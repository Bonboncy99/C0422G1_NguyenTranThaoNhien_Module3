use internship;

-- phan1

-- 1.	Đưa ra thông tin gồm mã số, họ tên và tên khoa của tất cả các giảng viên
select i.instructor_id,i. instructor_name,f.faculty_name
from instructor i
join faculty f on i.faculty_id = f.faculty_id
order by i.instructor_id;

-- 2.	Đưa ra thông tin gồm mã số, họ tên và tên khoa của các giảng viên của khoa ‘DIA LY va QLTN’
select i.instructor_id,i.instructor_name,f.faculty_name
from instructor i
join faculty f on i.faculty_id = f.faculty_id
where f.faculty_name = 'Dia ly va QLTN'
order by i.instructor_id;

-- 3.	Cho biết số sinh viên của khoa ‘CONG NGHE SINH HOC’
select count(*) as so_luong_sinh_vien
from student s
join faculty f on s.faculty_id = f.faculty_id
where f.faculty_name = 'Cong nghe Sinh hoc';

-- 4.	Đưa ra danh sách gồm mã số, họ tên và tuổi của các sinh viên khoa ‘TOAN’
select s.student_id, s.student_name, year(now())- date_of_birth as age
from student s
join faculty f on s.faculty_id = f.faculty_id
where f.faculty_name = 'Toan';

-- 5.	Cho biết số giảng viên của khoa ‘CONG NGHE SINH HOC’
select count(*)
from instructor i 
join faculty f on f.faculty_id = i.faculty_id
where f.faculty_name = 'Cong nghe Sinh hoc';

-- 6.	Cho biết thông tin về sinh viên không tham gia thực tập
select * 
from student s
where s.student_id not in (select student_id from instructor_student);

select s.* 
from student s
left join instructor_student ins on ins.student_id = s.student_id
where ins.student_id is null;

-- 7.	Đưa ra mã khoa, tên khoa và số giảng viên của mỗi khoa
select f.faculty_id, f.faculty_name, count(*) as so_giang_vien
from instructor i 
join faculty f on f.faculty_id = i.faculty_id
group by i.faculty_id;

-- 8.	Cho biết số điện thoại của khoa mà sinh viên có tên ‘Le van son’ đang theo học
select f.phone
from student s
join faculty f on f.faculty_id = s.faculty_id
where student_name = 'Le Van Son';

-- Phần 2.
-- 1.	Cho biết mã số và tên của các đề tài do giảng viên ‘Tran son’ hướng dẫn
select p.project_id, p.project_name 
from  project p
join instructor_student ins on ins.project_id = p.project_id
join instructor i on i.instructor_id = ins.instructor_id
where i.instructor_name = 'Tran Son';

-- 2.	Cho biết tên đề tài không có sinh viên nào thực tập
select p.project_id,p.project_name 
from project p
left join instructor_student ins on ins.project_id = p.project_id
where ins.project_id is null;

-- 3.	Cho biết mã số, họ tên, tên khoa của các giảng viên hướng dẫn từ 3 sinh viên trở lên.
select *, count(*) as so_luong_sinh_vien
from instructor i 
join instructor_student ins on i.instructor_id = ins.instructor_id
group by i.instructor_id
having so_luong_sinh_vien >=2;

-- 4.	Cho biết mã số, tên đề tài của đề tài có kinh phí cao nhất
-- 5.	Cho biết mã số và tên các đề tài có nhiều hơn 2 sinh viên tham gia thực tập
-- 6.	Đưa ra mã số, họ tên và điểm của các sinh viên khoa ‘DIALY và QLTN’
-- 7.	Đưa ra tên khoa, số lượng sinh viên của mỗi khoa
-- 8.	Cho biết thông tin về các sinh viên thực tập tại quê nhà
-- 9.	Hãy cho biết thông tin về những sinh viên chưa có điểm thực tập
-- 10.	 Đưa ra danh sách gồm mã số, họ tên các sinh viên có điểm thực tập bằng 0

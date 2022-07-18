use quan_ly_sinh_vien;

-- Hiển thị số lượng sinh viên ở từng nơi
select address, count(student_id) as so_luong_sinh_vien
from student
group by address;

-- Tính điểm trung bình các môn học của mỗi học viên
select s.student_name, avg(mark) as diem_trung_binh
from student s
join mark m
on m.student_id = s.student_id
group by s.student_id;

-- Hiển thị những bạn học viên co điểm trung bình các môn học lớn hơn 15
select s.student_name, avg(mark) as diem_trung_binh
from student s
join mark m 
on s.student_id = m.student_id
group by s.student_id
having diem_trung_binh >=15;

select student_name, avg(mark) as diem_trung_binh
from student s
join mark m 
on s.student_id = m.student_id
group by m.student_id
having diem_trung_binh >= all(select avg(mark) from mark group by mark.student_id)

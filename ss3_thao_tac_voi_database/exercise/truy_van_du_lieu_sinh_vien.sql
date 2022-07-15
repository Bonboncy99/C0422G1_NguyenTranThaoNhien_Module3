USE quan_ly_sinh_vien;

SELECT 
    *
FROM
    student
WHERE
    student_name LIKE 'h%';

SELECT 
    *
FROM
    class
WHERE
    MONTH(start_date) = 12;

-- select * from subject
-- where credit in (3,4,5)

SELECT 
    *
FROM
    subject
WHERE
    credit BETWEEN 3 AND 5;

SET sql_safe_updates = 0;
UPDATE student 
SET 
    class_id = 2
WHERE
    student_name = 'Hung';
SET sql_safe_updates = 1;


SELECT 
    s.student_name, m.mark, su.sub_name
FROM
    mark m
        JOIN
    student s ON m.student_id = s.student_id
        JOIN
    subject su ON m.sub_id = su.sub_id;
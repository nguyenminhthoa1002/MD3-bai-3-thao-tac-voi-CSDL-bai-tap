create database md3_bai3_baitap1;
-- drop database md3_bai3_baitap1;
use md3_bai3_baitap1;
SELECT * FROM md3_bai3_baithuchanh1.class;
SELECT * FROM md3_bai3_baithuchanh1.student;
SELECT * FROM md3_bai3_baithuchanh1.subject;
SELECT * FROM md3_bai3_baithuchanh1.mark;

-- Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
select *
from md3_bai3_baithuchanh1.student st
where st.studentname like 'h%';

-- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12. 
select *
from md3_bai3_baithuchanh1.class cl
where month(cl.startdate) = 12;

-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5. 
select *
from md3_bai3_baithuchanh1.subject sub
where sub.Credit between 3 and 5;

-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2. 
update md3_bai3_baithuchanh1.student
set classID = 2
where studentID = 1;
SELECT * FROM md3_bai3_baithuchanh1.student;

-- Hiển thị các thông tin: StudentName, SubName, Mark. 
-- Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. Nếu trùng sắp theo tên tăng dần.
select st.StudentId, st.studentname, sub.subname, m.mark
from md3_bai3_baithuchanh1.student st join md3_bai3_baithuchanh1.mark m on st.studentid = m.studentid join md3_bai3_baithuchanh1.subject sub on sub.subid = m.subid
order by m.Mark DESC, st.StudentName ASC;
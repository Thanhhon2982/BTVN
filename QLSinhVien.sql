create database QLSinhVien
go
use QLSinhVien
go
create table students 
( 
id int not null, 
full_name varchar(30) not null, 
created_at timestamp not null, 
phone_number nvarchar(11) not null, 
major varchar(30) not null, 
email varchar(30) not null, 
CONSTRAINT pk_students PRIMARY KEY(id) 
) 
 
create table courses 
( 
courses_id int not null, 
credit_hours int not null, 
courses_name varchar(30) not null, 
CONSTRAINT pk_courses PRIMARY KEY(courses_id) 
) 
 
create table marks 
( 
student_id int not null, 
courses_id int not null, 
mark int not null, 
td timestamp not null, 
) 
 
create table Lecturer 
( 
id int not null, 
phone_number int not null, 
rank varchar(30) not null, 
name varchar(30) not null, 
CONSTRAINT pk_Lecturer PRIMARY KEY(id) 
) 
 
create table classes 
( 
courses_id int not null, 
lec_id int not null, 
dt timestamp not null 
) 
GO 
ALTER TABLE dbo.marks ADD CONSTRAINT 
 FK_marks_students FOREIGN KEY(student_id) REFERENCES dbo.students(id) 
 ON DELETE CASCADE
GO 
ALTER TABLE dbo.marks ADD CONSTRAINT 
 FK_marks_courses FOREIGN KEY(courses_id) REFERENCES dbo.courses(courses_id) 
 ON DELETE CASCADE
GO 
ALTER TABLE dbo.classes  ADD CONSTRAINT 
 FK_classes_courses FOREIGN KEY(courses_id) REFERENCES dbo.courses(courses_id) 
 ON DELETE CASCADE
GO 
ALTER TABLE dbo.classes  ADD CONSTRAINT 
 FK_classes_Lecturer FOREIGN KEY(lec_id) REFERENCES dbo.Lecturer(id)
 ON DELETE CASCADE
go

insert into students (id, full_name, created_at, phone_number, major, email) values (0510010001, N'Nguyễn văn an', DEFAULT, 0912001001, N'CNTT', N'annguyen@gmail.com')
insert into students values (510010002, N'Nguyễn Văn Bình', DEFAULT, 0912001002, N'CNTT', N'vanbinha1@gmail.com')
insert into students values (510010003, N'Nguyễn thị Loan', DEFAULT, 0912001003, N'CNTT', N'thiloana1@gmail.com')
insert into students values (510010004, N'Nguyễn thị Hồng', DEFAULT, 0912001004, N'HTTT', N'thihonga1@gmail.com')
insert into students values (510010005, N'Nguyễn Ngọc Trâm', DEFAULT, 0912001005, N'HTTT', N'ngoctrama1@gmail.com')
insert into students values (510010006, N'Trần Văn Sơn', DEFAULT, 0912001006, N'HTTT', N'vansona1@gmail.com')
insert into students values (510010007, N'Trần Huy Hoàng', DEFAULT, 0912001007, N'HTTT', N'huyhoanga1@gmail.com')
insert into students values (510010008, N'Trần Văn Toản', DEFAULT, 0912001008, N'HTTT', N'vantoana1@gmail.com')
insert into students values (510010009, N'Ngô Lan Hương', DEFAULT, 0912001009, N'ĐTV', N'lanhuonga1@gmail.com')
insert into students values (510010010, N'Ngô Văn Hậu', DEFAULT, 0912001010, N'ĐTV' , N'vanhaua1@gmail.com')
insert into students values (510010011, N'Nguyễn Diệu Anh', DEFAULT, 0912001011, N'ĐTV', N'dieuanhb2@gmail.com')
insert into students values (510010012, N'Trần Thế bảo', DEFAULT, 0912001012, N'ĐTV', N'thebaob2@gmail.com')
insert into students values (510010013, N'Lê Đinh Chương', DEFAULT, 0912001013, N'ĐTV', N'dinhchuongb2@gmail.com')
insert into students values (510010014, N'Phạm Diếm Châu', DEFAULT, 0912001014, N'ĐTV', N'diemchaub2@gmail.com')
insert into students values (510010015, N'Hoàng Mỹ Dung', DEFAULT, 0912001015, N'ĐTV', N'mydungb2@gmail.com')
insert into students values (510010016, N'Huỳnh Diệu Anh ', DEFAULT, 0912001016, N'ĐTV', N'dieuanhb3@gmail.com')
insert into students values (510010017, N'Phan Thiên Bảo', DEFAULT, 0912001017, N'CTN', N'thienbaob2@gmail.com')
insert into students values (510010018, N'Vũ Thế bảo', DEFAULT, 0912001018, N'CTN', N'thebaob3@gmail.com')
insert into students values (510010019, N'Võ Gia Bách', DEFAULT, 0912001019, N'CTN', N'giabachb1@gmail.com')
insert into students values (510010020, N'Đặng Trúc Dương', DEFAULT, 0912001020, N'CTN', N'trucduongb1@gmail.com')
insert into students values (510010021, N'Nguyễn Tú Anh', DEFAULT, 0912001021, N'CTN', N'tuanb1@gmail.com')
insert into students values (510010022, N'Nguyễn Nhật Anh', DEFAULT, 0912001022, N'CTN', N'nhatanh1@gmail.com')
insert into students values (510010023, N'Nguyễn Diệu Anh', DEFAULT, 0912001023, N'CTN', N'dieuanhb1@gmail.com')
insert into students values (510010024, N'Trần Ngọc Bích', DEFAULT, 0912001024, N'ĐMT', N'ngocbichb1@gmail.com')
insert into students values (510010025, N'Trần Nam An', DEFAULT, 0912001025, N'ĐMT', N'namanb1@gmail.com')
insert into students values (510010026, N'Trần Quỳnh Anh', DEFAULT, 0912001026, N'ĐMT', N'quynhanhb1@gmail.com')
insert into students values (510010027, N'Lê Bình An', DEFAULT, 0912001027, N'ĐMT', N'binhanb1@gmail.com')
insert into students values (510010028, N'Lê Thiên Bình', DEFAULT, 0912001028, N'ĐMT', N'thienbinhb1@gmail.com')
insert into students values (510010029, N'Lê Thiên Ân', DEFAULT, 0912001029, N'ĐMT', N'thienanb1@gmail.com')
insert into students values (510010030, N'Trương Khánh Hằng', DEFAULT, 0912001030, N'ĐMT', N'khanhhangb1@gmail.com')
insert into students values (510010031, N'Nguyễn Văn Bình', DEFAULT, 0912001031, N'ĐMT', N'vanbinhb11@gmail.com')
insert into students values (510010032, N'Nguyễn thị Loan', DEFAULT, 0912001032, N'ĐMT', N'thiloanb11@gmail.com')
insert into students values (510010033, N'Nguyễn thị Hồng', DEFAULT, 0912001033, N'VT', N'thihongb11@gmail.com')
insert into students values (510010034, N'Nguyễn Ngọc Trâm', DEFAULT, 0912001034, N'VT', N'ngoctramb11@gmail.com')
insert into students values (510010035, N'Nguyễn Tú Anh', DEFAULT, 0912001035, N'VT', N'tuanb11@gmail.com')
insert into students values (510010036, N'Nguyễn Nhật Anh', DEFAULT, 0912001036, N'VT', N'nhatanhb11@gmail.com')
insert into students values (510010037, N'Nguyễn Diệu Anh', DEFAULT, 0912001037, N'VT', N'dieuanhb11@gmail.com')
insert into students values (510010038, N'Vũ Thế bảo', DEFAULT, 0912001038, N'VT', N'thebaob01@gmail.com')
insert into students values (510010039, N'Võ Gia Bách', DEFAULT, 0912001039, N'VT', N'giabachb01@gmail.com')
insert into students values (510010040, N'Đặng Trúc Dương', DEFAULT, 0912001040, N'BDKH', N'trucduongb01@gmail.com')
insert into students values (510010041, N'Trần Văn Toản', DEFAULT, 0912001041, N'BDKH', N'vantoanb11@gmail.com')
insert into students values (510010042, N'Ngô Lan Hương', DEFAULT, 0912001042, N'BDKH', N'lanhuongb11@gmail.com')
insert into students values (510010043, N'Ngô Văn Hậu', DEFAULT, 0912001043, N'BDKH' , N'vanhaub11@gmail.com')
insert into students values (510010044, N'Trần Ngọc Bích', DEFAULT, 0912001044, N'BDKH', N'ngocbichb11@gmail.com')
insert into students values (510010045, N'Trần Nam An', DEFAULT, 0912001045, N'BDKH', N'namanb11@gmail.com')
insert into students values (510010046, N'Trần Quỳnh Anh', DEFAULT, 0912001046, N'BDKH', N'quynhanhb11@gmail.com')
insert into students values (510010047, N'Lê Bình An', DEFAULT, 0912001047, N'BDKH', N'binhanb11@gmail.com')
insert into students values (510010048, N'Phạm Diếm Châu', DEFAULT, 0912001048, N'TĐ2', N'diemchaub22@gmail.com')
insert into students values (510010049, N'Hoàng Mỹ Dung', DEFAULT, 0912001049, N'TĐ2', N'mydungb22@gmail.com')
insert into students values (510010050, N'Huỳnh Diệu Anh ', DEFAULT, 0912001050, N'TĐ2', N'dieuanhb33@gmail.com')

insert into Lecturer (id, phone_number, rank, name) values (10001, 84001001, N'Giảng viên chính', N'Nguyễn Quang Huy')
insert into Lecturer values (10002, 84001002, N'Giảng viên chính', N'Phùng Gia Thế')
insert into Lecturer values (10003, 84001003, N'Giảng viên chính', N'Lê Thị Thu Hiền')
insert into Lecturer values (10004, 84001004, N'Giảng viên', N'Lê Thị Minh Thảo')
insert into Lecturer values (10005, 84001005, N'Khoa học chính trị', N'Phạm Văn Giềng')
insert into Lecturer values (10006, 84001006, N'Chuyên viên', N'Trịnh Đình Vinh')
insert into Lecturer values (10007, 84001007, N'Cố vấn học tập', N'Bùi Kiên Cường')
insert into Lecturer values (10008, 84001008, N'Trưởng khoa', N'Nguyễn Mẫu Lâm')
insert into Lecturer values (10009, 84001009, N'Chuyên viên', N'Phạm Thị Thuý Vân')
insert into Lecturer values (10010, 84001010, N'Giảng viên', N'Ngô Thị Trang')

insert into courses (courses_id, credit_hours, courses_name) values (101, 22, N'công nghệ thông tin')
insert into courses values (102, 10, N'Ielts')
insert into courses values (103, 9, N'Kế Toán')
insert into courses values (104, 15, N'Marketing')
insert into courses values (105, 8, N'Lập trình')
insert into courses values (106, 17, N'Thiết kế đồ họa')
insert into courses values (107, 13, N'Thiết kế – lập trình web')
insert into courses values (108, 25, N'Mỹ thuật đa phương tiện')
insert into courses values (109, 16, N'Tin học văn phòng')

insert into classes (courses_id, lec_id, dt) values (101, 10001, DEFAULT)
insert into classes values (102, 10002, DEFAULT)
insert into classes values (103, 10003, DEFAULT)
insert into classes values (104, 10004, DEFAULT)
insert into classes values (105, 10005, DEFAULT)
insert into classes values (106, 10006, DEFAULT)
insert into classes values (107, 10007, DEFAULT)
insert into classes values (108, 10008, DEFAULT)
insert into classes values (109, 10009, DEFAULT)

insert into marks(student_id, courses_id, mark, td) values (510010001, 101, 10, DEFAULT)
insert into marks values (510010002, 101, 9, DEFAULT)
insert into marks values (510010003, 101, 9, DEFAULT)
insert into marks values (510010004, 101, 9, DEFAULT)
insert into marks values (510010005, 101, 9, DEFAULT)
insert into marks values (510010006, 101, 9, DEFAULT)
insert into marks values (510010007, 101, 9, DEFAULT)
insert into marks values (510010008, 101, 9, DEFAULT)
insert into marks values (510010009, 101, 9, DEFAULT)
insert into marks values (510010010, 101, 9, DEFAULT)
insert into marks values (510010011, 102, 10, DEFAULT)
insert into marks values (510010012, 102, 10, DEFAULT)
insert into marks values (510010013, 102, 10, DEFAULT)
insert into marks values (510010014, 102, 10, DEFAULT)
insert into marks values (510010015, 102, 10, DEFAULT)
insert into marks values (510010016, 102, 10, DEFAULT)
insert into marks values (510010017, 102, 10, DEFAULT)
insert into marks values (510010018, 102, 10, DEFAULT)
insert into marks values (510010019, 102, 10, DEFAULT)
insert into marks values (510010020, 102, 10, DEFAULT)
insert into marks values (510010021, 103, 8, DEFAULT)
insert into marks values (510010022, 103, 8, DEFAULT)
insert into marks values (510010023, 103, 8, DEFAULT)
insert into marks values (510010024, 103, 8, DEFAULT)
insert into marks values (510010025, 103, 8, DEFAULT)
insert into marks values (510010026, 103, 8, DEFAULT)
insert into marks values (510010027, 103, 8, DEFAULT)
insert into marks values (510010028, 103, 8, DEFAULT)
insert into marks values (510010029, 103, 8, DEFAULT)
insert into marks values (510010030, 103, 8, DEFAULT)
insert into marks values (510010031, 104, 7, DEFAULT)
insert into marks values (510010032, 104, 7, DEFAULT)
insert into marks values (510010033, 104, 7, DEFAULT)
insert into marks values (510010034, 104, 7, DEFAULT)
insert into marks values (510010035, 104, 7, DEFAULT)
insert into marks values (510010036, 104, 7, DEFAULT)
insert into marks values (510010037, 104, 7, DEFAULT)
insert into marks values (510010038, 104, 7, DEFAULT)
insert into marks values (510010039, 104, 7, DEFAULT)
insert into marks values (510010040, 104, 7, DEFAULT)
insert into marks values (510010041, 105, 8, DEFAULT)
insert into marks values (510010042, 105, 8, DEFAULT)
insert into marks values (510010043, 105, 8, DEFAULT)
insert into marks values (510010044, 105, 8, DEFAULT)
insert into marks values (510010045, 105, 8, DEFAULT)
insert into marks values (510010046, 105, 8, DEFAULT)
insert into marks values (510010047, 105, 8, DEFAULT)
insert into marks values (510010048, 105, 8, DEFAULT)
insert into marks values (510010049, 105, 8, DEFAULT)
insert into marks values (510010050, 105, 8, DEFAULT)


DROP DATABASE IF EXISTS class_survey;
CREATE DATABASE class_survey ;
USE class_survey;
CREATE TABLE `class_survey`.`users` ( `id` INT(10) NOT NULL AUTO_INCREMENT , `username` VARCHAR(30) NOT NULL , `password` VARCHAR(200) NOT NULL , `role` INT(10) NOT NULL , `avatar` VARCHAR(200) NOT NULL DEFAULT '/resource/avatar/0.jpg' , PRIMARY KEY (`id`)) ENGINE = InnoDB;
CREATE TABLE `class_survey`.`students` ( `id` INT(10) NOT NULL , `fullname` VARCHAR(100) NOT NULL , `vnuemail` VARCHAR(100) NOT NULL , `classname` VARCHAR(100) NOT NULL , PRIMARY KEY (`id`)) ENGINE = InnoDB;
CREATE TABLE `class_survey`.`lecturers` ( `id` INT(10) NOT NULL , `fullname` VARCHAR(100) NOT NULL , `vnuemail` VARCHAR(100) NOT NULL , PRIMARY KEY (`id`)) ENGINE = InnoDB;
CREATE TABLE `class_survey`.`admins` ( `id` INT(10) NOT NULL , `fullname` VARCHAR(100) NOT NULL , `vnuemail` VARCHAR(100) NOT NULL , PRIMARY KEY (`id`)) ENGINE = InnoDB;
CREATE TABLE `class_survey`.`surveyform` ( `id` INT(10) NOT NULL AUTO_INCREMENT , `criteria` VARCHAR(300) NOT NULL , PRIMARY KEY (`id`)) ENGINE = InnoDB;
CREATE TABLE `class_survey`.`courses` ( `course_id` VARCHAR(30) NOT NULL , `year` VARCHAR(30) NOT NULL , `semester` VARCHAR(10) NOT NULL , `time` VARCHAR(100) NOT NULL , `place` VARCHAR(100) NOT NULL ,`subject` VARCHAR(300) NOT NULL, `credit` INT(10) NOT NULL DEFAULT '1' , PRIMARY KEY (`course_id`)) ENGINE = InnoDB;
CREATE TABLE `class_survey`.`lecturersofcourse` ( `course_id` VARCHAR(30) NOT NULL , `id` INT(10) NOT NULL , PRIMARY KEY (`course_id`, `id`)) ENGINE = InnoDB;
CREATE TABLE `class_survey`.`studentsofcourse` ( `course_id` VARCHAR(30) NOT NULL , `id` INT(10) NOT NULL , `done` TINYINT(1) NOT NULL DEFAULT '0' , PRIMARY KEY (`course_id`, `id`)) ENGINE = InnoDB;
CREATE TABLE `class_survey`.`reportofstudent` ( `course_id` VARCHAR(30) NOT NULL , `id` INT(10) NOT NULL , `criteria_id` INT(10) NOT NULL , `point` INT(10) NOT NULL , PRIMARY KEY (`course_id`, `id`, `criteria_id`)) ENGINE = InnoDB;

ALTER TABLE `admins` ADD CONSTRAINT `ad_us` FOREIGN KEY (`id`) REFERENCES `users`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `lecturers` ADD CONSTRAINT `le_us` FOREIGN KEY (`id`) REFERENCES `users`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `students` ADD CONSTRAINT `st_us` FOREIGN KEY (`id`) REFERENCES `users`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `lecturersofcourse` ADD CONSTRAINT `loc_co` FOREIGN KEY (`course_id`) REFERENCES `courses`(`course_id`) ON DELETE RESTRICT ON UPDATE RESTRICT; ALTER TABLE `lecturersofcourse` ADD CONSTRAINT `loc_le` FOREIGN KEY (`id`) REFERENCES `lecturers`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `studentsofcourse` ADD CONSTRAINT `soc_co` FOREIGN KEY (`course_id`) REFERENCES `courses`(`course_id`) ON DELETE RESTRICT ON UPDATE RESTRICT; ALTER TABLE `studentsofcourse` ADD CONSTRAINT `soc_st` FOREIGN KEY (`id`) REFERENCES `students`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `reportofstudent` ADD CONSTRAINT `ros_co` FOREIGN KEY (`course_id`) REFERENCES `courses`(`course_id`) ON DELETE RESTRICT ON UPDATE RESTRICT; ALTER TABLE `reportofstudent` ADD CONSTRAINT `ros_st` FOREIGN KEY (`id`) REFERENCES `students`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT; ALTER TABLE `reportofstudent` ADD CONSTRAINT `ros_su` FOREIGN KEY (`criteria_id`) REFERENCES `surveyform`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

INSERT INTO `users` (`id`, `username`, `password`, `role`, `avatar`) VALUES ('1', 'dungntc', '$2a$10$R067/DXqKiAfO7PcdrfdP.Q1u6oay2RdmntDkpBIIZSKuJFrICJ5q', '1', '/resource/avatar/0.jpg'), ('2', 'quangthn', '$2a$10$R067/DXqKiAfO7PcdrfdP.Q1u6oay2RdmntDkpBIIZSKuJFrICJ5q', '3', '/resource/avatar/0.jpg') ,('3','binhnt','$2a$10$R067/DXqKiAfO7PcdrfdP.Q1u6oay2RdmntDkpBIIZSKuJFrICJ5q','3', '/resource/avatar/0.jpg'),('5','maitt','$2a$10$R067/DXqKiAfO7PcdrfdP.Q1u6oay2RdmntDkpBIIZSKuJFrICJ5q','2', '/resource/avatar/0.jpg'),('4','thanhld','$2a$10$R067/DXqKiAfO7PcdrfdP.Q1u6oay2RdmntDkpBIIZSKuJFrICJ5q','2', '/resource/avatar/0.jpg'),('6','donv','$2a$10$R067/DXqKiAfO7PcdrfdP.Q1u6oay2RdmntDkpBIIZSKuJFrICJ5q','2', '/resource/avatar/0.jpg'),('7','anhnv','$2a$10$R067/DXqKiAfO7PcdrfdP.Q1u6oay2RdmntDkpBIIZSKuJFrICJ5q','2', '/resource/avatar/0.jpg'),('0', 'admin', '$2a$10$R067/DXqKiAfO7PcdrfdP.Q1u6oay2RdmntDkpBIIZSKuJFrICJ5q', '1', '/resource/avatar/0.jpg');
INSERT INTO `admins` (`id`, `fullname`, `vnuemail`) VALUES ('1', 'Nguyễn Thế Chí Dũng', 'dung@vnu.edu.vn'),('0', 'admin', 'admin@vnu.edu.vn');
INSERT INTO `students` (`id`, `fullname`, `vnuemail`, `classname`) VALUES ('2', 'Thái Huy Nhật Quang', 'quang@vnu.edu.vn', 'QH2016/c-clc'), ('3', 'Nguyễn Thanh Bình', 'binh@vnu.edu.vn', 'QH2016/c-clc');
INSERT INTO `lecturers` (`id`, `fullname`, `vnuemail`) VALUES ('4', 'Lê Đình Thanh', 'thanh@vnu.edu.vn'), ('5', 'Trần Trúc Mai', 'mai@vnu.edu.vn'),('6', 'Nguyễn Văn Đô', 'do@vnu.edu.vn'),('7', 'Nguyễn Việt Anh', 'anh@vnu.edu.vn');
INSERT INTO `courses` (`course_id`, `year`, `semester`, `time`, `place`, `subject`, `credit`) VALUES ('INT3306 1', '2018-2019', 'I', 'Tiết 10-12 chiều T6', '301G2', 'Phát Triển Ứng Dụng Web', '3'), ('INT2209 5', '2017-2018', 'II', 'Tiết 10-12 chiều T6', '103G2', 'Mạng Máy Tính', '3'),('INT3214 5', '2018-2019', 'I', 'tiết 1-5 thứ 4', 'PM201G2', 'Thực hành hệ điều hành', '4'), ('INT3306 2', '2018-2019', 'I', 'tiết 10-12 thứ 7', '303G2', 'Phát Triển Ứng Dụng Web', '3');
INSERT INTO `lecturersofcourse` (`course_id`, `id`) VALUES ('INT3306 1', '4'), ('INT2209 5', '5'),('INT2209 5', '6'),('INT3306 2', '7'), ('INT3214 5', '4');
INSERT INTO `studentsofcourse` (`course_id`, `id`, `done`) VALUES ('INT3306 1', '2', '1'), ('INT2209 5', '2', '1'),('INT3306 1', '3', '0'), ('INT2209 5', '3', '1'),('INT3214 5', '2', '1'), ('INT3306 2', '2', '0'),('INT3306 2','3','0');
INSERT INTO `surveyform`(`criteria`) VALUES ('Giảng đường đáp ứng yêu cầu của môn học'),('Các trang thiết bị tại giảng đường đáp ứng nhu cầu học tập và giảng dạy'),('Bạn được hỗ trợ kịp thời trong quá trình học môn này'),('Mục tiêu của môn học nêu rõ kiến thức và kỹ năng người học cần đạt được '),('Thời lượng môn học được phân bố hợp lý cho các hình thức học tập '),('Các tài liệu phục vụ môn học được cập nhật'),('Môn học góp phần trang bị kiến thức ,kỹ năng nghề nghiệp cho bạn '),('Giảng viên thực hiện đầy đủ nội quy và thời lượng của môn học theo kế hoạch '),('Giảng viên hướng dẫn bạn phương pháp học tập khi bắt đầu môn học '),('Phương pháp giảng dạy của giảng viên giúp bạn phát triển tư duy'),('Giảng viên tạo cơ hội để bạn chủ động tham gia vào quá trình học tập '),('Giảng viên giúp bạn phát triển kỹ năng làm việc độc lập '),('Giảng viên rèn luyện cho bạn phương pháp liên hệ giữa các vấn đề trong môn học với thực tiễn '),('Giảng viên sử dụng hiệu quả phương tiện dạy học '),('Giảng viên quan tâm giáo dục tư cách phẩm chất nghề nghiệp của người học'),('Bạn hiểu những vấn đề được truyền tải trên lớp'),('Kết quả học tập của người học được đánh giá bằng nhiều hình thức phù hợp với tính chất và đặc thù môn học'),('Nội dung kiểm tra đánh giá tổng hợp được các kỹ năng mà người học phải đạt theo yêu cầu'),('Thông tin phản hồi từ kiểm tra đánh giá giúp bạn cải thiện kết quả học tập');
INSERT INTO `reportofstudent`(`course_id`, `id`, `criteria_id`, `point`) VALUES  ('INT3306 1', 2, 1,4),('INT3306 1', 2, 2,4),('INT3306 1', 2, 3,4),('INT3306 1', 2, 4,2),('INT3306 1', 2, 5,5),('INT3306 1', 2, 6,4),('INT3306 1', 2, 7,4),('INT3306 1', 2, 8,4),('INT3306 1', 2, 9,4),('INT3306 1', 2, 10,4),('INT3306 1', 2, 11,4),('INT3306 1', 2, 12,4),('INT3306 1', 2, 13,4),('INT3306 1', 2, 14,4),('INT3306 1', 2, 15,4),('INT3306 1', 2, 16,4),('INT3306 1', 2, 17,4),('INT3306 1', 2, 18,4),('INT3306 1', 2, 19,4),('INT3306 1', 3, 1,4),('INT3306 1', 3, 2,4),('INT3306 1', 3, 3,4),('INT3306 1', 3, 4,2),('INT3306 1', 3, 5,1),('INT3306 1', 3, 6,4),('INT3306 1', 3, 7,4),('INT3306 1', 3, 8,4),('INT3306 1', 3, 9,4),('INT3306 1', 3, 10,4),('INT3306 1', 3, 11,4),('INT3306 1', 3, 12,3),('INT3306 1', 3, 13,5),('INT3306 1', 3, 14,4),('INT3306 1', 3, 15,4),('INT3306 1', 3, 16,4),('INT3306 1', 3, 17,4),('INT3306 1', 3, 18,4),('INT3306 1', 3, 19,4),('INT2209 5', 2, 1,4),('INT2209 5', 2, 2,4),('INT2209 5', 2, 3,4),('INT2209 5', 2, 4,2),('INT2209 5', 2, 5,5),('INT2209 5', 2, 6,4),('INT2209 5', 2, 7,4),('INT2209 5', 2, 8,4),('INT2209 5', 2, 9,4),('INT2209 5', 2, 10,4),('INT2209 5', 2, 11,4),('INT2209 5', 2, 12,4),('INT2209 5', 2, 13,4),('INT2209 5', 2, 14,4),('INT2209 5', 2, 15,4),('INT2209 5', 2, 16,4),('INT2209 5', 2, 17,4),('INT2209 5', 2, 18,4),('INT2209 5', 2, 19,4), ('INT2209 5', 3, 1,4),('INT2209 5', 3, 2,4),('INT2209 5', 3, 3,4),('INT2209 5', 3, 4,2),('INT2209 5', 3, 5,1),('INT2209 5', 3, 6,4),('INT2209 5', 3, 7,4),('INT2209 5', 3, 8,4),('INT2209 5', 3, 9,4),('INT2209 5', 3, 10,4),('INT2209 5', 3, 11,4),('INT2209 5', 3, 12,3),('INT2209 5', 3, 13,5),('INT2209 5', 3, 14,4),('INT2209 5', 3, 15,4),('INT2209 5', 3, 16,4),('INT2209 5', 3, 17,4),('INT2209 5', 3, 18,4),('INT2209 5', 3, 19,4),('INT3214 5', 2, 1,2),('INT3214 5', 2, 2,2),('INT3214 5', 2, 3,3),('INT3214 5', 2, 4,4),('INT3214 5', 2, 5,1),('INT3214 5', 2, 6,4),('INT3214 5', 2, 7,4),('INT3214 5', 2, 8,4),('INT3214 5', 2, 9,4),('INT3214 5', 2, 10,4),('INT3214 5', 2, 11,4),('INT3214 5', 2, 12,4),('INT3214 5', 2, 13,4),('INT3214 5', 2, 14,4),('INT3214 5', 2, 15,4),('INT3214 5', 2, 16,4),('INT3214 5', 2, 17,4),('INT3214 5', 2, 18,4),('INT3214 5', 2, 19,4);


CREATE VIEW coursesofstudents AS SELECT studentsofcourse.id as 'id',studentsofcourse.done,courses.course_id ,courses.subject,GROUP_CONCAT(lecturers.fullname SEPARATOR ', ') as 'lecturers' FROM courses,studentsofcourse,lecturersofcourse,lecturers WHERE courses.course_id=studentsofcourse.course_id && courses.course_id=lecturersofcourse.course_id && lecturers.id=lecturersofcourse.id  GROUP BY studentsofcourse.id ,courses.course_id ORDER BY studentsofcourse.id;
CREATE VIEW coursesoflecturers AS SELECT lecturersofcourse.id as 'id',courses.course_id ,lecturers.fullname,courses.subject FROM courses,studentsofcourse,lecturersofcourse,lecturers WHERE courses.course_id=lecturersofcourse.course_id && lecturers.id=lecturersofcourse.id  GROUP BY courses.course_id ,lecturersofcourse.id  ORDER BY lecturersofcourse.id;
CREATE VIEW resulftm AS SELECT coursesoflecturers.id,coursesoflecturers.course_id,coursesoflecturers.subject,reportofstudent.criteria_id,surveyform.criteria,Format(AVG(point),2) AS'M' ,Format(STD(point),2) AS 'STD'FROM reportofstudent,coursesoflecturers,surveyform WHERE coursesoflecturers.course_id=reportofstudent.course_id && reportofstudent.criteria_id=surveyform.id GROUP BY  coursesoflecturers.id,reportofstudent.course_id,reportofstudent.criteria_id ORDER BY coursesoflecturers.id,reportofstudent.course_id,reportofstudent.criteria_id;
CREATE VIEW resulftm1 AS SELECT coursesoflecturers.subject,reportofstudent.criteria_id,format(AVG(point),2) AS'M1' ,format(STD(point),2) AS 'STD1'FROM reportofstudent,coursesoflecturers WHERE coursesoflecturers.course_id=reportofstudent.course_id GROUP BY  coursesoflecturers.subject ,reportofstudent.criteria_id ;
CREATE VIEW resulftm2 AS SELECT coursesoflecturers.id,reportofstudent.criteria_id,format(AVG(point),2) AS'M2' ,format(STD(point),2) AS 'STD2'FROM reportofstudent,coursesoflecturers WHERE coursesoflecturers.course_id=reportofstudent.course_id GROUP BY  coursesoflecturers.id,reportofstudent.criteria_id ;
CREATE VIEW resulft AS SELECT resulftm.*,resulftm1.M1,resulftm1.STD1,resulftm2.M2 ,resulftm2.STD2 FROM resulftm,resulftm1,resulftm2 WHERE resulftm.subject=resulftm1.subject && resulftm.criteria_id=resulftm1.criteria_id && resulftm.id=resulftm2.id && resulftm.criteria_id=resulftm2.criteria_id 
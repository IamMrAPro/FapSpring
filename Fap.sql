Create database FapProject;
use FapProject;
CREATE TABLE `account` (
  `id` varchar(32) NOT NULL,
  `username` varchar(400) NOT NULL,
  `password` varchar(400) NOT NULL,
  `role` int NOT NULL,
  `status` binary(1) NOT NULL,
  PRIMARY KEY (`id`)
) ;
CREATE TABLE `account_details` (
  `first_name` varchar(400) NOT NULL,
  `middle_name` varchar(400) NOT NULL,
  `last_name` varchar(400) NOT NULL,
  `birth_date` date NOT NULL,
  `gender` binary(1) NOT NULL,
  `acc_id` varchar(32) NOT NULL,
  PRIMARY KEY (`acc_id`),
  CONSTRAINT `account_details_account_id_fk` FOREIGN KEY (`acc_id`) REFERENCES `account` (`id`)
) ;
CREATE TABLE `assessment` (
  `assessment_id` int NOT NULL AUTO_INCREMENT,
  `assessment_info` int NOT NULL,
  `assessment_value` float DEFAULT NULL,
  `assessment_comment` text,
  `student_id` varchar(32)  NOT NULL,
  `assessment_group` char(8) NOT NULL,
  PRIMARY KEY (`assessment_id`),
  KEY `assessment_assessment_group_assessment_group_code_fk` (`assessment_group`),
  KEY `assessment_assessment_info_assessment_info_id_fk` (`assessment_info`),
  KEY `assessment_student_acc_id_fk` (`student_id`),
  CONSTRAINT `assessment_assessment_group_assessment_group_code_fk` FOREIGN KEY (`assessment_group`) REFERENCES `assessment_group` (`assessment_group_code`),
  CONSTRAINT `assessment_assessment_info_assessment_info_id_fk` FOREIGN KEY (`assessment_info`) REFERENCES `assessment_info` (`assessment_info_id`),
  CONSTRAINT `assessment_student_acc_id_fk` FOREIGN KEY (`student_id`) REFERENCES `student` (`acc_id`)
) ;
CREATE TABLE `assessment_group` (
  `assessment_group_code` char(8) NOT NULL,
  `assessment_group_name` varchar(500) NOT NULL,
  PRIMARY KEY (`assessment_group_code`)
);
CREATE TABLE `assessment_info` (
  `assessment_info_id` int NOT NULL AUTO_INCREMENT,
  `assessment_name` varchar(500) NOT NULL,
  `assessment_percentage` float NOT NULL,
  PRIMARY KEY (`assessment_info_id`)
) ;
CREATE TABLE `class` (
  `class_code` char(8) NOT NULL,
  `class_name` varchar(500) NOT NULL,
  `course_id` int NOT NULL,
  `teacher_id` varchar(32) NOT NULL,
  PRIMARY KEY (`class_code`),
  KEY `class_course_course_id_fk` (`course_id`),
  KEY `class_teacher_acc_id_fk` (`teacher_id`),
  CONSTRAINT `class_course_course_id_fk` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`),
  CONSTRAINT `class_teacher_acc_id_fk` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`acc_id`)
) ;
CREATE TABLE `class_assessment_group` (
  `class_code` char(8) NOT NULL,
  `assessment_group_code` char(8) NOT NULL,
  PRIMARY KEY (`class_code`,`assessment_group_code`),
  KEY `class_assessment_group_assessment_group_assessment_group_code_fk` (`assessment_group_code`),
  CONSTRAINT `class_assessment_group_assessment_group_assessment_group_code_fk` FOREIGN KEY (`assessment_group_code`) REFERENCES `assessment_group` (`assessment_group_code`),
  CONSTRAINT `class_assessment_group_class_class_code_fk` FOREIGN KEY (`class_code`) REFERENCES `class` (`class_code`)
) ;
CREATE TABLE `course` (
  `course_id` int NOT NULL AUTO_INCREMENT,
  `course_name` varchar(400) NOT NULL,
  `course_credits` int NOT NULL,
  PRIMARY KEY (`course_id`)
);
CREATE TABLE `curriculum` (
  `cur_id` varchar(400) NOT NULL,
  `cur_name` varchar(400) NOT NULL,
  PRIMARY KEY (`cur_id`)
) ;
CREATE TABLE `curriculum_course` (
  `cur_id` varchar(400) NOT NULL,
  `course_id` int NOT NULL,
  PRIMARY KEY (`cur_id`,`course_id`),
  KEY `curriculum_course_course_course_id_fk` (`course_id`),
  CONSTRAINT `curriculum_course_course_course_id_fk` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`),
  CONSTRAINT `curriculum_course_curriculum_cur_id_fk` FOREIGN KEY (`cur_id`) REFERENCES `curriculum` (`cur_id`)
);
CREATE TABLE `student` (
  `acc_id` varchar(32) NOT NULL,
  `student_code` varchar(100) NOT NULL,
  `cur_id` varchar(400) NOT NULL,
  PRIMARY KEY (`acc_id`),
  KEY `student_curriculum_cur_id_fk` (`cur_id`),
  CONSTRAINT `student_account_id_fk` FOREIGN KEY (`acc_id`) REFERENCES `account` (`id`),
  CONSTRAINT `student_curriculum_cur_id_fk` FOREIGN KEY (`cur_id`) REFERENCES `curriculum` (`cur_id`)
) ;
CREATE TABLE `student_class` (
  `student_id` varchar(32) NOT NULL,
  `class_code` char(8) NOT NULL,
  PRIMARY KEY (`student_id`,`class_code`),
  KEY `FK15y7y6l2iqnk4x0qdj21jrmfk` (`class_code`),
  CONSTRAINT `student_class_class_class_code_fk` FOREIGN KEY (`class_code`) REFERENCES `class` (`class_code`),
  CONSTRAINT `student_class_student_acc_id_fk` FOREIGN KEY (`student_id`) REFERENCES `student` (`acc_id`)
);
CREATE TABLE `teacher` (
  `acc_id` varchar(32) NOT NULL,
  `department` int NOT NULL,
  `teacher_code` varchar(100) NOT NULL,
  PRIMARY KEY (`acc_id`),
  CONSTRAINT `teacher_account_id_fk` FOREIGN KEY (`acc_id`) REFERENCES `account` (`id`)
) 
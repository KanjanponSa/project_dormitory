-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.11-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for dormitory
DROP DATABASE IF EXISTS `dormitory`;
CREATE DATABASE IF NOT EXISTS `dormitory` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `dormitory`;

-- Dumping structure for table dormitory.admin_type
CREATE TABLE IF NOT EXISTS `admin_type` (
  `type_id` int(20) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Dumping data for table dormitory.admin_type: ~4 rows (approximately)
DELETE FROM `admin_type`;
/*!40000 ALTER TABLE `admin_type` DISABLE KEYS */;
INSERT INTO `admin_type` (`type_id`, `type_name`) VALUES
	(0, 'นักศึกษา');
INSERT INTO `admin_type` (`type_id`, `type_name`) VALUES
	(1, 'ผู้ดูแลระบบ');
INSERT INTO `admin_type` (`type_id`, `type_name`) VALUES
	(2, 'จัดการค่าใช้จ่าย');
INSERT INTO `admin_type` (`type_id`, `type_name`) VALUES
	(3, 'จัดการมิเตอร์ค่าไฟฟ้า');
/*!40000 ALTER TABLE `admin_type` ENABLE KEYS */;

-- Dumping structure for table dormitory.branch
CREATE TABLE IF NOT EXISTS `branch` (
  `branch_code` int(3) unsigned zerofill NOT NULL AUTO_INCREMENT COMMENT 'รหัสสาขา',
  `faculty_code` int(4) NOT NULL COMMENT 'รหัสคณะ',
  `name` varchar(255) NOT NULL COMMENT 'ชื่อสาขาภาษาไทย',
  `name_en` varchar(255) NOT NULL COMMENT 'ชื่อสาขาภาษาอังกฤษ',
  `acronym` varchar(255) NOT NULL COMMENT 'ตัวย่อสาขาภาษาอังกฤษ/ไทย',
  `levels` int(4) NOT NULL,
  PRIMARY KEY (`branch_code`),
  KEY `faculty_codeFK` (`faculty_code`),
  KEY `FK_levels` (`levels`),
  CONSTRAINT `FK_levels` FOREIGN KEY (`levels`) REFERENCES `level` (`noLevel`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `faculty_codeFK` FOREIGN KEY (`faculty_code`) REFERENCES `faculty` (`faculty_code`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=165 DEFAULT CHARSET=utf8;

-- Dumping data for table dormitory.branch: ~106 rows (approximately)
DELETE FROM `branch`;
/*!40000 ALTER TABLE `branch` DISABLE KEYS */;
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(001, 1500, 'สาขาวิชาการบัญชี', 'Accounting', 'AC', 1);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(002, 1500, 'สาขาวิชาการเงิน', 'Financial branch', 'FN', 1);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(003, 1500, 'สาขาวิชาการตลาด', 'Marketing', 'MK', 1);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(004, 1500, 'สาขาวิชาระบบสารสนเทศทางคอมพิวเตอร์', 'Information Systems', 'IS', 1);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(005, 1500, 'สาขาวิชาคอมพิวเตอร์ธุรกิจ', 'Business Computer', 'BC', 1);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(006, 1500, 'สาขาวิชาการจัดการ-การจัดการทั่วไป (MG)', 'Management General', 'MG', 1);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(007, 1500, 'สาขาวิชาการจัดการ-การจัดการอุตสาหกรรม (MI)', 'Management Industrial', 'MI', 1);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(008, 1500, 'สาขาวิชาการจัดการ-การจัดการโลจิสติกส์ (ML)', 'Management Logistic', 'ML', 1);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(009, 1600, 'สาขาวิชาสถิติประยุกต์', 'Statistics', 'ST', 1);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(010, 1600, 'สาขาวิชาเคมี', 'Chemistry', 'CHS', 1);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(011, 1600, 'สาขาวิชาฟิสิกส์ประยุกต์', 'Physics', 'PHY', 1);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(012, 1600, 'สาขาวิชาวิทยาการวัสดุและนวัตกรรม', 'Materials Science and Innovation', 'MSI', 1);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(013, 1600, 'สาขาวิชาเทคโนโลยีชีวผลิตภัณฑ์', 'Bioproduct Technology', 'BPT', 1);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(014, 1600, 'สาขาวิชาเทคโนโลยีผลิตภัณฑ์นม', 'Dairy Program Technology', 'DPT', 1);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(015, 1600, 'สาขาวิชาเทคโนโลยีผลิตภัณฑ์นมและเครื่องดื่ม', 'Dairy and beverage technology', 'DBT', 1);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(016, 1600, 'สาขาวิชาวิทยาการคอมพิวเตอร์', 'Computer Science', 'CS', 1);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(017, 1600, 'สาขาวิชาเทคโนโลยีการสื่อสารมวลชน', 'Mass Communication Technology', 'MCT', 1);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(018, 1600, 'สาขาวิชาเทคโนโลยีโลจิสติกส์', 'Logistics Technology', 'LT', 1);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(019, 1600, 'สาขาวิชานวัตกรรมและเทคโนโลยีการเกษตร', 'Agricultural Innovation and Technology', 'AIT', 1);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(020, 1600, 'สาขาวิชาวิทยาศาสตร์การกีฬาและสุขภาพ', 'Sport and Health Science', 'SHS', 1);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(021, 1600, 'สาขาวิชาการท่องเที่ยว', 'Tourism', 'TOU', 1);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(022, 1600, 'สาขาวิชาภาษาอังกฤษเพื่อการสื่อสารสากล', 'English for international communication', 'EIC', 1);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(069, 1700, 'สาขาวิชาวิศวกรรมโยธา', 'Civil Engineering', 'CE', 1);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(070, 1700, 'สาขาวิชาวิศวกรรมสำรวจ', 'Survey Engineering', 'SE', 1);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(071, 1700, 'สาขาวิชาวิศวกรรมไฟฟ้า', 'Electrical Engineering', 'EE', 1);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(072, 1700, 'สาขาวิศวกรรมโทรคมนาคม', 'Telecommunications Engineering', 'TE', 1);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(073, 1700, 'สาขาวิชาวิศวกรรมคอมพิวเตอร์', 'Computer Engineering', 'CPE', 1);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(074, 1700, 'สาขาวิชาวิศวกรรมอิเล็กทรอนิกส์', 'Electronic engineering', 'EEE', 1);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(075, 1700, 'สาขาวิชาวิศวกรรมเครื่องกล', 'Mechanical Engineering', 'ME', 1);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(076, 1700, 'สาขาวิชาวิศวกรรมเครื่องจักรกลหนัก', 'Heavy Equipment Engineering', 'HVE', 1);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(077, 1700, 'สาขาวิชาวิศวกรรมซ่อมบำรุงอากาศยาน', 'Aircraft Maintenance Engineering', 'ACME', 1);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(078, 1700, 'สาขาวิชาวิศวกรรมระบบราง', 'Rail System Engineering', 'RSE', 1);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(079, 1700, 'สาขาวิชาวิศวกรรมเครื่องจักรกลเกษตร', 'Agricultural Machinery Engineering', 'AME', 1);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(080, 1700, 'สาขาวิชาวิศวกรรมหลังการเก็บเกี่ยวและแปรสภาพ', 'Postharvest and transformation engineering', 'PPE', 1);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(081, 1700, 'สาขาวิชาวิศวกรรมยานยนต์', 'Automotive Engineering', 'AE', 1);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(082, 1700, 'สาขาวิชาวิศวกรรมการทำความเย็นและการปรับอากาศ', 'Refrigeration and Air Conditioning Engineering', 'RAE', 1);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(083, 1700, 'สาขาวิชาวิศวกรรมเมคคาทรอนิกส์', 'Mechatronics Engineering', 'MCE', 1);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(084, 1700, 'สาขาวิชาวิศวกรรมอุตสาหการ', 'Industrial Engineering', 'IE', 1);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(085, 1700, 'สาขาวิชาวิศวกรรมเครื่องมือและแม่พิมพ์', 'Tool and Die Engineering', 'TDE', 1);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(086, 1700, 'สาขาวิชาวิศวกรรมการผลิต', 'Production Engineering', 'PE', 1);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(087, 1700, 'สาขาวิชาวิศวกรรมโลจิสติกส์', 'Logistics Engineering', 'LE', 1);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(088, 1700, 'สาขาวิชาวิศวกรรมวัสดุและโลหการ', 'Metallurgical and Materials Engineering', 'MAE', 1);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(089, 1700, 'สาขาวิชาวิศวกรรมวัสดุและพอลิเมอร์', 'Materials and Polymer', 'MAP', 1);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(090, 1800, 'สาขาวิชาจิตรกรรม', 'Painting Arts', 'PA', 1);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(091, 1800, 'สาขาวิชาศิลปะภาพพิมพ์', 'Graphic Arts', 'GA', 1);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(092, 1800, 'สาขาวิชาประติมากรรม', 'Sculpture Arts', 'SA', 1);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(093, 1800, 'สาขาวิชาทัศนศิลป์-จิตรกรรม', 'Visual Painting Arts', 'VPA', 1);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(094, 1800, 'สาขาวิชาทัศนศิลป์-ศิลปะภาพพิมพ์', 'Visual Graphic Arts', 'VGA', 1);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(095, 1800, 'สาขาวิชาทัศนศิลป์-ประติมากรรม', 'Visual Sculpture Arts', 'VSA', 1);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(096, 1800, 'สาขาวิชาทัศนศิลป์', 'Visual Arts', 'VA', 1);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(097, 1800, 'สาขาวิชาออกแบบผลิตภัณฑ์อุตสาหกรรม', 'Industrial product design', 'ID', 1);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(098, 1800, 'สาขาวิชาออกแบบเซรามิก', 'Ceramic Design', 'CD', 1);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(099, 1800, 'สาขาวิชาออกแบบบรรจุภัณฑ์', 'Package Design', 'PD', 1);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(100, 1800, 'สาขาวิชาเทคโนโลยีออกแบบนิเทศศิลป์', 'Communication design technology', 'CDT', 1);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(101, 1800, 'สาขาวิชาการออกแบบนิเทศศิลป์', 'Communication Design', 'VCD', 1);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(102, 1800, 'สาขาวิชาเทคโนโลยีสถาปัตยกรรม', 'Architectural Technology', 'AAT', 1);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(103, 1800, 'สาขาวิชาสถาปัตยกรรม', 'Architecture', 'AAR', 1);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(104, 1800, 'สาขาวิชาสถาปัตยกรรมภายใน', 'Interior Architecture', 'AIA', 1);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(105, 1800, 'สาขาวิชาการจัดการผังเมือง', 'Urban Planning Management', 'AUP', 1);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(106, 1800, 'สาขาวิชาเทคโนโลยีการผังเมือง', 'Urban Planning Technology', 'UPT', 1);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(107, 1800, 'สาขาวิชาเทคโนโลยีมัลติมีเดีย', 'Multimedia Technology', 'AMT', 1);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(108, 1500, 'สาขาวิชาการตลาด', 'Marketing', 'บต', 2);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(109, 1500, 'สาขาวิชาคอมพิวเตอร์ธุรกิจ', 'Business Computer', 'คธ', 2);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(110, 1500, 'สาขาวิชาการเงิน', 'Financial branch', 'บง', 2);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(111, 1500, 'สาขาวิชาการบัญชี', 'Accounting', 'บช', 2);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(124, 1700, 'สาขาวิชาช่างโลหะ', 'Metalwork', 'ชล', 2);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(125, 1700, 'สาขาวิชาช่างเทคนิคระบบขนส่งทางราง', 'Railway System Technician', 'ทร', 2);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(126, 1700, 'สาขาวิชาไฟฟ้า', 'Electrical', 'ฟก', 2);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(127, 1700, 'สาขาวิชาอิเล็กทรอนิกส์', 'Electronic', 'ฟอ', 2);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(128, 1700, 'สาขาวิชาช่างผลิตเครื่องมือและแม่พิมพ์', 'Tools and Mold Manufacturing', 'ชผ', 2);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(129, 1700, 'สาขาวิชาช่างจักรกลหนัก', 'Heavy Machinery', 'กน', 2);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(130, 1700, 'สาขาวิชาช่างกลโรงงาน', 'Mechanical Engineering', 'ชก', 2);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(131, 1700, 'สาขาวิชาช่างยนต์', 'Mechanics', 'ชย', 2);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(132, 1700, 'สาขาวิชาช่างโยธา', 'Civil Engineering', 'ยธ', 2);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(133, 1500, 'การบัญชี', 'Accounting', 'M.Acc', 3);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(134, 1500, 'สาขาวิชาบริหารธุรกิจ', 'Business Administration', 'MBA', 3);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(135, 1600, 'สาขาวิชาเคมีประยุกต์', 'Applied Chemistry', 'M.CHS', 3);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(136, 1700, 'สาขาวิชาช่างบำรุงรักษาระบบไฟฟ้าในระบบขนส่งทางราง', 'Technician Maintenance Electrical System in Rail ', 'ฟร', 2);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(137, 1500, 'สาขาวิชาการจัดการธุรกิจค้าปลีก', 'Retail Business Management', 'คป', 2);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(138, 1500, 'สาขาวิชาการตลาด-การบริหารการตลาด', 'Marketing Program - Marketing Management ', 'MM', 1);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(139, 1500, 'สาขาวิชาการตลาด-การตลาดดิจิทัล', 'Marketing Program - Digital Marketing', 'DM', 1);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(140, 1500, 'สาขาวิชาการตลาด-การจัดการธุรกิจการค้าสมัยใหม่', 'Marketing Program - Modern Trade Management ', 'CP', 1);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(141, 1500, 'สาขาวิชาระบบสารสนเทศและนวัตกรรมธุรกิจดิจิทัล', 'Information Systems and Digital Business Innovation', 'IDI', 1);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(142, 1500, 'สาขาวิชาการจัดการ-การจัดการทั่วไป (MG)', 'Management General', 'GM', 1);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(143, 1500, 'สาขาวิชาการจัดการ-การจัดการอุตสาหกรรม (IM)', 'Management Industrial', 'IM', 1);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(144, 1500, 'สาขาวิชาการจัดการ-การจัดการโลจิสติกส์ (LM)', 'Management Logistic', 'LM', 1);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(145, 1600, 'สาขาวิชานวัตกรรมข้าว', 'Rice Innovation', 'RI', 1);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(146, 1600, 'สาขาวิชาธุรกิจนวัตกรรมการเกษตร', 'Agricultural Innovation Business', 'ABI', 1);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(147, 1600, 'สาขาวิชาภาษาอังกฤษเพื่อการสื่อสาร', 'English for Communication', 'EC', 1);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(148, 1600, 'โปรแกรมศึกษาทั่วไป', 'General Education', 'VN', 1);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(149, 1600, 'สาขาวิชาสัตวศาสตร์ ', 'Animal Science', 'สศ', 2);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(150, 1600, 'โปรแกรมศึกษาทั่วไป', 'General Education', 'ศท', 2);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(151, 1700, 'สาขาวิชาช่างยนต์-เครื่องทำความเย็นและปรับอากาศ', 'Automotive Mechanics - Refrigeration and Air Conditioning', 'แอร์', 2);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(152, 1700, 'สาขาวิชาวิศวกรรมเกษตรอัจฉริยะ', 'Intelligent Agricultural Engineering', 'SAE', 1);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(153, 1700, 'สาขาวิชาวิศวกรรมฟาร์มอัจฉริยะ', 'Intelligent Farm Engineering', 'SFE', 1);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(154, 1700, 'สาขาวิชาวิศวกรรมพลังงานทดแทนและสิ่งแวดล้อม', 'Renewable Energy and Environmental Engineering', 'REEE', 1);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(155, 1600, 'สาขาวิชาเคมีประยุกต์', 'Applied Chemistry', 'M.CHS', 3);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(156, 1600, '	สาขาวิชาเทคโนโลยีสารสนเทศและการสื่อสารประยุกต์', 'Applied Information and Communication Technology', 'M.ICT', 3);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(157, 1600, 'สาขาวิชาชีววิทยาประยุกต์ในการผลิตสัตว์', 'Applied Biology in Animal Production', 'M.AP', 3);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(158, 1700, 'สาขาวิชาวิศวกรรมโยธา', 'Civil Engineering', 'M.CE', 3);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(159, 1700, 'สาขาวิชาวิศวกรรมไฟฟ้า', 'Electrical Engineering', 'M.EE', 3);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(160, 1700, 'สาขาวิชาวิศวกรรมเครื่องกล', 'Mechanical Engineering', 'M.ME', 3);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(161, 1700, 'สาขาวิชาวิศวกรรมอุตสาหการ', 'Industrial Engineering', 'M.IE', 3);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(162, 1800, 'สาขาวิชาการออกแบบอุตสาหกรรม', 'Master of Architecture Programme in Industrial Design', 'IDS', 1);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(163, 1500, 'สาขาวิชาการจัดการธุรกิจการบิน', 'Bachelor of Business Administration', 'AM', 1);
INSERT INTO `branch` (`branch_code`, `faculty_code`, `name`, `name_en`, `acronym`, `levels`) VALUES
	(164, 1500, 'สาขาวิชาการจัดการโลจิสติกส์-การจัดการโซ่อุปทาน', 'Logistics Management - Supply Chain Management', 'LMS', 1);
/*!40000 ALTER TABLE `branch` ENABLE KEYS */;

-- Dumping structure for table dormitory.cost_value
CREATE TABLE IF NOT EXISTS `cost_value` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `term` int(11) NOT NULL,
  `room_type` int(11) NOT NULL,
  `dormitory` varchar(50) DEFAULT NULL,
  `electric_first` varchar(50) DEFAULT NULL,
  `water_first` varchar(50) DEFAULT NULL,
  `electric_unit` varchar(50) DEFAULT NULL,
  `insurance` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Dumping data for table dormitory.cost_value: ~4 rows (approximately)
DELETE FROM `cost_value`;
/*!40000 ALTER TABLE `cost_value` DISABLE KEYS */;
INSERT INTO `cost_value` (`id`, `term`, `room_type`, `dormitory`, `electric_first`, `water_first`, `electric_unit`, `insurance`) VALUES
	(1, 1, 1, '5000', '1000', '500', '8', '500');
INSERT INTO `cost_value` (`id`, `term`, `room_type`, `dormitory`, `electric_first`, `water_first`, `electric_unit`, `insurance`) VALUES
	(2, 2, 1, '6000', '500', '500', '8', '0');
INSERT INTO `cost_value` (`id`, `term`, `room_type`, `dormitory`, `electric_first`, `water_first`, `electric_unit`, `insurance`) VALUES
	(3, 1, 2, '6000', '2000', '400', '8', '500');
INSERT INTO `cost_value` (`id`, `term`, `room_type`, `dormitory`, `electric_first`, `water_first`, `electric_unit`, `insurance`) VALUES
	(4, 2, 2, '1', '3', '4', '5', '2');
/*!40000 ALTER TABLE `cost_value` ENABLE KEYS */;

-- Dumping structure for table dormitory.electric_bill
CREATE TABLE IF NOT EXISTS `electric_bill` (
  `room_number` varchar(50) NOT NULL,
  `value_meter` varchar(50) DEFAULT NULL,
  `month_read` varchar(50) NOT NULL,
  `update_at` datetime DEFAULT current_timestamp(),
  `user_edit` varchar(30) DEFAULT NULL,
  `electric_cost_unit` varchar(50) DEFAULT NULL,
  `electric_cost_old` varchar(50) DEFAULT NULL,
  `electric_cost_month` varchar(50) DEFAULT NULL,
  `electric_cost_left` varchar(50) DEFAULT NULL,
  `electric_cost_add` varchar(50) DEFAULT NULL,
  `isPay` int(1) DEFAULT 0 COMMENT '0 = ยังไม่จ่าย, 1 = จ่ายแล้ว',
  `receiptNumber` varchar(50) DEFAULT NULL,
  `time_pay` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `isSeen` varchar(50) DEFAULT '0',
  PRIMARY KEY (`room_number`,`month_read`),
  KEY `FK_electric_bill_user` (`user_edit`),
  CONSTRAINT `FK_electric_bill_user` FOREIGN KEY (`user_edit`) REFERENCES `user` (`username`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table dormitory.electric_bill: ~0 rows (approximately)
DELETE FROM `electric_bill`;
/*!40000 ALTER TABLE `electric_bill` DISABLE KEYS */;
INSERT INTO `electric_bill` (`room_number`, `value_meter`, `month_read`, `update_at`, `user_edit`, `electric_cost_unit`, `electric_cost_old`, `electric_cost_month`, `electric_cost_left`, `electric_cost_add`, `isPay`, `receiptNumber`, `time_pay`, `isSeen`) VALUES
	('2704', '800', '10/2020', '2020-10-18 06:06:04', 'admin1', '800', '2000', '6400', '0', '4400', 1, '12345678', '2020-10-19 04:28:45', '1');
/*!40000 ALTER TABLE `electric_bill` ENABLE KEYS */;

-- Dumping structure for table dormitory.faculty
CREATE TABLE IF NOT EXISTS `faculty` (
  `faculty_code` int(4) NOT NULL COMMENT 'เก็บรหัสคณะ',
  `name` varchar(255) NOT NULL COMMENT 'ชื่อหน่วยงานภาษาไทย',
  `name_en` varchar(255) NOT NULL COMMENT 'ชื่อหน่วยงานภาษาอังกฤษ',
  PRIMARY KEY (`faculty_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table dormitory.faculty: ~4 rows (approximately)
DELETE FROM `faculty`;
/*!40000 ALTER TABLE `faculty` DISABLE KEYS */;
INSERT INTO `faculty` (`faculty_code`, `name`, `name_en`) VALUES
	(1500, 'คณะบริหารธุรกิจ', 'Faculty of Business Administration');
INSERT INTO `faculty` (`faculty_code`, `name`, `name_en`) VALUES
	(1600, 'คณะวิทยาศาสตร์และศิลปศาสตร์', 'Faculty of Sciences and Liberal Arts');
INSERT INTO `faculty` (`faculty_code`, `name`, `name_en`) VALUES
	(1700, 'คณะวิศวกรรมศาสตร์และสถาปัตยกรรมศาสตร์', 'Faculty of Engineering and Architecture');
INSERT INTO `faculty` (`faculty_code`, `name`, `name_en`) VALUES
	(1800, 'คณะศิลปกรรมและออกแบบอุตสาหกรรม', 'Faculty of Fine Arts and Industrial Design');
/*!40000 ALTER TABLE `faculty` ENABLE KEYS */;

-- Dumping structure for table dormitory.level
CREATE TABLE IF NOT EXISTS `level` (
  `noLevel` int(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `acronym` varchar(255) NOT NULL,
  PRIMARY KEY (`noLevel`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table dormitory.level: ~3 rows (approximately)
DELETE FROM `level`;
/*!40000 ALTER TABLE `level` DISABLE KEYS */;
INSERT INTO `level` (`noLevel`, `name`, `acronym`) VALUES
	(1, 'ปริญญาตรี', 'ป.ตรี');
INSERT INTO `level` (`noLevel`, `name`, `acronym`) VALUES
	(2, 'ประกาศนียบัตรวิชาชีพชั้นสูง', 'ปวส');
INSERT INTO `level` (`noLevel`, `name`, `acronym`) VALUES
	(3, 'ปริญญาโท', 'ป.โท');
/*!40000 ALTER TABLE `level` ENABLE KEYS */;

-- Dumping structure for table dormitory.outsider
CREATE TABLE IF NOT EXISTS `outsider` (
  `id_card_code` varchar(17) NOT NULL COMMENT 'รหัสบัตรประชาชน',
  `std_code` varchar(15) NOT NULL COMMENT 'รหัสนักศึกษา',
  `nameTitle` varchar(20) NOT NULL COMMENT 'คำนำหน้า',
  `fname` varchar(200) NOT NULL COMMENT 'ชื่อจริง',
  `lname` varchar(200) NOT NULL COMMENT 'นามสกุล',
  `phone` varchar(20) NOT NULL COMMENT 'เบอร์โทรศัพท์',
  `house_no` varchar(10) DEFAULT NULL COMMENT 'บ้านเลขที่',
  `moo` varchar(5) DEFAULT NULL COMMENT 'หมู่',
  `sub_district` varchar(100) DEFAULT NULL COMMENT 'ตำบล',
  `district` varchar(100) DEFAULT NULL COMMENT 'อำเภอ',
  `province` varchar(255) DEFAULT NULL COMMENT 'จังหวัด',
  `father` varchar(255) DEFAULT NULL COMMENT 'ชื่อบิดา',
  `f_phone` varchar(15) DEFAULT NULL COMMENT 'เบอร์พ่อ',
  `mother` varchar(255) DEFAULT NULL COMMENT 'ชื่อมารดา',
  `m_phone` varchar(15) NOT NULL COMMENT 'เบอร์แม่',
  `student_relation` varchar(255) NOT NULL COMMENT 'ความสัมพันธ์กับนักศึกษา',
  PRIMARY KEY (`id_card_code`,`std_code`),
  KEY `FK_std_codes` (`std_code`),
  CONSTRAINT `FK_std_codes` FOREIGN KEY (`std_code`) REFERENCES `student` (`std_code`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table dormitory.outsider: ~1 rows (approximately)
DELETE FROM `outsider`;
/*!40000 ALTER TABLE `outsider` DISABLE KEYS */;
INSERT INTO `outsider` (`id_card_code`, `std_code`, `nameTitle`, `fname`, `lname`, `phone`, `house_no`, `moo`, `sub_district`, `district`, `province`, `father`, `f_phone`, `mother`, `m_phone`, `student_relation`) VALUES
	('1301801201671', '60172110142-4', 'นาย', 'ใจดี', 'จริงใจ', '0857667628', '478', '8', 'สูงเนิน', 'สูงเนิน', 'นครราชสีมา', 'นายโยธิน กิตติรงค์', '', 'นางพิมพ์นิภา กิตติรงค์', '', 'เพื่อน');
/*!40000 ALTER TABLE `outsider` ENABLE KEYS */;

-- Dumping structure for table dormitory.qa_student
CREATE TABLE IF NOT EXISTS `qa_student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` longtext DEFAULT NULL,
  `answer` longtext DEFAULT NULL,
  `student` varchar(15) DEFAULT NULL,
  `admin` varchar(30) DEFAULT NULL,
  `create_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `FK_qa_student_student` (`student`),
  KEY `FK_qa_student_user` (`admin`),
  CONSTRAINT `FK_qa_student_student` FOREIGN KEY (`student`) REFERENCES `student` (`std_code`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `FK_qa_student_user` FOREIGN KEY (`admin`) REFERENCES `user` (`username`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table dormitory.qa_student: ~2 rows (approximately)
DELETE FROM `qa_student`;
/*!40000 ALTER TABLE `qa_student` DISABLE KEYS */;
INSERT INTO `qa_student` (`id`, `question`, `answer`, `student`, `admin`, `create_at`) VALUES
	(1, 'สวัสดี', 'ลาก่อน', '60172110466-6', 'admin1', '2020-10-31 01:48:53');
INSERT INTO `qa_student` (`id`, `question`, `answer`, `student`, `admin`, `create_at`) VALUES
	(2, 'ไม่รู้จะถามอะไร', 'ไม่รู้จะตอบอะไร', '60172110466-6', 'admin1', '2020-10-31 02:12:42');
/*!40000 ALTER TABLE `qa_student` ENABLE KEYS */;

-- Dumping structure for table dormitory.room
CREATE TABLE IF NOT EXISTS `room` (
  `room_number` varchar(6) NOT NULL COMMENT 'เลขห้องพัก',
  `floor` int(1) NOT NULL COMMENT 'ชั้นของหอพัก',
  `type_room` tinyint(1) NOT NULL COMMENT 'ประเภทหอพัก',
  PRIMARY KEY (`room_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table dormitory.room: ~1,964 rows (approximately)
DELETE FROM `room`;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1201/1', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1201/2', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1201/3', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1201/4', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1202/1', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1202/2', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1202/3', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1202/4', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1203/1', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1203/2', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1203/3', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1203/4', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1204/1', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1204/2', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1204/3', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1204/4', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1205/1', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1205/2', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1205/3', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1205/4', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1206/1', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1206/2', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1206/3', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1206/4', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1207/1', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1207/2', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1207/3', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1207/4', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1208/1', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1208/2', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1208/3', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1208/4', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1209/1', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1209/2', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1209/3', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1209/4', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1210/1', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1210/2', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1210/3', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1210/4', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1211/1', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1211/2', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1211/3', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1211/4', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1212/1', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1212/2', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1212/3', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1212/4', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1213/1', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1213/2', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1213/3', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1213/4', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1214/1', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1214/2', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1214/3', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1214/4', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1215/1', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1215/2', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1215/3', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1215/4', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1216/1', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1216/2', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1216/3', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1216/4', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1217/1', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1217/2', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1217/3', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1217/4', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1218/1', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1218/2', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1218/3', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1218/4', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1219/1', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1219/2', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1219/3', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1219/4', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1220/1', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1220/2', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1220/3', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1220/4', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1221/1', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1221/2', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1221/3', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1221/4', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1222/1', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1222/2', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1222/3', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1222/4', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1223/1', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1223/2', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1223/3', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1223/4', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1224/1', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1224/2', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1224/3', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1224/4', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1225/1', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1225/2', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1225/3', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1225/4', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1226/1', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1226/2', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1226/3', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1226/4', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1227/1', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1227/2', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1227/3', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1227/4', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1228/1', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1228/2', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1228/3', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1228/4', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1229/1', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1229/2', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1229/3', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1229/4', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1230/1', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1230/2', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1230/3', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1230/4', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1231/1', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1231/2', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1231/3', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1231/4', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1232/1', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1232/2', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1232/3', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1232/4', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1233/1', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1233/2', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1233/3', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1233/4', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1234/1', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1234/2', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1234/3', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1234/4', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1235/1', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1235/2', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1235/3', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1235/4', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1236/1', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1236/2', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1236/3', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1236/4', 2, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1301/1', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1301/2', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1301/3', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1301/4', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1302/1', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1302/2', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1302/3', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1302/4', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1303/1', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1303/2', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1303/3', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1303/4', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1304/1', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1304/2', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1304/3', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1304/4', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1305/1', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1305/2', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1305/3', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1305/4', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1306/1', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1306/2', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1306/3', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1306/4', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1307/1', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1307/2', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1307/3', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1307/4', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1308/1', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1308/2', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1308/3', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1308/4', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1309/1', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1309/2', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1309/3', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1309/4', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1310/1', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1310/2', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1310/3', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1310/4', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1311/1', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1311/2', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1311/3', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1311/4', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1312/1', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1312/2', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1312/3', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1312/4', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1313/1', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1313/2', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1313/3', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1313/4', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1314/1', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1314/2', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1314/3', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1314/4', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1315/1', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1315/2', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1315/3', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1315/4', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1316/1', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1316/2', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1316/3', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1316/4', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1317/1', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1317/2', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1317/3', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1317/4', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1318/1', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1318/2', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1318/3', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1318/4', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1319/1', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1319/2', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1319/3', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1319/4', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1320/1', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1320/2', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1320/3', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1320/4', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1321/1', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1321/2', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1321/3', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1321/4', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1322/1', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1322/2', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1322/3', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1322/4', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1323/1', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1323/2', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1323/3', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1323/4', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1324/1', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1324/2', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1324/3', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1324/4', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1325/1', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1325/2', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1325/3', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1325/4', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1326/1', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1326/2', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1326/3', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1326/4', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1327/1', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1327/2', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1327/3', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1327/4', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1328/1', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1328/2', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1328/3', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1328/4', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1329/1', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1329/2', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1329/3', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1329/4', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1330/1', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1330/2', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1330/3', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1330/4', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1331/1', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1331/2', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1331/3', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1331/4', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1332/1', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1332/2', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1332/3', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1332/4', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1333/1', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1333/2', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1333/3', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1333/4', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1334/1', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1334/2', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1334/3', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1334/4', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1335/1', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1335/2', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1335/3', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1335/4', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1336/1', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1336/2', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1336/3', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1336/4', 3, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1401/1', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1401/2', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1401/3', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1401/4', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1402/1', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1402/2', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1402/3', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1402/4', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1403/1', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1403/2', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1403/3', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1403/4', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1404/1', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1404/2', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1404/3', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1404/4', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1405/1', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1405/2', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1405/3', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1405/4', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1406/1', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1406/2', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1406/3', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1406/4', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1407/1', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1407/2', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1407/3', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1407/4', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1408/1', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1408/2', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1408/3', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1408/4', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1409/1', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1409/2', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1409/3', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1409/4', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1410/1', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1410/2', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1410/3', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1410/4', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1411/1', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1411/2', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1411/3', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1411/4', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1412/1', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1412/2', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1412/3', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1412/4', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1413/1', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1413/2', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1413/3', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1413/4', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1414/1', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1414/2', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1414/3', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1414/4', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1415/1', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1415/2', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1415/3', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1415/4', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1416/1', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1416/2', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1416/3', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1416/4', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1417/1', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1417/2', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1417/3', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1417/4', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1418/1', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1418/2', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1418/3', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1418/4', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1419/1', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1419/2', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1419/3', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1419/4', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1420/1', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1420/2', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1420/3', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1420/4', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1421/1', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1421/2', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1421/3', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1421/4', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1422/1', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1422/2', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1422/3', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1422/4', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1423/1', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1423/2', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1423/3', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1423/4', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1424/1', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1424/2', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1424/3', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1424/4', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1425/1', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1425/2', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1425/3', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1425/4', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1426/1', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1426/2', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1426/3', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1426/4', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1427/1', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1427/2', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1427/3', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1427/4', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1428/1', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1428/2', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1428/3', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1428/4', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1429/1', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1429/2', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1429/3', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1429/4', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1430/1', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1430/2', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1430/3', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1430/4', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1431/1', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1431/2', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1431/3', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1431/4', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1432/1', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1432/2', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1432/3', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1432/4', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1433/1', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1433/2', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1433/3', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1433/4', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1434/1', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1434/2', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1434/3', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1434/4', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1435/1', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1435/2', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1435/3', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1435/4', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1436/1', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1436/2', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1436/3', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1436/4', 4, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1501/1', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1501/2', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1501/3', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1501/4', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1502/1', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1502/2', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1502/3', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1502/4', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1503/1', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1503/2', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1503/3', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1503/4', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1504/1', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1504/2', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1504/3', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1504/4', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1505/1', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1505/2', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1505/3', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1505/4', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1506/1', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1506/2', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1506/3', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1506/4', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1507/1', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1507/2', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1507/3', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1507/4', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1508/1', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1508/2', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1508/3', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1508/4', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1509/1', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1509/2', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1509/3', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1509/4', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1510/1', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1510/2', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1510/3', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1510/4', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1511/1', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1511/2', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1511/3', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1511/4', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1512/1', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1512/2', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1512/3', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1512/4', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1513/1', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1513/2', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1513/3', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1513/4', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1514/1', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1514/2', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1514/3', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1514/4', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1515/1', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1515/2', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1515/3', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1515/4', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1516/1', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1516/2', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1516/3', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1516/4', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1517/1', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1517/2', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1517/3', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1517/4', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1518/1', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1518/2', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1518/3', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1518/4', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1519/1', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1519/2', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1519/3', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1519/4', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1520/1', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1520/2', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1520/3', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1520/4', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1521/1', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1521/2', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1521/3', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1521/4', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1522/1', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1522/2', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1522/3', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1522/4', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1523/1', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1523/2', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1523/3', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1523/4', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1524/1', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1524/2', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1524/3', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1524/4', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1525/1', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1525/2', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1525/3', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1525/4', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1526/1', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1526/2', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1526/3', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1526/4', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1527/1', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1527/2', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1527/3', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1527/4', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1528/1', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1528/2', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1528/3', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1528/4', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1529/1', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1529/2', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1529/3', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1529/4', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1530/1', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1530/2', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1530/3', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1530/4', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1531/1', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1531/2', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1531/3', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1531/4', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1532/1', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1532/2', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1532/3', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1532/4', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1533/1', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1533/2', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1533/3', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1533/4', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1534/1', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1534/2', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1534/3', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1534/4', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1535/1', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1535/2', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1535/3', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1535/4', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1536/1', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1536/2', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1536/3', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1536/4', 5, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1601/1', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1601/2', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1601/3', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1601/4', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1602/1', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1602/2', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1602/3', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1602/4', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1603/1', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1603/2', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1603/3', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1603/4', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1604/1', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1604/2', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1604/3', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1604/4', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1605/1', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1605/2', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1605/3', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1605/4', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1606/1', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1606/2', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1606/3', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1606/4', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1607/1', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1607/2', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1607/3', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1607/4', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1608/1', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1608/2', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1608/3', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1608/4', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1609/1', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1609/2', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1609/3', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1609/4', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1610/1', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1610/2', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1610/3', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1610/4', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1611/1', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1611/2', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1611/3', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1611/4', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1612/1', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1612/2', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1612/3', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1612/4', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1613/1', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1613/2', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1613/3', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1613/4', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1614/1', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1614/2', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1614/3', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1614/4', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1615/1', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1615/2', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1615/3', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1615/4', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1616/1', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1616/2', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1616/3', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1616/4', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1617/1', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1617/2', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1617/3', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1617/4', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1618/1', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1618/2', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1618/3', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1618/4', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1619/1', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1619/2', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1619/3', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1619/4', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1620/1', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1620/2', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1620/3', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1620/4', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1621/1', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1621/2', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1621/3', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1621/4', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1622/1', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1622/2', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1622/3', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1622/4', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1623/1', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1623/2', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1623/3', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1623/4', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1624/1', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1624/2', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1624/3', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1624/4', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1625/1', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1625/2', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1625/3', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1625/4', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1626/1', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1626/2', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1626/3', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1626/4', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1627/1', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1627/2', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1627/3', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1627/4', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1628/1', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1628/2', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1628/3', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1628/4', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1629/1', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1629/2', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1629/3', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1629/4', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1630/1', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1630/2', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1630/3', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1630/4', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1631/1', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1631/2', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1631/3', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1631/4', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1632/1', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1632/2', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1632/3', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1632/4', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1633/1', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1633/2', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1633/3', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1633/4', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1634/1', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1634/2', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1634/3', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1634/4', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1635/1', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1635/2', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1635/3', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1635/4', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1636/1', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1636/2', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1636/3', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1636/4', 6, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1701/1', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1701/2', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1701/3', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1701/4', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1702/1', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1702/2', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1702/3', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1702/4', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1703/1', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1703/2', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1703/3', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1703/4', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1704/1', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1704/2', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1704/3', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1704/4', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1705/1', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1705/2', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1705/3', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1705/4', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1706/1', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1706/2', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1706/3', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1706/4', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1707/1', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1707/2', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1707/3', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1707/4', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1708/1', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1708/2', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1708/3', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1708/4', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1709/1', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1709/2', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1709/3', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1709/4', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1710/1', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1710/2', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1710/3', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1710/4', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1711/1', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1711/2', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1711/3', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1711/4', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1712/1', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1712/2', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1712/3', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1712/4', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1713/1', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1713/2', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1713/3', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1713/4', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1714/1', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1714/2', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1714/3', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1714/4', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1715/1', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1715/2', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1715/3', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1715/4', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1716/1', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1716/2', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1716/3', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1716/4', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1717/1', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1717/2', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1717/3', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1717/4', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1718/1', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1718/2', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1718/3', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1718/4', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1719/1', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1719/2', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1719/3', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1719/4', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1720/1', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1720/2', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1720/3', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1720/4', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1721/1', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1721/2', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1721/3', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1721/4', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1722/1', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1722/2', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1722/3', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1722/4', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1723/1', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1723/2', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1723/3', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1723/4', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1724/1', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1724/2', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1724/3', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1724/4', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1725/1', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1725/2', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1725/3', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1725/4', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1726/1', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1726/2', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1726/3', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1726/4', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1727/1', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1727/2', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1727/3', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1727/4', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1728/1', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1728/2', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1728/3', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1728/4', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1729/1', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1729/2', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1729/3', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1729/4', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1730/1', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1730/2', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1730/3', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1730/4', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1731/1', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1731/2', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1731/3', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1731/4', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1732/1', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1732/2', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1732/3', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1732/4', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1733/1', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1733/2', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1733/3', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1733/4', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1734/1', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1734/2', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1734/3', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1734/4', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1735/1', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1735/2', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1735/3', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1735/4', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1736/1', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1736/2', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1736/3', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1736/4', 7, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1801/1', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1801/2', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1801/3', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1801/4', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1802/1', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1802/2', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1802/3', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1802/4', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1803/1', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1803/2', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1803/3', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1803/4', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1804/1', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1804/2', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1804/3', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1804/4', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1805/1', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1805/2', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1805/3', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1805/4', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1806/1', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1806/2', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1806/3', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1806/4', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1807/1', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1807/2', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1807/3', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1807/4', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1808/1', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1808/2', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1808/3', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1808/4', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1809/1', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1809/2', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1809/3', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1809/4', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1810/1', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1810/2', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1810/3', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1810/4', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1811/1', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1811/2', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1811/3', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1811/4', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1812/1', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1812/2', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1812/3', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1812/4', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1813/1', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1813/2', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1813/3', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1813/4', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1814/1', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1814/2', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1814/3', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1814/4', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1815/1', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1815/2', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1815/3', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1815/4', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1816/1', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1816/2', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1816/3', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1816/4', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1817/1', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1817/2', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1817/3', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1817/4', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1818/1', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1818/2', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1818/3', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1818/4', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1819/1', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1819/2', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1819/3', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1819/4', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1820/1', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1820/2', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1820/3', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1820/4', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1821/1', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1821/2', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1821/3', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1821/4', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1822/1', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1822/2', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1822/3', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1822/4', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1823/1', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1823/2', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1823/3', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1823/4', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1824/1', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1824/2', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1824/3', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1824/4', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1825/1', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1825/2', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1825/3', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1825/4', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1826/1', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1826/2', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1826/3', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1826/4', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1827/1', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1827/2', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1827/3', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1827/4', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1828/1', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1828/2', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1828/3', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1828/4', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1829/1', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1829/2', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1829/3', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1829/4', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1830/1', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1830/2', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1830/3', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1830/4', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1831/1', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1831/2', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1831/3', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1831/4', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1832/1', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1832/2', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1832/3', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1832/4', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1833/1', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1833/2', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1833/3', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1833/4', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1834/1', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1834/2', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1834/3', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1834/4', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1835/1', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1835/2', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1835/3', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1835/4', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1836/1', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1836/2', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1836/3', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('1836/4', 8, 0);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2201/1', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2201/2', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2201/3', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2201/4', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2202/1', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2202/2', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2202/3', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2202/4', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2203/1', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2203/2', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2203/3', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2203/4', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2204/1', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2204/2', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2204/3', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2204/4', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2205/1', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2205/2', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2205/3', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2205/4', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2206/1', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2206/2', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2206/3', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2206/4', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2207/1', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2207/2', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2207/3', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2207/4', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2208/1', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2208/2', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2208/3', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2208/4', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2209/1', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2209/2', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2209/3', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2209/4', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2210/1', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2210/2', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2210/3', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2210/4', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2211/1', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2211/2', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2211/3', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2211/4', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2212/1', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2212/2', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2212/3', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2212/4', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2213/1', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2213/2', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2213/3', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2213/4', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2214/1', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2214/2', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2214/3', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2214/4', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2215/1', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2215/2', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2215/3', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2215/4', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2216/1', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2216/2', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2216/3', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2216/4', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2217/1', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2217/2', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2217/3', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2217/4', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2218/1', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2218/2', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2218/3', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2218/4', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2219/1', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2219/2', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2219/3', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2219/4', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2220/1', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2220/2', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2220/3', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2220/4', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2221/1', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2221/2', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2221/3', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2221/4', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2222/1', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2222/2', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2222/3', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2222/4', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2223/1', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2223/2', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2223/3', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2223/4', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2224/1', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2224/2', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2224/3', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2224/4', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2225/1', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2225/2', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2225/3', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2225/4', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2226/1', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2226/2', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2226/3', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2226/4', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2227/1', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2227/2', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2227/3', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2227/4', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2228/1', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2228/2', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2228/3', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2228/4', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2229/1', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2229/2', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2229/3', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2229/4', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2230/1', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2230/2', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2230/3', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2230/4', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2231/1', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2231/2', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2231/3', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2231/4', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2232/1', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2232/2', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2232/3', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2232/4', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2233/1', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2233/2', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2233/3', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2233/4', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2234/1', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2234/2', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2234/3', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2234/4', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2235/1', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2235/2', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2235/3', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2235/4', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2236/1', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2236/2', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2236/3', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2236/4', 2, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2301/1', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2301/2', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2301/3', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2301/4', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2302/1', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2302/2', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2302/3', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2302/4', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2303/1', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2303/2', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2303/3', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2303/4', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2304/1', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2304/2', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2304/3', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2304/4', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2305/1', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2305/2', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2305/3', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2305/4', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2306/1', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2306/2', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2306/3', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2306/4', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2307/1', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2307/2', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2307/3', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2307/4', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2308/1', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2308/2', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2308/3', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2308/4', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2309/1', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2309/2', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2309/3', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2309/4', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2310/1', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2310/2', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2310/3', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2310/4', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2311/1', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2311/2', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2311/3', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2311/4', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2312/1', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2312/2', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2312/3', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2312/4', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2313/1', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2313/2', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2313/3', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2313/4', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2314/1', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2314/2', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2314/3', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2314/4', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2315/1', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2315/2', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2315/3', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2315/4', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2316/1', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2316/2', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2316/3', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2316/4', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2317/1', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2317/2', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2317/3', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2317/4', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2318/1', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2318/2', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2318/3', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2318/4', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2319/1', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2319/2', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2319/3', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2319/4', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2320/1', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2320/2', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2320/3', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2320/4', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2321/1', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2321/2', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2321/3', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2321/4', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2322/1', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2322/2', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2322/3', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2322/4', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2323/1', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2323/2', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2323/3', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2323/4', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2324/1', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2324/2', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2324/3', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2324/4', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2325/1', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2325/2', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2325/3', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2325/4', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2326/1', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2326/2', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2326/3', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2326/4', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2327/1', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2327/2', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2327/3', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2327/4', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2328/1', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2328/2', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2328/3', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2328/4', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2329/1', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2329/2', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2329/3', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2329/4', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2330/1', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2330/2', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2330/3', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2330/4', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2331/1', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2331/2', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2331/3', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2331/4', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2332/1', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2332/2', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2332/3', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2332/4', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2333/1', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2333/2', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2333/3', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2333/4', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2334/1', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2334/2', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2334/3', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2334/4', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2335/1', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2335/2', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2335/3', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2335/4', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2336/1', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2336/2', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2336/3', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2336/4', 3, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2401/1', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2401/2', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2401/3', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2401/4', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2402/1', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2402/2', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2402/3', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2402/4', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2403/1', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2403/2', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2403/3', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2403/4', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2404/1', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2404/2', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2404/3', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2404/4', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2405/1', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2405/2', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2405/3', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2405/4', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2406/1', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2406/2', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2406/3', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2406/4', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2407/1', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2407/2', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2407/3', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2407/4', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2408/1', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2408/2', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2408/3', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2408/4', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2409/1', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2409/2', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2409/3', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2409/4', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2410/1', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2410/2', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2410/3', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2410/4', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2411/1', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2411/2', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2411/3', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2411/4', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2412/1', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2412/2', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2412/3', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2412/4', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2413/1', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2413/2', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2413/3', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2413/4', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2414/1', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2414/2', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2414/3', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2414/4', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2415/1', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2415/2', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2415/3', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2415/4', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2416/1', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2416/2', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2416/3', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2416/4', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2417/1', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2417/2', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2417/3', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2417/4', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2418/1', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2418/2', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2418/3', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2418/4', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2419/1', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2419/2', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2419/3', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2419/4', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2420/1', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2420/2', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2420/3', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2420/4', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2421/1', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2421/2', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2421/3', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2421/4', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2422/1', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2422/2', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2422/3', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2422/4', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2423/1', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2423/2', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2423/3', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2423/4', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2424/1', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2424/2', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2424/3', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2424/4', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2425/1', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2425/2', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2425/3', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2425/4', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2426/1', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2426/2', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2426/3', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2426/4', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2427/1', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2427/2', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2427/3', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2427/4', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2428/1', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2428/2', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2428/3', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2428/4', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2429/1', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2429/2', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2429/3', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2429/4', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2430/1', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2430/2', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2430/3', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2430/4', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2431/1', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2431/2', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2431/3', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2431/4', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2432/1', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2432/2', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2432/3', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2432/4', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2433/1', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2433/2', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2433/3', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2433/4', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2434/1', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2434/2', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2434/3', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2434/4', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2435/1', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2435/2', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2435/3', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2435/4', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2436/1', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2436/2', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2436/3', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2436/4', 4, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2501/1', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2501/2', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2501/3', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2501/4', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2502/1', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2502/2', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2502/3', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2502/4', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2503/1', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2503/2', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2503/3', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2503/4', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2504/1', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2504/2', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2504/3', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2504/4', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2505/1', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2505/2', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2505/3', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2505/4', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2506/1', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2506/2', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2506/3', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2506/4', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2507/1', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2507/2', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2507/3', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2507/4', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2508/1', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2508/2', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2508/3', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2508/4', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2509/1', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2509/2', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2509/3', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2509/4', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2510/1', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2510/2', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2510/3', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2510/4', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2511/1', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2511/2', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2511/3', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2511/4', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2512/1', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2512/2', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2512/3', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2512/4', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2513/1', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2513/2', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2513/3', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2513/4', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2514/1', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2514/2', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2514/3', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2514/4', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2515/1', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2515/2', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2515/3', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2515/4', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2516/1', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2516/2', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2516/3', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2516/4', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2517/1', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2517/2', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2517/3', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2517/4', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2518/1', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2518/2', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2518/3', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2518/4', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2519/1', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2519/2', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2519/3', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2519/4', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2520/1', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2520/2', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2520/3', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2520/4', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2521/1', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2521/2', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2521/3', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2521/4', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2522/1', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2522/2', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2522/3', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2522/4', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2523/1', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2523/2', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2523/3', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2523/4', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2524/1', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2524/2', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2524/3', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2524/4', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2525/1', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2525/2', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2525/3', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2525/4', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2526/1', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2526/2', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2526/3', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2526/4', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2527/1', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2527/2', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2527/3', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2527/4', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2528/1', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2528/2', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2528/3', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2528/4', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2529/1', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2529/2', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2529/3', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2529/4', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2530/1', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2530/2', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2530/3', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2530/4', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2531/1', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2531/2', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2531/3', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2531/4', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2532/1', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2532/2', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2532/3', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2532/4', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2533/1', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2533/2', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2533/3', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2533/4', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2534/1', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2534/2', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2534/3', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2534/4', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2535/1', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2535/2', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2535/3', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2535/4', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2536/1', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2536/2', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2536/3', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2536/4', 5, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2601/1', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2601/2', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2601/3', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2601/4', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2602/1', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2602/2', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2602/3', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2602/4', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2603/1', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2603/2', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2603/3', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2603/4', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2604/1', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2604/2', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2604/3', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2604/4', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2605/1', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2605/2', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2605/3', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2605/4', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2606/1', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2606/2', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2606/3', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2606/4', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2607/1', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2607/2', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2607/3', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2607/4', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2608/1', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2608/2', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2608/3', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2608/4', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2609/1', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2609/2', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2609/3', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2609/4', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2610/1', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2610/2', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2610/3', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2610/4', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2611/1', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2611/2', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2611/3', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2611/4', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2612/1', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2612/2', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2612/3', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2612/4', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2613/1', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2613/2', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2613/3', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2613/4', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2614/1', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2614/2', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2614/3', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2614/4', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2615/1', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2615/2', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2615/3', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2615/4', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2616/1', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2616/2', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2616/3', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2616/4', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2617/1', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2617/2', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2617/3', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2617/4', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2618/1', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2618/2', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2618/3', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2618/4', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2619/1', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2619/2', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2619/3', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2619/4', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2620/1', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2620/2', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2620/3', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2620/4', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2621/1', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2621/2', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2621/3', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2621/4', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2622/1', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2622/2', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2622/3', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2622/4', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2623/1', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2623/2', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2623/3', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2623/4', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2624/1', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2624/2', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2624/3', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2624/4', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2625/1', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2625/2', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2625/3', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2625/4', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2626/1', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2626/2', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2626/3', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2626/4', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2627/1', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2627/2', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2627/3', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2627/4', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2628/1', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2628/2', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2628/3', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2628/4', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2629/1', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2629/2', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2629/3', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2629/4', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2630/1', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2630/2', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2630/3', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2630/4', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2631/1', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2631/2', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2631/3', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2631/4', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2632/1', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2632/2', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2632/3', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2632/4', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2633/1', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2633/2', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2633/3', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2633/4', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2634/1', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2634/2', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2634/3', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2634/4', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2635/1', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2635/2', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2635/3', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2635/4', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2636/1', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2636/2', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2636/3', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2636/4', 6, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2701/1', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2701/2', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2701/3', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2701/4', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2702/1', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2702/2', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2702/3', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2702/4', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2703/1', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2703/2', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2703/3', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2703/4', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2704/1', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2704/2', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2704/3', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2704/4', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2705/1', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2705/2', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2705/3', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2705/4', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2706/1', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2706/2', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2706/3', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2706/4', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2707/1', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2707/2', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2707/3', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2707/4', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2708/1', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2708/2', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2708/3', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2708/4', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2709/1', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2709/2', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2709/3', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2709/4', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2710/1', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2710/2', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2710/3', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2710/4', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2711/1', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2711/2', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2711/3', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2711/4', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2712/1', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2712/2', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2712/3', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2712/4', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2713/1', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2713/2', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2713/3', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2713/4', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2714/1', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2714/2', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2714/3', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2714/4', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2715/1', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2715/2', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2715/3', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2715/4', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2716/1', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2716/2', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2716/3', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2716/4', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2717/1', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2717/2', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2717/3', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2717/4', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2718/1', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2718/2', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2718/3', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2718/4', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2719/1', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2719/2', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2719/3', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2719/4', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2720/1', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2720/2', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2720/3', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2720/4', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2721/1', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2721/2', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2721/3', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2721/4', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2722/1', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2722/2', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2722/3', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2722/4', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2723/1', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2723/2', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2723/3', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2723/4', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2724/1', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2724/2', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2724/3', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2724/4', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2725/1', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2725/2', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2725/3', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2725/4', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2726/1', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2726/2', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2726/3', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2726/4', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2727/1', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2727/2', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2727/3', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2727/4', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2728/1', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2728/2', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2728/3', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2728/4', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2729/1', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2729/2', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2729/3', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2729/4', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2730/1', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2730/2', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2730/3', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2730/4', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2731/1', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2731/2', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2731/3', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2731/4', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2732/1', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2732/2', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2732/3', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2732/4', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2733/1', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2733/2', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2733/3', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2733/4', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2734/1', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2734/2', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2734/3', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2734/4', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2735/1', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2735/2', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2735/3', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2735/4', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2736/1', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2736/2', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2736/3', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2736/4', 7, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2801/1', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2801/2', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2801/3', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2801/4', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2802/1', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2802/2', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2802/3', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2802/4', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2803/1', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2803/2', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2803/3', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2803/4', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2804/1', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2804/2', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2804/3', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2804/4', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2805/1', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2805/2', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2805/3', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2805/4', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2806/1', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2806/2', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2806/3', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2806/4', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2807/1', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2807/2', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2807/3', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2807/4', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2808/1', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2808/2', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2808/3', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2808/4', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2809/1', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2809/2', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2809/3', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2809/4', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2810/1', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2810/2', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2810/3', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2810/4', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2811/1', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2811/2', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2811/3', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2811/4', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2812/1', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2812/2', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2812/3', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2812/4', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2813/1', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2813/2', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2813/3', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2813/4', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2814/1', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2814/2', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2814/3', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2814/4', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2815/1', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2815/2', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2815/3', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2815/4', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2816/1', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2816/2', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2816/3', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2816/4', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2817/1', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2817/2', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2817/3', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2817/4', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2818/1', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2818/2', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2818/3', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2818/4', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2819/1', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2819/2', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2819/3', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2819/4', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2820/1', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2820/2', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2820/3', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2820/4', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2821/1', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2821/2', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2821/3', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2821/4', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2822/1', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2822/2', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2822/3', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2822/4', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2823/1', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2823/2', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2823/3', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2823/4', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2824/1', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2824/2', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2824/3', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2824/4', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2825/1', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2825/2', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2825/3', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2825/4', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2826/1', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2826/2', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2826/3', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2826/4', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2827/1', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2827/2', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2827/3', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2827/4', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2828/1', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2828/2', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2828/3', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2828/4', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2829/1', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2829/2', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2829/3', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2829/4', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2830/1', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2830/2', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2830/3', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2830/4', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2831/1', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2831/2', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2831/3', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2831/4', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2832/1', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2832/2', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2832/3', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2832/4', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2833/1', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2833/2', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2833/3', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2833/4', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2834/1', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2834/2', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2834/3', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2834/4', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2835/1', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2835/2', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2835/3', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2835/4', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2836/1', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2836/2', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2836/3', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2836/4', 8, 1);
INSERT INTO `room` (`room_number`, `floor`, `type_room`) VALUES
	('2871/1', 8, 1);
/*!40000 ALTER TABLE `room` ENABLE KEYS */;

-- Dumping structure for table dormitory.room_history
CREATE TABLE IF NOT EXISTS `room_history` (
  `no_room_history` int(6) NOT NULL AUTO_INCREMENT,
  `std_code` varchar(15) NOT NULL,
  `room_number_old` varchar(6) DEFAULT NULL,
  `room_number_new` varchar(6) DEFAULT NULL,
  `date_room` date NOT NULL,
  `status` int(2) NOT NULL,
  PRIMARY KEY (`no_room_history`),
  KEY `FK_status` (`status`),
  KEY `FK_std_code1` (`std_code`),
  CONSTRAINT `FK_status` FOREIGN KEY (`status`) REFERENCES `room_status` (`status_number`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `FK_std_code1` FOREIGN KEY (`std_code`) REFERENCES `student` (`std_code`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8;

-- Dumping data for table dormitory.room_history: ~0 rows (approximately)
DELETE FROM `room_history`;
/*!40000 ALTER TABLE `room_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `room_history` ENABLE KEYS */;

-- Dumping structure for table dormitory.room_status
CREATE TABLE IF NOT EXISTS `room_status` (
  `status_number` int(2) NOT NULL AUTO_INCREMENT,
  `status_name` varchar(50) NOT NULL,
  PRIMARY KEY (`status_number`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table dormitory.room_status: ~3 rows (approximately)
DELETE FROM `room_status`;
/*!40000 ALTER TABLE `room_status` DISABLE KEYS */;
INSERT INTO `room_status` (`status_number`, `status_name`) VALUES
	(1, 'ย้ายห้อง');
INSERT INTO `room_status` (`status_number`, `status_name`) VALUES
	(2, 'ย้ายออก');
INSERT INTO `room_status` (`status_number`, `status_name`) VALUES
	(3, 'ย้ายเข้า');
/*!40000 ALTER TABLE `room_status` ENABLE KEYS */;

-- Dumping structure for table dormitory.room_student
CREATE TABLE IF NOT EXISTS `room_student` (
  `stay_number` int(4) NOT NULL AUTO_INCREMENT COMMENT 'รหัสการเข้าพัก',
  `std_code` varchar(15) NOT NULL COMMENT 'รหัสนักศึกษา',
  `room_number` varchar(6) NOT NULL COMMENT 'เลขห้อง',
  PRIMARY KEY (`stay_number`),
  KEY `room_student_ibfk_1` (`room_number`),
  KEY `room_student_ibfk_2` (`std_code`),
  CONSTRAINT `room_student_ibfk_1` FOREIGN KEY (`room_number`) REFERENCES `room` (`room_number`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `room_student_ibfk_2` FOREIGN KEY (`std_code`) REFERENCES `student` (`std_code`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2901 DEFAULT CHARSET=utf8;

-- Dumping data for table dormitory.room_student: ~2,005 rows (approximately)
DELETE FROM `room_student`;
/*!40000 ALTER TABLE `room_student` DISABLE KEYS */;
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(858, '63162110458-4', '1201/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(859, '63162110457-4', '1201/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(860, '63162110272-2', '1201/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(861, '63162110521-0', '1201/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(862, '63162110026-5', '1202/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(863, '63162110002-9', '1202/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(864, '63162110152-7', '1202/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(865, '63162110138-2', '1202/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(866, '63162110156-7', '1203/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(867, '63151110149-3', '1203/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(868, '62152110020-9', '1204/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(869, '63152110100-0', '1204/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(870, '63152110271-4', '1204/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(871, '63162110244-9', '1203/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(872, '63152110173-5', '1204/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(873, '63151110131-5', '1203/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(874, '63152110237-3', '1205/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(875, '63152110241-1', '1205/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(876, '63162110468-2', '1206/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(877, '63152110317-6', '1205/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(878, '63152110220-5', '1205/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(879, '63162110076-4', '1206/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(880, '63151110183-4', '1207/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(881, '62152110217-9', '1207/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(882, '63162110469-2', '1206/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(883, '63162110525-0', '1206/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(884, '63151110151-0', '1208/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(885, '62152110163-9', '1207/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(886, '61152110353-1', '1208/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(887, '62152110114-0', '1207/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(888, '62162110175-5', '1208/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(889, '63162110073-4', '1209/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(890, '63162110093-0', '1209/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(891, '63162110086-2', '1209/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(892, '62162110172-5', '1208/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(893, '62162110201-9', '1210/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(894, '63172110001-7', '1210/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(895, '63162110102-8', '1209/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(896, '62162110034-5', '1211/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(897, '63151110130-5', '1211/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(898, '62162110225-5', '1211/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(899, '63162110299-8', '1210/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(900, '62162110139-4', '1210/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(901, '63162110118-6', '1212/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(902, '63151110150-0', '1211/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(903, '63162110150-7', '1212/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(904, '63162110142-0', '1212/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(905, '63162110159-7', '1212/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(906, '63162110436-9', '1213/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(907, '61152110171-9', '1214/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(908, '63162110394-7', '1213/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(909, '63162110341-8', '1213/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(910, '63162110381-9', '1213/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(911, '61152110337-6', '1214/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(912, '63151110188-4', '1215/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(913, '62152110192-3', '1215/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(914, '61152110297-4', '1214/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(915, '63182110220-9', '1214/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(916, '62152110186-5', '1215/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(917, '62152110111-0', '1215/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(918, '62152310060-6', '1216/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(919, '62152310194-9', '1216/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(920, '62152310140-0', '1216/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(921, '63152110028-7', '1216/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(922, '62162110063-8', '1217/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(923, '62162110414-5', '1217/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(924, '62162110407-7', '1217/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(925, '62162110072-6', '1217/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(926, '60162110093-6', '1218/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(927, '63152110091-2', '1218/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(928, '62152310143-0', '1218/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(929, '62152310018-7', '1218/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(930, '63162110406-5', '1219/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(931, '61152110108-4', '1219/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(932, '63162110132-2', '1219/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(933, '62162110261-6', '1220/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(934, '61152110011-3', '1219/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(935, '62162110269-6', '1220/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(936, '63162110259-6', '1221/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(937, '62162110303-8', '1220/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(938, '62162110149-2', '1220/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(939, '63162110388-9', '1221/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(940, '63171110398-6', '1222/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(941, '63162110438-9', '1221/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(942, '63171110408-4', '1222/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(943, '63162110407-5', '1221/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(944, '62152110148-4', '1222/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(945, '63171110404-4', '1222/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(946, '63171110403-4', '1223/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(947, '63171110400-4', '1223/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(948, '62151110091-5', '1223/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(949, '62162110281-2', '1223/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(950, '63151110050-1', '1224/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(951, '61152110169-1', '1224/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(952, '63162110063-6', '1225/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(953, '63162110061-6', '1225/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(954, '61152110080-8', '1224/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(955, '63162110056-8', '1225/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(956, '63162210010-5', '1225/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(957, '63162110226-3', '1226/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(958, '63162110214-5', '1226/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(959, '63162110122-4', '1227/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(960, '63162110192-9', '1226/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(961, '63162110304-6', '1227/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(963, '63162110196-9', '1226/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(964, '63162110311-4', '1227/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(965, '60162110183-7', '1228/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(966, '63152310115-4', '1228/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(967, '63162110111-6', '1228/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(968, '61162110291-2', '1228/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(969, '63151110028-8', '1229/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(970, '63151110097-3', '1229/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(971, '62162110120-6', '1229/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(972, '63151110107-1', '1229/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(973, '62152110028-9', '1230/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(974, '63151110071-7', '1230/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(975, '63151110079-7', '1230/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(976, '61152110048-7', '1230/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(977, '62152110096-4', '1231/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(978, '62152110094-4', '1231/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(979, '62152110257-0', '1231/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(980, '62152110048-5', '1232/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(981, '63151110112-9', '1232/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(982, '62152110001-3', '1231/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(983, '63151110029-8', '1232/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(984, '63162110161-5', '1233/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(985, '63162110459-4', '1234/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(986, '63162110149-0', '1233/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(987, '63162110124-4', '1233/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(988, '63151110124-7', '1232/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(989, '63162110158-7', '1233/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(990, '60162110124-0', '1234/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(991, '60162110159-3', '1234/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(992, '63161110001-0', '1234/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(993, '62152310227-3', '1235/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(994, '63172110004-7', '1235/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(995, '62152310239-1', '1235/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(996, '62152310137-2', '1236/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(997, '62152310241-9', '1235/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(998, '60152110366-1', '1301/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(999, '63171110227-2', '1236/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1000, '62152310178-3', '1236/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1001, '62152310176-3', '1236/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1002, '60152110293-6', '1301/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1003, '63152310258-4', '1302/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1004, '63171110230-0', '1302/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1005, '62172110103-8', '1302/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1007, '60152110235-9', '1301/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1008, '62172110086-2', '1302/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1009, '63152110057-0', '1303/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1010, '61182110046-1', '1303/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1011, '63152110128-6', '1303/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1012, '63152110127-6', '1303/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1013, '62152310289-0', '1304/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1014, '63152310099-8', '1304/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1015, '63152310239-9', '1305/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1016, '62152310147-0', '1304/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1017, '63152310282-8', '1305/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1018, '63152310086-0', '1304/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1019, '63152310283-8', '1305/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1020, '62152310138-2', '1306/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1021, '62152310331-0', '1306/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1022, '63171110109-7', '1306/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1023, '63162110251-6', '1307/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1024, '63152310296-6', '1305/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1025, '63162110306-6', '1307/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1026, '62152310246-9', '1306/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1027, '60152110155-5', '1307/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1028, '63162110316-4', '1307/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1029, '62152110016-1', '1308/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1030, '61162110387-3', '1308/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1031, '61152110237-7', '1308/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1032, '63152210110-6', '1309/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1033, '62162110025-7', '1309/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1034, '62162110042-3', '1309/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1035, '63152310047-9', '1308/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1036, '62162110046-3', '1309/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1037, '61162110203-1', '1310/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1038, '63152210071-4', '1310/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1039, '63152210075-4', '1310/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1040, '63152210061-6', '1311/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1041, '63151110215-8', '1311/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1042, '63162110434-9', '1311/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1043, '63162110315-4', '1312/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1044, '63152210010-7', '1311/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1045, '63152210054-8', '1312/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1046, '61162110145-4', '1310/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1047, '63152110040-3', '1313/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1048, '63152210103-8', '1312/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1049, '63152110109-0', '1313/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1050, '63162110397-7', '1312/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1051, '62172310334-6', '1314/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1052, '63152210105-8', '1313/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1053, '62162110041-3', '1313/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1054, '63152210096-0', '1314/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1055, '62172310139-8', '1314/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1056, '63152210059-8', '1314/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1057, '63152210081-2', '1315/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1058, '63152210063-6', '1315/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1059, '63152210062-6', '1315/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1060, '63152210064-6', '1315/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1061, '63152210117-6', '1316/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1062, '63162110293-8', '1316/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1063, '63152210090-0', '1316/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1064, '63152210042-1', '1317/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1065, '63152110445-9', '1317/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1066, '63152210041-1', '1316/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1067, '63152210048-1', '1317/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1068, '63152210038-3', '1317/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1069, '62152110249-3', '1318/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1070, '63152110175-5', '1318/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1071, '62152110347-2', '1318/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1072, '62152110066-0', '1318/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1073, '63152110153-9', '1319/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1074, '63152110198-1', '1319/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1075, '63152110167-7', '1319/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1076, '62152110165-9', '1320/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1077, '63152110279-4', '1319/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1078, '63151110033-6', '1320/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1079, '62162110331-2', '1320/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1080, '62162110195-1', '1320/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1081, '63152110329-4', '1321/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1082, '63152210101-8', '1321/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1083, '63152310281-8', '1321/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1084, '63152110081-4', '1322/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1085, '61162110410-7', '1322/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1086, '63172110303-4', '1323/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1087, '61162110212-9', '1322/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1088, '63152110328-4', '1322/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1089, '63172110318-2', '1323/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1090, '63162110175-3', '1323/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1091, '63172110071-2', '1324/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1092, '63172110124-2', '1324/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1093, '63172110382-7', '1323/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1094, '63152110373-3', '1325/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1095, '63172110159-5', '1324/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1096, '62162110220-5', '1325/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1097, '63152110325-4', '1325/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1098, '62162110071-6', '1325/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1099, '63172110063-4', '1324/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1100, '63151110160-8', '1326/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1101, '63151110106-1', '1326/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1102, '63172110019-5', '1327/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1103, '63151110038-6', '1326/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1104, '63172110045-9', '1327/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1105, '63172110013-5', '1327/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1106, '63151110037-6', '1326/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1107, '63172110073-2', '1327/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1108, '63172110136-0', '1329/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1109, '60172110039-7', '1328/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1110, '60172110382-3', '1328/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1111, '63172310112-0', '1328/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1112, '63172110119-4', '1329/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1113, '63172310542-0', '1328/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1114, '63162110509-4', '1330/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1115, '63172110336-8', '1329/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1116, '63172110337-8', '1329/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1117, '63162110213-5', '1330/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1118, '63162110271-2', '1330/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1119, '63162110262-4', '1330/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1120, '63162110167-5', '1331/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1121, '63162110441-7', '1331/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1122, '63162110025-5', '1331/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1123, '61152110315-0', '1332/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1124, '63162110493-6', '1331/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1125, '63162110171-3', '1333/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1126, '62152110133-6', '1332/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1127, '63151110104-1', '1332/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1128, '63162110392-7', '1333/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1129, '63171110163-4', '1333/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1130, '61152110300-2', '1332/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1131, '63162110445-7', '1334/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1132, '63162110422-1', '1333/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1133, '63162110460-2', '1334/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1134, '63162110068-6', '1335/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1135, '63162110071-4', '1335/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1136, '63162110423-1', '1334/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1137, '63162110212-5', '1335/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1138, '63162110238-1', '1335/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1139, '63162110462-2', '1334/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1140, '61152110332-6', '1401/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1141, '63162110273-2', '1336/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1143, '61162110143-4', '1336/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1144, '63151110227-6', '1401/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1145, '61162110002-3', '1336/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1146, '61152110074-0', '1402/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1147, '63152310188-9', '1401/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1148, '63152310118-4', '1401/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1149, '61152110049-7', '1402/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1150, '61152110183-7', '1402/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1151, '63152110339-2', '1402/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1152, '63152110077-6', '1403/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1153, '63152110031-5', '1403/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1154, '63152110154-9', '1403/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1155, '62152110327-6', '1404/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1156, '61152110291-4', '1404/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1157, '61152110225-9', '1404/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1158, '63152110165-7', '1403/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1159, '61162110354-9', '1405/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1160, '61152110235-7', '1404/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1161, '63152110152-9', '1405/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1162, '63152110150-9', '1405/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1163, '63152110072-6', '1406/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1164, '63152110063-8', '1406/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1165, '63152110029-7', '1406/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1166, '63152310215-3', '1407/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1167, '63152310225-1', '1407/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1168, '61162110227-7', '1405/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1169, '63152110107-0', '1406/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1170, '63152310233-9', '1407/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1171, '63151110099-3', '1408/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1172, '63152110289-2', '1407/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1173, '63152310247-7', '1408/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1174, '63152310237-9', '1408/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1175, '61162110413-7', '1409/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1176, '63152110337-2', '1408/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1177, '63151110200-0', '1409/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1178, '61162110251-0', '1409/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1179, '63152110022-7', '1409/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1180, '62162110054-0', '1410/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1181, '62162110083-4', '1410/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1182, '62162110040-3', '1410/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1183, '62152110168-9', '1411/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1184, '62162110196-1', '1410/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1185, '63151110102-1', '1411/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1186, '62182110026-3', '1412/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1187, '62152110299-2', '1411/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1188, '63152310033-1', '1412/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1189, '62152110159-1', '1411/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1190, '63182110027-1', '1413/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1191, '63152110254-8', '1412/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1192, '63182110019-3', '1413/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1193, '63171110228-2', '1413/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1194, '62182110032-1', '1412/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1195, '63152310265-2', '1413/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1196, '63152310263-2', '1414/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1197, '63162110174-3', '1414/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1198, '63152310295-6', '1414/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1199, '63172110488-6', '1414/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1200, '63152310018-5', '1415/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1201, '63152310187-9', '1415/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1202, '62152110116-0', '1415/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1203, '63152310015-5', '1416/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1204, '63152310128-2', '1416/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1205, '63152310172-1', '1416/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1206, '63152310019-5', '1415/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1207, '60152110530-6', '1417/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1208, '60152110156-5', '1417/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1209, '63152310087-0', '1418/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1210, '63152310184-9', '1417/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1211, '63152310288-8', '1416/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1212, '63152310183-9', '1417/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1213, '63152310091-8', '1418/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1214, '63152110170-5', '1418/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1215, '63152310010-5', '1419/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1216, '63151110103-1', '1418/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1217, '63152110312-6', '1420/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1218, '63152110400-7', '1419/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1219, '63152110277-4', '1420/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1220, '62152110117-0', '1419/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1221, '62152110214-9', '1419/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1222, '63152310126-2', '1420/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1223, '60182110070-6', '1421/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1224, '63152110051-0', '1420/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1225, '60182110050-0', '1421/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1226, '60182110060-8', '1421/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1227, '63152310078-2', '1422/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1228, '63152110214-7', '1422/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1229, '60182110120-6', '1421/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1230, '63152310144-8', '1422/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1231, '63152110347-0', '1423/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1232, '63152110344-0', '1423/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1233, '63152310082-0', '1422/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1234, '63152310080-0', '1424/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1235, '63152110226-5', '1423/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1236, '63152310081-0', '1424/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1237, '62152110009-3', '1424/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1238, '63152110183-3', '1423/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1239, '62152110118-0', '1424/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1240, '60152110467-0', '1425/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1241, '60152110053-6', '1425/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1242, '63162110165-5', '1426/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1243, '63152110030-5', '1425/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1244, '63152110320-4', '1426/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1245, '60152110353-3', '1425/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1246, '63152110095-2', '1426/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1247, '60182110153-9', '1427/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1248, '63152110384-1', '1426/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1249, '60182110276-4', '1427/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1250, '60182110281-2', '1427/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1251, '63152110037-5', '1428/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1252, '63152110203-9', '1428/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1253, '63152110036-5', '1428/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1254, '63152310069-4', '1429/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1255, '63152110259-8', '1428/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1256, '63152310165-3', '1429/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1257, '63152110144-2', '1430/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1258, '63152110118-8', '1430/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1259, '63152110263-6', '1429/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1260, '63152310070-2', '1430/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1261, '63152310089-0', '1430/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1262, '63152110131-4', '1431/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1263, '63152110041-3', '1431/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1264, '63152110074-6', '1431/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1265, '63152310075-2', '1429/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1266, '63152110155-9', '1431/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1267, '63152110010-9', '1432/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1268, '63152110001-1', '1433/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1269, '63152110008-1', '1432/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1270, '63152110114-8', '1432/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1271, '63152110064-8', '1432/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1272, '63152110005-1', '1433/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1273, '63152110017-9', '1433/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1274, '63152310260-2', '1434/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1275, '63152110070-6', '1434/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1276, '63152110002-1', '1434/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1277, '63152110084-4', '1433/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1278, '63152110018-9', '1434/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1279, '62152310311-4', '1435/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1280, '62152310167-5', '1435/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1281, '62152310283-0', '1435/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1282, '62152310334-0', '1435/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1283, '61152110102-4', '1436/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1284, '63152110033-5', '1436/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1285, '63152310156-5', '1436/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1286, '62162110005-1', '1501/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1287, '63152110215-7', '1436/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1288, '62162110079-6', '1501/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1289, '62162110284-2', '1501/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1290, '63151110220-6', '1502/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1291, '62162110157-9', '1501/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1292, '61162110328-6', '1502/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1293, '61172110105-0', '1502/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1294, '62162110170-5', '1503/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1295, '63152110132-4', '1503/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1296, '63152110016-9', '1503/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1297, '63152110026-7', '1503/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1298, '63182110187-7', '1502/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1299, '63162110166-5', '1504/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1300, '63152110357-7', '1504/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1301, '63152110267-6', '1504/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1302, '62152110191-3', '1505/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1303, '62152110288-4', '1505/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1304, '63152110360-5', '1504/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1305, '62152110211-9', '1506/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1306, '63151110044-4', '1505/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1307, '63162110527-0', '1506/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1308, '63151110224-6', '1506/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1309, '62152110275-6', '1505/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1310, '63152110222-5', '1507/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1311, '63152110221-5', '1507/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1312, '62152110149-4', '1506/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1313, '63151110089-5', '1507/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1314, '62152110083-6', '1508/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1315, '61152110063-2', '1508/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1316, '62152110073-8', '1508/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1317, '61152110347-4', '1508/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1318, '62152110005-3', '1509/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1319, '63152110239-3', '1507/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1320, '62152110078-8', '1509/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1321, '62152110303-0', '1509/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1322, '63172110391-5', '1509/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1323, '63182110237-7', '1510/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1324, '63151110231-4', '1510/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1325, '62152310385-9', '1511/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1326, '63152110065-8', '1510/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1327, '60152110413-1', '1512/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1328, '61152110010-3', '1512/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1329, '62152310313-4', '1511/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1330, '63152310226-1', '1511/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1331, '63152310100-6', '1511/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1332, '60152110412-1', '1512/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1333, '63152110246-1', '1513/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1334, '63152110231-3', '1513/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1335, '61152110060-2', '1512/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1336, '63152110038-5', '1513/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1337, '63152110047-3', '1514/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1338, '63152110054-0', '1514/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1339, '63152110116-8', '1514/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1340, '63172110384-7', '1515/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1341, '62162110020-7', '1514/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1342, '62182110037-1', '1515/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1343, '63172110167-3', '1515/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1344, '63182110016-3', '1513/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1345, '63151110059-1', '1515/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1346, '62162110204-9', '1516/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1347, '62162110160-7', '1516/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1348, '63152110159-9', '1517/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1349, '63152110181-3', '1517/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1350, '62162110208-9', '1516/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1351, '63152110261-6', '1517/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1352, '61162110081-6', '1518/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1353, '61162110299-2', '1518/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1354, '63152110182-3', '1517/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1355, '62162110239-3', '1518/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1356, '61162110238-5', '1518/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1357, '62152110206-1', '1519/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1358, '63162110177-3', '1519/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1359, '63162110065-6', '1520/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1360, '62152110127-8', '1519/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1361, '63162110083-2', '1520/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1362, '62152110015-1', '1519/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1363, '63182110006-5', '1521/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1364, '63151110167-8', '1520/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1365, '63151110017-0', '1520/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1366, '63182110192-5', '1521/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1367, '63162110473-0', '1521/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1368, '63152110314-6', '1522/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1369, '63152310026-3', '1522/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1370, '62162110397-9', '1522/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1371, '63152110315-6', '1522/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1372, '63152310061-4', '1523/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1373, '63151110177-6', '1521/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1374, '63152310257-4', '1523/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1375, '63152310074-2', '1523/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1376, '63152310299-6', '1523/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1377, '63172110091-8', '1524/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1378, '63172110234-9', '1524/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1379, '63172110512-0', '1524/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1380, '63151110061-9', '1524/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1381, '63152110293-0', '1525/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1382, '63152110355-7', '1525/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1383, '63152310123-2', '1525/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1384, '60152110135-0', '1526/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1385, '63151110075-7', '1526/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1386, '60152110297-6', '1526/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1387, '63152110349-0', '1527/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1388, '63151110098-3', '1526/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1389, '63152110178-5', '1525/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1390, '63152110353-7', '1527/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1391, '63152110370-3', '1527/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1392, '63152110371-3', '1527/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1393, '63172110138-0', '1528/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1394, '63172110041-9', '1528/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1395, '63152110291-0', '1529/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1396, '63172110341-6', '1528/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1397, '63152110361-5', '1529/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1398, '63152110332-2', '1529/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1399, '63152110282-2', '1530/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1400, '63162110067-6', '1529/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1401, '62162110212-7', '1528/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1402, '63152110292-0', '1530/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1403, '63152310093-8', '1531/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1404, '63152110197-1', '1531/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1406, '63152310180-9', '1531/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1407, '61152110029-1', '1530/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1408, '63152110219-7', '1531/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1409, '63152110236-3', '1532/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1410, '63152310166-3', '1532/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1411, '63152110190-1', '1533/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1412, '63152110168-7', '1532/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1413, '63152110196-1', '1533/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1414, '63152110311-6', '1533/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1415, '62162110384-1', '1534/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1416, '62152110179-7', '1534/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1417, '63152110235-3', '1533/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1418, '63152110304-8', '1532/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1419, '62162110322-4', '1534/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1420, '63151110082-5', '1534/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1421, '63152110298-0', '1535/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1422, '63152110255-8', '1535/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1423, '62152110225-7', '1536/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1424, '60182110014-9', '1535/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1425, '63152110218-7', '1535/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1426, '62152110185-5', '1536/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1427, '62152110256-0', '1536/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1428, '62152110053-2', '1536/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1429, '61162110130-6', '1601/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1430, '63151110210-8', '1601/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1431, '61162110306-0', '1601/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1432, '63172110367-1', '1602/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1433, '60162110456-0', '1602/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1434, '63172110346-6', '1602/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1435, '61162110138-6', '1601/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1436, '60162110401-1', '1602/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1437, '63172110283-8', '1603/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1438, '63172110132-0', '1603/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1439, '63151110085-5', '1604/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1440, '62152310271-2', '1604/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1441, '62152310256-6', '1604/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1442, '63172110366-1', '1603/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1443, '63162110324-2', '1603/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1444, '62172110321-2', '1605/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1445, '63172310332-4', '1604/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1446, '62172110320-2', '1605/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1447, '62172110211-5', '1605/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1448, '62172110155-7', '1605/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1449, '63151110232-4', '1606/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1450, '62172110059-8', '1607/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1451, '63151110212-8', '1606/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1452, '62172110050-8', '1607/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1453, '63151110211-8', '1606/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1454, '63172310030-7', '1606/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1455, '62162110305-8', '1607/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1456, '62172110304-6', '1607/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1457, '62162110163-7', '1608/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1458, '63172110393-5', '1608/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1459, '63172110392-5', '1608/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1460, '63172110263-2', '1608/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1461, '62162110224-5', '1609/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1462, '62162110203-9', '1609/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1463, '62162110090-2', '1609/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1464, '62162110186-3', '1609/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1465, '63172110165-3', '1610/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1466, '63172110039-1', '1610/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1467, '63162110120-4', '1611/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1468, '63172110007-7', '1610/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1469, '63162110385-9', '1611/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1470, '63162110168-5', '1611/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1471, '61182110010-7', '1610/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1472, '62162110327-4', '1611/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1473, '63172110065-4', '1612/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1474, '63172110189-9', '1612/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1475, '63172110088-0', '1612/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1476, '63172110301-4', '1612/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1477, '61162110167-9', '1613/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1478, '63172110329-0', '1614/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1479, '61162110194-3', '1613/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1480, '61162110112-0', '1613/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1481, '61162110026-9', '1613/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1482, '61172110375-3', '1614/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1483, '63162110545-6', '1614/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1484, '63172310408-9', '1615/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1485, '63172310411-7', '1615/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1486, '63172310413-7', '1615/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1487, '63171110402-4', '1615/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1488, '63172310135-6', '1616/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1489, '61152110186-7', '1616/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1490, '63172310412-7', '1614/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1491, '63182110217-1', '1616/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1492, '63162110256-6', '1617/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1493, '63162110249-9', '1617/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1494, '63162110084-2', '1617/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1495, '63162110253-6', '1617/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1496, '63162110248-9', '1618/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1497, '63162110277-2', '1618/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1498, '63151110015-0', '1618/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1499, '63162110279-2', '1618/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1500, '63151110067-9', '1619/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1501, '63151110006-2', '1619/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1502, '63151110156-0', '1619/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1503, '62182110138-0', '1620/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1504, '62182110054-6', '1620/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1505, '63151110159-0', '1619/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1506, '63162110169-5', '1622/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1507, '62182110029-3', '1620/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1508, '63162110330-0', '1622/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1509, '62182110047-9', '1620/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1510, '63162110329-2', '1622/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1511, '63162110364-3', '1623/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1512, '63162110377-1', '1623/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1513, '63162110346-8', '1622/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1514, '63162110040-1', '1623/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1515, '63162110110-6', '1623/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1516, '63162110096-0', '1625/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1517, '61172110265-6', '1625/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1518, '61182110125-4', '1626/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1519, '63171110051-7', '1626/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1520, '63171110045-0', '1625/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1521, '61182110076-4', '1626/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1522, '63162110081-2', '1625/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1523, '61182110067-6', '1626/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1524, '63151110176-6', '1627/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1525, '63162110130-2', '1627/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1526, '63152110076-6', '1627/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1527, '63152110055-0', '1627/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1528, '63171110068-5', '1628/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1529, '63172110049-9', '1629/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1530, '63162110232-1', '1628/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1531, '63162110235-1', '1628/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1532, '63162110187-1', '1628/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1533, '63151110217-8', '1629/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1534, '62152110262-8', '1630/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1535, '62152110304-0', '1630/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1536, '63172110320-0', '1629/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1537, '62152110298-2', '1630/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1538, '62152110277-6', '1630/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1539, '63151110219-8', '1631/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1540, '63172110228-1', '1629/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1541, '63172110315-2', '1631/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1542, '63171110290-7', '1631/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1543, '63162110326-2', '1631/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1544, '63162110446-7', '1632/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1545, '63162110367-3', '1632/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1546, '63162110378-1', '1632/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1547, '63162110365-3', '1632/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1548, '63162110117-6', '1633/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1549, '63162110133-2', '1633/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1550, '63162110139-2', '1633/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1551, '62182110059-6', '1634/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1553, '62182110126-2', '1634/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1554, '63172110033-1', '1635/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1555, '63172110034-1', '1635/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1556, '62182110155-5', '1634/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1557, '63162110104-8', '1635/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1558, '61162110292-2', '1634/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1559, '63172110259-4', '1636/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1560, '63172110343-6', '1636/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1561, '61162110245-3', '1636/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1562, '63172110344-6', '1635/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1563, '62152310381-9', '1636/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1564, '63182110002-5', '1701/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1565, '63182110232-7', '1701/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1566, '63182110023-1', '1702/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1567, '63182110183-7', '1702/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1568, '63182110068-2', '1702/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1569, '63182110018-3', '1701/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1570, '63182110026-1', '1701/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1571, '63182110024-1', '1702/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1572, '63182110120-0', '1703/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1573, '63182110191-5', '1703/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1574, '63182110135-8', '1703/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1575, '63162110333-0', '1704/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1576, '63182110059-4', '1704/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1577, '63162110057-8', '1704/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1578, '63182110137-8', '1703/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1579, '63182110054-4', '1705/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1580, '63182110092-6', '1704/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1581, '63182110084-8', '1705/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1582, '63182110128-0', '1705/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1583, '63182110035-9', '1706/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1584, '63182110194-5', '1705/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1585, '63182110073-0', '1706/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1586, '63182110095-6', '1706/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1587, '63162110173-3', '1707/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1588, '63162110101-8', '1707/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1589, '63152110078-6', '1708/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1590, '63182110051-4', '1708/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1591, '63182110156-3', '1707/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1592, '63151110095-3', '1707/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1593, '63152110079-6', '1708/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1594, '63182110121-0', '1709/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1595, '63182110090-6', '1708/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1596, '63182110093-6', '1709/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1597, '63182110168-1', '1709/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1598, '63162110355-5', '1710/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1599, '63182110169-1', '1709/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1600, '63162110356-5', '1710/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1601, '63182110171-9', '1711/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1602, '60162110343-4', '1710/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1603, '63172110056-6', '1711/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1604, '60162110408-1', '1710/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1605, '63172110096-8', '1712/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1606, '63172110103-6', '1712/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1607, '63172110040-9', '1711/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1608, '63172110020-3', '1711/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1609, '62162110403-7', '1712/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1610, '63172110084-0', '1713/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1611, '62152310027-5', '1712/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1612, '63172110100-6', '1713/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1613, '63172110330-8', '1713/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1614, '63172110363-1', '1713/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1615, '62152110107-2', '1714/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1616, '62152110284-4', '1714/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1617, '63172110158-5', '1714/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1618, '63172110300-4', '1715/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1619, '63172110067-4', '1714/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1620, '62172310203-3', '1715/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1621, '63172110287-8', '1715/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1622, '62172310062-2', '1715/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1623, '63172110242-7', '1716/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1624, '61182110033-3', '1716/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1625, '61182110188-1', '1716/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1626, '63162110153-7', '1717/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1627, '63182110198-5', '1717/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1628, '63162110430-9', '1717/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1629, '63182110207-3', '1717/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1630, '61172110296-0', '1716/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1631, '63162110502-4', '1718/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1632, '63162110418-3', '1718/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1633, '63151110178-6', '1719/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1634, '61172110270-4', '1718/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1635, '63172110150-5', '1719/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1636, '63172110029-3', '1719/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1637, '63182110210-1', '1718/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1638, '63172110324-0', '1719/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1639, '63172110060-4', '1720/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1640, '62152110230-5', '1720/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1641, '63172110031-1', '1721/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1642, '63172110117-4', '1720/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1643, '63172110032-1', '1721/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1644, '62152110100-2', '1720/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1645, '63182110186-7', '1721/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1646, '63172110241-7', '1722/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1647, '63172110257-4', '1722/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1648, '63172110255-4', '1722/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1649, '63172110237-9', '1722/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1650, '63172110064-4', '1721/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1651, '63172110058-6', '1724/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1652, '63172110289-8', '1723/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1653, '63172110365-1', '1723/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1654, '63162110516-2', '1723/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1655, '63172110313-2', '1723/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1657, '63172110157-5', '1724/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1658, '63172110267-2', '1725/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1659, '63172110350-3', '1724/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1660, '63172110351-3', '1725/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1661, '63172110111-4', '1725/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1662, '63172110086-0', '1725/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1663, '63172110161-3', '1726/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1664, '63172110236-9', '1726/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1665, '60162110288-6', '1726/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1666, '63172110130-0', '1727/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1667, '63172110107-6', '1727/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1668, '63172110450-2', '1727/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1669, '63172110252-4', '1726/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1670, '63172110162-3', '1727/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1671, '63172110227-1', '1728/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1672, '63172110249-7', '1728/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1673, '63172110127-2', '1728/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1674, '63172110476-8', '1728/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1675, '63172310155-1', '1729/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1676, '63172310206-1', '1729/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1677, '63172310436-3', '1729/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1678, '63172310426-5', '1729/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1679, '63172110254-4', '1730/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1680, '63172110077-2', '1730/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1681, '63172110163-3', '1730/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1682, '63172310440-1', '1731/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1683, '63172110328-0', '1731/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1684, '63171110200-6', '1730/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1685, '63171110232-0', '1731/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1686, '63171110257-5', '1732/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1687, '63172310194-3', '1732/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1688, '63171110256-5', '1731/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1689, '63172310366-7', '1732/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1690, '63172310363-7', '1732/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1691, '63172110153-5', '1733/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1692, '63172110050-6', '1733/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1693, '63171110258-5', '1733/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1694, '63172110180-9', '1734/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1695, '63172310028-9', '1734/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1696, '63172110279-0', '1733/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1697, '63172310200-1', '1734/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1698, '63172310370-5', '1735/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1699, '63172310373-5', '1735/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1700, '63172110426-9', '1735/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1701, '62182110056-6', '1736/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1702, '63172110129-2', '1735/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1703, '63172310446-1', '1734/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1704, '63172110238-9', '1736/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1705, '62182110201-5', '1736/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1706, '63152110161-7', '1736/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1707, '63182110032-9', '1801/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1708, '63182110139-8', '1802/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1709, '63182110033-9', '1801/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1710, '63182110007-5', '1801/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1711, '63152310176-1', '1802/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1712, '63182110130-8', '1801/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1713, '63182110153-3', '1802/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1714, '63152110071-6', '1803/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1715, '62162110023-7', '1803/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1716, '63152110115-8', '1804/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1717, '62162110159-9', '1803/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1718, '63182110158-3', '1802/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1719, '61152110119-2', '1804/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1720, '61152110138-8', '1804/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1721, '63152110163-7', '1804/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1722, '63182110214-1', '1805/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1723, '63182110086-8', '1805/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1724, '62162110024-7', '1803/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1725, '63182110110-2', '1805/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1726, '63182110102-4', '1805/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1727, '63182110193-5', '1806/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1728, '63182110138-8', '1806/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1729, '63182110094-6', '1806/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1730, '63182110041-7', '1807/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1731, '63172110468-0', '1807/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1732, '63172110011-5', '1808/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1733, '63182110082-8', '1807/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1734, '63182110118-2', '1807/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1735, '63182110069-2', '1806/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1736, '63172110015-5', '1808/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1737, '63172110115-4', '1808/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1738, '63172310285-4', '1809/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1739, '63172110360-1', '1808/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1740, '63172310034-7', '1809/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1741, '63182110014-3', '1809/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1742, '63172110021-3', '1810/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1743, '63172310284-4', '1809/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1744, '63162110313-4', '1810/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1745, '63162110041-1', '1810/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1746, '63172110232-9', '1811/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1747, '63172110235-9', '1811/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1748, '63152110108-0', '1811/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1749, '63172110038-1', '1812/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1750, '63172110294-6', '1810/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1751, '63172110290-6', '1811/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1752, '63172110036-1', '1812/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1753, '63172110017-5', '1813/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1754, '63172110345-6', '1812/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1755, '63172110080-0', '1813/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1756, '63172110185-9', '1813/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1757, '63172110340-6', '1812/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1758, '63171110133-1', '1813/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1759, '63152310133-0', '1814/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1760, '63152310058-6', '1814/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1761, '63172310004-3', '1814/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1762, '63152310055-6', '1814/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1763, '63152110280-2', '1815/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1764, '63152110233-3', '1815/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1765, '63152110287-2', '1815/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1766, '62162110173-5', '1816/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1767, '62162110180-3', '1816/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1768, '62162110127-6', '1816/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1769, '63162110004-9', '1817/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1770, '63152110299-0', '1815/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1771, '62162110021-7', '1816/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1772, '63162110098-0', '1817/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1773, '63162110121-4', '1817/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1774, '63162110266-4', '1818/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1775, '63162110224-3', '1817/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1776, '63151110010-0', '1818/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1777, '63152110189-3', '1819/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1778, '63162110281-0', '1818/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1779, '63162110278-2', '1818/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1780, '63162110419-3', '1820/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1781, '63152110210-7', '1820/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1782, '63171110041-0', '1819/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1783, '63152110232-3', '1819/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1784, '63152110258-8', '1820/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1785, '63172310522-4', '1819/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1786, '62152110180-5', '1821/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1787, '63152110032-5', '1822/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1788, '62172110257-6', '1821/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1789, '63152110061-8', '1822/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1790, '63162110190-9', '1821/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1791, '62152110023-9', '1821/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1792, '63152110142-2', '1822/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1793, '63152110092-2', '1822/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1794, '63152310119-4', '1823/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1795, '63152310129-2', '1823/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1796, '63152310135-0', '1823/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1797, '63152110080-4', '1824/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1798, '63171110328-1', '1824/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1799, '63152110097-2', '1824/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1800, '63171110383-8', '1823/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1801, '63162110127-4', '1825/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1802, '61152110208-3', '1825/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1803, '63152110129-6', '1824/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1804, '61152110028/1', '1825/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1805, '63182110173-9', '1826/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1806, '63152310004-7', '1826/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1807, '63152310012-5', '1826/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1808, '63162110449-7', '1826/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1809, '63152310076-2', '1825/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1810, '63152310209-5', '1827/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1811, '63152310007-7', '1827/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1812, '63182110188-7', '1827/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1813, '63162110314-4', '1828/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1814, '63152310204-5', '1827/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1815, '63152110288-2', '1828/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1816, '63152110069-8', '1828/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1817, '60182110121-6', '1828/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1818, '63152110027-7', '1829/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1819, '63152110137-4', '1829/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1820, '63152110048-3', '1829/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1821, '63152110364-5', '1829/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1822, '63152110004-1', '1830/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1823, '63152110024-7', '1830/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1824, '63152110245-1', '1830/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1825, '63152110087-4', '1831/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1826, '63162110297-8', '1831/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1827, '63182110003-5', '1831/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1828, '63152110067-8', '1830/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1829, '63182110070-0', '1831/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1830, '63152310230-9', '1832/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1831, '63152210021-5', '1833/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1832, '63152310289-8', '1832/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1833, '63152210018-7', '1833/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1834, '63152310111-4', '1832/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1835, '63152210032-3', '1833/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1836, '63152310206-5', '1832/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1837, '63152210045-1', '1834/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1838, '63182110228-9', '1834/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1839, '63152210098-0', '1833/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1840, '63162110359-5', '1834/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1841, '63152110156-9', '1835/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1842, '63152110157-9', '1835/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1843, '63162110134-2', '1835/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1844, '63152110206-9', '1835/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1845, '63152310164-3', '1836/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1846, '63152110202-9', '1836/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1847, '63152110204-9', '1836/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1849, '63152110381-1', '1321/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1850, '63151110025-8', '1224/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1851, '60182110138-4', '1427/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1852, '62152110280-4 ', '1624/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1853, '62152110279-6 ', '1624/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1854, '62182110195-7 ', '1624/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1855, '62162110318-6 ', '1624/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1856, '61182110223-3', '1621/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1857, '61182110222-3', '1621/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1858, '60162110526-6', '1621/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1859, '60162110522-6', '1621/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1860, '63182110243-5', '1510/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1861, '62162110386-1', '1516/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1862, '63152110443-9', '1616/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1863, '63152110441-9', '1706/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1864, '63152110437-1', '1834/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1865, '63172110145-8', '2201/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1866, '63171110410-2', '2202/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1867, '63171110468-1', '2201/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1868, '63171110271-1', '2201/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1869, '63172110444-5', '2201/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1870, '63171110414-2', '2202/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1871, '63151110013-0', '2202/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1872, '63171110405-4', '2203/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1873, '63171110415-2', '2203/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1874, '63171110412-2', '2203/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1875, '63151110034-6', '2202/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1876, '63171110417-2', '2204/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1877, '63171110411-2', '2204/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1878, '63151110234-4', '2204/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1879, '63171110028-4', '2204/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1880, '63171110406-4', '2203/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1881, '63171110222-2', '2205/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1882, '63171110070-3', '2205/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1883, '63171110042-0', '2205/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1884, '63171110103-7', '2206/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1885, '63171110075-3', '2206/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1886, '63171110071-3', '2205/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1887, '63171110160-4', '2207/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1888, '63171110129-3', '2206/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1889, '63171110151-6', '2207/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1890, '63171110074-3', '2206/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1891, '63171110137-1', '2207/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1892, '63171110166-4', '2207/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1893, '63171110205-6', '2208/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1894, '63171110177-2', '2208/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1895, '63171110245-8', '2208/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1896, '63171110179-2', '2209/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1897, '63171110247-8', '2208/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1898, '63171110318-3', '2209/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1899, '63171110356-4', '2209/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1900, '63171110314-3', '2209/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1901, '63171110090-9', '2210/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1902, '63171110009-8', '2210/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1903, '63171110039-2', '2210/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1904, '63171110032-2', '2210/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1905, '63171110108-7', '2211/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1906, '63171110096-9', '2211/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1907, '63171110148-9', '2211/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1908, '63171110154-6', '2211/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1909, '63171110279-1', '2212/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1910, '63171110161-4', '2212/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1911, '62162110086-4', '2212/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1912, '63151110229-6', '2212/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1913, '63171110204-6', '2213/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1914, '63171110206-6', '2213/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1915, '63171110196-8', '2213/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1916, '63171110220-2', '2214/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1917, '63171110213-4', '2214/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1918, '63171110214-4', '2214/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1919, '63171110210-4', '2213/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1920, '63171110212-4', '2214/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1921, '63171110281-9', '2215/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1922, '63171110243-8', '2215/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1923, '63171110305-5', '2215/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1924, '63171110011-6', '2216/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1925, '63171110304-5', '2215/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1926, '63171110017-6', '2216/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1927, '63171110165-4', '2216/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1928, '63171110065-5', '2216/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1929, '63171110208-6', '2217/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1930, '63171110310-3', '2218/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1931, '63171110150-6', '2217/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1932, '63171110378-0', '2217/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1933, '63171110118-5', '2217/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1934, '63171110369-2', '2218/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1935, '63171110363-2', '2218/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1936, '63171110371-0', '2219/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1937, '63172310122-8', '2219/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1938, '63171110311-3', '2218/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1939, '63171110372-0', '2219/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1940, '63171110382-8', '2220/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1941, '63171110385-8', '2220/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1942, '63172310472-4', '2220/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1943, '63171110216-4', '2219/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1944, '63171110027-4', '2221/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1945, '62162110091-2', '2221/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1946, '62162110185-3', '2221/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1947, '63171110015-6', '2220/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1948, '63171110086-1', '2222/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1949, '63171110391-6', '2222/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1950, '63171110091-9', '2222/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1951, '63171110084-1', '2222/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1952, '60182110040-3', '2223/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1953, '63171110367-2', '2221/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1954, '60162110338-6', '2223/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1955, '60182110177-5', '2223/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1956, '63171110157-6', '2224/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1957, '63171110182-0', '2224/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1958, '62162110368-5', '2224/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1959, '61172310263-2', '2225/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1960, '61182110162-5', '2223/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1961, '63171110203-6', '2224/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1962, '63171110233-0', '2225/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1963, '63171110238-0', '2225/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1964, '63171110242-8', '2225/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1965, '63171110265-3', '2226/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1966, '63171110393-6', '2226/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1967, '63171110267-3', '2226/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1968, '63171110302-5', '2226/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1969, '63171110055-7', '2227/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1970, '63171110079-3', '2227/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1971, '63171110083-1', '2227/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1972, '63171110234-0', '2228/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1973, '63171110080-1', '2228/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1974, '63171110101-7', '2227/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1975, '63171110322-1', '2229/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1976, '63171110236-0', '2229/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1977, '63171110270-1', '2228/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1978, '63171110025-4', '2229/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1979, '63171110113-5', '2228/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1980, '63171110030-2', '2230/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1981, '63171110140-9', '2230/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1982, '63171110026-4', '2229/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1983, '63171110120-3', '2230/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1984, '63171110057-7', '2230/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1985, '63171110368-2', '2231/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1986, '63171110159-6', '2231/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1987, '63171110181-0', '2232/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1988, '63171110186-0', '2232/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1989, '63171110162-4', '2232/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1990, '63171110149-9', '2231/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1991, '63171110189-0', '2232/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1992, '63171110158-6', '2231/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1993, '63171110301-5', '2233/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1994, '63171110192-8', '2233/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1995, '63152110467-4', '2233/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1996, '63171110048-0', '2234/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1997, '63171110049-0', '2234/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1998, '63171110054-7', '2234/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(1999, '63171110044-0', '2234/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2000, '63171110324-1', '2233/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2001, '63171110082-1', '2235/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2002, '63171110069-5', '2235/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2003, '63171110059-7', '2235/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2004, '63171110089-1', '2235/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2005, '61172110202-9', '2301/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2006, '61172110039-5', '2301/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2007, '63171110095-9', '2236/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2008, '63171110102-7', '2236/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2009, '63171110097-9', '2236/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2010, '63171110105-7', '2236/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2011, '61172110190-1', '2301/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2012, '63182110155-3', '2301/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2013, '63182110021-1', '2302/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2014, '63182110088-8', '2302/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2015, '63182110204-3', '2302/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2016, '63182110154-3', '2302/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2017, '63171110225-2', '2304/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2018, '63182110143-6', '2305/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2019, '63182110096-6', '2305/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2020, '63182110012-3', '2304/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2021, '63182110132-8', '2305/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2022, '63182110151-3', '2306/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2023, '63182110124-0', '2305/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2024, '63182110028-1', '2307/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2025, '63182110100-4', '2307/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2026, '63182110055-4', '2308/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2027, '63182110145-6', '2308/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2028, '63182110042-7', '2307/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2029, '63182110111-2', '2307/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2030, '63182110133-8', '2308/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2031, '63182110157-3', '2308/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2032, '63182110190-5', '2309/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2033, '63171110418-2', '2310/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2034, '63182110189-7', '2309/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2035, '63182110196-5', '2309/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2036, '63182110080-8', '2309/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2037, '63171110413-2', '2310/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2038, '63171110106-7', '2311/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2039, '63171110416-2', '2310/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2040, '61172110071-6', '2312/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2041, '63171110407-4', '2310/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2042, '63171110173-2', '2311/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2043, '61172110014-9', '2312/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2044, '61172110235-3', '2312/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2045, '63171110141-9', '2311/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2046, '61172110203-9', '2312/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2047, '63182110063-2', '2313/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2048, '63182110047-7', '2313/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2049, '63182110223-9', '2314/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2050, '63172110497-4', '2314/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2051, '63182110206-3', '2313/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2052, '63171110374-0', '2313/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2053, '63182110221-9', '2314/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2054, '63172110454-2', '2314/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2055, '63171110187-0', '2315/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2056, '63171110184-0', '2315/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2057, '63171110209-6', '2317/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2058, '63171110197-8', '2315/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2059, '63171110219-4', '2317/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2060, '63171110218-4', '2317/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2061, '63171110198-8', '2315/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2062, '63171110221-2', '2317/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2063, '63171110330-9', '2319/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2064, '63171110337-9', '2319/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2065, '63171110331-9', '2319/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2066, '63171110338-9', '2319/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2067, '62172110338-0', '2321/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2068, '62171110016-8', '2321/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2069, '63171110352-4', '2322/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2070, '63162110221-3', '2321/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2071, '63171110365-2', '2322/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2072, '63171110350-4', '2322/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2073, '63171110380-8', '2322/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2074, '62172110231-1', '2321/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2075, '63171110361-2', '2323/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2076, '63171110043-0', '2323/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2077, '63171110323-1', '2323/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2078, '63171110033-2', '2323/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2079, '63171110146-9', '2324/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2080, '63171110164-4', '2324/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2081, '63171110389-8', '2325/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2082, '63171110175-2', '2324/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2083, '63171110190-8', '2325/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2084, '63171110185-0', '2325/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2085, '63171110231-0', '2326/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2086, '63171110226-2', '2326/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2087, '63171110251-5', '2326/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2088, '63171110167-4', '2324/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2089, '63171110183-0', '2325/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2090, '63151110080-5', '2327/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2091, '63171110024-4', '2327/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2092, '63171110358-4', '2326/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2093, '63171110092-9', '2327/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2094, '63171110123-3', '2328/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2095, '63171110139-1', '2328/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2096, '63171110333-9', '2328/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2097, '63171110201-6', '2328/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2098, '63151110115-9', '2327/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2099, '63171110342-7', '2329/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2100, '63171110093-9', '2329/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2101, '63171110344-7', '2329/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2102, '63172310539-2', '2329/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2103, '63171110317-3', '2330/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2104, '63171110379-0', '2330/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2105, '63171110050-7', '2331/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2106, '63171110341-7', '2331/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2107, '63171110354-4', '2330/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2108, '63171110289-9', '2330/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2109, '63171110078-3', '2331/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2110, '63171110061-5', '2331/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2111, '63171110081-1', '2332/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2112, '63171110007-8', '2333/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2113, '63171110142-9', '2332/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2114, '63171110253-5', '2332/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2115, '63171110255-5', '2333/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2116, '63171110259-5', '2333/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2117, '63171110229-2', '2332/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2118, '63171110295-7', '2334/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2119, '63171110294-7', '2334/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2120, '63171110115-5', '2336/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2121, '63171110283-9', '2333/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2122, '63171110176-2', '2336/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2123, '63171110298-7', '2334/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2124, '63171110347-7', '2336/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2125, '63171110345-7', '2336/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2126, '63172310114-0', '2401/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2127, '63171110299-7', '2334/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2128, '63172310327-6', '2401/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2129, '63171110223-2', '2402/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2130, '63172310330-4', '2401/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2131, '63172310101-2', '2401/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2132, '63172310018-1', '2402/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2133, '63171110467-1', '2402/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2134, '63172310220-7', '2403/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2135, '63172310319-8', '2403/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2136, '63172310157-1', '2402/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2137, '63172310146-4', '2403/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2138, '63172310329-6', '2403/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2139, '63171110394-6', '2404/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2140, '63172310325-6', '2405/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2141, '63172310326-6', '2404/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2142, '63172310328-6', '2404/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2143, '63172310403-9', '2404/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2144, '63172310238-5', '2405/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2145, '63172310239-5', '2405/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2146, '63172310169-9', '2405/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2147, '63172310536-2', '2407/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2148, '63172310210-9', '2406/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2149, '63171110364-2', '2406/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2150, '63172310188-5', '2406/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2151, '63171110315-3', '2406/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2152, '63172310240-3', '2407/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2153, '63172310217-9', '2407/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2154, '63172310375-5', '2408/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2155, '63182110235-7', '2409/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2156, '63172310341-2', '2408/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2157, '62172110134-2', '2407/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2158, '63172310379-5', '2408/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2159, '63172310378-5', '2408/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2160, '63171110392-6', '2410/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2161, '63172310404-9', '2409/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2162, '63172310189-5', '2409/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2163, '63172110282-8', '2410/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2164, '63172110431-7', '2410/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2165, '63172310021-9', '2411/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2166, '63172310467-6', '2411/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2167, '63172110352-3', '2410/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2168, '63172310048-5', '2411/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2169, '63172310535-2', '2411/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2170, '63172310051-2', '2412/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2171, '63172310163-9', '2412/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2172, '63172110456-2', '2412/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2173, '63172110425-9', '2412/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2174, '63172310117-0', '2413/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2175, '63172310129-8', '2413/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2176, '63172110511-0', '2414/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2177, '63172310182-5', '2413/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2178, '63172310147-4', '2414/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2179, '63172310417-7', '2414/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2180, '63172310008-3', '2414/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2181, '63172310184-5', '2413/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2182, '63172110498-4', '2416/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2183, '63172310418-7', '2415/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2184, '63172110095-8', '2416/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2185, '63152110416-5', '2415/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2186, '63172310258-0', '2416/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2187, '63172310136-6', '2415/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2188, '63172310270-6', '2416/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2189, '63172310259-0', '2417/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2190, '63172310269-8', '2417/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2191, '63172310278-6', '2417/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2192, '63172310279-6', '2418/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2193, '63172310255-0', '2418/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2194, '63172310290-2', '2417/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2195, '63172310544-0', '2418/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2196, '63172310288-4', '2418/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2197, '63172110383-7', '2419/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2198, '63152110180-3', '2420/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2199, '63172110389-7', '2419/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2200, '63172110390-5', '2419/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2201, '63172110385-7', '2419/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2202, '63152110217-7', '2420/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2203, '63172110380-7', '2420/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2204, '63172110443-5', '2421/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2205, '63172110395-5', '2420/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2206, '62172110219-5', '2422/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2207, '63152110434-1', '2421/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2208, '61162110101-2', '2422/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2209, '63172310077-8', '2421/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2210, '61172110187-3', '2422/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2211, '63172310132-6', '2421/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2212, '63172310127-8', '2423/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2213, '63172310025-9', '2423/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2214, '63172310055-2', '2423/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2215, '63172310154-1', '2424/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2216, '61172110173-5', '2422/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2217, '63172310265-8', '2424/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2218, '63172310317-8', '2424/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2219, '63172310141-4', '2424/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2220, '63172110316-2', '2425/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2221, '63172310479-4', '2426/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2222, '63162110508-4', '2425/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2223, '63172310301-0', '2425/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2224, '63172310487-2', '2426/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2225, '63172110273-0', '2425/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2226, '63172310486-2', '2426/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2227, '63172310531-2', '2426/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2228, '63172310023-9', '2427/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2229, '63172110121-2', '2427/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2230, '63172110248-7', '2427/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2231, '63172310174-7', '2428/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2232, '63172310031-7', '2427/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2233, '63172310166-9', '2429/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2234, '63172310144-4', '2428/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2235, '63172310134-6', '2429/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2236, '63172310179-7', '2428/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2237, '63172310192-3', '2429/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2238, '63172310167-9', '2428/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2239, '62172110251-6', '2429/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2240, '63172310195-3', '2430/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2241, '63172310244-3', '2430/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2242, '63172310233-5', '2430/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2243, '63172110139-0', '2431/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2244, '63172110025-3', '2431/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2245, '62172310233-7', '2431/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2246, '63172310120-8', '2430/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2247, '63171110004-8', '2431/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2248, '63172110172-1', '2432/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2249, '63172110078-2', '2432/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2250, '63172110075-2', '2432/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2251, '63172110118-4', '2432/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2252, '63172110326-0', '2433/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2253, '62172310291-4', '2433/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2254, '63172110268-2', '2433/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2255, '63172110097-8', '2433/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2256, '63172110502-2', '2434/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2257, '63182110234-7', '2434/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2258, '63182110172-9', '2434/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2259, '63182110162-1', '2434/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2260, '63172110469-0', '2435/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2261, '63172110459-2', '2435/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2262, '63182110029-1', '2436/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2263, '63172310216-9', '2435/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2264, '63182110062-2', '2436/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2265, '63182110052-4', '2436/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2266, '63182110049-7', '2435/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2267, '63182110225-9', '2436/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2268, '60172110558-7', '2306/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2269, '60172110557-7', '2306/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2270, '60162110524-6', '2306/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2271, '61172110415-5', '2316/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2272, '61172110416-5', '2316/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2273, '61172110417-5', '2316/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2275, '62162110317-6', '2318/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2276, '62182110196-7', '2318/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2277, '62172110346-8', '2318/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2278, '62172110347-8', '2318/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2279, '61163140004-9', '2320/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2280, '61163140005-9', '2320/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2281, '61152110341-4', '2320/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2282, '61152110342-4', '2320/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2283, '60172110559-7', '2335/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2284, '60162110523-6', '2335/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2285, '62162110319-6', '2335/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2286, '60162110525-6', '2335/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2287, '61162210026-7', '2303/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2288, '61162210021-7', '2303/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2289, '61162210022-7', '2303/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2290, '61162210025-7', '2303/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2291, '61162210023-7', '2304/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2292, '61162210024-7', '2304/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2293, '63152110398-9', '2423/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2294, '62163140002-7', '2316/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2295, '63172310271-6', '2501/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2296, '63172310272-6', '2501/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2297, '63172310039-7', '2502/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2298, '63172310273-6', '2501/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2299, '63172310358-9', '2502/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2300, '63172310193-3', '2502/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2301, '63172310281-4', '2501/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2302, '63172310287-4', '2503/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2303, '63172310060-0', '2503/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2304, '63172310224-7', '2503/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2305, '63172310229-7', '2502/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2306, '63172310207-1', '2503/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2307, '63172310307-0', '2505/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2308, '63172310298-2', '2504/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2309, '63172110467-0', '2504/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2310, '63172310296-2', '2504/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2311, '63172310297-2', '2504/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2312, '63172110405-3', '2506/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2313, '63172310380-3', '2505/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2314, '63172110262-2', '2505/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2315, '63172110373-9', '2506/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2316, '63172310540-0', '2505/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2317, '63172110183-9', '2507/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2318, '63172110412-1', '2506/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2319, '63172110517-0', '2506/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2320, '63172310336-4', '2508/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2321, '63172310056-2', '2507/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2322, '63172110260-2', '2507/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2323, '63172310017-1', '2507/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2324, '63172310139-6', '2508/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2325, '63172310316-8', '2508/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2326, '63172310402-9', '2509/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2327, '63172310214-9', '2509/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2328, '63172310401-9', '2508/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2329, '63172310286-4', '2509/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2330, '63172310231-5', '2509/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2331, '63172110155-5', '2510/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2332, '63172110253-4', '2510/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2333, '63172110210-3', '2510/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2334, '63172110230-9', '2510/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2335, '63172110358-3', '2511/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2336, '63172110406-3', '2511/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2337, '63172110413-1', '2512/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2338, '63172110407-3', '2511/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2339, '63152110463-4', '2511/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2340, '63172110409-3', '2512/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2341, '63172110486-6', '2512/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2342, '63172110175-1', '2512/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2343, '63172110182-9', '2513/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2344, '63172110199-7', '2513/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2345, '63172310033-7', '2513/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2346, '63172310007-3', '2514/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2347, '63172310094-4', '2514/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2348, '63172110181-9', '2513/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2349, '63172110201-5', '2514/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2350, '63172310087-6', '2515/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2351, '62172310511-8', '2515/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2352, '63172310103-2', '2514/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2353, '63172310138-6', '2515/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2354, '63172310049-5', '2515/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2355, '63172310209-1', '2516/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2356, '63172310162-9', '2516/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2357, '63172310116-0', '2516/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2358, '63172310118-0', '2516/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2359, '63172310198-3', '2517/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2360, '63172310201-1', '2517/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2361, '63172310368-7', '2518/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2362, '63172310374-5', '2517/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2363, '63162110500-4', '2518/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2364, '63152110436-1', '2517/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2365, '63172310439-3', '2518/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2366, '63162110393-7', '2518/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2367, '63172310438-3', '2519/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2368, '63172110070-2', '2519/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2369, '63172110094-8', '2519/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2370, '63172110209-5', '2519/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2371, '63172110191-7', '2520/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2372, '63172110192-7', '2520/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2373, '63172110204-5', '2520/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2374, '63172110193-7', '2520/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2375, '63172110438-7', '2521/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2376, '63172110434-7', '2521/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2377, '63172110427-9', '2521/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2378, '63172110208-5', '2522/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2379, '63172110437-7', '2521/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2380, '63172110281-8', '2522/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2381, '63172110304-4', '2522/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2382, '63172110137-0', '2522/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2383, '63172310429-5', '2523/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2384, '63172110184-9', '2523/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2385, '63172110387-7', '2523/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2386, '63172310356-9', '2523/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2387, '63172110174-1', '2524/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2388, '63172110261-2', '2524/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2389, '63172310003-3', '2525/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2390, '63172110220-1', '2524/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2391, '63172310110-0', '2525/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2392, '63172310530-2', '2525/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2393, '63172310107-2', '2525/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2394, '63172310208-1', '2524/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2395, '63172310158-1', '2526/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2396, '63172310186-5', '2527/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2397, '63172310111-0', '2526/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2398, '63172310130-6', '2526/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2399, '63172310203-1', '2527/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2400, '63172310106-2', '2526/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2401, '63172310323-6', '2527/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2402, '63172110187-9', '2528/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2403, '63172310425-5', '2528/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2404, '63172310355-9', '2528/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2405, '63172310427-5', '2529/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2406, '63172110491-4', '2528/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2407, '63172310430-3', '2527/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2408, '63172110447-5', '2530/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2409, '63172310431-3', '2529/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2410, '63172110272-0', '2530/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2411, '63172310226-7', '2529/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2412, '63172110200-5', '2530/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2413, '63172110420-9', '2531/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2414, '63172310236-5', '2529/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2415, '63172310121-8', '2531/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2416, '63172110354-3', '2530/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2417, '63172310170-7', '2531/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2418, '63172310303-0', '2531/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2419, '63172310176-7', '2532/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2420, '63172310212-9', '2532/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2421, '63172110422-9', '2533/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2422, '63172310232-5', '2532/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2423, '63172310260-8', '2532/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2424, '63172110551-1', '2533/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2425, '63172110421-9', '2533/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2426, '63172110214-3', '2534/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2427, '63172110507-2', '2533/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2428, '63172110247-7', '2534/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2429, '63172310037-7', '2534/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2430, '63172110361-1', '2535/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2431, '63172310036-7', '2534/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2432, '63172110293-6', '2535/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2433, '63172110474-8', '2535/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2434, '63182110245-5', '2536/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2435, '63172110419-1', '2535/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2436, '63182110057-4', '2536/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2437, '63152210084-2', '2601/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2438, '63152210092-0', '2601/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2439, '63172310091-4', '2536/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2440, '63172310548-0', '2536/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2441, '63152210082-2', '2602/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2442, '63152210044-1', '2601/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2443, '63152210086-2', '2601/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2444, '63152210027-5', '2602/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2445, '63152210065-6', '2602/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2446, '63162110148-0', '2603/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2447, '63152210028-5', '2602/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2448, '63162110323-2', '2603/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2449, '63152210025-5', '2603/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2450, '63162110564-1', '2604/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2451, '63172310320-6', '2604/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2452, '63162110246-9', '2603/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2453, '63182110254-2', '2604/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2454, '63172310263-8', '2605/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2455, '63172310012-1', '2604/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2456, '63172310264-8', '2605/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2457, '63172110538-6', '2605/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2458, '63152310227-1', '2606/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2459, '63172110526-8', '2606/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2460, '63172110460-0', '2606/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2461, '63172110446-5', '2607/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2462, '63172110499-4', '2606/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2463, '63172110215-3', '2608/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2464, '63172110125-2', '2607/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2465, '63182110236-7', '2607/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2466, '63172110152-5', '2607/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2467, '63172110229-1', '2608/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2468, '63172110280-8', '2608/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2469, '63172110307-4', '2609/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2470, '63152210116-6', '2608/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2471, '63172110309-4', '2609/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2472, '63172110298-6', '2609/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2473, '63172310353-9', '2610/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2474, '63172310347-2', '2610/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2475, '62162110249-1', '2609/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2476, '63172310321-6', '2610/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2477, '63172310390-1', '2610/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2478, '63172310140-4', '2611/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2479, '63172310124-8', '2611/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2480, '63172310183-5', '2612/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2481, '63172310119-0', '2611/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2482, '63172310414-7', '2612/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2483, '62172110357-5', '2611/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2484, '63172310218-9', '2612/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2485, '63172310225-7', '2613/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2486, '63172310415-7', '2614/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2487, '63172310349-2', '2613/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2488, '63172310448-1', '2614/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2489, '63172310451-8', '2615/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2490, '63172310304-0', '2614/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2491, '63172310352-9', '2613/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2492, '63172310097-4', '2615/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2493, '63172310422-5', '2615/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2494, '63172310131-6', '2615/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2495, '63172110030-1', '2616/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2496, '63172110106-6', '2616/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2497, '63172110028-3', '2616/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2498, '63172310040-5', '2616/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2499, '63172110102-6', '2617/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2500, '63172110037-1', '2617/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2501, '63172110142-8', '2617/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2502, '63172110170-1', '2617/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2503, '63172110194-7', '2618/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2504, '63172310513-6', '2618/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2505, '63172110246-7', '2618/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2506, '63172110256-4', '2618/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2507, '63172310080-6', '2620/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2508, '63172310015-1', '2619/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2509, '63172310315-8', '2619/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2510, '63172310447-1', '2619/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2511, '63172310197-3', '2620/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2512, '63172310022-9', '2619/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2513, '63172310241-3', '2621/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2514, '63172310243-3', '2620/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2515, '63172310086-6', '2620/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2516, '63172310242-3', '2621/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2517, '63172110441-5', '2622/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2518, '63172110269-2', '2622/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2519, '63172110176-1', '2621/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2520, '63172110291-6', '2622/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2521, '63172310517-6', '2621/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2522, '63172110055-6', '2622/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2523, '63172310362-7', '2623/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2524, '63172310364-7', '2623/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2525, '63172310247-3', '2623/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2526, '63172310385-3', '2624/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2527, '63172310396-1', '2623/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2528, '63172310367-7', '2624/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2529, '63172310433-3', '2624/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2530, '63172110144-8', '2625/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2531, '63172310435-3', '2624/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2532, '63172110156-5', '2625/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2533, '63172110164-3', '2625/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2534, '62182110209-5', '2625/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2535, '63172110369-1', '2626/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2536, '63172110487-6', '2626/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2537, '63172110093-8', '2626/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2538, '63172110368-1', '2626/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2539, '63172310248-3', '2627/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2540, '63172110496-4', '2627/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2541, '63172310095-4', '2627/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2542, '63172310148-4', '2628/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2543, '63172310133-6', '2628/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2544, '63172310145-4', '2628/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2545, '63172310230-5', '2628/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2546, '63172310153-1', '2629/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2547, '63172310432-3', '2629/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2548, '63182110101-4', '2630/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2549, '63172310256-0', '2629/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2550, '63172110528-8', '2629/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2551, '63172310178-7', '2630/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2552, '63172310361-7', '2630/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2553, '63172110288-8', '2631/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2554, '63172310276-6', '2631/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2555, '63162110189-1', '2630/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2556, '63172110270-0', '2631/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2557, '63172110305-4', '2631/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2558, '63172110331-8', '2632/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2559, '63172110423-9', '2632/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2560, '63172110306-4', '2632/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2561, '63172110332-8', '2632/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2562, '63172110429-9', '2633/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2563, '63172110442-5', '2633/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2564, '63172110501-2', '2633/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2565, '63172310082-6', '2634/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2566, '63172310020-9', '2634/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2567, '63172110439-7', '2633/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2568, '63172310002-3', '2634/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2569, '63172110295-6', '2635/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2570, '63172310026-9', '2634/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2571, '63172110177-1', '2635/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2572, '63172110364-1', '2635/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2573, '63172310123-8', '2636/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2574, '62171110121-5', '2635/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2575, '63172310128-8', '2636/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2576, '63152110093-2', '2701/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2577, '63172310515-6', '2636/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2578, '63172310261-8', '2636/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2579, '63152110111-8', '2701/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2580, '63152110194-1', '2701/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2581, '60182110292-0', '2701/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2582, '63162110047-1', '2702/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2583, '63162110140-0', '2702/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2584, '63162110055-8', '2702/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2585, '63162210017-5', '2702/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2586, '63162110363-3', '2703/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2587, '63162110358-5', '2703/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2588, '63162110092-0', '2703/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2589, '63162110088-2', '2703/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2590, '63152310109-6', '2705/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2591, '63152110424-3', '2705/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2592, '63162110282-0', '2704/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2593, '63171110052-7', '2705/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2594, '63162110285-0', '2704/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2595, '63152110134-4', '2705/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2596, '63152110122-6', '2706/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2597, '63171110409-4', '2706/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2598, '63152110034-5', '2706/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2599, '63152110331-2', '2706/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2600, '63162110551-3', '2707/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2601, '63152110402-7', '2707/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2602, '63152110126-6', '2707/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2603, '63182110239-7', '2708/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2604, '63162110555-3', '2707/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2605, '63182110185-7', '2708/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2606, '63152110213-7', '2708/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2607, '63152310330-8', '2709/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2608, '63152110145-2', '2708/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2609, '63152310177-1', '2710/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2610, '63162110033-3', '2709/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2611, '63162110476-0', '2709/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2612, '63162110544-6', '2710/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2613, '63152310323-0', '2710/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2614, '63172110478-8', '2710/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2615, '63162110350-5', '2711/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2616, '63162110303-6', '2711/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2617, '63162110305-6', '2711/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2618, '63162110396-7', '2711/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2619, '63182110020-1', '2712/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2620, '63152110013-9', '2712/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2621, '62162110134-4', '2712/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2622, '63182110079-0', '2713/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2623, '63162110497-6', '2713/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2624, '63182110203-3', '2712/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2625, '63162110137-2', '2713/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2626, '63162110126-4', '2713/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2627, '63162110151-7', '2714/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2628, '63162110391-7', '2714/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2629, '63162110146-0', '2714/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2630, '63162110415-3', '2714/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2631, '62162110148-2', '2715/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2632, '62162110228-5', '2715/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2633, '62162110003-1', '2715/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2634, '62162110167-7', '2715/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2635, '63172110470-8', '2716/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2636, '61162110147-4', '2716/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2637, '63152110230-3', '2716/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2638, '63182110244-5', '2717/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2639, '63172110461-0', '2717/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2640, '63162110250-6', '2717/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2641, '63172310484-2', '2717/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2642, '63172110479-8', '2718/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2643, '63172310538-2', '2718/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2644, '63172310488-2', '2718/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2645, '63172110023-3', '2719/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2646, '63172110043-9', '2719/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2647, '63172110101-6', '2720/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2648, '63171110401-4', '2719/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2649, '63172110109-6', '2719/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2650, '63172110104-6', '2720/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2651, '63172110196-7', '2720/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2652, '63172110123-2', '2720/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2653, '63172110052-6', '2721/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2654, '63172110334-8', '2722/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2655, '63172310524-4', '2722/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2656, '63172110219-3', '2721/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2657, '63172110069-4', '2721/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2658, '63172110146-8', '2721/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2659, '63152110459-6', '2722/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2660, '63172110233-9', '2723/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2661, '63172110374-9', '2723/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2662, '63172110430-7', '2722/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2663, '63172110198-7', '2723/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2664, '63172310495-0', '2724/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2665, '63172310532-2', '2724/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2666, '63152110099-2', '2724/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2667, '63171110046-0', '2724/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2668, '63172110400-3', '2723/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2669, '63162110216-5', '2725/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2670, '63162110448-7', '2725/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2671, '63162110511-2', '2726/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2672, '62152310054-8', '2725/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2673, '63162110470-0', '2726/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2674, '63172110494-4', '2725/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2675, '63162210008-7', '2727/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2676, '63162110510-2', '2726/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2677, '63162110487-8', '2727/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2678, '63162110176-3', '2727/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2679, '63162110090-0', '2727/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2680, '63171110397-6', '2726/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2681, '62152110056-2', '2728/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2682, '63172310237-5', '2728/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2683, '62152110210-9', '2728/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2684, '63172310202-1', '2728/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2685, '63162110227-3', '2729/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2686, '63172310550-7', '2729/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2687, '63162110444-7', '2729/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2688, '63162110228-3', '2729/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2689, '63172310463-6', '2730/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2690, '63172310449-1', '2730/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2691, '63172310222-7', '2730/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2692, '63172310305-0', '2730/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2693, '62162110287-2', '2731/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2694, '63172310490-0', '2732/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2695, '62152110226-7', '2731/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2696, '63162110195-9', '2732/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2697, '62152110029-9', '2732/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2698, '62152110190-3', '2731/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2699, '62152110062-0', '2731/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2700, '63182110011-3', '2732/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2701, '60162110052-4', '2733/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2702, '63172110544-4', '2733/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2703, '61182110065-6', '2733/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2704, '63152110432-1', '2734/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2705, '60162110001-5', '2733/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2706, '63162110517-2', '2734/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2707, '63172310492-0', '2735/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2708, '63172310494-0', '2735/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2709, '62182110010-5', '2734/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2710, '61162110235-5', '2734/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2711, '63172110536-6', '2735/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2712, '63172310552-7', '2736/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2713, '63172310500-8', '2735/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2714, '63172310526-4', '2736/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2715, '63162110488-8', '2801/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2716, '63172310528-4', '2736/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2717, '63162110410-3', '2801/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2718, '63172310527-4', '2736/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2719, '63172110399-5', '2801/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2720, '63172110379-9', '2801/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2721, '63152210007-9', '2802/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2722, '63152210008-9', '2802/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2723, '63152210095-0', '2803/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2724, '63152210012-7', '2802/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2725, '63152210049-1', '2802/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2726, '63172110356-3', '2803/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2727, '63182110230-7', '2804/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2728, '63172110339-8', '2803/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2729, '63152210047-1', '2803/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2730, '63152310312-2', '2804/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2731, '63152310028-3', '2804/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2732, '63152310229-1', '2804/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2733, '63152310013-5', '2805/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2734, '63152310286-8', '2805/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2735, '63152310059-6', '2805/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2736, '63152110268-6', '2806/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2737, '63152110273-4', '2806/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2738, '63152310112-4', '2805/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2739, '63152110306-8', '2806/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2740, '63152110177-5', '2806/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2741, '63162110204-7', '2807/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2742, '63162110382-9', '2807/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2743, '63162110417-3', '2807/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2744, '63172310496-0', '2808/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2745, '63162110269-4', '2808/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2746, '63152210073-4', '2807/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2747, '63162110452-4', '2808/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2748, '63172110092-8', '2809/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2749, '63172110435-7', '2809/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2750, '63172310351-9', '2810/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2751, '63152110103-0', '2809/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2752, '63162110143-0', '2809/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2753, '63172310047-5', '2810/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2754, '63172310520-4', '2810/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2755, '63172110521-8', '2811/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2756, '63172310382-3', '2810/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2757, '63152110318-6', '2811/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2758, '63172110381-7', '2811/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2759, '63172310165-9', '2811/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2760, '63172110308-4', '2812/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2761, '63152110343-0', '2812/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2762, '63152210115-6', '2812/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2763, '63172110009-7', '2812/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2764, '63152310261-2', '2813/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2765, '63162110370-1', '2813/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2766, '63162110095-0', '2813/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2767, '63182110045-7', '2813/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2768, '63162110267-4', '2814/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2769, '63182110202-3', '2814/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2770, '63152110333-2', '2814/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2771, '63162110291-8', '2814/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2772, '63162110395-7', '2815/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2773, '63152110133-4', '2815/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2774, '63152110300-8', '2815/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2775, '63152110147-2', '2816/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2776, '63172310171-7', '2815/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2777, '63152110141-2', '2816/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2778, '63172310001-3', '2817/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2779, '63152110356-7', '2816/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2780, '63152110316-6', '2816/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2781, '63172310081-6', '2817/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2782, '63172310392-1', '2817/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2783, '63172310342-2', '2818/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2784, '63172310343-2', '2817/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2785, '63152210094-0', '2818/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2786, '63172310345-2', '2818/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2787, '63152210070-4', '2818/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2788, '60162110162-1', '2819/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2789, '63172110083-0', '2820/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2790, '63172110401-3', '2819/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2791, '63172310348-2', '2820/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2792, '63172310354-9', '2819/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2793, '63172310444-1', '2820/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2794, '63172110203-5', '2819/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2795, '63172310156-1', '2820/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2796, '63162110302-6', '2821/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2797, '63172310369-7', '2821/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2798, '63172310306-0', '2821/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2799, '63172110213-3', '2822/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2800, '63172310445-1', '2821/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2801, '63172110221-1', '2822/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2802, '63172110218-3', '2822/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2803, '63172110436-7', '2823/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2804, '63172110276-0', '2823/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2805, '63172110277-0', '2823/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2806, '63172110349-6', '2824/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2807, '63172110245-7', '2823/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2808, '63172110348-6', '2824/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2809, '63172110355-3', '2824/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2810, '63172110266-2', '2824/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2811, '63172110371-9', '2825/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2812, '63172110428-9', '2825/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2813, '63172110432-7', '2825/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2814, '63162110114-6', '2826/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2815, '63162110162-5', '2826/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2816, '63172110424-9', '2825/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2817, '63172310318-8', '2826/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2818, '63162110404-5', '2826/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2819, '63172110403-3', '2827/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2820, '63172110404-3', '2827/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2821, '63182110219-1', '2827/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2822, '63172310268-8', '2827/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2823, '63172310073-8', '2828/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2824, '63172310052-2', '2828/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2825, '63172310252-0', '2828/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2826, '63172110239-9', '2829/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2827, '63172110089-0', '2829/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2828, '63172110240-7', '2829/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2829, '63172110231-9', '2828/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2830, '63172310302-0', '2829/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2831, '63172110292-6', '2830/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2832, '63172110160-3', '2830/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2833, '63162110136-2', '2830/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2834, '63172110035-1', '2831/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2835, '63172110066-4', '2830/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2836, '63172110003-7', '2831/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2837, '63172110048-9', '2831/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2838, '63172110002-7', '2831/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2839, '63171110001-8', '2832/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2840, '63171110132-1', '2832/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2841, '63171110067-5', '2832/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2842, '63182110144-6', '2833/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2843, '63182110034-9', '2833/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2844, '63171110135-1', '2832/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2845, '63182110164-1', '2833/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2846, '63182110178-9', '2834/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2847, '63182110097-6', '2834/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2848, '63182110064-2', '2834/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2849, '63182110175-9', '2833/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2850, '63152310110-4', '2835/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2851, '63182110081-8', '2835/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2852, '63172110051-6', '2835/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2853, '63172110224-1', '2835/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2854, '63182110167-1', '2836/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2855, '63182110067-2', '2836/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2856, '63182110077-0', '2836/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2857, '63152110394-9', '2834/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2858, '63172310516-6', '2612/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2859, '63151110194-2', '2614/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2860, '63172310102-2', '2627/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2881, '63172110271-0', '2409/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2882, '63172110166-3', '1724/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2883, '60152110030-1', '1530/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2888, '631621100069', '1820/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2889, '60172110466-6', '2801/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2891, '60172110142-4', '2605/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2893, '60172110111-5', '2871/1');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2894, '60172110111-6', '2836/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2895, '631621100000', '2311/2');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2896, '60182110179-5', '1633/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2897, '631621104926', '1336/3');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2898, '63162110471-0', '2704/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2899, '631711102731', '1836/4');
INSERT INTO `room_student` (`stay_number`, `std_code`, `room_number`) VALUES
	(2900, '63172110076-2', '1227/1');
/*!40000 ALTER TABLE `room_student` ENABLE KEYS */;

-- Dumping structure for table dormitory.rules
CREATE TABLE IF NOT EXISTS `rules` (
  `rules_number` int(2) NOT NULL AUTO_INCREMENT COMMENT 'รหัสกฏระเบียบ',
  `rules_name` varchar(255) NOT NULL COMMENT 'กฏระเบียบ',
  PRIMARY KEY (`rules_number`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- Dumping data for table dormitory.rules: ~16 rows (approximately)
DELETE FROM `rules`;
/*!40000 ALTER TABLE `rules` DISABLE KEYS */;
INSERT INTO `rules` (`rules_number`, `rules_name`) VALUES
	(1, 'ขึ้นหอพักโดยไม่ได้รับอนุญาติ');
INSERT INTO `rules` (`rules_number`, `rules_name`) VALUES
	(2, 'นำพา/ยินยอมให้บุคคลที่ไม่ใช่นักศึกษาหอพักขึ้นหอพัก');
INSERT INTO `rules` (`rules_number`, `rules_name`) VALUES
	(3, 'แอบอ้างชื่อผู้อื่น');
INSERT INTO `rules` (`rules_number`, `rules_name`) VALUES
	(4, 'ยินยอมให้ผู้อื่นแอบอ้างชื่อตนเอง');
INSERT INTO `rules` (`rules_number`, `rules_name`) VALUES
	(5, 'ส่งเสียงดังหรือมีพฤติกรรมก่อความรำคาญให้ผู้อื่น');
INSERT INTO `rules` (`rules_number`, `rules_name`) VALUES
	(6, 'ก่อเหตุทะเลาะวิวาท');
INSERT INTO `rules` (`rules_number`, `rules_name`) VALUES
	(7, 'ปีนรั้วหอพัก');
INSERT INTO `rules` (`rules_number`, `rules_name`) VALUES
	(8, 'เจตนาทำให้ทรัพย์สินของหอพัก/ผู้อื่นเสียหาย');
INSERT INTO `rules` (`rules_number`, `rules_name`) VALUES
	(9, 'ลงบันไดหนีไฟโดยไม่มีเหตุฉุกเฉิน');
INSERT INTO `rules` (`rules_number`, `rules_name`) VALUES
	(10, 'นำสิ่งของต้องห้ามเข้ามาในหอพัก');
INSERT INTO `rules` (`rules_number`, `rules_name`) VALUES
	(11, 'เล่นการพนันหรืออยู่ในวงการพนัน');
INSERT INTO `rules` (`rules_number`, `rules_name`) VALUES
	(12, 'ไม่แสดงบัตรเพื่อแสดงตัวตนแก่ รปภ/เจ้าหน้าที่');
INSERT INTO `rules` (`rules_number`, `rules_name`) VALUES
	(13, 'มีพฤติกรรมก้าวร้าว');
INSERT INTO `rules` (`rules_number`, `rules_name`) VALUES
	(14, 'ดื่มสุรา');
INSERT INTO `rules` (`rules_number`, `rules_name`) VALUES
	(15, 'เสพกัญชา/สิ่งเสพติด');
INSERT INTO `rules` (`rules_number`, `rules_name`) VALUES
	(16, 'อื่นๆ');
/*!40000 ALTER TABLE `rules` ENABLE KEYS */;

-- Dumping structure for table dormitory.rules_student
CREATE TABLE IF NOT EXISTS `rules_student` (
  `rules_no` int(12) NOT NULL AUTO_INCREMENT COMMENT 'ลำดับที่',
  `std_code` varchar(15) DEFAULT NULL COMMENT 'รหัสนักศึกษา',
  `id_card_code` varchar(17) DEFAULT NULL COMMENT 'รหัสบัตรประชาชน',
  `date_rule` date NOT NULL COMMENT 'วันที่',
  `time_rule` varchar(8) NOT NULL COMMENT 'เวลาที่ทำผิด',
  `rules_break` int(2) NOT NULL COMMENT 'ผิดกฏข้อที่',
  `other` varchar(200) DEFAULT NULL COMMENT 'อื่นๆ',
  `details` text DEFAULT NULL COMMENT 'รายละเอียด',
  PRIMARY KEY (`rules_no`),
  KEY `FK_rules_number` (`rules_break`),
  KEY `FK_id_card` (`id_card_code`),
  KEY `FK_std_number` (`std_code`),
  CONSTRAINT `FK_id_card` FOREIGN KEY (`id_card_code`) REFERENCES `outsider` (`id_card_code`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_rules_number` FOREIGN KEY (`rules_break`) REFERENCES `rules` (`rules_number`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_std_number` FOREIGN KEY (`std_code`) REFERENCES `student` (`std_code`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8;

-- Dumping data for table dormitory.rules_student: ~0 rows (approximately)
DELETE FROM `rules_student`;
/*!40000 ALTER TABLE `rules_student` DISABLE KEYS */;
/*!40000 ALTER TABLE `rules_student` ENABLE KEYS */;

-- Dumping structure for table dormitory.std_status
CREATE TABLE IF NOT EXISTS `std_status` (
  `noStatus` int(2) NOT NULL AUTO_INCREMENT COMMENT 'รหัสสถานะ',
  `nameStatus` varchar(255) NOT NULL COMMENT 'ชื่อสถานะ',
  PRIMARY KEY (`noStatus`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table dormitory.std_status: ~2 rows (approximately)
DELETE FROM `std_status`;
/*!40000 ALTER TABLE `std_status` DISABLE KEYS */;
INSERT INTO `std_status` (`noStatus`, `nameStatus`) VALUES
	(1, 'นักศึกษาหอพัก');
INSERT INTO `std_status` (`noStatus`, `nameStatus`) VALUES
	(2, 'นักศึกษา');
/*!40000 ALTER TABLE `std_status` ENABLE KEYS */;

-- Dumping structure for table dormitory.student
CREATE TABLE IF NOT EXISTS `student` (
  `std_code` varchar(15) NOT NULL COMMENT 'รหัสนักศึกษา',
  `nameTitle` varchar(20) NOT NULL COMMENT 'คำนำหน้า',
  `fname` varchar(200) NOT NULL COMMENT 'ชื่อจริง',
  `lname` varchar(200) NOT NULL COMMENT 'นามสกุล',
  `branch_code` int(3) unsigned zerofill NOT NULL COMMENT 'รหัสสาขา',
  `groupStd` varchar(15) NOT NULL COMMENT 'กลุ่มเรียน',
  `phone` varchar(20) DEFAULT NULL COMMENT 'เบอร์โทรศัพท์',
  `status` int(2) NOT NULL COMMENT 'สถานะนักศึกษา',
  `img` text DEFAULT '' COMMENT 'รูป',
  PRIMARY KEY (`std_code`),
  KEY `std_statusFK` (`status`),
  KEY `branch_codeFK` (`branch_code`),
  CONSTRAINT `branch_codeFK` FOREIGN KEY (`branch_code`) REFERENCES `branch` (`branch_code`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `std_statusFK` FOREIGN KEY (`status`) REFERENCES `std_status` (`noStatus`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table dormitory.student: ~2,006 rows (approximately)
DELETE FROM `student`;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('60152110030-1', 'นางสาว', 'พรสุดา', 'ดีสำโรง', 001, '60241A', '', 1, '1615429368772.jpg');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('60152110053-6', 'นางสาว', 'สิลิลรัตน์', 'คำลาย', 007, '60241A', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('60152110135-0', 'นางสาว', 'ศิริวรรณ', 'ใจรักดี', 002, '60241A', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('60152110155-5', 'นางสาว', 'บุษกร', 'ตัวสระเกษ', 006, '60241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('60152110156-5', 'นางสาว', 'รัชนู', 'พันชนะ', 007, '60241A', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('60152110235-9', 'นางสาว', 'ชลลดา', 'พิมเสน', 001, '60241A', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('60152110293-6', 'นางสาว', 'สุภาพร', 'น้อยกลาง', 001, '60241C', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('60152110297-6', 'นางสาว', 'เขมอัปสร', 'วรจันทร์', 002, '60241A', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('60152110353-3', 'นางสาว', 'ปริญญา', 'ชาพล', 007, '60241A', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('60152110366-1', 'นางสาว', 'ชลลดา', 'เทียนขุนทด', 001, '60241A', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('60152110412-1', 'นางสาว', 'ตรัสรา', 'ปลอดสิริกุล', 002, '60241B', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('60152110413-1', 'นางสาว', 'ณัททิญาภรณ์', 'กล้าสู้', 002, '60241B', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('60152110467-0', 'นางสาว', 'วรินทร์ญาภรณ์', 'ฤทธิ์ดอน', 007, '60241A', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('60152110530-6', 'นางสาว', 'ชัญญานุช', 'บุญเรือง', 007, '60241A', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('60162110001-5', 'นาย', 'ชัชวาล', 'จิตรโคตร', 021, '60241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('60162110052-4', 'นาย', 'ธนาวุฒิ', 'ลี้โชติ', 021, '60241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('60162110093-6', 'นางสาว', 'นวรัตน์', 'คณทา', 017, '60241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('60162110124-0', 'นางสาว', 'ปิยเนตร', 'นูขุนทด', 016, '60241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('60162110159-3', 'นางสาว', 'กมลชนก', 'ประกอบยา', 016, '60241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('60162110162-1', 'นาย', 'อธิษฐ์', 'คุณารูป', 017, '60241', '0610254254', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('60162110183-7', 'นางสาว', 'พิมพ์ชนก', 'นวัตมงคลกรณ์  EIC.', 022, '60241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('60162110288-6', 'นางสาว', 'สุวิพร', 'รื่นโพธิ์กลาง', 019, '60241B', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('60162110338-6', 'นาย', 'กษิดิ์เดช', 'อาศัยนา', 019, '62241A', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('60162110343-4', 'นางสาว', 'วิภาพร', 'ศิริพันธ์', 019, '60241C', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('60162110401-1', 'นางสาว', 'อินทร์ธุอร', 'เลื่อนสูงเนิน', 010, '60241A', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('60162110408-1', 'นางสาว', 'ศศิธร', 'หนูอินทร์', 019, '60241A', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('60162110456-0', 'นางสาว', 'ปัทมา', 'บุญมี', 013, '60241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('60162110522-6', 'MISS.', 'SREY NY', 'UNG', 013, '60241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('60162110523-6', 'MR.', 'SOTHEAROTH', 'HENG', 010, '60241A', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('60162110524-6', 'MR.', 'CHOULONG', 'VEANN', 011, '60241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('60162110525-6', 'MR.', 'BORAMEY', 'PENH', 020, '60241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('60162110526-6', 'MISS.', 'NIMOL', 'LONG', 021, '60241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('60172110039-7', 'นางสาว', 'ณัฐสินี', 'พรชัยศรีธนขาติ', 088, '60241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('60172110111-5', 'นาย', 'ภาณุวิชญ์', 'กิตติรงค์', 073, '60241', '0857667628', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('60172110111-6', 'นาย', 'ใจดี', 'จริงจริง', 073, '60242', '0842683954', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('60172110142-4', 'นาย', 'ภาณุวิชญ์', 'กิตติรงค์', 073, '60241', '0857667628', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('60172110382-3', 'นางสาว', 'สุดารัตน์', 'เก่งนอก', 084, '60241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('60172110466-6', 'นางสาว', 'อรทัย', 'ประมังคะตา', 073, '60241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('60172110500-8', 'นางสาว', 'กัญจนพร', 'แสนเจียม', 073, '60241', '', 2, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('60172110502-8', 'นาย', 'ชัยธวัช', 'น้อมพูดซา', 073, '60241', '', 2, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('60172110557-7', 'MR.', 'SUNCHHORNG', 'ROUN', 069, '60241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('60172110558-7', 'MR.', 'SOKUNTHEARA', 'HOR', 074, '60241A', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('60172110559-7', 'MR.', 'RANY', 'LIV', 075, '60241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('60182110014-9', 'นางสาว', 'ธิดาพร', 'ป่วงกระโทก', 104, '60251', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('60182110040-3', 'นาย', 'ศุภกร', 'เจกรัมย์', 096, '60241B', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('60182110050-0', 'นางสาว', 'จุฑามาศ', 'เลนนาแซง', 104, '60251', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('60182110060-8', 'นางสาว', 'อนุธิดา', 'ยอดจันทึก', 104, '60251', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('60182110070-6', 'นางสาว', 'ณัฐริกา', 'เครื่องกลาง', 104, '60251', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('60182110120-6', 'นางสาว', 'ดุจญาดา', 'อรรถกิจทวี', 104, '60251', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('60182110121-6', 'นางสาว', 'ดุสิตา', 'สมตาเถร', 105, '60241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('60182110138-4', 'นางสาว', 'ชิดชนก', 'ศรีดี', 107, '60241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('60182110153-9', 'นางสาว', 'กมลวรรณ', 'สีดาวงษ์', 099, '60241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('60182110177-5', 'นาย', 'เจนวัฒน์', 'พูนศรี', 096, '60241A', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('60182110179-5', 'นางสาว', 'อนงค์', 'ตาแดง', 104, 'IA', '0934587108', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('60182110276-4', 'นางสาว', 'พรศศิธร', 'พิมเขตร', 099, '60241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('60182110281-2', 'นางสาว', 'กานติมา', 'จันทร์จิต', 099, '60241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('60182110292-0', 'นาย', 'วีระศักดิ์', 'เพ็ชรกิ่ง', 099, '60241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('61152110010-3', 'นางสาว', 'อุมาภรณ์', 'แย้มทอง', 002, '61241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('61152110011-3', 'นางสาว', 'ณัฐวดี', 'ปั้นแตง', 004, '61241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('61152110028/1', 'นางสาว', 'จิตรลดา', 'เพ็ชรแสง', 001, '61241A', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('61152110029-1', 'นางสาว', 'ศิริพร', 'ซ่อนกลาง', 001, '61241B', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('61152110048-7', 'นางสาว', 'ทิพวรรณ', 'ตึ๋งพันธุ์', 006, '61241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('61152110049-7', 'นางสาว', 'ภัทรภรณ์', 'ถุงทอง', 001, '61241B', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('61152110060-2', 'นางสาว', 'ลลิตา', 'มะลิวัน', 002, '61241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('61152110063-2', 'นางสาว', 'มยุลิน', 'สุวรรณศรี', 008, '61241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('61152110074-0', 'นางสาว', 'วรรณวิสา', 'บุญหลัง', 001, '61241B', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('61152110080-8', 'นางสาว', 'สุจิตรา', 'กฤษณสุวรรณ', 002, '61241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('61152110102-4', 'นางสาว', 'ภัณฑิลา', 'คำภาพันธ์', 001, '61241A', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('61152110108-4', 'นางสาว', 'ศศิวรรณ', 'ประภัศร', 004, '61241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('61152110119-2', 'นางสาว', 'พรรณธิภา', 'งันขุนทด', 001, '61241B', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('61152110138-8', 'นางสาว', 'สิรีธร', 'เตยพุทรา', 008, '61241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('61152110169-1', 'นางสาว', 'วรกานต์', 'แก้วหล้า', 002, '61241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('61152110171-9', 'นางสาว', 'เบญญาภา', 'ผลชิงชัย', 008, '61241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('61152110183-7', 'นางสาว', 'พรสุดา', 'ศรีแก้ว', 001, '61241B', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('61152110186-7', 'นางสาว', 'เบญจพร', 'หริพงษ์', 003, '61241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('61152110208-3', 'นางสาว', 'กวิสรา', 'คำพะวงศ์', 001, '61241A', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('61152110225-9', 'นางสาว', 'สุชาวดี', 'ทุมฉิมพาลี', 006, '61241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('61152110235-7', 'นางสาว', 'ปิ่นสุดา', 'ช่วยสร้าง', 006, '61241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('61152110237-7', 'นางสาว', 'ณัฐิดา', 'พิมพ์ในเมือง', 001, '61241A', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('61152110291-4', 'นางสาว', 'วิไลวรรณ', 'แจ้งไพร', 008, '61241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('61152110297-4', 'นางสาว', 'ศิริรัตน์', 'เอิบพรมราช', 008, '61241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('61152110300-2', 'นางสาว', 'ภัฐราภา', 'เจาะดี', 001, '61241B', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('61152110315-0', 'นางสาว', 'กวินทิพย์', 'รัตนเนนย์', 001, '61241B', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('61152110332-6', 'นางสาว', 'รสริน', 'ฉลาด', 001, '61241B', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('61152110337-6', 'นางสาว', 'ณัฐชยา', 'สุขขาว', 008, '61241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('61152110341-4', 'MR.', 'SOVANDY', 'IN', 004, '61241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('61152110342-4', 'MR.', 'CHANDARA', 'SIN', 004, '61241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('61152110347-4', 'นางสาว', 'รัชลิตา', 'ชัยลา', 007, '61241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('61152110353-1', 'นางสาว', 'สาธินี', 'แสงอรุณ', 006, '61241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('61162110002-3', 'นางสาว', 'สุภาณี', 'รังปัญญา', 018, '61241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('61162110026-9', 'นางสาว', 'ธนิกาญจน์', 'พรวนกระโทก', 010, '61241A', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('61162110081-6', 'นางสาว', 'อนัญญา', 'ยวงโป่งแก้ว', 022, '61241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('61162110101-2', 'นาย', 'สิริโชค', 'ศรีบุญเรือง', 022, '61241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('61162110112-0', 'นางสาว', 'จุรีทิพย์', 'ค่ากระโทก', 017, '61241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('61162110130-6', 'นางสาว', 'สุนันทา', 'จันทร์สุข', 010, '61241A', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('61162110138-6', 'นางสาว', 'จิดาภา', 'ป้องขันธ์', 010, '61241B', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('61162110143-4', 'นางสาว', 'ปณิดา', 'หุ้มไธสง', 018, '61241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('61162110145-4', 'นางสาว', 'วราภรณ์', 'อะโคตรมี', 018, '61241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('61162110147-4', 'นาย', 'คงคา', 'รวดเร็ว', 020, '61241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('61162110167-9', 'นางสาว', 'จินดารัตน์', 'แก้วสีงาม', 017, '61241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('61162110194-3', 'นางสาว', 'วิภาวัลย์', 'ตั้งกระจ่างจิตร', 010, '61241A', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('61162110203-1', 'นางสาว', 'นฤมล', 'สูงสุด', 018, '61241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('61162110212-9', 'นางสาว', 'อุบลวรรณ', 'ฐานเจริญ', 010, '61241B', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('61162110227-7', 'นางสาว', 'สมฤทัย', 'หนูสันเทียะ', 009, '61241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('61162110235-5', 'นาย', 'สุภนัย', 'คำนิล', 022, '61241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('61162110238-5', 'นางสาว', 'วรรณกานต์', 'รัตนารักษ์', 022, '61241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('61162110245-3', 'นางสาว', 'ธิดา', 'โบงูเหลือม', 016, '61241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('61162110251-0', 'นางสาว', 'อันธิกา', 'จ่าพิชม', 013, '61241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('61162110291-2', 'นางสาว', 'ชยามร', 'ฤทธิ์กันโต', 022, '61241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('61162110292-2', 'นางสาว', 'ธันยธรณ์', 'เทพกลาง', 019, '61241C', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('61162110299-2', 'นางสาว', 'ลลดา', 'บัวนิล', 022, '61241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('61162110306-0', 'นางสาว', 'ณัฐรัตน์', 'มุ่งแฝงกลาง', 010, '61241B', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('61162110328-6', 'นางสาว', 'อัจฉราภรณ์', 'มวยดี', 022, '61241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('61162110354-9', 'นางสาว', 'ภรัชพร', 'บิงขุนทด', 009, '61241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('61162110387-3', 'นางสาว', 'สุภาพร', 'ดำสูงเนิน', 012, '61241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('61162110410-7', 'นางสาว', 'จิราภรณ์', 'เจริญฤทธิ์', 010, '61241A', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('61162110413-7', 'นางสาว', 'ดาลิน', 'แดนกระโทก', 013, '61241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('61162210021-7', 'MR.', 'CHIVORN', 'KHUN', 014, '61221', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('61162210022-7', 'MR.', 'LANGHONG', 'LAY', 014, '61221', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('61162210023-7', 'MR.', 'SINAK', 'CHEANG', 014, '61221', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('61162210024-7', 'MR.', 'CHET', 'MAT', 014, '61221', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('61162210025-7', 'MR.', 'PANHARATH', 'CHHI', 014, '61221', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('61162210026-7', 'MR.', 'BUNLA', 'CHEA', 014, '61221', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('61163140004-9', 'MR.', 'SAVANG', 'SOK', 156, '61354 (แผน ก2)', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('61163140005-9', 'MR.', 'SARIM', 'TOUCH', 156, '61354 (แผน ก2)', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('61172110014-9', 'นาย', 'ปฏิพล', 'พิลาศาสตร์', 075, '61241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('61172110039-5', 'นาย', 'ชัยยา', 'เข็มสว่าง', 069, '61241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('61172110071-6', 'นาย', 'ชยาพร', 'ประชากุล', 075, '61241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('61172110105-0', 'นางสาว', 'ณัฐชยา', 'อินธิราช', 083, '61241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('61172110173-5', 'นาย', 'รัตนพงษ์', 'เรืองเจริญ', 073, '61241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('61172110187-3', 'นาย', 'หรรษวัต', 'บุญกอง', 073, '61241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('61172110190-1', 'นาย', 'ณัฏฐพล', 'ศรีประเสริฐศักดิ์', 075, '61241', '0918313438', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('61172110202-9', 'นาย', 'วัฒนา', 'ทรัพย์ประเสริฐ', 072, '61241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('61172110203-9', 'นาย', 'ณัฐพงษ์', 'วิเศษนอกสินกุล', 075, '61241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('61172110235-3', 'นาย', 'ชุติพงษ์', 'ยวนจิตร', 075, '61242', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('61172110265-6', 'นางสาว', 'กมลลักษณ์', 'เหมะธุลิน', 084, '61241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('61172110270-4', 'นางสาว', 'กนกภรณ์', 'ซาร์', 075, '61241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('61172110296-0', 'นางสาว', 'จิรัชยา', 'เกตสันเทียะ', 071, '61241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('61172110375-3', 'นางสาว', 'จินดารัตน์', 'บุญครอง', 089, '61241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('61172110415-5', 'MR.', 'CHANSOVANNKUMPHEAK', 'PHUN', 084, '61241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('61172110416-5', 'MR.', 'HENG', 'CHHEANG', 087, '61241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('61172110417-5', 'MR.', 'THYDA', 'THEA', 089, '61241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('61172310263-2', 'นาย', 'ณพสิทธิ์', 'โสตะวงศ์', 083, '61231', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('61182110010-7', 'นางสาว', 'ชลธิชา', 'พรรณาภพ', 107, '61241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('61182110033-3', 'นางสาว', 'ปนัดดา', 'โนนใหม่', 101, '61241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('61182110046-1', 'นางสาว', 'จันทรรัตน์', 'ตีบกลาง', 106, '61241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('61182110065-6', 'นาย', 'ธนาธิป', 'ไข่กระโทก', 097, '61241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('61182110067-6', 'นางสาว', 'ณัฐนันท์', 'มุ่งแฝงกลาง', 097, '61241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('61182110076-4', 'นางสาว', 'สุรวดี', 'จันทร์ลิ้ม', 097, '61241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('61182110125-4', 'นางสาว', 'กันยารัตน์', 'แวดสูงเนิน', 097, '61241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('61182110162-5', 'นาย', 'รัชชานนท์', 'ธนานพคุณชัย', 096, '61241A', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('61182110188-1', 'นางสาว', 'น้ำทิพย์', 'สิงห์คำป้อง', 101, '61241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('61182110222-3', 'MISS.', 'SONICH', 'SROY', 097, '61241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('61182110223-3', 'MISS.', 'LEABSOMNANG', 'MEAN', 097, '61241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62151110091-5', 'นางสาว', 'ปัญฐิตา', 'งามศรี', 110, '62121 (ม.6)', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62152110001-3', 'นางสาว', 'วริษฐาพร', 'สกุลคำประสิทธิ์', 001, '62241A', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62152110005-3', 'นางสาว', 'จิณัฐตา', 'รวมดอน', 008, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62152110009-3', 'นางสาว', 'พัดชา', 'มณฑาพงษ์', 007, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62152110015-1', 'นางสาว', 'นาริษา', 'สุวรรณมาโจ', 001, '62241A', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62152110016-1', 'นางสาว', 'กนกพิชชา', 'นวลใส', 001, '62241B', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62152110020-9', 'นางสาว', 'พรนภา', 'นนเทศา', 001, '62241A', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62152110023-9', 'นางสาว', 'ธนาพร', 'มุ่งเอื้อมกลาง', 001, '62241B', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62152110028-9', 'นางสาว', 'หทัยวรรณ', 'จันทร์พงษ์', 006, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62152110029-9', 'นาย', 'สิทธิโชค', 'เพลงสันเทียะ', 006, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62152110048-5', 'นางสาว', 'ฐาปนี', 'สาทิพจันทร์', 001, '62241B', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62152110053-2', 'นางสาว', 'ภัทรกันย์', 'ติวทอง', 002, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62152110056-2', 'นาย', 'จารุวัฒน์', 'คำขุนทด', 007, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62152110062-0', 'นาย', 'พีรภัทร์', 'ลาภสมบูรณ์ยิ่ง', 007, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62152110066-0', 'นางสาว', 'เหมวรรณ', 'เสวกานันท์', 006, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62152110073-8', 'นางสาว', 'ฐิติกา', 'อินทร์นอก', 008, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62152110078-8', 'นางสาว', 'ขวัญจิรา', 'คนโทฉิมพลี', 007, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62152110083-6', 'นางสาว', 'อลิชา', 'จันทร์ศรี', 008, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62152110094-4', 'นางสาว', 'กนกนิภา', 'สมบูรณ์', 001, '62241A', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62152110096-4', 'นางสาว', 'ญาณิน', 'หาญนอก', 001, '62241B', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62152110100-2', 'นางสาว', 'จิรปรียา', 'คันธศักดิ์ศิริ', 007, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62152110107-2', 'นางสาว', 'วิมลรัตน์', 'หยวกฉิมพลี', 001, '62241A', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62152110111-0', 'นางสาว', 'อารียา', 'อัคราช', 001, '62241A', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62152110114-0', 'นางสาว', 'อภิญญา', 'หอมขุนทด', 002, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62152110116-0', 'นางสาว', 'อรนิด', 'พอกพูล', 007, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62152110117-0', 'นางสาว', 'นริษา', 'โคตก่ำ', 007, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62152110118-0', 'นางสาว', 'มณธิชา', 'น้อยผาง', 008, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62152110127-8', 'นางสาว', 'วันวิสาข์', 'ใสพลกรัง', 001, '62241A', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62152110133-6', 'นางสาว', 'นริศรา', 'ยางนอก', 001, '62241A', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62152110148-4', 'นางสาว', 'สุภิศรา', 'มูลทองหลาง', 003, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62152110149-4', 'นางสาว', 'กัญญารัตน์', 'จุลศรี', 008, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62152110159-1', 'นางสาว', 'กิตติกา', 'นิฤมล', 001, '62241B', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62152110163-9', 'นางสาว', 'ศิริญา', 'หวดขุนทด', 002, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62152110165-9', 'นางสาว', 'กุลพันธ์รัตน์', 'สินประเสริฐ', 001, '62241B', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62152110168-9', 'นางสาว', 'หทัยชนก', 'เสิงขุนทด', 001, '62241B', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62152110179-7', 'นางสาว', 'กนกวรรร', 'สิงห์ขันธ์', 001, '62241B', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62152110180-5', 'นางสาว', 'ทรรศิกา', 'สิทธิวงษ์', 001, '62241B', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62152110185-5', 'นางสาว', 'วลัยรัตน์', 'อินพู่', 002, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62152110186-5', 'นางสาว', 'ธิญาดา', 'พูนมีพะเนา', 001, '62241A', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62152110190-3', 'นาย', 'ศักดิ์สิริ', 'ศิริพัฒน์กุล', 007, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62152110191-3', 'นางสาว', 'วณิตา', 'กระสังข์', 008, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62152110192-3', 'นางสาว', 'วาเลน', 'วงษ์ประเสริฐ', 001, '62241A', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62152110206-1', 'นางสาว', 'วรรณรดา', 'ตรีรัตนกุลพร', 001, '62241A', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62152110210-9', 'นาย', 'รติพงษ์', 'คงเจริญ', 007, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62152110211-9', 'นางสาว', 'ชลธิชา', 'วินดี', 008, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62152110214-9', 'นางสาว', 'จีรวรรณ', 'เพชรประไพ', 007, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62152110217-9', 'นางสาว', 'อินทิรา', 'บวรเศรษฐพร', 002, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62152110225-7', 'นางสาว', 'กัญญาภัทร', 'วงษ์ชู', 002, '62241', '0930904987', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62152110226-7', 'นาย', 'ฐิติกร', 'ชุ่มขุนทด', 007, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62152110230-5', 'นางสาว', 'ธนัชชา', 'หนูคง', 002, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62152110249-3', 'นางสาว', 'เพ็ญนภา', 'สนั่นไพร', 006, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62152110256-0', 'นางสาว', 'อรุณรุ่ง', 'ยนจอหอ', 002, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62152110257-0', 'นางสาว', 'พันพัสสา', 'เปียหมื่นไวย์', 001, '62241B', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62152110262-8', 'นางสาว', 'ศิริวรรณ', 'ยวนกลาง', 006, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62152110275-6', 'นางสาว', 'สุพัตรา', 'บุญน้อม', 008, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62152110277-6', 'นางสาว', 'จันทิมา', 'โถ่ยสูงเนิน', 006, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62152110279-6', 'MISS.', 'SIRIPHON', 'SAWAENGDEE', 125, '63121ข (ม.6)', '0621601975', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62152110280-4', 'MISS.', 'BUNTHORN', 'NHEATA', 125, '63121ข (ม.6)', '0935285086', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62152110284-4', 'นางสาว', 'วรรณภา', 'เลากลาง', 001, '62241A', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62152110288-4', 'นางสาว', 'ปานระพี', 'สืบกระแสร์', 008, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62152110298-2', 'นางสาว', 'อภิสรา', 'สวรรค์ดอน', 006, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62152110299-2', 'นางสาว', 'สุนิษา', 'ประจง', 003, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62152110303-0', 'นางสาว', 'ณพัฐธิกา', 'ธัญเมธีพัฒน์', 007, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62152110304-0', 'นางสาว', 'นิราวัลย์', 'ปานพรม', 006, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62152110327-6', 'นางสาว', 'กัลยารัตน์', 'สมิงมิตร', 008, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62152110347-2', 'นางสาว', 'อริสรา', 'ศรีประเสริฐ', 006, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62152310018-7', 'นางสาว', 'ปิ่นมณี', 'ทองพิมาย', 002, '62221', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62152310027-5', 'นางสาว', 'วิมพ์วิภา', 'เทากระโทก', 003, '62221', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62152310054-8', 'นาย', 'เบญจรงค์', 'จงเจิมกลาง', 004, '62221A', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62152310060-6', 'นางสาว', 'ปาริญาภรณ์', 'ในกระโทก', 002, '62221', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62152310137-2', 'นางสาว', 'จุฑามาศ', 'ผกามาศ', 001, '62221A', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62152310138-2', 'นางสาว', 'อรพิม', 'ศิลปะ', 001, '62221A', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62152310140-0', 'นางสาว', 'จิราพร', 'แมดพิมาย', 002, '62221', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62152310143-0', 'นางสาว', 'มัลลิกา', 'ซิงจังหรีด', 002, '62221', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62152310147-0', 'นางสาว', 'พิชญานันท์', 'คูหา', 001, '62221A', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62152310167-5', 'นางสาว', 'วีรยา', 'ศรีสุข', 001, '62221A', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62152310176-3', 'นางสาว', 'เกศมณี', 'แก่นกระโทก', 001, '62221A', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62152310178-3', 'นางสาว', 'กนกวรรณ', 'อังศิริลาวัลย์', 001, '62221A', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62152310194-9', 'นางสาว', 'หัทยา', 'ไตรนาค', 002, '62221', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62152310227-3', 'นางสาว', 'ภัทราวดี', 'โครวัตร', 001, '62221B', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62152310239-1', 'นางสาว', 'อินทิรา', 'พูดคล่อง', 001, '62221B', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62152310241-9', 'นางสาว', 'ทิพยาภรณ์', 'ดึกกระโทก', 001, '62221B', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62152310246-9', 'นางสาว', 'กาญจนา', 'ทำนานอก', 001, '62221C', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62152310256-6', 'นางสาว', 'อนันทิพย์', 'เชือกโคกกรวด', 003, '62221', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62152310271-2', 'นางสาว', 'อมรรัตน์', 'ขอนกระโทก', 003, '62221', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62152310283-0', 'นางสาว', 'พณัฐดา', 'นาทิพย์', 001, '62221C', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62152310289-0', 'นางสาว', 'นัตยา', 'วงค์วิเศษ', 001, '62221C', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62152310311-4', 'นางสาว', 'บุศรินทร์', 'จิสูงเนิน', 001, '62221C', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62152310313-4', 'นางสาว', 'มนรดา', 'ถาเอี้ยง', 004, '62221B', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62152310331-0', 'นางสาว', 'ฐิตาพร', 'ประกอบดี', 001, '62221C', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62152310334-0', 'นางสาว', 'ชนกนันท์', 'ลักขษร', 001, '62221C', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62152310381-9', 'นางสาว', 'ชุติมา', 'อินทรพาพรหม', 004, '62221B', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62152310385-9', 'นางสาว', 'วิไลพร', 'จันทร์ตัน', 004, '62221B', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62162110003-1', 'นาย', 'ธุมากร', 'ป้อมสุวรรณ์', 021, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62162110005-1', 'นางสาว', 'เปรมชนก', 'สุทธิ', 021, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62162110020-7', 'นางสาว', 'ปภาวี', 'กิตติรงค์', 022, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62162110021-7', 'นางสาว', 'สุรารักษ์', 'เกียรติสูงเนิน', 022, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62162110023-7', 'นางสาว', 'รัชนัน', 'การค้า', 017, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62162110024-7', 'นางสาว', 'มัญชุลิกา', 'ดีมาก', 019, '62241A', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62162110025-7', 'นางสาว', 'ดรุณี', 'ทะวรสันต์', 019, '62241A', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62162110034-5', 'นางสาว', 'สโรชา', 'ขำอาจ', 013, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62162110040-3', 'นางสาว', 'เจตนาพร', 'สาฆ้อง', 018, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62162110041-3', 'นางสาว', 'นริศรา', 'ถนัดเลื่อย', 019, '62241A', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62162110042-3', 'นางสาว', 'ปวีณา', 'อ่อนทองหลาง', 019, '62241A', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62162110046-3', 'นางสาว', 'จิตลัดดา', 'สนิทชอบ', 019, '62241B', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62162110054-0', 'นางสาว', 'วาทินี', 'จันทร์ที', 018, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62162110063-8', 'นางสาว', 'ธัญชนก', 'แสนโยธะกะ', 017, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62162110071-6', 'นางสาว', 'จีรนันท์', 'ผูกกลาง', 010, '62241B', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62162110072-6', 'นางสาว', 'ปรียาภัทร', 'แซ่โง้ว', 017, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62162110079-6', 'นางสาว', 'บัณฑิตา', 'วรรณกิจ', 021, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62162110083-4', 'นางสาว', 'สุธัญญา', 'กมลคร', 018, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62162110086-4', 'นาย', 'บวร', 'แก้วขุนทด', 017, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62162110090-2', 'นางสาว', 'อนิสา', 'ชันขุนทด', 018, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62162110091-2', 'นาย', 'ภานุพงษ์', 'เหรียญสูงเนิน', 018, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62162110120-6', 'นางสาว', 'เหมือนวาด', 'กลมกลาง', 019, '62241A', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62162110127-6', 'นางสาว', 'ชลิตา', 'รื่นรวย', 022, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62162110134-4', 'นาย', 'ทัสมา', 'บุกขุนทด', 021, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62162110139-4', 'นางสาว', 'ชาลิสา', 'ศุภมงคล', 009, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62162110148-2', 'นาย', 'วรวุฒิ', 'ราชวัตร', 021, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62162110149-2', 'นางสาว', 'นริศรา', 'หุตะเมขลิน', 018, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62162110157-9', 'นางสาว', 'ปฐมาวดี', 'กีต้า', 021, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62162110159-9', 'นางสาว', 'สุนิษา', 'เสริฐศรี', 011, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62162110160-7', 'นางสาว', 'ธราทิพย์', 'ไชยท้าว', 022, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62162110163-7', 'นางสาว', 'บุณยาพร', 'กะสุนรัมย์', 018, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62162110167-7', 'นาย', 'ชัยมนตรี', 'ชวยขุนทด', 021, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62162110170-5', 'นางสาว', 'ชเนตตี', 'ธรรมนาม', 022, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62162110172-5', 'นางสาว', 'ณัชธนิดา', 'อมรกิตติถาวร  BPT', 013, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62162110173-5', 'นางสาว', 'กชกร', 'วิรัตน์เกษ', 022, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62162110175-5', 'นางสาว', 'อินทิรา', 'สูตรใหม่', 013, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62162110180-3', 'นางสาว', 'ธัญญาภรณ์', 'แก้วสีขาว', 022, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62162110185-3', 'นาย', 'ภูชัย', 'เพชรสูงเนิน', 018, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62162110186-3', 'นางสาว', 'จุฑาพร', 'กุ้ยประเสริฐ', 018, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62162110195-1', 'นางสาว', 'ธาริญา', 'ชูชีพ', 019, '62241B', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62162110196-1', 'นางสาว', 'บุษยา', 'กรวยสวัสดิ์', 018, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62162110201-9', 'นางสาว', 'ปรียานุช', 'พุ่มมั่น', 009, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62162110203-9', 'นางสาว', 'อรุณี', 'ภูขุนทด', 018, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62162110204-9', 'นางสาว', 'ธนสุภาวรรณ์', 'สุขสูงเนิน', 022, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62162110208-9', 'นางสาว', 'กิตติยาภรณ์', 'สงขุนทด', 022, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62162110212-7', 'นางสาว', 'ศศิประภา', 'บีกขุนทด', 020, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62162110220-5', 'นางสาว', 'พรพรรษา', 'ซุยกระโทก', 010, '62241B', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62162110224-5', 'นางสาว', 'ปาริฉัตร', 'โพงขุนทด', 018, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62162110225-5', 'นางสาว', 'สายชล', 'พักสันเทียะ', 013, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62162110228-5', 'นาย', 'ณพกฤษณ์', 'เช่นพิมาย', 021, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62162110239-3', 'นางสาว', 'ณัฐพร', 'วรรณป้าน', 022, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62162110249-1', 'นาย', 'ณัฐกิตติ์', 'พรมสุวรรณ์', 010, '62241A', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62162110261-6', 'นางสาว', 'แดนนิสสา', 'สว่างศรี', 018, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62162110269-6', 'นางสาว', 'ขวัญใจ', 'เกี้ยวสันเทียะ', 018, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62162110281-2', 'นางสาว', 'นันทวรรณ์', 'เชื้อเชิญชม', 021, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62162110284-2', 'นางสาว', 'ธิดารัตน์', 'อารีชาติ', 021, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62162110287-2', 'นาย', 'สิปปกร', 'แสงพรม', 016, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62162110303-8', 'นางสาว', 'อทิติยา', 'เชียวขุนทด', 018, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62162110305-8', 'นางสาว', 'ภาวนา', 'อินทรเสนา', 018, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62162110317-6', 'MR.', 'Rathavann', 'phally', 016, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62162110318-6', 'MISS.', 'ZAHROS', 'MAN', 147, '63241A', '0621742767', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62162110319-6', 'MR.', 'sophea', 'loem', 017, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62162110322-4', 'นางสาว', 'ณัฎฐณิชา', 'สาคุณ', 022, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62162110327-4', 'นางสาว', 'ทัตพร', 'โลสันเทียะ', 020, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62162110331-2', 'นางสาว', 'อรไพลิน', 'สมพีรพันธุ์', 019, '62241B', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62162110368-5', 'นาย', 'ทวี', 'เต็งสูงเนิน', 017, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62162110384-1', 'นางสาว', 'ธันยา', 'แนบจันอัด', 022, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62162110386-1', 'นางสาว', 'ศิโรรัตน์', 'มัจฉาทอง', 022, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62162110397-9', 'นางสาว', 'ชนะดา', 'บุญบุตร', 021, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62162110403-7', 'นางสาว', 'ทิพาพร', 'โชติพิพัฒน์พงศ์', 017, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62162110407-7', 'นางสาว', 'ชลธิชา', 'ไชยเผือก', 017, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62162110414-5', 'นางสาว', 'กมลภรณ์', 'จันทร์ล้อมรัตน์ MCT.', 017, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62163140002-7', 'MR.', 'Bunrong', 'Sok', 156, '62354', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62171110016-8', 'นาย', 'คณิน', 'สิริจำรัสวงศ์', 131, '62121', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62171110121-5', 'นาย', 'เจนณรงค์', 'อินทร์สำราญ', 129, '62121', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62172110050-8', 'นางสาว', 'จิราภรณ์', 'จันคำ', 084, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62172110059-8', 'นางสาว', 'นราวดี', 'บรรจง', 084, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62172110086-2', 'นางสาว', 'วริศรา', 'ล้อมสระน้อย', 087, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62172110103-8', 'นางสาว', 'ชลิดา', 'เรืองจันทึก', 087, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62172110134-2', 'นาย', 'สืบสกุล', 'จงหมื่นไวย์', 080, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62172110155-7', 'นางสาว', 'กนกวรรณ', 'เกริกสูงเนิน', 084, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62172110211-5', 'นางสาว', 'ศิรินทร', 'ศรีเเสงทรัพย์', 084, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62172110219-5', 'นาย', 'กฤษฎา', 'เบียดขุนทด', 082, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62172110231-1', 'นาย', 'ธนเกียรติ', 'เครือสูงเนิน', 073, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62172110251-6', 'นาย', 'ชิษณุพงศ์', 'ศิริพันธ์', 087, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62172110257-6', 'นางสาว', 'ถิรวรรณ', 'จาระนัย', 084, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62172110304-6', 'นางสาว', 'ณัฐณิชา', 'บัลลังค์', 084, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62172110320-2', 'นางสาว', 'ศตพร', 'ภาสขุนทด', 084, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62172110321-2', 'นางสาว', 'ชลธิชา', 'ชำนาญจิตร', 084, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62172110338-0', 'นาย', 'เกียรติภูมิ', 'พิสุทธิ์', 073, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62172110346-8', 'MR.', 'Rathanak', 'seoun', 071, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62172110347-8', 'MR.', 'Vuthypiseth', 'phon', 072, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62172110357-5', 'นาย', 'กรวัตร์', 'เจริญศักดิ์', 072, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62172310062-2', 'นางสาว', 'สุภาพร', 'เรืองสูงเนิน', 074, '62231A', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62172310139-8', 'นางสาว', 'กมลชนก', 'ช่างพิมพ์', 071, '62231', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62172310203-3', 'นางสาว', 'ศศิพิมพ์', 'จันคณา', 074, '62231A', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62172310233-7', 'นาย', 'เกียรติไพบูลย์', 'เทพภิบาล', 086, '62231', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62172310291-4', 'นาย', 'วัชรินทร์', 'ยี่ยวน', 086, '62231', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62172310334-6', 'นางสาว', 'ศิริสิน', 'บัวพุฒ', 071, '62231', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62172310511-8', 'นาย', 'ธันวาคม', 'จรรยา', 082, '62231', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62182110010-5', 'นาย', 'วัชระ', 'ซ้ายกระโทก', 107, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62182110026-3', 'นางสาว', 'เดือน', '-', 096, '62241A', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62182110029-3', 'นางสาว', 'พิทยาภรณ์', 'พิสิฏฐ์โรจนพงศ์', 101, '62241A', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62182110032-1', 'นางสาว', 'วาวา', '-', 096, '62241A', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62182110037-1', 'นางสาว', 'อุษญาณี', 'สันกลาง', 097, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62182110047-9', 'นางสาว', 'ธัญญาศิริ', 'พรมมิตธิกุล', 101, '62241A', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62182110054-6', 'นางสาว', 'คณิศร', 'พรมมร', 101, '62241A', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62182110056-6', 'นางสาว', 'อุษณิษา', 'ทนโคกสูง', 104, '62251', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62182110059-6', 'นางสาว', 'วันนิพา', 'โหมฮึก', 099, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62182110126-2', 'นางสาว', 'เหมือนฝัน', 'รอสูงเนิน', 099, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62182110138-0', 'นางสาว', 'รวิวรรณ', 'สอดโคกสูง', 101, '62241B', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62182110155-5', 'นางสาว', 'ธิดารัตน์', 'ภูมิเกาะ', 099, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62182110195-7', 'MISS.', 'DARAREAKSMEY', 'DY', 106, '63241', '0930724763', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62182110196-7', 'MR.', 'Romly', 'kao', 099, '62241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62182110201-5', 'นางสาว', 'มัณฑนา', 'ด่านกระโทก', 104, '62251', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('62182110209-5', 'นาย', 'พิพัฒน์', 'พิบูลย์แสงรุ้ง', 101, '62241A', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63151110006-2', 'นางสาว', 'ศศิวดี', 'เชิดสูงเนิน', 111, '63121ก', '0981232587', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63151110010-0', 'นางสาว', 'ศศิกานต์', 'ก่ำพรมราช', 108, '63121 (ม.6)', '0642183297', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63151110013-0', 'นาย', 'เมธี', 'วิเศษคร้อ', 111, '63121ก', '0621368628', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63151110015-0', 'นางสาว', 'พรรวษา', 'อินทศร', 108, '63121 (ม.6)', '0621232457', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63151110017-0', 'นางสาว', 'วชิรญาณ์', 'เมืองกระโทก', 111, '63121ก', '0956058794', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63151110025-8', 'นางสาว', 'วุฒิพร', 'ผ่านกระโทก', 110, '63121', '0934105542', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63151110028-8', 'นางสาว', 'ปาริฉัตร์', 'เฝ้าหนองดู่', 110, '63121', '0952628193', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63151110029-8', 'นางสาว', 'ณัฐนรี', 'แดงคำ', 110, '63121 (ม.6)', '0610562762', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63151110033-6', 'นางสาว', 'สุปรียา', 'ศรีสง่า', 111, '63121ก', '0821530355', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63151110034-6', 'นาย', 'ก้องหล้า', 'บุญกิ่ง', 111, '63121ก', '0930929062', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63151110037-6', 'นางสาว', 'ปิยะฉัตร', 'นาดี', 111, '63121ก', '0985733795', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63151110038-6', 'นางสาว', 'วรรณภรณ์', 'ศรีพรหม', 111, '63121ก', '0855302274', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63151110044-4', 'นางสาว', 'บัณฑิตา', 'รอไธสง', 111, '63121ก', '0989892241', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63151110050-1', 'นางสาว', 'สุรีรัตน์', 'อ่อนกลั่นดี', 110, '63121', '0611492837', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63151110059-1', 'นางสาว', 'สุนิษา', 'บรรลือทรัพย์', 111, '63121ข', '0935657983', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63151110061-9', 'นางสาว', 'นิสาชล', 'สาลีเกิด', 111, '63121ข', '0630535644', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63151110067-9', 'นางสาว', 'สันต์ฤทัย', 'ศุภพรชัยพฤกษ์', 111, '63121ข', '085-417-4597', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63151110071-7', 'นางสาว', 'ทักษพร', 'ยศกลาง', 110, '63121 (ม.6)', '0628561291', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63151110075-7', 'นางสาว', 'นฤมล', 'ทรงฉลาด', 111, '63121ข', '0643014588', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63151110079-7', 'นางสาว', 'กัญญ์วรา', 'ยงเสมอ', 110, '63121 (ม.6)', '0997905306', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63151110080-5', 'นาย', 'พัฒนภูมิ', 'สวัสดิ์ผล', 109, '63121', '0967062920', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63151110082-5', 'นางสาว', 'นิสากร', 'เหลาคม', 111, '63121ข', '0658899464', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63151110085-5', 'นางสาว', 'สุพัตรา', 'พูนจะโปะ', 109, '63121', '0627726869', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63151110089-5', 'นางสาว', 'บัณฑิตา', 'ตามเมืองปัก', 109, '63121', '0934492305', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63151110095-3', 'นางสาว', 'กาญจนา', 'บุญวงค์', 109, '63121', '0624864295', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63151110097-3', 'นางสาว', 'สุนิสา', 'สุขรวย', 110, '63121', '0883737615', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63151110098-3', 'นางสาว', 'ภาณุมาส', 'พากเพียร', 111, '63121ข', '0930904987', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63151110099-3', 'นางสาว', 'ปิยดา', 'คำนันท์', 111, '63121ข', '0902533499', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63151110102-1', 'นางสาว', 'สุปรีดา', 'แก้วไชยะ', 111, '63121ข', '-', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63151110103-1', 'นางสาว', 'ศิริรัตน์', 'คำสัตย์', 111, '63121ข', '0935732166', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63151110104-1', 'นางสาว', 'หทัยชนก', 'พรมมา', 111, '63121ข', '0655831330', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63151110106-1', 'นางสาว', 'ฐิตินันท์', 'พุดหอม', 111, '63121ข', '0810683570', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63151110107-1', 'นางสาว', 'ลลิตา', 'จันดาวงศ์', 110, '63121', '-', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63151110112-9', 'นางสาว', 'กาญจนา', 'ภูมิโคกรักษ์', 110, '63121 (ม.6)', '-', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63151110115-9', 'นาย', 'ตันติกร', 'พลวัน', 108, '63121', '0973310406', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63151110124-7', 'นางสาว', 'ณัฐสุดา', 'ชุ่มฉิมพลี', 110, '63121 (ม.6)', '0957036106', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63151110130-5', 'นางสาว', 'ภัทรวดี', 'ศรีคุณ', 110, '63121 (ม.6)', '0886311426', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63151110131-5', 'นางสาว', 'นฤมล', 'ขำดี', 110, '63121 (ม.6)', '0872434926', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63151110149-3', 'นางสาว', 'เพ็ญนภา', 'ทาธิวัน', 110, '63121 (ม.6)', '0826267476', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63151110150-0', 'นางสาว', 'วรรณิษา', 'วรรณปะเข', 110, '63121 (ม.6)', '0855215096', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63151110151-0', 'นางสาว', 'วิลันดา', 'เอนกลาง', 108, '63121 (ม.6)', '0652973516', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63151110156-0', 'นางสาว', 'กัญจนภรณ์', 'สุนทร', 111, '63121ก', '0649460485', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63151110159-0', 'นางสาว', 'มณีรัตน์', 'เปลื้องกระโทก', 111, '63121ก', '0935152417', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63151110160-8', 'นางสาว', 'ภัทรกันย์', 'สุระสุข', 111, '63121ข', '0934951911', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63151110167-8', 'นางสาว', 'นภาวรรณ', 'สายสุวรรณ', 111, '63121ข', '0902707239', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63151110176-6', 'นางสาว', 'ศศิชา', 'นิลจันทร์', 111, '63121ข', '0956065671', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63151110177-6', 'นางสาว', 'สุนิสา', 'งันขุนทด', 111, '63121ข', '0862615134', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63151110178-6', 'นางสาว', 'จันธิมาภร', 'บุญประจง', 111, '63121ข', '0923973927', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63151110183-4', 'นางสาว', 'พัชรินทร์', 'ปะริเตนัง', 110, '63121 (ม.6)', '0982029721', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63151110188-4', 'นางสาว', 'สิรินันท์', 'สีเสนา', 110, '63121 (ม.6)', '0981743712', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63151110194-2', 'นาย', 'ณัฐยศ', 'ขอศรีกลาง', 110, '63121 (ม.6)', '0630560056', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63151110200-0', 'นางสาว', 'บัณฑิตา', 'ชื่นบาน', 110, '63121', '0949200652', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63151110210-8', 'นางสาว', 'ธนภรณ์', 'ทาไธสง', 137, '63121', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63151110211-8', 'นางสาว', 'รสริน', 'อดุลกลาง', 137, '63121(ม.6)', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63151110212-8', 'นางสาว', 'บุศรินทร์', 'แกล้งกลางดอน', 137, '63121(ม.6)', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63151110215-8', 'นางสาว', 'บุศรินทร์', 'ปุผาลา', 137, '63121(ม.6)', '0934427529', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63151110217-8', 'นางสาว', 'ภัทรวรรณ', 'ใจดี', 137, '63121(ม.6)', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63151110219-8', 'นางสาว', 'สุภาพร', 'จี่พิมาย', 137, '63121(ม.6)', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63151110220-6', 'นางสาว', 'กนกวรรณ', 'รัตนคำพจน์', 137, '63121', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63151110224-6', 'นางสาว', 'จตุรพร', 'แก้วก้อน', 137, '63121(ม.6)', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63151110227-6', 'นางสาว', 'อุษา', 'ทิพย์คูนอก', 137, '63121(ม.6)', '0624021328', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63151110229-6', 'นาย', 'ธนทัต', 'เยื้องเปล', 137, '63121(ม.6)', '0859258082', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63151110231-4', 'นางสาว', 'กนกวรรณ', 'โจติธรรมวาทิน', 137, '63121(ม.6)', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63151110232-4', 'นางสาว', 'จารุวรรณ', 'เพลงศรี', 137, '63121(ม.6)', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63151110234-4', 'นาย', 'ธนวุฒิ', 'มัตถาปะกา', 137, '63121(ม.6)', '0646501518', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110001-1', 'นางสาว', 'ลดาวรรณ์', 'เผ็ดกระโทก', 004, '63241', '0821508135', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110002-1', 'นางสาว', 'ญานาธร', 'ชอบศิลป์', 142, '63241', '0619694271', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110004-1', 'นางสาว', 'ผ่องนภา', 'โลเกต', 002, '63241A', '0639504432', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110005-1', 'นางสาว', 'อิสริยา', 'ไฉวกลาง', 004, '63241', '0986363893', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110008-1', 'นางสาว', 'จิราพร', 'หาพันธ์', 144, '63241A', '0653134277', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110010-9', 'นางสาว', 'จอมขวัญ', 'คงศรี', 144, '63241A', '0864611715', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110013-9', 'นาย', 'ธนากร', 'ทีดินดำ', 004, '63241', '0849606048', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110016-9', 'นางสาว', 'สุนีรัตน์', 'เทียนขุนทด', 002, '63241A', '0654139018', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110017-9', 'นางสาว', 'ฐิติยา', 'พูลสระคู', 004, '63241', '0929750238', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110018-9', 'นางสาว', 'ฐิดารัตน์', 'สันติจำเริญกิจ', 142, '63241', '0894591469', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110022-7', 'นางสาว', 'เขมิกา', 'แปลงดี', 001, '63241A', '0955298632', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110024-7', 'นางสาว', 'เบญจวรรณ', 'พิศนอก', 002, '63241A', '0987291401', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110026-7', 'นางสาว', 'กนกลักษณ์', 'ผ่องใส', 002, '63241A', '0930766773', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110027-7', 'นางสาว', 'ขนิษฐา', 'อินทร์โคกสูง', 144, '63241B', '0895208499', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110028-7', 'นางสาว', 'กัลยารัตน์', 'เกือบสันเทียะ', 002, '63241A', '0952743522', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110029-7', 'นางสาว', 'สุณัฐชา', 'เที่ยงธรรม', 002, '63241A', '0973029373', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110030-5', 'นางสาว', 'อณุภา', 'น้อยนำสูนย์', 143, '63241', '0955950114', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110031-5', 'นางสาว', 'จีนพัฒน์', 'ฝอดสูงเนิน', 001, '63241B', '0982424269', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110032-5', 'นางสาว', 'นิชกานต์', 'จักรแก้ว', 002, '63241A', '061-1035307', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110033-5', 'นางสาว', 'ชนิดา', 'ชุมกว้าง', 143, '63241', '0629194210', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110034-5', 'นาย', 'ธีรวิทย์', 'ฉาบกิ่ง', 001, '63241B', '0982105761', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110036-5', 'นางสาว', 'สุกัญญา', 'ประทาสี', 002, '63241A', '0933533029', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110037-5', 'นางสาว', 'ปิยวรรณ', 'แจ้โพธิ์', 002, '63241B', '0660910827', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110038-5', 'นางสาว', 'รัตนาภรณ์', 'ทองเพ็ชร', 002, '63241B', '0821362734', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110040-3', 'นางสาว', 'อัฌชริยาภรณ์', 'มาตรังศรี', 002, '63241B', '0935124135', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110041-3', 'นางสาว', 'อารยา', 'บัวจำรัส', 144, '63241B', '0971530293', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110047-3', 'นางสาว', 'วารินี', 'บุตรเจริญ', 002, '63241B', '0996088133', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110048-3', 'นางสาว', 'พุทธพร', 'จันพรมมา', 002, '63241B', '0610361525', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110051-0', 'นางสาว', 'มยุรี', 'น้อยไพล', 144, '63241B', '0969840095', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110054-0', 'นางสาว', 'รุ่งระวี', 'สาธร', 002, '63241B', '0863420179', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110055-0', 'นางสาว', 'ณัฐพร', 'กระจ่างโพธิ์', 142, '63241', '0932706202', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110057-0', 'นางสาว', 'ศุภลักษณ์', 'ปิ่นสูงเนิน', 142, '63241', '0887461402', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110061-8', 'นางสาว', 'ปาริชาติ', 'ชื่นฉิมพลี', 003, '63241', '0637607776', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110063-8', 'นางสาว', 'บุณยานุช', 'หิรัญพันธ์', 001, '63241A', '0994725330', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110064-8', 'นางสาว', 'วรรณภา', 'พรหมหิงษา', 144, '63241A', '0630169147', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110065-8', 'นางสาว', 'ชนัญชิดา', 'พุฒต้น', 001, '63241B', '0629657674', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110067-8', 'นางสาว', 'ฐิตินันท์', 'เดชานุภานนท์', 144, '63241A', '0901038915', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110069-8', 'นางสาว', 'ณัฏฐนิช', 'พรหมบุตร', 144, '63241B', '064-4933891', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110070-6', 'นางสาว', 'กัญญารัตน์', 'กล้าหาญ', 143, '63241', '0981681429', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110071-6', 'นางสาว', 'ชนกานต์', 'กันยาพงษ์', 001, '63241C', '0825693547', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110072-6', 'นางสาว', 'ชลธิชา', 'สังข์ทอง', 002, '63241A', '0981601845', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110074-6', 'นางสาว', 'ทิพวรรณ', 'แถวโสภา', 144, '63241B', '0973165348', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110076-6', 'นางสาว', 'สิณีนาถ', 'กิ่งไผ่ล้อม', 142, '63241', '0909010214', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110077-6', 'นางสาว', 'อชันญา', 'ศิริแก้ว', 001, '63241C', '0646482338', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110078-6', 'นางสาว', 'กัลยกร', 'บุญโต', 143, '63241', '0981904354', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110079-6', 'นางสาว', 'ณัฐนิชา', 'หนูพันธุ์', 143, '63241', '0931071916', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110080-4', 'นางสาว', 'สุภาวรรณ์', 'สายกระสุน', 142, '63241', '0630282495', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110081-4', 'นางสาว', 'เมษา', 'เนียมสันเทียะ', 002, '63241A', '0640052231', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110084-4', 'นางสาว', 'วันวิสาข์', 'สัตย์ธรรม', 004, '63241', '044641305', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110087-4', 'นางสาว', 'ปัญฑารีย์', 'มณีกรรณ์', 003, '63241', '0622600331', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110091-2', 'นางสาว', 'น้ำผึ้ง', 'พิษจำรูญ', 002, '63241A', '0629918315', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110092-2', 'นางสาว', 'ศศิกานต์', 'จันศิริ', 002, '63241A', '0650985826', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110093-2', 'นาย', 'จิรพัส', 'กะรัมย์', 001, '63241A', '0653127517', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110095-2', 'นางสาว', 'ณัฐณิชา', 'บ่อไทย', 002, '63241A', '0979782660', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110097-2', 'นางสาว', 'กนกวรรณ', 'หลาบนอก', 142, '63241', '0981080897', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110099-2', 'นาย', 'อนาวิล', 'พวบขุนทด', 143, '63241', '0862493055', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110100-0', 'นางสาว', 'วิสารัตน์', 'ชัยวรรณ์', 003, '63241', '0803165732', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110103-0', 'นาย', 'เศรษฐพงศ์', 'นาคสระน้อย', 003, '63241', '0935569595', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110107-0', 'นางสาว', 'ตียกุล', 'กองกิจ', 001, '63241A', '0972572922', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110108-0', 'นางสาว', 'กุลนิษฐ์', 'ทันตภิรมย์', 003, '63241', '0633151109', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110109-0', 'นางสาว', 'ชณิดาภรณ์', 'ชิขุนทด', 002, '63241A', '0986357538', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110111-8', 'นาย', 'จิรศักดิ์', 'โนนตาเถร', 001, '63241A', '0639309915', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110114-8', 'นางสาว', 'ศศิธร', 'เศรษฐศักดิ์อำพล', 144, '63241A', '0986169814', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110115-8', 'นางสาว', 'เรนุกา', 'ถวัลย์วีระวงศ์', 001, '63241B', '0935510289', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110116-8', 'นางสาว', 'กาญจนา', 'เเคนเเวง', 002, '63241B', '0649455679', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110118-8', 'นางสาว', 'ดวงกมล', 'เจิมขุนทด', 003, '63241', '0621398323', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110122-6', 'นาย', 'ณัฐนันท์', 'ไขทะเล', 142, '63241', '0872604107', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110126-6', 'นาย', 'ชานุวัตร', 'ศรีอภัย', 004, '63241', '0925617406', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110127-6', 'นางสาว', 'ชลธิชา', 'ยืนยงค์', 142, '63241', '0828762683', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110128-6', 'นางสาว', 'เพ็ญนภา', 'ทีเกาะ', 142, '63241', '0622082125', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110129-6', 'นางสาว', 'ชลดา', 'บุผาลา', 142, '63241', '0982292133', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110131-4', 'นางสาว', 'พัทธนันท์', 'ลาส', 144, '63241B', '0923586941', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110132-4', 'นางสาว', 'รัตนาพร', 'นิลพลกรัง', 144, '63241B', '0610646761', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110133-4', 'นาย', 'พชรพล', 'เพชรมาก', 144, '63241B', '0991231612', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110134-4', 'นาย', 'เรืองฤทธิ์', 'ภาวะรัตน์', 144, '63241B', '0837981045', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110137-4', 'นางสาว', 'ลักษิกา', 'มาสวัสดิ์', 002, '63241B', '099-4967926', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110141-2', 'นาย', 'ธณภัทร', 'ชำนาญนาค', 003, '63241', '0962305701', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110142-2', 'นางสาว', 'กมลวรรณ', 'จุลทัศน์', 003, '63241', '0657051007', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110144-2', 'นางสาว', 'สุธิตา', 'โฉมกระโทก', 003, '63241', '0652811685', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110145-2', 'นาย', 'พีรพัฒน์', 'พรานกระโทก', 003, '63241', '-', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110147-2', 'นาย', 'ณัฐพัชร', 'มงกุฎเพชร', 003, '63241', '0857769780', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110150-9', 'นางสาว', 'อังศิณีย์', 'กล่อมเกลี้ยง', 001, '63241B', '0988781894', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110152-9', 'นางสาว', 'นันธกานต์', 'ทวยสม', 001, '63241B', '0621782014', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110153-9', 'นางสาว', 'จันทกานต์', 'ดีนารัมย์', 001, '63241B', '0849627913', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110154-9', 'นางสาว', 'สุจิรา', 'กรอบพุดซา', 001, '63241C', '0821438706', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110155-9', 'นางสาว', 'ณราภรณ์', 'ฤทธิมหา', 144, '63241B', '0934764256', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110156-9', 'นางสาว', 'พรรณฉัตร', 'เขียวพิลาบ', 002, '63241B', '0638748851', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110157-9', 'นางสาว', 'ศุจีภรณ์', 'แพเกาะ', 002, '63241B', '0973361668', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110159-9', 'นางสาว', 'อรพิน', 'ผินสูงเนิน', 002, '63241B', '0986157508', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110161-7', 'นางสาว', 'จิราภรณ์', 'หาญคำจันทร์', 003, '63241', '0934168350', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110163-7', 'นางสาว', 'ปริชญา', 'ประมวล', 001, '63241C', '0972478192', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110165-7', 'นางสาว', 'นิภาพร', 'ทองดีนอก', 001, '63241C', '0656759396', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110167-7', 'นางสาว', 'วิไลรัตน์', 'สกุลจิรันต์', 001, '63241B', '0899176734', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110168-7', 'นางสาว', 'วีรดา', 'ดีนวนพะเนาว์', 001, '63241A', '0626711152', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110170-5', 'นางสาว', 'ณันฑารินทร์', 'โชติปัญญาธนบูรณ์', 143, '63241', '0989873612', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110173-5', 'นางสาว', 'วินิตา', 'เทียมทอง', 001, '63241A', '0650546261', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110175-5', 'นางสาว', 'พัทธ์ธีรา', 'ทวยไธสง', 001, '63241B', '0804697115', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110177-5', 'นาย', 'ฐานิต', 'แซ่อุน', 144, '63241A', '0630406831', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110178-5', 'นางสาว', 'ปาริชาติ', 'บัวจังหรีด', 144, '63241B', '0937457497', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110180-3', 'นาย', 'ศศธร', 'โดดสู้', 003, '63241', '0818783105', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110181-3', 'นางสาว', 'ธิดารัตน์', 'แผลงสูงเนิน', 001, '63241C', '0942860330', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110182-3', 'นางสาว', 'รวิสรา', 'สามารถ', 001, '63241C', '0619392417', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110183-3', 'นางสาว', 'รัตนา', 'ดวงพล', 144, '63241B', '0630167200', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110189-3', 'นางสาว', 'ณัฐณิชา', 'สวนใต้', 142, '63241', '0956066632', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110190-1', 'นางสาว', 'โชษิตา', 'ซากระโทก', 001, '63241A', '0898487008', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110194-1', 'นาย', 'จิรวัฒน์', 'บุญฤทธิ์', 003, '63241', '0926714192', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110196-1', 'นางสาว', 'มัทราวดี', 'พรผักแว่น', 001, '63241A', '0929758594', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110197-1', 'นางสาว', 'เบญญทิพย์', 'อยู่สวัสดิ์', 001, '63241A', '0617430555', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110198-1', 'นางสาว', 'สุพิชญา', 'พรมกัณฑ์', 002, '63241A', '0967900682', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110202-9', 'นางสาว', 'พรรณวิภา', 'กลั่นมา', 001, '63241B', '0925143773', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110203-9', 'นางสาว', 'รจรินทร์', 'ประชนตะคุ', 004, '63241', '0933537284', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110204-9', 'นางสาว', 'ฑิตยา', 'พัวเจริญ', 003, '63241', '0802797868', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110206-9', 'นางสาว', 'จิตรลดา', 'มุ่งคีมกลาง', 001, '63241B', '0933587379', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110210-7', 'นางสาว', 'วาสนา', 'ขอชิดกลาง', 144, '63241B', '0961323177', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110213-7', 'นาย', 'กิตติพงษ์', 'อิ้วจันทึก', 003, '63241', '0825284715', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110214-7', 'นางสาว', 'จตุพร', 'ซอพรมราช', 143, '63241', '0613482833', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110215-7', 'นางสาว', 'มลฑิฌา', 'ยิ่งยวด', 003, '63241', '0655399133', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110217-7', 'นาย', 'วัชรพล', 'ดำโพธิ์', 003, '63241', '0649671789', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110218-7', 'นางสาว', 'ธรธรณ์', 'คุ้มกระโทก', 001, '63241A', '0801719513', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110219-7', 'นางสาว', 'นิจจารีย์', 'เต็งสระน้อย', 001, '63241A', '0953564952', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110220-5', 'นางสาว', 'สุภาภรณ์', 'แจนดอน', 001, '63241B', '0647138823', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110221-5', 'นางสาว', 'กัญญารัตน์', 'ผลพยุง', 001, '63241B', '0611054280', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110222-5', 'นางสาว', 'กันยารัตน์', 'พระสระน้อย', 001, '63241B', '0908866752', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110226-5', 'นางสาว', 'สุกัญญา', 'แว่นจันลา', 144, '63241B', '0948828683', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110230-3', 'นาย', 'ปุณยกร', 'ประดิษฐปรีชา', 001, '63241C', '0876503095', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110231-3', 'นางสาว', 'อริสรา', 'กงกันยา', 001, '63241C', '0997588073', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110232-3', 'นางสาว', 'ปาริฉัตร', 'คมจิตร', 142, '63241', '-', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110233-3', 'นางสาว', 'พรชิตา', 'จันทะศรี', 142, '63241', '0934965538', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110235-3', 'นางสาว', 'สิรีธร', 'มนพิมาย', 001, '63241A', '0922479150', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110236-3', 'นางสาว', 'กรรณิการ์', 'ใจมนต์', 001, '63241A', '0638383066', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110237-3', 'นางสาว', 'อรปรียา', 'ต่อประเสริฐ', 001, '63241A', '0634950211', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110239-3', 'นางสาว', 'ภัคจิรา', 'ภักดีพงษ์', 001, '63241B', '0907480685', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110241-1', 'นางสาว', 'มนัสนันท์', 'ทองพรมราช', 001, '63241B', '0842891364', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110245-1', 'นางสาว', 'นวนันท์', 'มุ่งมี', 144, '63241A', '0642126356', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110246-1', 'นางสาว', 'ศิรภัสสร', 'ซาเมืองกุล', 001, '63241B', '0885951783', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110254-8', 'นางสาว', 'วิภาดา', 'ลากระโทก', 003, '63241', '0639612509', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110255-8', 'นางสาว', 'อภิสรา', 'เกื่องกระโทก', 001, '63241C', '0934144036', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110258-8', 'นางสาว', 'อามรวรรณ', 'อูขุนทด', 144, '63241B', '0926481476', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110259-8', 'นางสาว', 'พรชิตา', 'อนารัตน์', 004, '63241', '0658706227', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110261-6', 'นางสาว', 'ภัฏฏการก์', 'สุปิยาภรณ์', 001, '63241C', '0968395346', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110263-6', 'นางสาว', 'กนกวรรณ', 'จรโคกกรวด', 143, '63241', '0918313305', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110267-6', 'นางสาว', 'ศิริรัตน์', 'ฟากวิลัย', 002, '63241B', '0935620372', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110268-6', 'นาย', 'ณิชภูมิ', 'ผลยวง', 144, '63241A', '0807873133', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110271-4', 'นางสาว', 'วราภรณ์', 'แคนสุข', 001, '63241A', '0611157632', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110273-4', 'นาย', 'นันทกานต์', 'ทัพกลาง', 144, '63241A', '0961519021', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110277-4', 'นางสาว', 'สุภาวดี', 'บุญจันทึก', 144, '63241A', '0966461900', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110279-4', 'นางสาว', 'พิชยาวี', 'ขนันไทย', 002, '63241A', '0929310794', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110280-2', 'นางสาว', 'ปิยวรรณ', 'เพ็งโหมด', 142, '63241', '0902482936', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110282-2', 'นางสาว', 'ปรางทิพย์', 'แสพลกรัง', 144, '63241B', '0630425517', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110287-2', 'นางสาว', 'ศิริวรรณ', 'กนกหงษ์', 142, '63241', '0619635782', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110288-2', 'นางสาว', 'กัลยา', 'ภูเนาว์นิล', 143, '63241', '0927619489', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110289-2', 'นางสาว', 'กุลสินี', 'หอพิกลาง', 143, '63241', '0637951187', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110291-0', 'นางสาว', 'กัณฐิกา', 'พิมคีรี', 144, '63241B', '0648901289', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110292-0', 'นางสาว', 'อภิญญา', 'จิตต์จะโปะ', 144, '63241B', '0935328347', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110293-0', 'นางสาว', 'พลอยรุ้ง', 'เสาร์สายออ', 139, '63241', '0916727119', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110298-0', 'นางสาว', 'คณิศร', 'ยอดพิมาย', 001, '63241C', '0928508927', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110299-0', 'นางสาว', 'วิภาดา', 'มีสูงเนิน', 142, '63241', '0610395741', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110300-8', 'นาย', 'ปริญญา', 'ปลัดนู', 144, '63241B', '0982272578', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110304-8', 'นางสาว', 'มาลินี', 'แสงพานิชย์', 001, '63241A', '0981987434', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110306-8', 'นาย', 'ชัชวาล', 'ถั่วประโคน', 144, '63241A', '0956200789', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110311-6', 'นางสาว', 'วริษา', 'รวยสันเทียะ', 001, '63241A', '0627923620', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110312-6', 'นางสาว', 'ฟ้ารุ่ง', 'ทำนานอก', 144, '63241A', '0937586573', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110314-6', 'นางสาว', 'อภิสรา', 'ญาติกลาง', 144, '63241B', '0654815506', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110315-6', 'นางสาว', 'กษมา', 'ศรีชัย', 144, '63241B', '0612265511', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110316-6', 'นาย', 'ธราดล', 'ดาวกลาง', 001, '63241B', '0940497850', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110317-6', 'นางสาว', 'นรินทิพย์', 'ชัยเชิดชู', 001, '63241B', '0933204373', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110318-6', 'นาย', 'สิงหพันธ์', 'พรมพันธ์ใจ', 142, '63241', '0959167837', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110320-4', 'นางสาว', 'จิรัชญา', 'สดกลาง', 002, '63241A', '0927468219', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110325-4', 'นางสาว', 'นันทิชาพร', 'คิดเห็น', 001, '63241B', '0611683158', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110328-4', 'นางสาว', 'ปรางค์ทิพย์', 'มโนสิทธิ์', 002, '63241A', '0612849118', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110329-4', 'นางสาว', 'รัชนีวรรณ', 'บุตรีวงค์', 142, '63241', '0982421108', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110331-2', 'นาย', 'สันติสุข', 'นอกตาจั่น', 144, '63241A', '0653232273', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110332-2', 'นางสาว', 'ณัฐพร', 'ขาสันเทียะ', 144, '63241B', '0998653850', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110333-2', 'นาย', 'ธีรภัทร์', 'ทวีกุล', 144, '63241B', '0935254077', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110337-2', 'นางสาว', 'วศิภา', 'จิตร์เอี่ยม', 143, '63241', '0946280381', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110339-2', 'นางสาว', 'พิกุล', 'ฉิมมา', 001, '63241C', '0904411964', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110343-0', 'นาย', 'ธนันดร', 'จันทราพรมราช', 142, '63241', '0659462681', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110344-0', 'นางสาว', 'บุษกร', 'สอนพุฒ', 144, '63241A', '0981940640', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110347-0', 'นางสาว', 'เมธาวี', 'แซงกระโทก', 144, '63241A', '0924527720', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110349-0', 'นางสาว', 'ธิดารัตน์', 'ศรีโลหะ', 144, '63241B', '0953823096', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110353-7', 'นางสาว', 'วไลภรณ์', 'ชำนาญกลาง', 144, '63241B', '0993433121', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110355-7', 'นางสาว', 'ณีรนุช', 'เด่นดวงเดือน', 139, '63241', '0623215749', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110356-7', 'นาย', 'ถิรเจตน์', 'แสนโต', 001, '63241B', '0839366494', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110357-7', 'นางสาว', 'พรชนก', 'โก๊ะขุนทด', 002, '63241B', '-', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110360-5', 'นางสาว', 'ศิริลักษณ์', 'แตงกลาง', 002, '63241B', '0640980059', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110361-5', 'นางสาว', 'ปิยนาถ', 'เฉียงจะโปะ', 001, '63241A', '0946549429', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110364-5', 'นางสาว', 'ศิริอนงค์', 'ขจรภพ', 144, '63241A', '-', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110370-3', 'นางสาว', 'ธนสรณ์', 'คงสมกาย', 144, '63241B', '0808086909', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110371-3', 'นางสาว', 'เบญจามินทร์', 'บัวสันเทียะ', 144, '63241B', '0626235702', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110373-3', 'นางสาว', 'อภิภาวดี', 'ระเกตุ', 001, '63241B', '0981698097', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110381-1', 'นางสาว', 'อาทร', 'ไชยเขต', 013, '63241B', '0982538040', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110384-1', 'นางสาว', 'ภาวินี', 'วงศ์สุทธาวาส', 001, '63241B', '0990101015', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110394-9', 'นาย', 'สิริศักดิ์', 'บุญเจีรม', 139, '63241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110398-9', 'นาย', 'วิธวินท์', 'เดชบำรุง', 164, '63241A', '0902658428', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110400-7', 'นางสาว', 'อรอนงค์', 'อิมะพัด', 139, '63241', '0653522446', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110402-7', 'นาย', 'ณัฐพันธ์', 'แสงจันทร์', 139, '63241', '0925910266', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110416-5', 'นาย', 'คมสัน', 'กระฉอดนอก', 002, '63241B', '0619913343', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110424-3', 'นาย', 'วงศธร', 'เปาอินทร์', 141, '63241', '0981029474', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110432-1', 'นาย', 'นนท์ธีญา', 'อมฤกษ์', 139, '63241', '0983380164', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110434-1', 'นาย', 'เด่นดนัย', 'เด่นวงษ์', 001, '63241B', '0934143438', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110436-1', 'นาย', 'ปิยะชนม์', 'หะหลยุทธ', 163, '63241', '0610463323', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110437-1', 'นางสาว', 'อิสริยา', 'นาคพวง', 163, '63241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110441-9', 'นางสาว', 'ถนอมวรรณ', 'นิลดีสระน้อย', 163, '63241', '0933405257', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110443-9', 'นางสาว', 'ธิมาพร', 'เจริญวัชรพาณิชย์', 163, '63241', '0943904224', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110445-9', 'นางสาว', 'สุริยาพร', 'พรโชคติธรรม', 005, '63221C', '0648157839', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110459-6', 'นาย', 'พลวัต', 'ลือโลก', 143, '63241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110463-4', 'นาย', 'อธิปพล', 'แสนเจ็ก', 139, '63241', '0820021105', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152110467-4', 'นาย', 'ภาคภูมิ', 'รื่นฤดี', 141, '63241', '0641866537', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152210007-9', 'นาย', 'พรมงคล', 'ปาธิเก', 005, '63221A', '0937235766', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152210008-9', 'นาย', 'ธนวัฒน์', 'โตจันทึก', 005, '63221A', '0845844670', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152210010-7', 'นางสาว', 'จันทภา', 'สุริยันต์', 005, '63221A', '0621052692', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152210012-7', 'นาย', 'ธนวัฒน์', 'ทวนพรมราช', 005, '63221A', '0612089333', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152210018-7', 'นางสาว', 'อัญธิสา', 'ถาเหลา', 005, '63221B', '0971128930', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152210021-5', 'นางสาว', 'พันธิตรา', 'ภู่สิงห์', 005, '63221B', '0988541147', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152210025-5', 'นาย', 'สหภาพ', 'สงนอก', 005, '63221B', '0925067175', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152210027-5', 'นาย', 'ปิยพันธ์', 'ภาวงค์', 005, '63221B', '0922931471', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152210028-5', 'นาย', 'เทอดสกุล', 'เงื่อนพิมาย', 005, '63221B', '0807352600', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152210032-3', 'นางสาว', 'จิราวรรณ', 'ศรีสนอง', 005, '63221B', '0933277554', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152210038-3', 'นางสาว', 'สิริกร', 'ปัดทุม', 005, '63221C', '0981615542', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152210041-1', 'นางสาว', 'อมัยพร', 'จันทราช', 005, '63221C', '0637797728', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152210042-1', 'นางสาว', 'สุพรรษา', 'ขันจันทึก', 005, '63221C', '0984525483', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152210044-1', 'นาย', 'ภัทรพงษ์', 'พรหมพินิจ', 005, '63221C', '0967716690', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152210045-1', 'นางสาว', 'ณัฐฐาทิพย์', 'มโนสารโสภณ', 005, '63221C', '0611492842', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152210047-1', 'นาย', 'พงษ์สิทธิ์', 'เครือบนอก', 005, '63221C', '0621421491', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152210048-1', 'นางสาว', 'สกุลตลา', 'ฝังนิล', 005, '63221C', '0934639592', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152210049-1', 'นาย', 'ธนาวุฒิ', 'ปัญญา', 005, '63221A', '0648721371', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152210054-8', 'นางสาว', 'สุชานาถ', 'วงษ์นคร', 005, '63221A', '0621618025', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152210059-8', 'นางสาว', 'สุภัทตรา', 'มะลิด', 005, '63221A', '0926961276', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152210061-6', 'นางสาว', 'สายธาร', 'ภาพกระโทก', 005, '63221A', '0613979218', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152210062-6', 'นางสาว', 'ปิยะฉัตร', 'แสงภา', 005, '63221A', '0984132082', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152210063-6', 'นางสาว', 'ชญานี', 'ทองมี', 005, '63221A', '0642867242', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152210064-6', 'นางสาว', 'พลอยไพลิน', 'ประสพทอง', 005, '63221A', '086-4592-482', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152210065-6', 'นาย', 'กิตติภพ', 'ดีจันทร์', 005, '63221B', '0802752957', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152210070-4', 'นาย', 'วิศรุต', 'แสงแดง', 005, '63221B', '0825726866', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152210071-4', 'นางสาว', 'ศศิกานต์', 'ไกรสำโรง', 005, '63221B', '0621432282', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152210073-4', 'นาย', 'อดิศร', 'ที่รัก', 005, '63221B', '0904860765', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152210075-4', 'นางสาว', 'ทิพวัลย์', 'จันทร์หอม', 005, '63221B', '-', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152210081-2', 'นางสาว', 'ชุติกาญจน์', 'กุ่ยโห้', 005, '63221C', '0621844370', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152210082-2', 'นาย', 'ภานุพงศ์', 'ทิพยศร', 005, '63221C', '0630150193', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152210084-2', 'นาย', 'ธวัช', 'นาราษฎร์', 005, '63221C', '0641381672', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152210086-2', 'นาย', 'ไชยวัฒน์', 'เกตุผาสุข', 005, '63221C', '0887124826', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152210090-0', 'นางสาว', 'ณัฐพร', 'มีไทยสงค์', 005, '63221C', '0930572867', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152210092-0', 'นาย', 'มานะ', 'ยอดนอก', 005, '63221C', '-', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152210094-0', 'นาย', 'จิรายุ', 'ด้วงนอก', 005, '63221C', '0955098597', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152210095-0', 'นาย', 'รณกร', 'โถเหลือง', 005, '63221C', '0961723881', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152210096-0', 'นางสาว', 'ธมนวรรณ', 'สร้างนา', 005, '63221C', '0948652258', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152210098-0', 'นางสาว', 'วาสนา', 'ขยันการ', 005, '63221B', '0997532611', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152210101-8', 'นางสาว', 'อรณี', 'ชมรัมย์', 005, '63221B', '0653231576', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152210103-8', 'นางสาว', 'ดวงรัตน์', 'ยิ่งแก้ว', 005, '63221A', '0903741192', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152210105-8', 'นางสาว', 'อริสรา', 'พุกกะณะสุต', 005, '63221A', '0640946214', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152210110-6', 'นางสาว', 'กรรณิการ์', 'เกตุสุข', 005, '63221B', '0621826023', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152210115-6', 'นาย', 'พรธนา', 'ฉายแก้ว', 005, '63221A', '0611582028', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152210116-6', 'นาย', 'ณัฐวัฒน์', 'วัฒนากลาง', 005, '63221B', '0895794333', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152210117-6', 'นางสาว', 'ยุวเนตร', 'หอกิ่ง', 005, '63221C', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152310004-7', 'นางสาว', 'กนกวรรณ', 'ไพร่เวหา', 142, '63221A', '0934607066', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152310007-7', 'นางสาว', 'สุธินี', 'ขุนระงับสังข์', 142, '63221A', '-', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152310010-5', 'นางสาว', 'กมลพรรณ', 'นาตาแสง', 001, '63221A', '0984353128', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152310012-5', 'นางสาว', 'จุฑาทิพย์', 'ด่านทองหลาง', 142, '63221A', '0902706917', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152310013-5', 'นาย', 'ธนวัฒน์', 'ยันจะโปะ', 003, '63221', '-', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152310015-5', 'นางสาว', 'กรรณิการ์', 'กลิ้งกระโทก', 142, '63221A', '0930316960', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152310018-5', 'นางสาว', 'นิชาภา', 'ทองพิมาย', 001, '63221B', '0620687667', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152310019-5', 'นางสาว', 'กุญช์ชญา', 'บุญประมวล', 001, '63221B', '095-2145135', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152310026-3', 'นางสาว', 'ศุลีพร', 'เข้มดีกุล', 002, '63221', '0924564957', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152310028-3', 'นาย', 'เถลิงศักดิ์', 'จาบกระโทก', 142, '63221A', '0985979719', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152310033-1', 'นางสาว', 'กิตติกา', 'ห้องดอกไม้', 001, '63221C', '0887200585', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152310047-9', 'นางสาว', 'ณัฐธิรา', 'อุตรมาตย์', 002, '63221', '0994714864', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152310055-6', 'นางสาว', 'กัลยา', 'แกรงกระโทก', 142, '63221A', '0927921472', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152310058-6', 'นางสาว', 'รัตนาวลี', 'ผลบุญ', 142, '63221B', '0934512236', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152310059-6', 'นาย', 'บอย', 'เชาว์วันดี', 001, '63221A', '0923719635', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152310061-4', 'นางสาว', 'จินตนา', 'พลพยัคฆ์', 002, '63221', '0800444232', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152310069-4', 'นางสาว', 'อทิตตยา', 'ทาดวงตา', 001, '63221A', '0930497729', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152310070-2', 'นางสาว', 'กาญจนา', 'วิเสส', 003, '63221', '0623423396', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152310074-2', 'นางสาว', 'สุดารัตน์', 'ศรียงค์พะเนา', 002, '63221', '0922862372', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152310075-2', 'นางสาว', 'สุจิตรา', 'สุขโอรส', 001, '63221A', '0611434974', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152310076-2', 'นางสาว', 'นิฤมล', 'องอาจ', 001, '63221A', '0951782540', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152310078-2', 'นางสาว', 'ศรัณญา', 'ปะโนรัมย์', 001, '63221A', '0945759920', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152310080-0', 'นางสาว', 'ทิพธัญญา', 'สมบังใด', 001, '63221A', '0610480687', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152310081-0', 'นางสาว', 'กัลยาณี', 'กรีสุธา', 001, '63221A', '0824119072', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152310082-0', 'นางสาว', 'สุดารัตน์', 'เป่าตัว', 001, '63221A', '0934726653', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152310086-0', 'นางสาว', 'อินทิรา', 'คำชาลี', 142, '63221B', '0991678038', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152310087-0', 'นางสาว', 'วาสนา', 'พิมภักดี', 001, '63221B', '0610955034', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152310089-0', 'นางสาว', 'สุนิตา', 'แขจังหรีด', 003, '63221', '0638317673', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152310091-8', 'นางสาว', 'รุ่งนภา', 'แก้วสารภูมิ', 001, '63221B', '0934697087', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152310093-8', 'นางสาว', 'กรรณิการ์', 'เผ่นจันทึก', 001, '63221B', '0826101737', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152310099-8', 'นางสาว', 'กัลยา', 'อุดทะกา', 142, '63221B', '0645043207', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152310100-6', 'นางสาว', 'ณัฐกานต์', 'ทับขุนทด', 003, '63221', '0612189618', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152310109-6', 'นาย', 'ยศวรรธน์', 'ทุมมา', 143, '63221', '0984199902', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152310110-4', 'นาย', 'นนทนันท์', 'ประภาสะโนบล', 001, '63221C', '0962072942', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152310111-4', 'นางสาว', 'มณีรัตน์', 'นวลเถลิงศักดิ์', 142, '63221B', '0656341845', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152310112-4', 'นาย', 'ศิวะพล', 'ศรีโภชน์', 003, '63221', '0992319303', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152310115-4', 'นางสาว', 'รัตนาภรณ์', 'ศรีสวัสดิ์ศรี', 001, '63221C', '0640918478', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152310118-4', 'นางสาว', 'สุรางคนา', 'ดลราษี', 001, '63221C', '0913293014', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152310119-4', 'นางสาว', 'มนทการ', 'แซ่คั่ง', 003, '63221', '0958838202', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152310123-2', 'นางสาว', 'พรทิพย์', 'พรมจันทึก', 002, '63221', '0621423867', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152310126-2', 'นางสาว', 'เพชรรัตน์', 'บุญจันทร์', 001, '63221C', '0892858605', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152310128-2', 'นางสาว', 'ขนิษฐา', 'ซื่อตรง', 001, '63221C', '0864715085', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152310129-2', 'นางสาว', 'มนัสนันท์', 'กระจ่างฤทธิ์', 003, '63221', '0935405857', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152310133-0', 'นางสาว', 'ญาสุมินทร์', 'นิมิตรหมื่นไวย', 142, '63221B', '0989325194', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152310135-0', 'นางสาว', 'ศิริรัตน์', 'ศรีกร', 003, '63221', '0653124079', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152310144-8', 'นางสาว', 'กัญญารัตน์', 'ถาดสระน้อย', 001, '63221A', '0856354473', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152310156-5', 'นางสาว', 'จุฑารัตน์', 'นาคบุญธรรม', 003, '63221', '0630476937', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152310164-3', 'นางสาว', 'อทิตติญา', 'วากระโทก', 001, '63221A', '0638943445', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152310165-3', 'นางสาว', 'พรรณภัทร', 'ประสงค์งาม', 001, '63221A', '0623369881', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152310166-3', 'นางสาว', 'สุกัญญา', 'แหลมหลัก', 001, '63221A', '0988765626', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152310172-1', 'นางสาว', 'พิมวิภา', 'เพ็ชรทะเล', 142, '63221A', '0631252127', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152310176-1', 'นางสาว', 'สุจิตรา', 'บุ่นจันทีก', 142, '63221A', '0930751933', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152310177-1', 'นาย', 'ชาญวิทย์', 'กุญชร ณ อยุธยา', 143, '63221', '0624573128', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152310180-9', 'นางสาว', 'ปวีณ์นุช', 'บัวจันทร์', 001, '63221B', '0610314563', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152310183-9', 'นางสาว', 'พรนภัส', 'นะราเทียม', 001, '63221B', '0616758133', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152310184-9', 'นางสาว', 'จุฬาลักษณ์', 'สังสูงเนิน', 001, '63221B', '0935056742', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152310187-9', 'นางสาว', 'ณัฏฐิกา', 'พลายงาม', 001, '63221B', '0644023864', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152310188-9', 'นางสาว', 'ศิริรัตน์', 'นามลี', 001, '63221B', '0961701548', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152310204-5', 'นางสาว', 'อนุสรา', 'สุรินสมบูรณ์', 142, '63221A', '0949394622', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152310206-5', 'นางสาว', 'อริชาศ์', 'แก่งสันเทียะ', 142, '63221A', '0952464331', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152310209-5', 'นางสาว', 'ภาวินี', 'ชื่นผักแว่น', 142, '63221A', '0621015339', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152310215-3', 'นางสาว', 'ปติณญา', 'ลิบลับ', 001, '63221B', '0973401928', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152310225-1', 'นางสาว', 'ณัฐพร', 'จอหอกลาง', 001, '63221C', '0645465320', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152310226-1', 'นางสาว', 'ชนันธร', 'งิมขุนทด', 003, '63221', '0935586309', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152310227-1', 'นาย', 'ธวัชชัย', 'ศรีศักดิ์นอก', 003, '63221', '0641890813', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152310229-1', 'นาย', 'สิทธิศักดิ์', 'มนปราณีต', 142, '63221A', '0890611149', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152310230-9', 'นางสาว', 'ภัทธีมา', 'สุขใสยา', 142, '63221A', '0803521567', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152310233-9', 'นางสาว', 'ปรียาภรณ์', 'อำมะ', 001, '63221C', '0958495144', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152310237-9', 'นางสาว', 'กฤติยา', 'ศิริมงคล', 001, '63221C', '0610543896', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152310239-9', 'นางสาว', 'ปวีณา', 'ควินรัมย์', 142, '63221B', '0636284596', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152310247-7', 'นางสาว', 'ศิริวรรณ', 'ภูมิขุนทด', 001, '63221C', '0952968697', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152310257-4', 'นางสาว', 'สิริมาภรณ์', 'วรโพธิ์', 003, '63221', '0933954202', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152310258-4', 'นางสาว', 'อภิวรรณ์', 'เยินสูงเนิน', 142, '63221B', '0828748087', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152310260-2', 'นางสาว', 'สกุลณา', 'บุรีลำสูงเนิน', 143, '63221', '0616490456', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152310261-2', 'นาย', 'ศรัณยู', 'ศิริบุญ', 143, '63221', '0984203769', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152310263-2', 'นางสาว', 'อภิญญา', 'ลาดสันเทียะ', 142, '63221B', '0961907965', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152310265-2', 'นางสาว', 'อุษณีย์', 'ผากอง', 001, '63221C', '0633975981', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152310281-8', 'นางสาว', 'แคทรียา', 'ดีไพล', 142, '63221B', '0933784902', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152310282-8', 'นางสาว', 'อรทิพา', 'คะเย็นรัมย์', 142, '63221B', '0635850647', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152310283-8', 'นางสาว', 'อรอุษา', 'สินวิเศษ', 142, '63221B', '0952293340', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152310286-8', 'นาย', 'นิธิภัทร', 'วังขนาย', 142, '63221B', '0638629034', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152310288-8', 'นางสาว', 'ปวีณา', 'คงนาคา', 142, '63221B', '0653609626', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152310289-8', 'นางสาว', 'นัตพร', 'ดอกรักกลาง', 142, '63221B', '0659469316', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152310295-6', 'นางสาว', 'วาโย', 'พรมลักษณ์', 001, '63221C', '0885511328', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152310296-6', 'นางสาว', 'จิตรตรี', 'ศรีกุดเวียง', 142, '63221B', '0830860199', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152310299-6', 'นางสาว', 'วิภาวี', 'ไกรกลาง', 003, '63221', '0858569026', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152310312-2', 'นาย', 'ธีรพงศ์', 'อุตสา', 142, '63221B', '0999128509', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152310323-0', 'นาย', 'กฤษณพงศ์', 'ถิรวัฒน์ธนกร', 143, '63221', '0926411218', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63152310330-8', 'นาย', 'พรชัย', 'ณรงค์สระน้อย', 143, '63221', '0886236243', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63161110001-0', 'นางสาว', 'ภาณุมาศ', 'อักษรครบุรี', 149, '63121(ม.6)', '0802718357', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('631621100000', 'นาย', 'ใจดี', 'ดีใจ', 002, 'TOU 63241A', '0888888888', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110002-9', 'นางสาว', 'เพชรลดา', 'ค้าสบาย', 010, '63241A', '0934134509', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110004-9', 'นางสาว', 'วรรณวิษา', 'แจ่มมงคล', 021, '63241A', '0616501834', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('631621100069', 'นางสาว', 'รุ่งทรัพย์', 'ถิ่นพุดซา', 021, 'TOU 63241A', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110025-5', 'นางสาว', 'ธญปิมา', 'บุญหว่าง', 012, '63241', '0927305732', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110026-5', 'นางสาว', 'ชีวรัตน์', 'ร่มสันเทียะ', 010, '63241A', '0986357193', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110033-3', 'นาย', 'ทิวานนท์', 'นาเจริญ', 017, '63241', '0611087450', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110040-1', 'นางสาว', 'พิชญา', 'บัวบาน', 021, '63241A', '0990210201', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110041-1', 'นางสาว', 'นันทิชา', 'ศิลาโคกกรวด', 009, '63241', '0630010603', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110047-1', 'นาย', 'ครรชิต', 'ปลอมเมือง', 019, '63241B', '0933414302', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110055-8', 'นาย', 'ภานุ', 'กฤตยาจามร', 019, '63241C', '0934303049', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110056-8', 'นางสาว', 'จันทร์จิรา', 'โทไธสง', 019, '63241C', '0650973409', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110057-8', 'นางสาว', 'อินทิรา', 'เกลี้ยงหอม', 147, '63241A', '0982823974', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110061-6', 'นางสาว', 'เกวลิน', 'บุ้งกระโทก', 019, '63241C', '0935198414', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110063-6', 'นางสาว', 'ปิยะธิดา', 'นักกระโทก', 019, '63241C', '0982988357', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110065-6', 'นางสาว', 'กนิษฐา', 'ชอบพรมราช', 017, '63241', '0934808618', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110067-6', 'นางสาว', 'โชติรส', 'ลิ้มมณีโกศล', 013, '63241', '0982256826', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110068-6', 'นางสาว', 'สุชัญญา', 'เคาวฤก', 010, '63241B', '0934891699', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110071-4', 'นางสาว', 'ปนัดดา', 'มาลาพันธ์', 010, '63241B', '0981121880', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110073-4', 'นางสาว', 'สุธิดา', 'การุณ', 013, '63241', '-', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110076-4', 'นางสาว', 'นภัสกร', 'สร้างไร่', 018, '63241', '0858231134', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110081-2', 'นางสาว', 'ศศิธร', 'ธรรมศรี', 021, '63241A', '0643415990', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110083-2', 'นางสาว', 'นิภาวรรณ', 'ตะสันเทียะ', 017, '63241', '0611325088', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110084-2', 'นางสาว', 'ทับทิม', 'แสนธิ', 016, '63241', '0930937701', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110086-2', 'นางสาว', 'พลอยไพลิน', 'วรณรัตน์', 013, '63241', '0924383138', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110088-2', 'นาย', 'อดิศักดิ์', 'ทองหล่อ', 018, '63241', '0902842013', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110090-0', 'นาย', 'ณรงค์ฤทธิ์', 'จันทร์เสน', 013, '63241', '0630506102', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110092-0', 'นาย', 'ปัณฑ์ณพัชญ์', 'เชาว์โคกสูง', 147, '63241A', '0927870710', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110093-0', 'นางสาว', 'อารียา', 'คำกลาง', 013, '63241', '0630366185', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110095-0', 'นาย', 'สุทิวัส', 'สำเร็จรัมย์', 021, '63241A', '0644614114', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110096-0', 'นางสาว', 'สุกัญญา', 'มิสันเทียะ', 017, '63241', '0904285568', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110098-0', 'นางสาว', 'เบญจพร', 'ชินวงค์', 021, '63241A', '-', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110101-8', 'นางสาว', 'จุฑามาศ', 'พาวขุนทด', 016, '63241', '0935523299', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110102-8', 'นางสาว', 'อรไพลิน', 'ศิริทรัพย์', 013, '63241', '-', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110104-8', 'นางสาว', 'วิลาวัณย์', 'ดีขุนทด', 147, '63241A', '0634852580', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110110-6', 'นางสาว', 'พนิตกาญน์', 'จันทร์หอม', 021, '63241A', '0981930412', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110111-6', 'นางสาว', 'อโณทัย', 'ฉาบพิมาย', 019, '63241A', '0981068112', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110114-6', 'นาย', 'นวัถกรณ์', 'ทองเพียร', 016, '63241', '0935418244', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110117-6', 'นางสาว', 'ธัญญรัตน์', 'กุลนอก', 147, '63241A', '0610563588', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110118-6', 'นางสาว', 'ศศิธร', 'โฮนกระโทก', 013, '63241', '-', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110120-4', 'นางสาว', 'ปริญญา', 'จงแต่งกลาง', 147, '63241A', '0631636921', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110121-4', 'นางสาว', 'ปริมวดี', 'พลนอก', 021, '63241A', '0972467860', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110122-4', 'นางสาว', 'ณัฐกมล', 'ปนสันเทียะ', 019, '63241A', '0902724114', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110124-4', 'นางสาว', 'อาทิตยา', 'ขุมเกาะ', 019, '63241A', '0981034868', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110126-4', 'นาย', 'กฤติธี', 'นุ่มเกลี้ยง', 147, '63241A', '0647952350', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110127-4', 'นางสาว', 'ฐิตามร', 'โสภณ', 019, '63241A', '0902588460', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110130-2', 'นางสาว', 'ปัญปรียา', 'จันทรภาส', 021, '63241A', '0902920990', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110132-2', 'นางสาว', 'พรเพ็ญ', 'นัดกระโทก', 019, '63241A', '0935413827', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110133-2', 'นางสาว', 'มัลลิกา', 'ป่านแก้ว', 147, '63241A', '0981938364', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110134-2', 'นางสาว', 'ธันยา', 'คงแก้วพะเนา', 147, '63241A', '-', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110136-2', 'นาย', 'จิรภัทร', 'ภักดีกุล', 019, '63241A', '0902600136', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110137-2', 'นาย', 'อนุชา', 'กายพรมราช', 147, '63241A', '0990433399', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110138-2', 'นางสาว', 'ภัทลดา', 'คำสุวิมลชัย', 010, '63241A', '0942636107', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110139-2', 'นางสาว', 'รุจิวรรณ', 'ขันธะสีลา', 147, '63241A', '0887674465', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110140-0', 'นาย', 'ศรัณยู', 'พุทธเสน', 019, '63241B', '0934300302', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110142-0', 'นางสาว', 'ปาริชาติ', 'ศรีวัง', 013, '63241', '0630433098', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110143-0', 'นาย', 'ปราชญ์พสิษฐ์', 'กูลวิริยะ', 016, '63241', '0837922235', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110146-0', 'นาย', 'ธีธัช', 'จันทร์ศิริ', 147, '63241A', '0814180724', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110148-0', 'นาย', 'สุรยุทธ', 'ทัดมาลา', 018, '63241', '0611684473', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110149-0', 'นางสาว', 'รัตติยากรณ์', 'ฉ่ำพะเนาว์', 019, '63241B', '0610377663', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110150-7', 'นางสาว', 'จิดาภา', 'เตยโพธิ์', 013, '63241', '-', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110151-7', 'นาย', 'อภิสิทธิ์', 'คู่กระโทก', 147, '63241A', '-', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110152-7', 'นางสาว', 'ปานทิพย์', 'พุดจันทึก', 010, '63241A', '0939173618', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110153-7', 'นางสาว', 'ปภาสรณ์', 'ความดี', 147, '63241A', '0611670646', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110156-7', 'นางสาว', 'สุพัตรา', 'สันขุนทด', 010, '63241A', '0991697754', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110158-7', 'นางสาว', 'นันทพร', 'ขอนโพธิ์', 019, '63241B', '0894038279', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110159-7', 'นางสาว', 'กรรณิการ์', 'อานุกูล', 013, '63241', '0908340402', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110161-5', 'นางสาว', 'อัจจิมา', 'สุโพธิ์', 019, '63241B', '0944793045', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110162-5', 'นาย', 'ลิปตภัลลพ', 'นพพลกรัง', 019, '63241B', '0949120354', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110165-5', 'นางสาว', 'ณัฐวลี', 'จตุรพรสวัสดิ์', 017, '63241', '0934611022', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110166-5', 'นางสาว', 'กมลรัตน์', 'เพชรม่วง', 017, '63241', '0986210576', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110167-5', 'นางสาว', 'พรนิภา', 'ดำขำ', 011, '63241', '0625633220', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110168-5', 'นางสาว', 'มุธิตา', 'บุญเชย', 147, '63241A', '0933365537', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110169-5', 'นางสาว', 'อุไรพร', 'อรุณรับ', 021, '63241A', '0935607268', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110171-3', 'นางสาว', 'จันจิรา', 'ยะกะ', 012, '63241', '0611019371', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110173-3', 'นางสาว', 'กนกวรรณ์', 'หาญจันอัด', 147, '63241A', '0813900462', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110174-3', 'นางสาว', 'ชนิตา', 'มาอยู่นอก', 147, '63241A', '0934202962', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110175-3', 'นางสาว', 'พัทธรัตน์', 'โคตรแสง', 018, '63241', '0988246015', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110176-3', 'นาย', 'กฤติธี', 'กกขุนทด', 013, '63241', '0825286456', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110177-3', 'นางสาว', 'กรชนก', 'ซางกระโทก', 017, '63241', '0630435108', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110187-1', 'นางสาว', 'ตะวันฉาย', 'ปลั่งกลาง', 018, '63241', '0611516334', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110189-1', 'นาย', 'ณัฐศักดิ์', 'เนตวงษ์', 018, '63241', '-', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110190-9', 'นางสาว', 'กุลณัฐ', 'ประจงค์', 019, '63241B', '0611266413', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110192-9', 'นางสาว', 'ไพริน', 'สันกระโทก', 019, '63241B', '0956456105', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110195-9', 'นาย', 'นราวิชญ์', 'เชงขุนทด', 019, '63241C', '0947462001', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110196-9', 'นางสาว', 'ธนาพร', 'จิตต์สวัสดิ์', 019, '63241C', '0934152627', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110204-7', 'นาย', 'อรรถพล', 'ทนบุรี', 016, '63241', '-', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110212-5', 'นางสาว', 'ชุติกาญจน์', 'บุญเอก', 010, '63241B', '0952188752', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110213-5', 'นางสาว', 'พิมพ์มาดา', 'ลาภกระโทก', 009, '63241', '0982659384', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110214-5', 'นางสาว', 'จุฬารัตน์', 'ถึงจันทึก', 019, '63241C', '0621926613', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110216-5', 'นาย', 'นันทวัฒน์', 'หัดจุมพล', 012, '63241', '0884802664', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110221-3', 'นาย', 'ธนวัชร์', 'แสงไพบูลย์', 147, '63241B', '0824761684', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110224-3', 'นางสาว', 'สุนิสา', 'บัวป้อม', 018, '63241', '0654151524', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110226-3', 'นางสาว', 'สุกัญญา', 'ผิวสายคำ', 019, '63241C', '0645377673', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110227-3', 'นาย', 'ชัชวาลย์', 'มลกลาง', 019, '63241C', '0632487593', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110228-3', 'นาย', 'ราชพฤกษ์', 'โสภา', 019, '63241C', '0652514119', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110232-1', 'นางสาว', 'สุพัชชา', 'ชาติวงค์', 021, '63241A', '0930931454', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110235-1', 'นางสาว', 'ศุจินธรา', 'คนมั่น', 021, '63241A', '0820885197', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110238-1', 'นางสาว', 'ปาณิสรา', 'สุมามาลย์', 010, '63241B', '0981583953', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110244-9', 'นางสาว', 'วาสนา', 'ตีบกระโทก', 010, '63241A', '0934590255', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110246-9', 'นาย', 'คุณานนต์', 'ปิ่นโคกกรวด', 018, '63241', '-', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110248-9', 'นางสาว', 'ชลธิชา', 'เหมือนวาจา', 021, '63241A', '0848885472', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110249-9', 'นางสาว', 'ดรุณี', 'พลดงนอก', 021, '63241A', '0953283611', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110250-6', 'นาย', 'จักรรินทร์', 'พั้วแพง', 021, '63241A', '0621325802', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110251-6', 'นางสาว', 'ลัดดาวัลย์', 'ศรีสูงเนิน', 021, '63241B', '0934983214', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110253-6', 'นางสาว', 'อาภัสรา', 'โผจัตุรัส', 021, '63241B', '0933645852', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110256-6', 'นางสาว', 'สุภาพร', 'แคนเภา', 021, '63241B', '0928847414', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110259-6', 'นางสาว', 'มนัสนันท์', 'เก็บกลาง', 019, '63241A', '0935502411', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110262-4', 'นางสาว', 'ศศิธร', 'จันทิมา', 009, '63241', '0653209040', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110266-4', 'นางสาว', 'สิริมา', 'เหล็กโคกสูง', 021, '63241B', '0954761506', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110267-4', 'นาย', 'อชิรญา', 'นาบกระโทก', 021, '63241B', '0925937477', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110269-4', 'นาย', 'อัฒพล', 'เผื่อนกลาง', 017, '63241', '0650511415', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110271-2', 'นางสาว', 'ธิรดา', 'สร้อยอุดม', 009, '63241', '0954652014', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110272-2', 'นางสาว', 'นิศารัตน์', 'ปั้งกระโทก', 010, '63241B', '0641932652', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110273-2', 'นางสาว', 'ภาณุมาศ', 'เข็มทอง', 010, '63241B', '0984234522', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110277-2', 'นางสาว', 'ศิริโสภา', 'เอื้อยสันเทียะ', 021, '63241B', '0610142082', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110278-2', 'นางสาว', 'วันทนิกา', 'เจริญกุล', 021, '63241B', '0957152590', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110279-2', 'นางสาว', 'จุฑาภรณ์', 'ธรรมธร', 021, '63241B', '0823657624', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110281-0', 'นางสาว', 'จิตราภรณ์', 'ทำสันเทียะ', 021, '63241B', '0610494280', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110282-0', 'นาย', 'ธีรพัฒน์', 'มุ่งเบียดกลาง', 021, '63241B', '0993355963', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110285-0', 'นาย', 'วุฒิการณ์', 'บางขุนทด', 021, '63241B', '0971086366', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110291-8', 'นาย', 'ชนาธิป', 'แท้สูงเนิน', 147, '63241B', '0652366149', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110293-8', 'นางสาว', 'ศิริลักษณ์', 'คชเรนทร์', 147, '63241B', '0983672472', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110297-8', 'นางสาว', 'ณิชกานต์', 'พงษ์พฤกษ์งาม', 017, '63241', '0844118270', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110299-8', 'นางสาว', 'ธัญลักษณ์', 'บูฉิมภาลี', 013, '63241', '0615733874', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110302-6', 'นาย', 'ศิรวิทย์', 'นงค์บาง', 019, '63241A', '0981154557', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110303-6', 'นาย', 'สุทธิพงษ์', 'ทุมประทาย', 019, '63241B', '0934807860', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110304-6', 'นางสาว', 'จันทราทิพย์', 'ถนอมพลกรัง', 019, '63241B', '0625176406', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110305-6', 'นาย', 'พีรวิชญ์', 'เกี้ยวกระโทก', 019, '63241B', '0878700836', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110306-6', 'นางสาว', 'บุญฑริก', 'สังฆมานนท์', 019, '63241B', '0910292972', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110311-4', 'นางสาว', 'นารีรัตน์', 'ชูสำโรง', 019, '63241C', '0621368120', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110313-4', 'นางสาว', 'สมฤดี', 'กิติสกนธ์', 009, '63241', '0630404569', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110314-4', 'นางสาว', 'จิราวรรณ', 'จอกพุดซา', 009, '63241', '0892452441', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110315-4', 'นางสาว', 'ศิริธารา', 'ชาวเวียง', 009, '63241', '0956821396', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110316-4', 'นางสาว', 'กัญจน์กมล', 'ทองภักดี', 009, '63241', '0872054649', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110323-2', 'นาย', 'ธนิตพล', 'สีโสดา', 018, '63241', '0979280184', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110324-2', 'นางสาว', 'วิภารัตน์', 'เติมวัน', 020, '63241', '0651041340', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110326-2', 'นางสาว', 'นันทิตา', 'พวงสวัสดิ์', 021, '63241B', '0909120495', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110329-2', 'นางสาว', 'ธารทิพย์', 'เสริฐกระโทก', 021, '63241B', '0934693557', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110330-0', 'นางสาว', 'นัฐกร', 'ปะติปัง', 021, '63241B', '0981203492', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110333-0', 'นางสาว', 'วรถิณา', 'ทวีพุดซา', 147, '63241B', '0933958351', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110341-8', 'นางสาว', 'ธัชรินันต์', 'โนมขุนทด', 013, '63241', '-', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110346-8', 'นางสาว', 'พนิดา', 'อินทรสุข', 021, '63241B', '0631501595', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110350-5', 'นาย', 'ณัฐพล', 'ลือนา', 019, '63241B', '0619129091', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110355-5', 'นางสาว', 'พิยดา', 'เพียซ้าย', 147, '63241B', '0659464350', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110356-5', 'นางสาว', 'ปภาวรินท์', 'บุนนาค', 147, '63241B', '0658094559', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110358-5', 'นาย', 'ดนัสวิน', 'ชินนอก', 147, '63241B', '0960943945', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110359-5', 'นางสาว', 'กัญญาณัฐ', 'เหมจันทึก', 147, '63241B', '0637677755', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110363-3', 'นาย', 'ณัฐภัทร', 'สระทองคำ', 147, '63241B', '0643596806', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110364-3', 'นางสาว', 'สกุลตรา', 'วงศ์สุระพัศ', 021, '63241B', '088-803-4484', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110365-3', 'นางสาว', 'ชลิดา', 'แก้วโยธา', 147, '63241B', '0611343074', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110367-3', 'นางสาว', 'เบญจวรรณ', 'ฉัตรปัญญาวุฒิ', 147, '63241B', '044071650', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110370-1', 'นาย', 'โสภณวิชญ์', 'หงษ์อำไพ', 021, '63241B', '0625267781', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110377-1', 'นางสาว', 'ชฎารัตน์', 'มณีรัตน์', 021, '63241B', '0832257380', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110378-1', 'นางสาว', 'จิตสุภา', 'มิสา', 147, '63241B', '0611255954', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110381-9', 'นางสาว', 'พรทิวา', 'ชอบสว่าง', 013, '63241', '0956179013', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110382-9', 'นาย', 'ชัชวาลย์', 'วับสันเทียะ', 016, '63241', '0971361680', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110385-9', 'นางสาว', 'เสาวลักษณ์', 'ไพรบึง', 147, '63241B', '-', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110388-9', 'นางสาว', 'ทิพย์วรรณ', 'จงปลงกลาง', 019, '63241C', '0925418071', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110391-7', 'นาย', 'วชิรวิทย์', 'สืบจากน้อย', 016, '63241', '0610938620', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110392-7', 'นางสาว', 'มัทธิกา', 'เพียกขุนทด', 018, '63241', '0616403065', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110393-7', 'นาย', 'กิตติพศ', 'จันทร์พุฒ', 020, '63241', '0986277869', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110394-7', 'นางสาว', 'สุชาดา', 'สุขเกษม', 013, '63241', '0933855603', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110395-7', 'นาย', 'ณัฐกิตติ์', 'เวียงคำ', 019, '63241A', '0862572653', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110396-7', 'นาย', 'ปฏิภาณ', 'ใช้คง', 019, '63241B', '0820658095', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110397-7', 'นางสาว', 'อารีรัตน์', 'เนตรเสน', 009, '63241', '0988986854', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110404-5', 'นาย', 'สหรัฐ', 'เมฆหมอก', 019, '63241A', '0885837930', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110406-5', 'นางสาว', 'พรณิภา', 'ต่อมพุดซา', 019, '63241B', '0934630791', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110407-5', 'นางสาว', 'ฐิติกา', 'ผดุงวิเชียร', 019, '63241C', '0621388474', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110410-3', 'นาย', 'ณรตนชม', 'ปุกหุต', 147, '63241A', '0876569515', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110415-3', 'นาย', 'ชินวัตร', 'พรมลี', 016, '63241', '0817761727', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110417-3', 'นาย', 'ครองลาภ', 'รูปคม', 019, '63241C', '0982074342', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110418-3', 'นางสาว', 'สุปาณี', 'เข็มมาตร์', 146, '63241', '0615695977', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110419-3', 'นางสาว', 'ปนัดดา', 'ถมยาแก้ว', 017, '63241', '0956098019', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110422-1', 'นางสาว', 'จันทร์จิรา', 'ถั่วกระโทก', 018, '63241', '0933895024', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110423-1', 'นางสาว', 'นงนุช', 'ทองแก้ว', 018, '63241', '0954736091', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110430-9', 'นางสาว', 'ณัฐพร', 'แซ่ว่อง', 147, '63241A', '0655759306', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110434-9', 'นางสาว', 'ภันทิสา', 'โรมสันเทียะ', 020, '63241', '0838188039', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110436-9', 'นางสาว', 'วรนุช', 'ปิ่นสังข์', 013, '63241', '0629036286', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110438-9', 'นางสาว', 'พรสวรรค์', 'ไขขุนทด', 019, '63241C', '0966436628', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110441-7', 'นางสาว', 'ปวีณ์กร', 'ฤทธิ์ไธสง', 011, '63241', '0621460678', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110444-7', 'นาย', 'ณัฐธัญ', 'เเก้ววิเศษ', 019, '63241C', '0969987379', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110445-7', 'นางสาว', 'ประวีณา', 'จักอะโน', 018, '63241', '0984314083', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110446-7', 'นางสาว', 'กัญญารัตน์', 'ฟูศรีบุญ', 147, '63241B', '0936297538', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110448-7', 'นาย', 'เจษฎา', 'เจียกงูเหลือม', 012, '63241', '0805708291', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110449-7', 'นางสาว', 'อาทิตติยากรณ์', 'แก้วศรีนวม', 017, '63241', '0942861961', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110452-4', 'นาย', 'ภัทรพล', 'จอมประกายรัตน์', 017, '63241', '-', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110457-4', 'นางสาว', 'ณิชนันทน์', 'นิลจันทึก', 009, '63241', '0986277317', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110458-4', 'นางสาว', 'มินตรา', 'พันธ์ถวิล', 010, '63241B', '0610539964', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110459-4', 'นางสาว', 'นฤมล', 'ดิษฐ์ครบุรี', 021, '63241B', '0945481862', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110460-2', 'นางสาว', 'สุภัชชา', 'กระบัตทอง', 018, '63241', '0812825640', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110462-2', 'นางสาว', 'ญาสุมินทร์', 'สินรัมย์', 018, '63241', '0647848832', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110468-2', 'นางสาว', 'กัญญาณัฎฐ์', 'ไชยเสนา', 010, '63241A', '0807689691', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110469-2', 'นางสาว', 'ปริยาภรณ์', 'ดำริห์', 010, '63241A', '0956019299', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110470-0', 'นาย', 'ชาญณรงค์', 'สร้างนอก', 020, '63241', '0953822831', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110471-0', 'นาย', 'ชนนันพัฒน์', 'กอสันเทียะ', 021, 'TOH', '0643070571', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110473-0', 'นางสาว', 'ไอรดา', 'จักรุวงษ์', 017, '63241', '0955849055', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110476-0', 'นาย', 'กฤษณะ', 'งามจันทร์', 017, '63241', '0910161262', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110487-8', 'นาย', 'ภควัฒน์', 'คูณทอง', 018, '63241', '0886870310', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110488-8', 'นาย', 'เวสารัช', 'ธรรมจันทึก', 020, '63241', '0943828334', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('631621104926', 'นางสาว', 'ดาราวลี', 'ยุะะชัย', 010, 'CHS', '0946986966', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110493-6', 'นางสาว', 'สิริวิมล', 'สมประสงค์', 020, '63241', '0833849361', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110497-6', 'นาย', 'ชนะชัย', 'มูลตรีปฐม', 016, '63241', '0611325996', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110500-4', 'นาย', 'ประสิทธิ์', 'แพทย์สันเทียะ', 016, '63241', '0936803859', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110502-4', 'นางสาว', 'ณัฐธญาณ์', 'มากทรัพย์', 016, '63241', '0812647804', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110508-4', 'นาย', 'กอบชัย', 'ทานอุทิศ', 016, '63241', '0985912379', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110509-4', 'นางสาว', 'เจษฎาภรณ์', 'มะสีผา', 020, '63241', '0817411432', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110510-2', 'นาย', 'ชวิน', 'ชื่นชม', 020, '63241', '0657488516', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110511-2', 'นาย', 'พงศ์สิริ', 'สัจจะสังข์', 017, '63241', '0935639716', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110516-2', 'นางสาว', 'ปภาวรินท์', 'คล่องกำไร', 018, '63241', '0622696275', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110517-2', 'นาย', 'ศุภณัฐ', 'จันทรังษี', 016, '63241', '0853038550', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110521-0', 'นางสาว', 'กิตยาภรณ์', 'มีแก้ว', 010, '63241B', '0840421760', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110525-0', 'นางสาว', 'ภาคินรัตน์', 'ลุนวงค์', 018, '63241', '0986122506', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110527-0', 'นางสาว', 'ชญานิศ', 'ดำแก้ว', 018, '63241', '0643982446', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110544-6', 'นาย', 'วรวุฒิ', 'กระจ่างจิต', 016, '63241', '0918272841', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110545-6', 'นางสาว', 'นสิมาพร', 'ประทุมมา', 017, '63241', '0622938454', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110551-3', 'นาย', 'บริณัย', 'ปะโมนะตา', 020, '63241', '0618161328', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110555-3', 'นาย', 'ศราวุธ', 'แสนศรี', 020, '63241', '0829472280', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162110564-1', 'นาย', 'กิตติพงศ์', 'ลีปอพาน', 020, '63241', '0802492130', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162210008-7', 'นาย', 'ศิวะเทพ', 'ศรีเกตุ', 015, '63221', '0929422368', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162210010-5', 'นางสาว', 'ลักษณา', 'พึ่งพา', 015, '63221', '0930251126', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63162210017-5', 'นาย', 'ธีระวุฒิ', 'จิตรีมิตร', 015, '63221', '0986431786', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110001-8', 'นาย', 'กรณ์วิศิษฐ์', 'โมฬีชาติ', 129, '63121', '0632615596', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110004-8', 'นาย', 'จิรภัทร', 'เจิมขุนทด', 127, '63121 (ม.6)', '0930710981', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110007-8', 'นาย', 'พัฒน์ศกร', 'บุญเจือ', 129, '63121 (ม.6)', '0842370681', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110009-8', 'นาย', 'สิทธิพงค์', 'คงคาศรี', 130, '63121', '0830233699', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110011-6', 'นาย', 'สืบศักดิ์', 'นิลจ์นทึก', 128, '63121 (ม.6)', '0653475474', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110015-6', 'นาย', 'ศิขรินทร์', 'เสวกานันท์', 131, '63121', '0611345399', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110017-6', 'นาย', 'ชนะพล', 'ทนฉิมพลี', 128, '63121 (ม.6)', '0934135296', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110024-4', 'นาย', 'เดชาวัต', 'ดอนประดู่', 136, '63121 (ม.6)', '0810722850', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110025-4', 'นาย', 'ภราดร', 'หอมวัน', 125, '63121ก (ม.6)', '0902892801', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110026-4', 'นาย', 'กฤติน', 'วงค์เวียน', 125, '63121ก (ม.6)', '0908086176', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110027-4', 'นาย', 'ณัฐวุฒิ', 'อินทร์แก้ว', 131, '63121', '0930957351', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110028-4', 'นาย', 'ศิรินทร์', 'เชษฐขุนทด', 129, '63121 (ม.6)', '0610725426', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110030-2', 'นาย', 'ศุภณัฐ', 'ศิริพงศธร', 125, '63121ก (ม.6)', '0921605041', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110032-2', 'นาย', 'ฤทธิพร', 'จือจันทึก', 130, '63121', '0966899012', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110033-2', 'นาย', 'อดิเทพ', 'ถึกสูงเนิน', 136, '63121', '0801521805', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110039-2', 'นาย', 'อนุวัฒน์', 'หวังทิวกลาง', 130, '63121', '-', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110041-0', 'นางสาว', 'นัทกานต์', 'ช่วยชาติ', 129, '63121 (ม.6)', '0611326810', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110042-0', 'นาย', 'อภินันท์', 'อินนอก', 129, '63121 (ม.6)', '-', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110043-0', 'นาย', 'ณัฐวุติ', 'เพิ่มกระโทก', 136, '63121', '0836620715', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110044-0', 'นาย', 'ธนกิตต์', 'โพธิสัย', 126, '63121', '096-8905449', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110045-0', 'นางสาว', 'ธัญลักษณ์', 'หง่อยกระโทก', 126, '63121', '0610835859', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110046-0', 'นาย', 'นิติ', 'แขมดคกกรวด', 136, '63121', '0862551175', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110048-0', 'นาย', 'พลากร', 'แซ่ลอ', 126, '63121', '0910174162', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110049-0', 'นาย', 'พลกฤต', 'แสนสันเทียะ', 126, '63121', '0826698645', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110050-7', 'นาย', 'ศุภกร', 'สะใบทอง', 127, '63121 (ม.6)', '0617780255', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110051-7', 'นางสาว', 'ผกามาศ', 'อดทน', 126, '63121', '0956109736', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110052-7', 'นาย', 'วีรศักดิ์', 'บุญอวบ', 136, '63121', '089-300-8399', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110054-7', 'นาย', 'อนิรุทธิ์', 'จากครบุรี', 126, '63121', '-', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110055-7', 'นาย', 'ธนกฤต', 'แก้วมหาคุณ', 124, '63121', '0656908358', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110057-7', 'นาย', 'รัฐพงศ์', 'เพชรวงษ์', 125, '63121ก (ม.6)', '0986019021?', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110059-7', 'นาย', 'พงษ์พาณิชย์', 'แก้ววงศษา', 126, '63121', '0610949096', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110061-5', 'นาย', 'อัฐษฎา', 'ศิริวัฒน์', 127, '63121 (ม.6)', '0933643483', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110065-5', 'นาย', 'กฤษณพงษ์', 'ถนัดไร่', 128, '63121 (ม.6)', '0630203638', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110067-5', 'นาย', 'รวิพล', 'คอนปรุ', 129, '63121', '0918048038', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110068-5', 'นางสาว', 'สมฤดี', 'ปกสันเทียะ', 126, '63121', '0927477958', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110069-5', 'นาย', 'ยุทรภูมิ', 'ดำริ', 126, '63121', '0986025351', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110070-3', 'นาย', 'อนุชิต', 'เจริญพันธุวงศ์', 129, '63121 (ม.6)', '0935150689', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110071-3', 'นาย', 'วัชรพล', 'พวงศรี', 129, '63121 (ม.6)', '0847887327', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110074-3', 'นาย', 'วรายุทธ', 'จรัญจอหอ', 129, '63121 (ม.6)', '0643171379', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110075-3', 'นาย', 'ชนาธิป', 'กิ่งค้างมูล', 129, '63121 (ม.6)', '0986256882', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110078-3', 'นาย', 'เอกราช', 'วอนอก', 127, '63121 (ม.6)', '0935309367', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110079-3', 'นาย', 'องอาจ', 'อุนทุโร', 124, '63121', '0928439144', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110080-1', 'นาย', 'อรรถพล', 'อันโคตร', 124, '63121', '0642181232', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110081-1', 'นาย', 'ธีรเดช', 'ชะละตะคุ', 127, '63121 (ม.6)', '0641381582', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110082-1', 'นาย', 'จิรวัฒน์', 'พลจันทึก', 126, '63121', '0852099413', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110083-1', 'นาย', 'ธีรวัฒน์', 'นาเพชร', 124, '63121', '0638801807', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110084-1', 'นาย', 'นาวิน', 'แบบสันเทียะ', 131, '63121', '0622048171', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110086-1', 'นาย', 'พัฒฑนพงศ์', 'ชาชะอรรม', 131, '63121', '0844297141', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110089-1', 'นาย', 'ทัตพงศ์', 'การณรงค์', 126, '63121', '0929048974', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110090-9', 'นาย', 'อภิภัทร์', 'แฉ่งสูงเนิน', 130, '63121', '0649206835', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110091-9', 'นาย', 'นัฐพล', 'ตาติจันทร์', 131, '63121', '0610927967', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110092-9', 'นาย', 'ศตวรรษ', 'นาคสมบูรณ์', 136, '63121 (ม.6)', '0934939321', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110093-9', 'นาย', 'วรวุฒิ', 'ชาญวิเศษ', 126, '63121', '0623978053', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110095-9', 'นาย', 'บูรพา', 'ทักษิโณ', 126, '63121', '0959591878', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110096-9', 'นาย', 'หัตภชัย', 'หาญสารจอด', 130, '63121', '0862596103', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110097-9', 'นาย', 'วรวิทย์', 'ชาญวิเศษ', 126, '63121', '0972788345', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110101-7', 'นาย', 'ศุภโชค', 'ปัตถานัง', 124, '63121', '0802258290', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110102-7', 'นาย', 'ณภัทร', 'ถีสูงเนิน', 126, '63121', '0801731547', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110103-7', 'นาย', 'ศณิศร', 'ชารตรีนิรันดร์กูล', 129, '63121 (ม.6)', '096-9142326', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110105-7', 'นาย', 'ธิติวุฒิ', 'ปุงแก้ว', 126, '63121', '0971571114', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110106-7', 'นาย', 'ปฎิพล', 'สันขุนทด', 126, '63121', '0923282659', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110108-7', 'นาย', 'รัฐภูมิ', 'คงเหลือสิน', 130, '63121', '0942041152', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110109-7', 'นางสาว', 'ธัชนก', 'จูมเกตุ', 125, '63121ก (ม.6)', '0656210546', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110113-5', 'นาย', 'เชษฐ์พิชิต', 'เชื้อบัญฑิต', 124, '63121', '0947515896', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110115-5', 'นาย', 'นนทชัย', 'จันดาผล', 132, '63121', '0986210468', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110118-5', 'นาย', 'สิทธิศักดิ์', 'ยิบรัมย์', 128, '63121 (ม.6)', '0878754192', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110120-3', 'นาย', 'ทักษา', 'นาประจักร', 125, '63121ก (ม.6)', '0648046359', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110123-3', 'นาย', 'ภาณุพงษ์', 'สนทองหลาง', 136, '63121 (ม.6)', '-', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110129-3', 'นาย', 'สุรเกียรติ', 'นาดีด่านกลาง', 129, '63121 (ม.6)', '0653906652', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110132-1', 'นาย', 'ปณชัย', 'แรงเขตรกิจ', 129, '63121', '0839050874', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110133-1', 'นางสาว', 'สุนิตา', 'พันเพ็ชร์', 125, '63121ก (ม.6)', '0628647796', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110135-1', 'นาย', 'ชินวัตร', 'ดวงมะณี', 129, '63121', '0645951051', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110137-1', 'นาย', 'กรกต', 'จันจินดา', 129, '63121 (ม.6)', '0931412847', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110139-1', 'นาย', 'เศรษฐ์วณัฐ', 'ธนายุวรัตน์', 136, '63121 (ม.6)', '0621638692', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110140-9', 'นาย', 'พันธุ์เทพ', 'คำพอง', 125, '63121ก (ม.6)', '0632562991', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110141-9', 'นาย', 'ปฐมพงษ์', 'แก่นจันทร์', 126, '63121', '0636237432', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110142-9', 'นาย', 'รัชพล', 'ปังคำ', 127, '63121 (ม.6)', '0611378729', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110146-9', 'นาย', 'บวรนันท์', 'ชัยวิชา', 136, '63121', '0842724899', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110148-9', 'นาย', 'ณฐพล', 'ภูมิสถาน', 130, '63121', '0986095181', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110149-9', 'นาย', 'อนันต์', 'จีระบุตร', 125, '63121ข (ม.6)', '0954208324', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110150-6', 'นาย', 'ธนกฤต', 'ทองลิ้ม', 128, '63121 (ม.6)', '0981824706', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110151-6', 'นาย', 'กฤตภาส', 'อุ่นใจ', 129, '63121 (ม.6)', '0610768424', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110154-6', 'นาย', 'เรืองศักดิ์', 'ตามไธสง', 130, '63121', '0621521344', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110157-6', 'นาย', 'ชวกรณ์', 'อาจหาญ', 131, '63121', '-', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110158-6', 'นาย', 'อิทธิพงษ์', 'กอกลาง', 125, '63121ข (ม.6)', '0615082484', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110159-6', 'นาย', 'วีรชาติ', 'คมขำ', 125, '63121ข (ม.6)', '0810172835', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110160-4', 'นาย', 'ธีรภัทร', 'ตันมอญ', 129, '63121 (ม.6)', '0621600017', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110161-4', 'นาย', 'นันทกร', 'พามี', 130, '63121', '0929698785', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110162-4', 'นาย', 'ธนภัทร', 'ยันจะโปะ', 125, '63121ข (ม.6)', '0918646075', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110163-4', 'นางสาว', 'จารุพร', 'โสดา', 125, '63121ข (ม.6)', '0621601975', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110164-4', 'นาย', 'ภานุวัฒน์', 'ทุมพร', 136, '63121', '0621325371', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110165-4', 'นาย', 'เนปกรศ์', 'เจริญสุข', 129, '63121', '0922758017', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110166-4', 'นาย', 'ชัยวุฒิ', 'บุญเฮ้า', 129, '63121 (ม.6)', '0946754713', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110167-4', 'นาย', 'อัมรินทร์', 'คุ้มวงษ์', 136, '63121', '0925403131', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110173-2', 'นาย', 'พงศกร', 'ฉวีโชติ', 126, '63121', '0611458321', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110175-2', 'นาย', 'ทรงธรรม', 'คุณธนปิยุกล', 136, '63121', '0611490516', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110176-2', 'นาย', 'ธีรภัทร', 'มิตรแสง', 132, '63121', '0638944950', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110177-2', 'นาย', 'จิรวัฒน์', 'บาลไธสง', 129, '63121 (ม.6)', '0934464800?', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110179-2', 'นาย', 'อัษฎาวุธ', 'พรมมะลิ', 129, '63121', '0982919719', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110181-0', 'นาย', 'พีรเทพ', 'เหลื่อมทองหลาง', 125, '63121ข (ม.6)', '0968143218', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110182-0', 'นาย', 'นนทกาญจน์', 'ชำนาญพิเศษ', 131, '63121', '0971476407', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110183-0', 'นาย', 'พลกฤต', 'ธรรมวงศ์', 136, '63121', '0802623383', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110184-0', 'นาย', 'ธีรดล', 'พิมพ์โพธิ์กลาง', 126, '63121', '0833799227', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110185-0', 'นาย', 'นรากร', 'ศาลาคำ', 136, '63121', '0652472046', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110186-0', 'นาย', 'ศรราม', 'ดือขุนทด', 125, '63121ข (ม.6)', '0959188424', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110187-0', 'นาย', 'กริช', 'กลอกกระโทก', 126, '63121', '0994930356', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110189-0', 'นาย', 'จักรกริช', 'ระหวายนอก', 125, '63121ข (ม.6)', '0952313771', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110190-8', 'นาย', 'กิตติศักดิ์', 'นาคเกษม', 136, '63121', '0930676737', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110192-8', 'นาย', 'จิรวัฒน์', 'ทองลี', 125, '63121ข (ม.6)', '0955272043', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110196-8', 'นาย', 'ดำรงศักดิ์', 'ไชยศรี', 130, '63121', '0930709259', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110197-8', 'นาย', 'ณภัทร', 'อินทรมณี', 126, '63121', '044111407', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110198-8', 'นาย', 'สรวิชญ์', 'รุจีระศิริกุล', 126, '63121', '0960916786', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110200-6', 'นางสาว', 'เชิญตะวัน', 'ภูคำแสน', 132, '63121', '0930814263', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110201-6', 'นาย', 'จิรายุทธ', 'แก้วก่อง', 136, '63121 (ม.6)', '0651025518', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110203-6', 'นาย', 'จรินทร์', 'ศรีทองอนันต์', 131, '63121', '0985959507', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110204-6', 'นาย', 'ศักดิ์ดา', 'ลายกลาง', 130, '63121', '0631319208', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110205-6', 'นาย', 'วัชรพล', 'กิจไธสง', 129, '63121 (ม.6)', '0940295327', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110206-6', 'นาย', 'ธนู', 'โพธิ์มินทร์', 130, '63121', '0922933260', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110208-6', 'นาย', 'ชินวัตร', 'เอิบอิ่ม', 129, '63121', '0659954851', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110209-6', 'นาย', 'ปิยวัฒน์', 'คงสุข', 126, '63121', '0918144506', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110210-4', 'นาย', 'วายุ', 'หล้าชิด', 130, '63121', '0858801637', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110212-4', 'นาย', 'ศักดิ์สิทธิ์', 'พรมเดื่อ', 130, '63121', '0969981621', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110213-4', 'นาย', 'ถิรวัฒน์', 'ทูลฉลอง', 130, '63121', '0979654840', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110214-4', 'นาย', 'ภูมิพิพัฒติ์', 'บุตรศรีภูมิ', 130, '63121', '0649528571', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110216-4', 'นาย', 'อัจฉริยะ', 'เกษคร้าม', 129, '63121', '0989026917', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110218-4', 'นาย', 'เพชรอรุณ', 'ชิดสูงเนิน', 126, '63121', '0611191251', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110219-4', 'นาย', 'ธรรมรัตน์', 'ฟังสูงเนิน', 126, '63121', '0945037775', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110220-2', 'นาย', 'จีรศักดิ์', 'เอ้สูงเนิน', 130, '63121', '0879394357', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110221-2', 'นาย', 'เดชาธร', 'ภูมูลเมือง', 126, '63121', '0821915770?', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110222-2', 'นาย', 'บูรพา', 'บุญประจวบโชค', 129, '63121', '0653066193', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110223-2', 'นาย', 'พศิน', 'จั้นอรัญ', 132, '63121', '0854618655', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110225-2', 'นาย', 'ธเนศพล', 'แซ่จิว', 127, '63121', '0834058457', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110226-2', 'นาย', 'พีรภัทร', 'ถ่อนสันเทียะ', 136, '63121', '0909834291', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110227-2', 'นางสาว', 'กมลชนก', 'วิริยะ', 125, '63121ข (ม.6)', '0801214348', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110228-2', 'นางสาว', 'ธันยพร', 'คงธนชัยวัฒน์', 136, '63121', '0930308411', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110229-2', 'นาย', 'จักรพงษ์', 'เดสูงเนิน', 127, '63121 (ม.6)', '0986419288', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110230-0', 'นางสาว', 'ศิริวรรณ', 'โหนกลาง', 136, '63121', '0616625824', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110231-0', 'นาย', 'ณัฐพงษ์', 'อภัยวงศ์', 136, '63121', '0971521646', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110232-0', 'นางสาว', 'ปนัดดา', 'โสภาบุตร', 127, '63121 (ม.6)', '0612481725', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110233-0', 'นาย', 'เกียรติพงษ์', 'แก้วมาต', 131, '63121', '0935062494', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110234-0', 'นาย', 'ฐานทัพ', 'มะสีผา', 124, '63121', '0637345197', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110236-0', 'นาย', 'มานะเดช', 'ค้าโค', 128, '63121 (ม.6)', '0930684225', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110238-0', 'นาย', 'ศุภกฤต', 'แจ้งกลาง', 131, '63121', '0621211963', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110242-8', 'นาย', 'ชัยวุฒิ', 'หวังคุ้มกลาง', 131, '63121', '0639565257', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110243-8', 'นาย', 'ณัฐปคัลภ์', 'โตใจ', 130, '63121', '0636306625', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110245-8', 'นาย', 'ธนพนธ์', 'เดชขุนทด', 129, '63121 (ม.6)', '0621650455', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110247-8', 'นาย', 'กฤษดา', 'ถนัดไร่', 129, '63121 (ม.6)', '0966898853', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110251-5', 'นาย', 'ชิษณุพงศ์', 'ศรีพิมพ์', 136, '63121', '0630208820', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110253-5', 'นาย', 'ชลสิทธิ์', 'หนูแก้ว', 127, '63121 (ม.6)', '0910324075', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110255-5', 'นาย', 'พิชญุตม์', 'ปัดธุลี', 127, '63121 (ม.6)', '0981586458', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110256-5', 'นางสาว', 'ปาลิดา', 'ตวยกระโทก', 127, '63121 (ม.6)', '0927878669', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110257-5', 'นางสาว', 'นันท์ชญาน์', 'สุตะนา', 127, '63121 (ม.6)', '0629895019', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110258-5', 'นางสาว', 'อัจจิมา', 'บุญตา', 127, '63121 (ม.6)', '0864997103', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110259-5', 'นาย', 'นพพร', 'เรืองจันทึก', 127, '63121 (ม.6)', '0650077936', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110265-3', 'นาย', 'อิทธิพล', 'จันณรงค์', 131, '63121', '0956106465', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110267-3', 'นาย', 'วิทยา', 'เกาะงาม', 131, '63121', '0958170124', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110270-1', 'นาย', 'อัคเดช', 'อินทอง', 124, '63121', '0924182803', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110271-1', 'นาย', 'ปรมินทร์', 'พุทธสอน', 128, '63121 (ม.6)', '063 9327157', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('631711102731', 'นางสาว', 'พรรณปพร', 'พอกกา', 125, 'TRT', '0612389196', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110279-1', 'นาย', 'นัทฐพงศ์', 'บุงกระโทก', 129, '63121', '0933579432', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110281-9', 'นาย', 'ต้นฉบับ', 'เจริญสุข', 130, '63121', '0932398961', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110283-9', 'นาย', 'กฤตเมธ', 'เพลินจันทึก', 127, '63121 (ม.6)', '0859174008', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110289-9', 'นาย', 'อภิเดช', 'พลธรรม', 127, '63121', '0872606014', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110290-7', 'นางสาว', 'ณัชชา', 'แซ่เฉ่า', 136, '63121', '0944922358', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110294-7', 'นาย', 'ชาญวิทย์', 'บำขุนทด', 127, '63121 (ม.6)', '0808521207', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110295-7', 'นาย', 'ธวัชชัย', 'ดอกทุเรียน', 127, '63121 (ม.6)', '0823717354', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110298-7', 'นาย', 'ดนุพล', 'พลีดี', 127, '63121 (ม.6)', '0981605179', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110299-7', 'นาย', 'จักรพันธุ์', 'ดวงอ่อน', 127, '63121 (ม.6)', '0950019108', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110301-5', 'นาย', 'ศักรินทร์', 'นันธิโย', 125, '63121ข (ม.6)', '0981752208', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110302-5', 'นาย', 'ออมสิน', 'ริยะจันทร์', 131, '63121', '0806562730', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110304-5', 'นาย', 'สิทธิศักดิ์', 'นาบํารุง', 130, '63121', '0629833973', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110305-5', 'นาย', 'จักรกฤษณ์', 'คำสี', 130, '63121', '0652675505', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110310-3', 'นาย', 'ธนากร', 'เวียงจันทึก', 128, '63121 (ม.6)', '0993970226', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110311-3', 'นาย', 'วิศรุต', 'เหนือจันทึก', 128, '63121 (ม.6)', '0927837909', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110314-3', 'นาย', 'พัฒนพงษ์', 'ธรรมคุณ', 129, '63121 (ม.6)', '0935311847', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110315-3', 'นาย', 'ณรงค์ศักดิ์', 'บ่อพิมาย', 132, '63121', '0984754879', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110317-3', 'นาย', 'อานนท์', 'เพาะกระโทก', 127, '63121', '0982046989', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110318-3', 'นาย', 'ภัทรพล', 'ภูมิพัฒน์', 129, '63121 (ม.6)', '0934364125', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110322-1', 'นาย', 'วรากร', 'สอนจันทร์', 124, '63121', '0973296484', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110323-1', 'นาย', 'ณัฐกานต์', 'กริดกระโทก', 128, '63121 (ม.6)', '0812828683', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110324-1', 'นาย', 'อนุชา', 'อินทร์สอน', 125, '63121ข (ม.6)', '0653162744', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110328-1', 'นางสาว', 'ปนัสยา', 'วงศ์เขียว', 132, '63121', '0623087301', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110330-9', 'นาย', 'ณัฐพล', 'วิลาศรี', 126, '63121', '0659910626', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110331-9', 'นาย', 'ภาณุพงศ์', 'การบรรจง', 126, '63121', '0934572473', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110333-9', 'นาย', 'ธีระพัฒน์', 'สงทามะดัน', 136, '63121 (ม.6)', '0968049545', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110337-9', 'นาย', 'ณัฐวัตน์', 'เวชสันเทียะ', 126, '63121', '0837928206', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110338-9', 'นาย', 'ก่อพงศ์', 'บุญสายออ', 126, '63121', '0965184181', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110341-7', 'นาย', 'ภูวดล', 'ไพรชัฎ', 126, '63121', '0952232113', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110342-7', 'นาย', 'ธนู', 'เลิกนอก', 136, '63121 (ม.6)', '0809209768', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110344-7', 'นาย', 'นพรักษ์', 'ฉิ่งสูงเนิน', 136, '63121 (ม.6)', '0958450305', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110345-7', 'นาย', 'ศักดิ์สิทธิ์', 'สมสะอาด', 132, '63121', '0938081499', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110347-7', 'นาย', 'ชานนท์', 'แสวงงาม', 132, '63121', '0981737025', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110350-4', 'นาย', 'กรกฤษณ์', 'ทัดเทียม', 126, '63121', '0935034708', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110352-4', 'นาย', 'รัชพงศ์', 'ชัยรถ', 126, '63121', '0935711157', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110354-4', 'นาย', 'พลศิษฎ์', 'สินลา', 127, '63121', '0924994380', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110356-4', 'นาย', 'อภิสิทธิ์', 'ปราบนอก', 129, '63121 (ม.6)', '0996277812', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110358-4', 'นาย', 'สุรศักดิ์', 'สาบุตดี', 136, '63121', '0840808060', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110361-2', 'นาย', 'วีรพันธ์', 'บุงกระโทก', 126, '63121', '0927513728', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110363-2', 'นาย', 'กุลพัชร', 'น้อยอาษา', 128, '63121 (ม.6)', '0870044420', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110364-2', 'นาย', 'ณัฐภัทร', 'โทนโคกสูง', 132, '63121', '0917982012', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110365-2', 'นาย', 'ภัทรพงษ์', 'บุรานนท์', 126, '63121', '0956344661', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110367-2', 'นาย', 'ปุณธนะ', 'แซะจอหอ', 129, '63121', '0863409622', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110368-2', 'นาย', 'ปรเมศวร์', 'แพ่งจันทึก', 125, '63121ก (ม.6)', '0630499316', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110369-2', 'นาย', 'วรพจน์', 'ทิมทอง', 128, '63121 (ม.6)', '0882855169', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110371-0', 'นาย', 'มลชัย', 'กาบบุญมา', 128, '63121 (ม.6)', '0956814300', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110372-0', 'นาย', 'ธราดล', 'ศรีวิลัย', 128, '63121 (ม.6)', '0879571280', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110374-0', 'นาย', 'ปรัชชญา', 'แซ่เตีย', 127, '63121', '0621472404', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110378-0', 'นาย', 'จิราวุฒิ', 'จันทีนอก', 128, '63121 (ม.6)', '0803803035', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110379-0', 'นาย', 'ศิรัสพล', 'พิมปาน', 127, '63121', '0800133716', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110380-8', 'นาย', 'นัฐวุฒิ', 'แสงกล้า', 126, '63121', '0834876742', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110382-8', 'นาย', 'สหรัฐ', 'หมอนอิง', 128, '63121 (ม.6)', '0855341299', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110383-8', 'นางสาว', 'โสรญา', 'ขวดจันทร์', 132, '63121', '0830854113', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110385-8', 'นาย', 'ประวิทย์', 'มำขุนทด', 128, '63121 (ม.6)', '0878714043', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110389-8', 'นาย', 'ปฏิภาณ', 'ชุ่มกลาง', 131, '63121', '0868868663', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110391-6', 'นาย', 'ธีรพงษ์', 'พรมสุภะ', 131, '63121', '0982474824', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110392-6', 'นาย', 'สุริยงค์', 'ศรีแย้ม', 127, '63121', '0988476615', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110393-6', 'นาย', 'ณฐพล', 'พูดเพราะ', 132, '63121', '0990363654', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110394-6', 'นาย', 'ชินดนัย', 'เดือนขาว', 132, '63121', '0935035645', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110397-6', 'นาย', 'สิทธิพล', 'คำดี', 136, '63121 (ม.6)', '0935019644', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110398-6', 'นางสาว', 'กัญญารัตน์', 'คำดี', 136, '63121 (ม.6)', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110400-4', 'นางสาว', 'ศิริวดี', 'เภาคำแก้ว', 136, '63121 (ม.6)', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110401-4', 'นาย', 'โสภณ', 'สีทน', 136, '63121 (ม.6)', '0641952672', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110402-4', 'นางสาว', 'ธารดา', 'เกลี่ยรัมย์', 136, '63121 (ม.6)', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110403-4', 'นางสาว', 'นนทยา', 'พุ่มพฤกษ์', 136, '63121 (ม.6)', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110404-4', 'นางสาว', 'ญาณิศา', 'พรมเริง', 136, '63121 (ม.6)', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110405-4', 'นาย', 'นาวี', 'ศิริโชค', 136, '63121 (ม.6)', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110406-4', 'นาย', 'ณัฐนันท์', 'ดีเปรี่ยม', 136, '63121 (ม.6)', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110407-4', 'นาย', 'คันฉัตร', 'สรสิทธิ์', 136, '63121 (ม.6)', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110408-4', 'นางสาว', 'ชญานี', 'ชัยมงคง', 136, '63121 (ม.6)', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110409-4', 'นาย', 'วัชรา', 'การะเกษ', 136, '63121 (ม.6)', '0968371379', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110410-2', 'นาย', 'วีระยุทธ', 'เจือจันทร์', 136, '63121 (ม.6)', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110411-2', 'นาย', 'ศุภโคช', 'สุขสีจันทร์', 136, '63121 (ม.6)', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110412-2', 'นาย', 'ธีรภัทร', 'ข่ายกระโทก', 136, '63121 (ม.6)', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110413-2', 'นาย', 'อนุวัฒน์', 'เหวนอก', 136, '63121 (ม.6)', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110414-2', 'นาย', 'เกียรศักดิ์', 'มาพิบูลย์', 136, '63121 (ม.6)', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110415-2', 'นาย', 'โชติวุฒิ', 'ปิดตาละเพ', 136, '63121 (ม.6)', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110416-2', 'นาย', 'สุเมธ', 'จินดาธรรม', 136, '63121 (ม.6)', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110417-2', 'นาย', 'ประกาศิตร์', 'กล้าหาญ', 136, '63121 (ม.6)', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110418-2', 'นาย', 'เกียรติศักดิ์', 'ประเสริฐศรี', 136, '63121 (ม.6)', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110467-1', 'นาย', 'ธนวัฒน์', 'อรุณศรี', 132, '63121', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63171110468-1', 'นาย', 'สันหณัฐ', 'ช่วยนา', 124, '63121', '0629832846', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110001-7', 'นางสาว', 'เจนจิรา', 'บุญศรีเมฆ', 069, '63241', '0630686466', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110002-7', 'นาย', 'พรเทพ', 'อ่อนขาว', 074, '63241', '044222635', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110003-7', 'นาย', 'ปรีดา', 'น้อยมะดัน', 074, '63241', '0821579859', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110004-7', 'นางสาว', 'ธิญาดา', 'เรียมริมมะดัน', 073, '63241', '0650942900', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110007-7', 'นางสาว', 'ธันยพร', 'แฟขุนทด', 076, '63241', '0933367008', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110009-7', 'นาย', 'คลังทอง', 'ภู่ทอง', 079, '63241', '0634125059', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110011-5', 'นางสาว', 'ประภัสสร', 'วงษ์พิทักษ์', 072, '63241', '0935675876', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110013-5', 'นางสาว', 'ศุภาวดี', 'ศรีนิยม', 078, '63241', '0982237643', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110015-5', 'นางสาว', 'สุวรรณนภา', 'แก้วประเสริฐ', 072, '63241', '0810720678', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110017-5', 'นางสาว', 'พรสวรรค์', 'วงค์เสงี่ยม', 069, '63241', '0800613834', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110019-5', 'นางสาว', 'เสาวลักษณ์', 'ช่อดารา', 078, '63241', '0624976296', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110020-3', 'นางสาว', 'วันวิษา', 'นันทะโคตร', 088, '63241', '0624200017', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110021-3', 'นางสาว', 'สุมิตตา', 'ข่อสูงเนิน', 070, '63241', '0982014637', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110023-3', 'นาย', 'ณัฐวุฒิ', 'คุ้มเหม', 078, '63241', '0611300788', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110025-3', 'นาย', 'ชนกันต์', 'โสสีสุข', 072, '63241', '0953071143', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110028-3', 'นาย', 'พิชญาชาญ', 'กระออมแก้ว', 075, '63241', '0945026838', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110029-3', 'นางสาว', 'สุภัสสร', 'จาบสันเทียะ', 080, '63241', '0934594847', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110030-1', 'นาย', 'สรรพวุธ', 'เขียมรัมย์', 069, '63241', '0956022920', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110031-1', 'นางสาว', 'ภัทรภร', 'จีนสันเทียะ', 089, '63241', '0902305979', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110032-1', 'นางสาว', 'กัลยาณี', 'หวังรักกลาง', 089, '63241', '0610398829', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110033-1', 'นางสาว', 'อทิตยา', 'หุงขุนทด', 087, '63241', '0647814572', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110034-1', 'นางสาว', 'นิตยา', 'รอดวินิจ', 089, '63241', '0610276877', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110035-1', 'นาย', 'จิรวัฒน์', 'พึ่งพงษ์', 074, '63241', '0645456245', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110036-1', 'นางสาว', 'อรณี', 'จุกกระโทก', 087, '63241', '0617594868', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110037-1', 'นาย', 'อังกุล', 'บุญจันทร์', 069, '63241', '0863329732', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110038-1', 'นางสาว', 'หนึ่งฤทัย', 'ชมภู', 087, '63241', '0630960545', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110039-1', 'นางสาว', 'วลัยพรรณ', 'พุดขุนทด', 076, '63241', '0924162893', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110040-9', 'นางสาว', 'มนัสนันท์', 'เชื้อจอหอ', 072, '63241', '0927453394', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110041-9', 'นางสาว', 'รสสุคนธ์', 'เหมือนสันเทียะ', 087, '63241', '0971473506', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110043-9', 'นาย', 'กันตพงษ์', 'พลวงสร้อย', 078, '63241', '0829494804', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110045-9', 'นางสาว', 'เบญจพร', 'สวัสดิ์รักษา', 078, '63241', '0988561077', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110048-9', 'นาย', 'ธนากรณ์', 'ฟอนโคกสูง', 074, '63241', '0981928036', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110049-9', 'นางสาว', 'สุชาดา', 'จงเอื้อกลาง', 084, '63241', '0630357364', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110050-6', 'นางสาว', 'นภัสสร', 'ม้วนทอง', 073, '63241', '0968429668', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110051-6', 'นาย', 'ภูมินทร์', 'มุ่งแฝงกลาง', 072, '63241', '0807324619', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110052-6', 'นาย', 'เสริมเกียรติ', 'บุญจันทร์', 078, '63241', '0887672179', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110055-6', 'นาย', 'รัชพล', 'ใจมั่น', 073, '63241', '0982326065', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110056-6', 'นางสาว', 'วารินทร์', 'ดินจันทึก', 072, '63241', '0655360930', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110058-6', 'นางสาว', 'นลินี', 'นากุดนอก', 070, '63241', '0644498194', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110060-4', 'นางสาว', 'นรากร', 'คงค้างพลู', 082, '63241', '0963548826', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110063-4', 'นางสาว', 'กมลชนก', 'ตลับไธสง', 152, '63241', '0982265411', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110064-4', 'นางสาว', 'สุทิน', 'หวังค้ำกลาง', 089, '63241', '0986624001', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110065-4', 'นางสาว', 'กัญญารัตน์', 'เดชขุนทด', 084, '63241', '0935316734', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110066-4', 'นาย', 'ทิชานนท์', 'สกุลวงค์', 089, '63241', '0935240188', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110067-4', 'นางสาว', 'อารียา', 'บุญยม', 072, '63241', '0629910524', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110069-4', 'นาย', 'ชินพัฒน์', 'หกขุนทด', 078, '63241', '0984098255', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110070-2', 'นาย', 'กิตติภูมิ', 'ด่านแก้ว', 084, '63241', '0886755022', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110071-2', 'นางสาว', 'อารียา', 'หนอกกระโทก', 152, '63241', '0621385305', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110073-2', 'นางสาว', 'วรรณพร', 'เต็มเปี่ยม', 078, '63241', '0940515732', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110075-2', 'นาย', 'ปิติ', 'งอนกลาง', 072, '63241', '0611502203', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110076-2', 'นางสาว', 'นภัสวรรณ', 'จูกระโทก', 078, 'RSE.', '0610287465', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110077-2', 'นางสาว', 'วีรัญญา', 'สิงห์ไทยสงค์', 069, '63241', '0922944614', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110078-2', 'นาย', 'อนุชิต', 'บัวล้อมใบ', 072, '63241', '0958564602', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110080-0', 'นางสาว', 'อนัญญา', 'คุยสัน', 069, '63241', '0989585560', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110083-0', 'นาย', 'ธีรยุทธ', 'บ้วนกระโทก', 152, '63241', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110084-0', 'นางสาว', 'จิรัฐติกาล', 'นามมูลตรี', 072, '63241', '0981873468', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110086-0', 'นางสาว', 'ภัคธีมา', 'จุลเวช', 083, '63241', '0935537967', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110088-0', 'นางสาว', 'วิลาศิณี', 'สดไธสง', 084, '63241', '0656319403', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110089-0', 'นาย', 'สรศักดิ์', 'นพคุณ', 088, '63241', '0990232463', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110091-8', 'นางสาว', 'ญานิกา', 'ดาดง', 087, '63241', '0652674337', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110092-8', 'นาย', 'พิพัฒพงศ์', 'กลั่นเกษม', 069, '63241', '0918359524', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110093-8', 'นาย', 'อัมรินทร์', 'แสงฤกธิ์', 076, '63241', '0925514912', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110094-8', 'นาย', 'ณัฐวุฒิ', 'ทานะเวช', 084, '63241', '0800750815', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110095-8', 'นาย', 'ศรายุทธ', 'มาลา', 080, '63241', '0930692160', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110096-8', 'นางสาว', 'จุฑามาศ', 'บุญขุนทด', 072, '63241', '0941182950', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110097-8', 'นาย', 'อุกฤษ', 'สินประเสริฐ', 072, '63241', '0630238559', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110100-6', 'นางสาว', 'สุดารัตน์', 'พูนศรี', 072, '63241', '0934714077', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110101-6', 'นาย', 'เกียรติศักดิ์', 'ไขแสง', 078, '63241', '0952671672', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110102-6', 'นาย', 'เบญจพล', 'ปลื้มมะลัง', 074, '63241', '0649673529', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110103-6', 'นางสาว', 'นุศยา', 'เหลาเกตุ', 072, '63241', '0997377532', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110104-6', 'นาย', 'อนุพงศ์', 'สีสมุทร', 078, '63241', '0985294679', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110106-6', 'นาย', 'จิรวัฒน์', 'เชยบุญช่วย', 069, '63241', '0967435263', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110107-6', 'นางสาว', 'สุดารัตน์', 'คำสุกดี', 083, '63241', '0930983343', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110109-6', 'นาย', 'วัชรากร', 'ประสิทธิ์สุวรรณ', 152, '63241', '0972522166', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110111-4', 'นางสาว', 'พาฝัน', 'แก้วมะดัน', 083, '63241', '0904096234', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110115-4', 'นางสาว', 'สุกัญญา', 'กนก', 072, '63241', '0611566077', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110117-4', 'นางสาว', 'ศิรินภา', 'ลือทองหลาง', 082, '63241', '0934839429', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110118-4', 'นาย', 'ธีรทัต', 'ศรีษาคำ', 072, '63241', '0930638832', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110119-4', 'นางสาว', 'สุชาดา', 'หลวงพล', 078, '63241', '0826671332', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110121-2', 'นาย', 'โสภณ', 'ขยันกลาง', 078, '63241', '0846076605', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110123-2', 'นาย', 'เสกสรร', 'ทุนสูงเนิน', 078, '63241', '0953544906', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110124-2', 'นางสาว', 'ปิยธิดา', 'สังข์ทอง', 152, '63241', '0990741818', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110125-2', 'นาย', 'เทพนที', 'ทองวิเศษ', 079, '63241', '0629127696', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110127-2', 'นางสาว', 'สุภาวดี', 'บุ้งต่อบัว', 083, '63241', '0644840511', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110129-2', 'นางสาว', 'สุตาภัทร', 'แสงพรม', 069, '63241', '0899640287', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110130-0', 'นางสาว', 'ณัฐนันท์', 'นามบุตรดี', 083, '63241', '0623609176', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110132-0', 'นางสาว', 'พรทิพย์', 'เบื้องไธสง', 069, '63241', '0936403775', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110136-0', 'นางสาว', 'พลอยพรรณ', 'เพียงแก้ว', 078, '63241', '0982243565', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110137-0', 'นาย', 'กิตติพันธ์', 'บุญจูบุตร', 087, '63241', '0637746767', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110138-0', 'นางสาว', 'อารียา', 'ถูกจิต', 087, '63241', '0986139386', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110139-0', 'นาย', 'เจนพล', 'นามปัญญา', 079, '63241', '0646464227', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110142-8', 'นาย', 'วรวุฒิ', 'ปลื้มชัยภูมิ', 074, '63241', '0986683092', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110144-8', 'นาย', 'ปราบชนะ', 'บุญรัตน์ปราพันธ์', 073, '63241', '0818091186', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110145-8', 'นาย', 'กรกช', 'แก้วพิมพรม', 069, '63241', '0640261131', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110146-8', 'นาย', 'ธนกิจ', 'โพคาศรี', 078, '63241', '0653381108', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110150-5', 'นางสาว', 'จิรภัทร', 'ล้อมวงค์', 080, '63241', '0986208409', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110152-5', 'นาย', 'พีรพัฒน์', 'ปัตตาละคะ', 079, '63241', '0935077607', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110153-5', 'นางสาว', 'ปวีรัตน์', 'จงรับกลาง', 073, '63241', '0962987879', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110155-5', 'นาย', 'อาวุต', 'ส่วยครบุรี', 076, '63241', '0654876504', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110156-5', 'นาย', 'ศุภพล', 'เรืองชิต', 089, '63241', '0658704899', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110157-5', 'นางสาว', 'ณัฏฐาเนตร', 'พลเภา', 075, '63241', '0931981318', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110158-5', 'นางสาว', 'ชลพร', 'ทศภักตร์', 072, '63241', '0941244121', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110159-5', 'นางสาว', 'พิยดา', 'ทัพกลาง', 152, '63241', '0630128095', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110160-3', 'นาย', 'ปฏิพล', 'เสมอสาย', 089, '63241', '0803973622', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110161-3', 'นางสาว', 'พรรณศิริ', 'ซองผม', 075, '63241', '0645383692', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110162-3', 'นางสาว', 'สรสิชา', 'มณีขำ', 083, '63241', '0616010233', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110163-3', 'นางสาว', 'ณัฐชยา', 'ยันกลาง', 074, '63241', '0628984258', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110164-3', 'นาย', 'จตุรพร', 'ยังพิทักษ์เกียรติ', 075, '63241', '0610530600', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110165-3', 'นางสาว', 'เกาลิน', 'ทับขุนทด', 084, '63241', '0660870055', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110166-3', 'นางสาว', 'ธิมาพร', 'หินใหม่', 087, '63241', '0931181614', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110167-3', 'นางสาว', 'พรพิมล', 'นามสันเทียะ', 076, '63241', '0611011824', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110170-1', 'นาย', 'ทัศน์พล', 'เดือนกลาง', 069, '63241', '0940868424', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110172-1', 'นาย', 'พีรพัฒน์', 'จงวงค์', 072, '63241', '0986319590', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110174-1', 'นาย', 'ชนุดม', 'ศรีกำปัง', 089, '63241', '0621857641', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110175-1', 'นาย', 'วชรวุธ', 'รักเมือง', 076, '63241', '0929745748', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110176-1', 'นาย', 'นนทวัฒน์', 'จันทร์กรอง', 073, '63241', '0615243057', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110177-1', 'นาย', 'ทัตพงศ์', 'เขมศิริวัฒนกุล', 078, '63241', '0922988114', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110180-9', 'นางสาว', 'สิริยากร', 'สมทิพย์', 073, '63241', '0624523026', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110181-9', 'นาย', 'ณัฐพล', 'ปะระมัดสระน้อย', 084, '63241', '0652677291', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110182-9', 'นาย', 'ธีรวิทย์', 'ชื่นไธสง', 076, '63241', '0930871537', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110183-9', 'นาย', 'ปรมัตถ์', 'ตวยกระโทก', 074, '63241', '0981176946', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110184-9', 'นาย', 'สหฤทธิ์', 'เหล่าเวียงเกตุ', 088, '63241', '0996062841', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110185-9', 'นางสาว', 'เบญญาพร', 'บำรุงศิลป์', 069, '63241', '0637659614', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110187-9', 'นาย', 'ดลสิทธิ์', 'สัตย์ฌุชนม์', 083, '63241', '0870762189', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110189-9', 'นางสาว', 'ตะวัน', 'หมั่นคง', 084, '63241', '0610600630', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110191-7', 'นาย', 'พรลภัส', 'พิชญ์ประเสริฐ', 084, '63241', '-', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110192-7', 'นาย', 'พีรพัฒน์', 'ปรุงมะเริง', 084, '63241', '0651192274', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110193-7', 'นาย', 'วทัญญู', 'นิพรรัมย์', 084, '63241', '0960916908', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110194-7', 'นาย', 'กัปตัน', 'บุญส่ง', 069, '63241', '0982868234', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110196-7', 'นาย', 'จิรเวช', 'พึงไชย', 078, '63241', '0979540294', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110198-7', 'นาย', 'ชุติมันต์', 'ทศพัก', 073, '63241', '0967794932', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110199-7', 'นาย', 'วริทธิ์ธร', 'เสพสุข', 076, '63241', '0935452755', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110200-5', 'นาย', 'กิตติพงศ์', 'ม่วงตะเภา', 083, '63241', '0988938382', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110201-5', 'นาย', 'ณรงค์ธรรม', 'ศิลปชัย', 084, '63241', '044631280', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110203-5', 'นาย', 'สันติชล', 'บุญประพาน', 069, '63241', '0956137465', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110204-5', 'นาย', 'ชาคริต', 'กริชสะกะ', 084, '63241', '-', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110208-5', 'นาย', 'นนธวัฒน์', 'เพชรบูรณ์', 069, '63241', '0658196844', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110209-5', 'นาย', 'ณัฐวุฒิ', 'ตรีรักษา', 084, '63241', '0902657278', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110210-3', 'นาย', 'ภูวนาถ', 'สมงาม', 076, '63241', '0889160375', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110213-3', 'นาย', 'วัชรพงษ์', 'หันแถลง', 073, '63241', '0636312705', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110214-3', 'นาย', 'ภูวไนย', 'เจนหนองแวง', 083, '63241', '0632315327', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110215-3', 'นาย', 'สมยศ', 'เพ็งจันดา', 079, '63241', '0934451808', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110218-3', 'นาย', 'กฤษณะ', 'ละอองศรี', 075, '63241', '0981106696', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110219-3', 'นาย', 'ปัญญา', 'ทือเกาะ', 078, '63241', '0652972826', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110220-1', 'นาย', 'วุฒิพงษ์', 'เวิดสูงเนิน', 089, '63241', '0640811181', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110221-1', 'นาย', 'กฤษฎา', 'มาลัย', 073, '63241', '0651182441', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110224-1', 'นาย', 'ปุญญพัฒน์', 'สิริรุจิชาญ', 072, '63241', '0914709700', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110227-1', 'นางสาว', 'สุภาภรณ์', 'เจียมรัมย์', 083, '63241', '0887872050', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110228-1', 'นางสาว', 'จารุวรรณ', 'ชัยศิลป์', 084, '63241', '0910566737', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110229-1', 'นาย', 'ณัชพล', 'ขอนค้างพลู', 079, '63241', '0906639393', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110230-9', 'นาย', 'นนท์ธวัช', 'ชินวัฒนะไพศาล', 076, '63241', '0811850559', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110231-9', 'นาย', 'ปรมินทร์', 'ฉายะรถี', 078, '63241', '0827272295', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110232-9', 'นางสาว', 'สิริยากรณ์', 'นุการรัมย์', 089, '63241', '0621736001', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110233-9', 'นาย', 'รพีพัฒน์', 'ไร่พิมาย', 077, '63241', '0935653418', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110234-9', 'นางสาว', 'สรัลพร', 'พันพรมราช', 087, '63241', '0615429181', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110235-9', 'นางสาว', 'ทิพรัตน์', 'สุวรรณศรี', 089, '63241', '0630352205', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110236-9', 'นางสาว', 'จันจิรา', 'วงศรี', 075, '63241', '0935433484', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110237-9', 'นางสาว', 'สุพรรณี', 'พรีพรม', 080, '63241', '0855312358', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110238-9', 'นางสาว', 'สุภาวดี', 'นบพลกรัง', 069, '63241', '0970674144', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110239-9', 'นาย', 'พีรพัตร', 'หงษ์ฟ้อน', 088, '63241', '0970767772', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110240-7', 'นาย', 'จักรกฤษณ์', 'ยวงโป่งแก้ว', 088, '63241', '09350509350', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110241-7', 'นางสาว', 'กานต์สิริ', 'พิพิธกุล', 080, '63241', '0986921440', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110242-7', 'นางสาว', 'ดารารัตน์', 'ญาติกลาง', 072, '63241', '0801656882', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110245-7', 'นาย', 'สามารถ', 'มืดกว้าง', 075, '63241', '0910167490', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110246-7', 'นาย', 'ภูวนาท', 'พิชัย', 069, '63241', '0830935032', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110247-7', 'นาย', 'พงศกร', 'โก่นสันเทียะ', 083, '63241', '0611595211', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110248-7', 'นาย', 'นพรุจ', 'พยัคฆเดช', 078, '63241', '0986420885', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110249-7', 'นางสาว', 'ชลธิชา', 'นามสม', 083, '63241', '0956153827', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110252-4', 'นางสาว', 'ดวงกมล', 'สีกะพา', 071, '63241', '0991842121', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110253-4', 'นาย', 'ณัฐวุฒิ', 'บุญตา', 076, '63241', '0940076693', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110254-4', 'นางสาว', 'ชนิดา', 'หยดสูงเนิน', 071, '63241', '0959305154', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110255-4', 'นางสาว', 'ณัฐณิชา', 'ผิวลา', 080, '63241', '0956218870', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110256-4', 'นาย', 'อนุชิต', 'จันดิษฐ์', 069, '63241', '0621506708', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110257-4', 'นางสาว', 'เสาวลักษณ์', 'ทนสูงเนิน', 080, '63241', '0934906478', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110259-4', 'นางสาว', 'รุ่งทิวา', 'ภิญโย', 087, '63241', '0937470794', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110260-2', 'นาย', 'หาญกล้า', 'จอดนอก', 074, '63241', '0929261611', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110261-2', 'นาย', 'ศักดา', 'เบ้ามูลตรี', 089, '63241', '0972391310', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110262-2', 'นาย', 'พิชญุตม์', 'ศรีโพธิ์', 074, '63241', '0853946164', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110263-2', 'นางสาว', 'สุชัญญา', 'โภชจะโปะ', 070, '63241', '0967784559', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110266-2', 'นาย', 'มรุเดช', 'ไลนอก', 075, '63241', '0653371539', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110267-2', 'นางสาว', 'นภาภรณ์', 'ศรีเเสง', 075, '63241', '0984081669', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110268-2', 'นาย', 'โชติสิริกุล', 'ญาณธานี', 072, '63241', '0889235473', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110269-2', 'นาย', 'ธนภูมิ', 'พูนสวัสดิ์', 073, '63241', '0984781600', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110270-0', 'นาย', 'ธิติพงศ์', 'ปักษา', 071, '63241', '0610717453', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110271-0', 'นาย', 'ณัฐวุฒิ', 'จุปะมัดตัง', 075, 'ME.63241', '0952948541', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110272-0', 'นาย', 'อานนท์', 'วุฒิไวย', 083, '63241', '0841724453', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110273-0', 'นาย', 'กิติพงศ์', 'วรรณศรี', 075, '63241', '-', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110276-0', 'นาย', 'ชัยมงคล', 'ปันมา', 075, '63241', '-', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110277-0', 'นาย', 'มินทดา', 'โปสัยบุตร', 075, '63241', '0622259551', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110279-0', 'นางสาว', 'สุนิษา', 'จ่าแก้ว', 073, '63241', '0886757431', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110280-8', 'นาย', 'ณัฐพล', 'กลั่นสาร', 079, '63241', '0898884212', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110281-8', 'นาย', 'ศุภชัย', 'ระไหวพรมราช', 087, '63241', '0931722169', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110282-8', 'นาย', 'วีรพงษ์', 'ทองคำ', 075, '63241', '0969168082', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110283-8', 'นางสาว', 'มาริสา', 'น้ำกระโทก', 069, '63241', '0945092953', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110287-8', 'นางสาว', 'สุภาวิมล', 'คูณหัวโทน', 072, '63241', '0935175127', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110288-8', 'นาย', 'วีระพล', 'อุ่นอ้วน', 071, '63241', '0636290049', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110289-8', 'นางสาว', 'ณัฐรุจา', 'ทะเลดอน', 087, '63241', '0929940264', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110290-6', 'นางสาว', 'ดลยดา', 'ศรีไกรลด', 089, '63241', '0642749380', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110291-6', 'นาย', 'วัชรากร', 'มาพะลัย', 073, '63241', '0957132331', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110292-6', 'นาย', 'ครรชิตพล', 'ทองศรี', 089, '63241', '0890009490', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110293-6', 'นาย', 'ศุภฤกษ์', 'พิมพ์โคตร', 083, '63241', '0611068687', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110294-6', 'นางสาว', 'ก้านแก้ว', 'กันยา', 070, '63241', '0936691937', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110295-6', 'นาย', 'ภาณุพงศ์', 'ไพเราะ', 078, '63241', '0644422989', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110298-6', 'นาย', 'วุฒิภัทร', 'พิมพ์กลาง', 073, '63241', '0644033103', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110300-4', 'นางสาว', 'นิตยา', 'เลากลาง', 072, '63241', '0993407765', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110301-4', 'นางสาว', 'อนามิกา', 'วิจิตขะจี', 084, '63241', '0647432287', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110303-4', 'นางสาว', 'สุธิดา', 'เหวนอก', 152, '63241', '0631257784', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110304-4', 'นาย', 'ธนพล', 'นางสันเทียะ', 087, '63241', '-', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110305-4', 'นาย', 'ณัฐวุฒิ', 'ยันสำโรง', 071, '63241', '0806131298', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110306-4', 'นาย', 'เจษฎาภรณ์', 'ตากกระโทก', 071, '63241', '0989436203', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110307-4', 'นาย', 'เกริกฤทธิ์', 'มุ่งเครือกลาง', 083, '63241', '0621767278', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110308-4', 'นาย', 'ธนกฤต', 'เซ็นทองหลาง', 083, '63241', '0916640882', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110309-4', 'นาย', 'ชยทัต', 'นกกลาง', 079, '63241', '0800671716', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110313-2', 'นางสาว', 'รัตนากร', 'ทิศกระโทก', 087, '63241', '0890321821', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110315-2', 'นางสาว', 'ชญานิษฐ์', 'ชินฮาต', 076, '63241', '0981477379', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110316-2', 'นาย', 'ชัยณรงค์', 'ศรีทอง', 077, '63241', '0656424888', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110318-2', 'นางสาว', 'กิตติวดี', 'เดื่อไธสง', 152, '63241', '-', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110320-0', 'นางสาว', 'ศรินยา', 'วงษ์ละคร', 084, '63241', '0807852290', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110324-0', 'นางสาว', 'พัชรินทร์', 'เพิงขุนทด', 080, '63241', '0963397809', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110326-0', 'นาย', 'จิรศักดิ์', 'ยุคกลาง', 072, '63241', '0653084824', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110328-0', 'นางสาว', 'อันยารักษ์', 'หินเหล็ก', 074, '63241', '0945732089', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110329-0', 'นางสาว', 'กชกร', 'ภู่นาค', 070, '63241', '0902617833', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110330-8', 'นางสาว', 'บัณฑิตา', 'แจ่มกลาง', 070, '63241', '0800643479', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110331-8', 'นาย', 'วชิรวิทย์', 'ทับสมบัติ', 071, '63241', '0972727073', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110332-8', 'นาย', 'อเนก', 'ประยูรวงค์', 071, '63241', '0841156501', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110334-8', 'นาย', 'สิทธิศักดิ์', 'จินารักษ์', 078, '63241', '0944704255', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110336-8', 'นางสาว', 'อาทิตยา', 'นิตไธสงค์', 078, '63241', '0827473613', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110337-8', 'นางสาว', 'จิราวรรณ', 'จันทะเบี้ยว', 078, '63241', '0971094225', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110339-8', 'นาย', 'พงษ์พัฒน์', 'ยี่สารพัฒน์', 078, '63241', '0942983111', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110340-6', 'นางสาว', 'ณัฐกานต์', 'ฉิวเฉื่อย', 087, '63241', '0908159264', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110341-6', 'นางสาว', 'บุศรา', 'เกตุชาติ', 087, '63241', '0917755867', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110343-6', 'นางสาว', 'พิชญาภัค', 'ขวัญเสียงเสนาะ', 087, '63241', '0988479632', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110344-6', 'นางสาว', 'ญานิสา', 'โม่งปราณีต', 087, '63241', '0926628816', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110345-6', 'นางสาว', 'ดวงฤทัย', 'รสไธสง', 087, '63241', '0621308308', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110346-6', 'นางสาว', 'เพ็ญนภา', 'ปะตังเวสา', 069, '63241', '0650062120', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110348-6', 'นาย', 'ปฏิภาณ', 'ดีขุนทด', 073, '63241', '0957052716', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110349-6', 'นาย', 'กฤตนัย', 'ไฝเพชร', 073, '63241', '0990097916', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110350-3', 'นางสาว', 'กัญญาณัฐ', 'การนอก', 075, '63241', '0625738962', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110351-3', 'นางสาว', 'สุกัญญา', 'จังพะเนา', 075, '63241', '0887082369', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110352-3', 'นาย', 'จิรานุวัฒน์', 'วงศ์ษา', 075, '63241', '0649696036', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110354-3', 'นาย', 'เจษฎา', 'พับขุนทด', 083, '63241', '0930935592', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110355-3', 'นาย', 'จิราเจตน์', 'เวียงดอนก่อ', 073, '63241', '0934924316', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110356-3', 'นาย', 'อภิณัฐ', 'วีรกุล', 078, '63241', '0933831633', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110358-3', 'นาย', 'ปรานต์', 'จารุวรรณวัฒนา', 076, '63241', '0928138471', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110360-1', 'นางสาว', 'อนิสรา', 'จำรัสบุญ', 072, '63241', '0611406162', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110361-1', 'นาย', 'ปฐวี', 'จงเทพ', 072, '63241', '-', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110363-1', 'นางสาว', 'บัวชมพู', 'แผนสันเทียะ', 070, '63241', '0616923231', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110364-1', 'นาย', 'นิติภูมิ', 'อังกาบ', 078, '63241', '0929120093', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110365-1', 'นางสาว', 'ศิรประภา', 'ยันกลาง', 087, '63241', '0621840201', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110366-1', 'นางสาว', 'ธนัชพร', 'สรวญรัมย์', 069, '63241', '0631796499', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110367-1', 'นางสาว', 'จันทราทิพย์', 'พานเงิน', 069, '63241', '0982427398', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110368-1', 'นาย', 'ณัฐภัทร', 'หาญโก่ย', 073, '63241', '0657256496', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110369-1', 'นาย', 'เจษฎาภรณ์', 'เสือเล็ก', 073, '63241', '0895847707', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110371-9', 'นาย', 'ชุติเดช', 'บรรลังเดช', 075, '63241', '0925705870', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110373-9', 'นาย', 'นนปิฎก', 'ธรรมนุส', 074, '63241', '0949058774', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110374-9', 'นาย', 'กิตติพงษ์', 'เกลื่อนกลางดอน', 077, '63241', '0858849790', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110379-9', 'นาย', 'ชิษณุพงศ์', 'ถ่ายสูงเนิน', 070, '63241', '0620747590', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110380-7', 'นาย', 'ศุภกิจ', 'มีมานะ', 070, '63241', '0930833416', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110381-7', 'นาย', 'พลากร', 'วรรณโสภณ', 079, '63241', '0971627690', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110382-7', 'นางสาว', 'อรษา', 'คงค้างพลู', 152, '63241', '0955685073', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110383-7', 'นาย', 'ประพัฒน์', 'ก่ำสระน้อย', 082, '63241', '-', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110384-7', 'นางสาว', 'ตรีรัตน์', 'เนตรทองหลาง', 082, '63241', '0966508853', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110385-7', 'นาย', 'กิตติกานต์', 'สร้อยกระโทก', 082, '63241', '0872427763', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110387-7', 'นาย', 'ธานินทร์', 'ยางนอก', 088, '63241', '0968988775', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110389-7', 'นาย', 'สุเมธ', 'แสงโพธิ์', 082, '63241', '0653986869', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110390-5', 'นาย', 'บุญฤทธิ์', 'ประสิทธิ์กูล', 082, '63241', '0862491431', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110391-5', 'นางสาว', 'ขวัญใจ', 'ภูบุญศรี', 079, '63241', '0867368847', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110392-5', 'นางสาว', 'วิริยาพร', 'ซอมตะคุ', 070, '63241', '0612597521', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110393-5', 'นางสาว', 'ณัฏฐ์ภรภัทร', 'ใจเสงี่ยม', 070, '63241', '0950621845', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110395-5', 'นาย', 'ปัญญากร', 'เปรมปรีดิ์', 070, '63241', '0621361683', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110399-5', 'นาย', 'พีรพงษ์', 'ป้องศรี', 070, '63241', '0984707584', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110400-3', 'นาย', 'อภิสิทธิ์', 'รอสูงเนิน', 077, '63241', '0610735081', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110401-3', 'นาย', 'ภูธะเนตร', 'คำมุงคุล', 070, '63241', '0881195506', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110403-3', 'นาย', 'อัษฎาวุธ', 'โกติรัมย์', 074, '63241', '0622542800', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110404-3', 'นาย', 'ตระกูล', 'อุทก', 074, '63241', '0640859512', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110405-3', 'นาย', 'ตะวัน', 'ลิ้มอุไร', 074, '63241', '0948134541', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110406-3', 'นาย', 'สุภทัต', 'เทินสระเกษ', 076, '63241', '0849842646', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110407-3', 'นาย', 'ภานุวัฒน์', 'ไร่นา', 076, '63241', '0652620702', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110409-3', 'นาย', 'ฐิรวัฒน์', 'งามเลิศ', 076, '63241', '0645381739', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110412-1', 'นาย', 'ชนกันต์', 'ธีระเดชากุล', 074, '63241', '0980258585', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110413-1', 'นาย', 'ธีรภัทร์', 'ขันวิเศษ', 076, '63241', '0981317459', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110419-1', 'นาย', 'นิรัตติสัย', 'พุขุนทด', 083, '63241', '0969978657', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110420-9', 'นาย', 'ธีรวัฒน์', 'นาคสระเกตุ', 083, '63241', '0829807010', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110421-9', 'นาย', 'พิทักษ์', 'ง่วนสันเทียะ', 083, '63241', '0828745697', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110422-9', 'นาย', 'ชนะชล', 'กาเวสูง', 083, '63241', '0966588331', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110423-9', 'นาย', 'ก้องภัค', 'คำภาพันธ์', 071, '63241', '0989152644', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110424-9', 'นาย', 'กิตติศักดิ์', 'มีวงค์', 075, '63241', '0826769389', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110425-9', 'นาย', 'วีระเทพ', 'เนตรดำกูล', 075, '63241', '0611615682', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110426-9', 'นางสาว', 'กิ่งกาญจน์', 'ยิ้มน้อย', 069, '63241', '0885761323', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110427-9', 'นาย', 'ธนวัฒน์', 'ประถมพรมราช', 084, '63241', '0991989719', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110428-9', 'นาย', 'พลกฤษณ์', 'น้อยจันทร์', 071, '63241', '-', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110429-9', 'นาย', 'ผดุงเกียรติ', 'มะกา', 071, '63241', '0646461506', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110430-7', 'นาย', 'ศุภกิตติ์', 'แก้วพิมพ์', 078, '63241', '0988818218', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110431-7', 'นาย', 'ทักษิณ', 'บรรลือทรัพย์', 075, '63241', '0657583330', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110432-7', 'นาย', 'รัชชานนท์', 'แสนภูมิ', 071, '63241', '0800748906', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110434-7', 'นาย', 'อานนท์', 'หลอดทองหลาง', 084, '63241', '0928784731', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110435-7', 'นาย', 'พชรพล', 'ภู่ประดิษฐ', 083, '63241', '0803322373', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110436-7', 'นาย', 'ภัควัฒน์', 'ทิพย์โยธา', 075, '63241', '0619529516', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110437-7', 'นาย', 'สรวิชญ์', 'เฉลยไกร', 084, '63241', '0622515591', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110438-7', 'นาย', 'อาริยวัฒน์', 'อิ่มเต็ม', 084, '63241', '0636212014', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110439-7', 'นาย', 'พิชัย', 'ท่าหาญ', 071, '63241', '0987411150', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110441-5', 'นาย', 'ชาคริต', 'วัฒนพงศ์พิศาล', 073, '63241', '-', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110442-5', 'นาย', 'ณัฐกิตติ์', 'พิมพ์หมื่น', 071, '63241', '0925073371', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110443-5', 'นาย', 'ธนวัฒน์', 'ฮวดตี๋', 070, '63241', '0967917368', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110444-5', 'นาย', 'วีรวัฒน์', 'คะเซ็นเชื้อ', 069, '63241', '0621314059', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110446-5', 'นาย', 'พงศ์ธวัช', 'อ้อชัยภูมิ', 079, '63241', '0849628895', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110447-5', 'นาย', 'ฐิติวัสส์', 'นามตะ', 083, '63241', '0942068384', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110450-2', 'นางสาว', 'พรรณษา', 'นามนัย', 083, '63241', '0651024755', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110454-2', 'นาย', 'สิรภพ', 'เมตตา', 071, '63241', '0878784665', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110456-2', 'นาย', 'พรหมเมต', 'จันทร์เพ็ญ', 076, '63241', '0895835700', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110459-2', 'นาย', 'ปรมินทร์', 'พร้อมสันเทียะ', 078, '63241', '0930948068', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110460-0', 'นาย', 'ชญานนท์', 'แป้นนางรอง', 079, '63241', '0615705103', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110461-0', 'นาย', 'ณัฐวุฒิ', 'พรหมวงษ์', 082, '63241', '0981175022', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110467-0', 'นาย', 'ธนพัฒน์', 'หวังสวาสดิ์', 076, '63241', '0611276351', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110468-0', 'นางสาว', 'สุดารัตน์', 'เอี่ยมรัมย์', 089, '63241', '0945733622', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110469-0', 'นาย', 'ธงชัย', 'นิลพลกรัง', 078, '63241', '0935472911', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110470-8', 'นาย', 'ธีรภัทร์', 'แพงดี', 082, '63241', '0926908616', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110474-8', 'นาย', 'ตันติกร', 'เจียกงูเหลือม', 083, '63241', '0950670992', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110476-8', 'นางสาว', 'สุกัญญา', 'ประสารรส', 071, '63241', '0624141033', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110478-8', 'นาย', 'ฐาปกรณ์', 'แผ้วสูงเนิน', 076, '63241', '0973348864', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110479-8', 'นาย', 'ธนวิทย์', 'นนทะสร', 077, '63241', '0971219367', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110486-6', 'นาย', 'ภูชิชย์', 'ยวนกระโทก', 076, '63241', '09878745-41', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110487-6', 'นาย', 'อาทิตย์', 'ราชกระโทก', 076, '63241', '0811456129', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110488-6', 'นางสาว', 'บุญนพิน', 'กวนบ้านสุ่ย', 084, '63241', '0883630223', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110491-4', 'นาย', 'อธิวัฒน์', 'พิมพ์โคตร', 083, '63241', '0993072432', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110494-4', 'นาย', 'สุริโย', 'ตีเมืองสอง', 069, '63241', '0969169126', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110496-4', 'นาย', 'ธนโชติ', 'พิศตะขบ', 076, '63241', '0879635591', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110497-4', 'นาย', 'สหรัฐ', 'ปิดงูเหลือม', 070, '63241', '0645753038', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110498-4', 'นาย', 'ศักดิ์รินทร์', 'ขวัญม่วง', 080, '63241', '0660715264', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110499-4', 'นาย', 'กษิดิศ', 'ภุมรินทร์', 079, '63241', '0930684104', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110501-2', 'นาย', 'ทินภัทร', 'ปลื้มชัยภูมิ', 069, '63241', '0935395683', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110502-2', 'นาย', 'ณัฐพล', 'คุ้มครอง', 077, '63241', '0994733881', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110507-2', 'นาย', 'ภัทรดนัย', 'แดงสี', 071, '63241', '044625231', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110511-0', 'นาย', 'อลงกรณ์', 'คำบุดดี', 154, '63241', '0981501620', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110512-0', 'นางสาว', 'สุทธิชา', 'เชิญกลาง', 087, '63241', '0653231306', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110517-0', 'นาย', 'วุฒิไกร', 'จ้อยสูงเนิน', 074, '63241', '0844284587', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110521-8', 'นาย', 'ปิยพล', 'เชิดฉันท์', 079, '63241', '0919290699', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110526-8', 'นาย', 'พูลสวัสดิ์', 'เเก้วบัวเคน', 079, '63241', '0621241996', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110528-8', 'นาย', 'ฐาปณพงศ์', 'ชนุครัมย์', 070, '63241', '-', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110536-6', 'นาย', 'จีรณะ', 'พงษ์บริรักษ์', 076, '63241', '0918013865', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110538-6', 'นาย', 'ฐิติพงษ์', 'ชูธรัตน์', 080, '63241', '0972606963', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110544-4', 'นาย', 'นพรัตน์', 'พิสันเทียะ', 070, '63241', '0674378233', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172110551-1', 'นาย', 'ณัฐพล', 'ถนอมพลกรัง', 071, '63241', '0959506094', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310001-3', 'นาย', 'สหัสวรรษ', 'แขกรัมย์', 069, '63231A', '0852001433', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310002-3', 'นาย', 'พิเชษฐ์', 'พลอยเพ็ชร', 072, '63231', '0986350275', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310003-3', 'นาย', 'ไกรสร', 'กางนอก', 083, '63231A', '0997759546', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310004-3', 'นางสาว', 'ลดาวัลย์', 'ปากอุตสาห์', 086, '63231', '0957438941', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310007-3', 'นาย', 'อาทิตย์', 'งดกระโทก', 084, '63231', '0981286897', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310008-3', 'นาย', 'กฤษฎา', 'แก้วอรสาร', 075, '63231A', '0973353030', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310012-1', 'นาย', 'ภูมิสิทธิ์', 'สันดี', 084, '63231', '0961419054', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310015-1', 'นาย', 'อนุวัตน์', 'เชื้อทองคำ', 073, '63231', '0821074243', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310017-1', 'นาย', 'ศุภกร', 'ครุฑรัมย์', 076, '63231A', '0981914339', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310018-1', 'นาย', 'วันเฉลิม', 'นะราวัง', 075, '63231B', '0986318324', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310020-9', 'นาย', 'ณัฐพงศ์', 'ผลภาค', 072, '63231', '0621845191', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310021-9', 'นาย', 'พีรวัฒน์', 'รัตนา', 086, '63231', '0933191052', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310022-9', 'นาย', 'ธนโชติ', 'ชื่นนอก', 072, '63231', '0935730071', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310023-9', 'นาย', 'วิภู', 'คำแสง', 072, '63231', '0655033372', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310025-9', 'นาย', 'ภัทรสิทธิ์', 'นาคบุญธรรม', 085, '63231', '0807357715', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310026-9', 'นาย', 'ณัฐวัฒน์', 'ชินวร', 072, '63231', '0610850558', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310028-9', 'นางสาว', 'ชลิดา', 'สิ่วไธสง', 073, '63231', '0621569702', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310030-7', 'นางสาว', 'ณัฐญา', 'ชาสูงเนิน', 069, '63231B', '-', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310031-7', 'นาย', 'ปริญญา', 'ฝ่าพิมาย', 072, '63231', '0631527707', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310033-7', 'นาย', 'ทรงยศ', 'จำนงชอบ', 084, '63231', '0643290720', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310034-7', 'นางสาว', 'ปิยวรรณ', 'ฮานิป', 072, '63231', '0902515830', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310036-7', 'นาย', 'ธนกฤต', 'ปะตังเวสา', 072, '63231', '0930897936', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310037-7', 'นาย', 'สหัสวรรษ', 'มณีศรี', 072, '63231', '0981901806', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310039-7', 'นาย', 'สุเมธ', 'คล้อยกลาง', 083, '63231A', '0863703145', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310040-5', 'นาย', 'ชยกร', 'แก้วคง', 079, '63231', '0830203655', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310047-5', 'นาย', 'อภิศักดิ์', 'รวยรื่น', 069, '63231B', '0969404315', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310048-5', 'นาย', 'บุญญฤทธิ์', 'อินแพง', 086, '63231', '0934247381', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310049-5', 'นาย', 'สุรชัย', 'งามปัก', 086, '63231', '0621764487', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310051-2', 'นาย', 'ศิริวัฒน์', 'ฟ้าคุ้ม', 086, '63231', '0985910576', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310052-2', 'นาย', 'สุทธิพงศ์', 'จำปาโชค', 076, '63231A', '0863371442', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310055-2', 'นาย', 'ณัฐวัฒน์', 'บอมขุนทด', 085, '63231', '0655758943', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310056-2', 'นาย', 'นพกร', 'มุ่งรวยกลาง', 076, '63231A', '0822109028', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310060-0', 'นาย', 'ยศกฤต', 'เทียมจัตุรัส', 084, '63231', '0935214335', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310073-8', 'นาย', 'ผเดิมพงษ์', 'ฝ่ายสัจจะ', 076, '63231A', '0958595339', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310077-8', 'นาย', 'นพเก้า', 'ยิ่งมีมา', 085, '63231', '0990311140', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310080-6', 'นาย', 'สุรยุทธ', 'เอี่ยมศรี', 073, '63231', '0614584909', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310081-6', 'นาย', 'ภัคควรรธน์', 'เดชารุจีรวัษย์', 069, '63231A', '044833338', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310082-6', 'นาย', 'ณัฐวุฒิ', 'วงค์สันเทียะ', 074, '63231A', '0630139709', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310086-6', 'นาย', 'ถิรวัฒน์', 'กองทอง', 073, '63231', '0807237359', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310087-6', 'นาย', 'ณัฐดนัย', 'เตยดอน', 084, '63231', '0935171387', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310091-4', 'นาย', 'เอกรินทร์', 'วงศ์จันทา', 075, '63231A', '0619580093', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310094-4', 'นาย', 'สถาพร', 'ทูลกลาง', 084, '63231', '0651136460', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310095-4', 'นาย', 'คมสันต์', 'เนตรวงษ์', 071, '63231', '0645329849', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310097-4', 'นาย', 'จิราวุฒิ', 'ดีเลิศ', 072, '63231', '0619238366', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310101-2', 'นาย', 'พงษ์สิทธิ์', 'บุญใจ', 075, '63231A', '0657057181', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310102-2', 'นาย', 'ธีรพล', 'ลีอาจ', 071, '63231', '0802429202', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310103-2', 'นาย', 'วรกริช', 'วรนุช', 084, '63231', '0927101225', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310106-2', 'นาย', 'ลัทธพล', 'หนูเส็ง', 083, '63231A', '0927502204', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310107-2', 'นาย', 'รัตนกรณ์', 'ใบสนธิ์', 083, '63231A', '0902940064', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310110-0', 'นาย', 'พงศกร', 'มนูญญโสภิต', 083, '63231A', '0924596094', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310111-0', 'นาย', 'ธนกฤต', 'กวยเลิศ', 083, '63231A', '0954370269', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310112-0', 'นางสาว', 'วิลาสินี', 'ลิสวัสดิ์', 085, '63231', '-', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310114-0', 'นาย', 'อัษฎาวุฒิ', 'อ๊อกมณโท', 075, '63231A', '0934430890', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310116-0', 'นาย', 'อภิสิทธิ์', 'ประสมทรัพย์', 084, '63231', '0986670525', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310117-0', 'นาย', 'กมลศักดิ์', 'ป่วนกระโทก', 086, '63231', '0913419285', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310118-0', 'นาย', 'นพพล', 'พยัฆศรี', 084, '63231', '0990407291', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310119-0', 'นาย', 'สืบศักดิ์', 'สุขอินพะเนา', 075, '63231A', '0883226727', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310120-8', 'นาย', 'ธนาธิป', 'พรตรัยมาศ', 072, '63231', '0973429411', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310121-8', 'นาย', 'ภานุวัฒน์', 'แก้วหล่อ', 083, '63231A', '0989038423', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310122-8', 'นาย', 'ณัฐวุฒิ', 'หลงพิมาย', 074, '63231A', '0930301590', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310123-8', 'นาย', 'ณัฐวุฒิ', 'อัศวภูมิ', 074, '63231A', '0986132041', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310124-8', 'นาย', 'ณัฐวุฒิ', 'ดงกระโทก', 075, '63231A', '0935791246', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310127-8', 'นาย', 'สุริยะ', 'คูณทอง', 085, '63231', '0616732003', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310128-8', 'นาย', 'ณัฐวุฒิ', 'สุนทรเมธี', 074, '63231A', '0611673529', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310129-8', 'นาย', 'ทนงศักดิ์', 'รัตนะโสภา', 086, '63231', '0640740638', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310130-6', 'นาย', 'นันทวัฒน์', 'มุงกระโทก', 083, '63231A', '0933811410', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310131-6', 'นาย', 'ทัศสวัสดิ์', 'เดือนกลาง', 075, '63231A', '0981989005', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310132-6', 'นาย', 'อภิสิทธิ์', 'ฤทธิ์บำรุง', 085, '63231', '0898060359', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310133-6', 'นาย', 'วิทวัต', 'สมสิงห์', 071, '63231', '0611511368', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310134-6', 'นาย', 'ชัยรัตน์', 'อิ่มดำ', 072, '63231', '0801656846', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310135-6', 'นางสาว', 'พิชญาวี', 'จั่นขุนทด', 079, '63231', '096-134-5397', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310136-6', 'นาย', 'ทักษ์ดนัย', 'ฮาสเล็ม', 086, '63231', '0651198898', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310138-6', 'นาย', 'ธีรภัทร์', 'บ่มทองหลาง', 084, '63231', '0988676967', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310139-6', 'นาย', 'ธงชัย', 'รูปกระโทก', 076, '63231A', '0950482113', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310140-4', 'นาย', 'ณัฐพล', 'จงฤทธิ์', 069, '63231A', '0988728571', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310141-4', 'นาย', 'อัครเดช', 'เพียรีย์', 085, '63231', '0935236142', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310144-4', 'นาย', 'รักษ์พงศ์', 'หรัญรัตน์', 072, '63231', '0831289906', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310145-4', 'นาย', 'ตวงสิทธิ์', 'เทียมสิงห์', 071, '63231', '0917602366', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310146-4', 'นาย', 'องอาจ', 'ปรศุพัฒนา', 075, '63231A', '0646415144', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310147-4', 'นาย', 'วรวุฒิ', 'พวงพี', 086, '63231', '0982348001', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310148-4', 'นาย', 'ก้องภพ', 'แก่นปรีชา', 071, '63231', '0624900080', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310153-1', 'นาย', 'คมกฤช', 'ฝีมือดี', 071, '63231', '-', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310154-1', 'นาย', 'สมิทธิ์', 'บุญภิญโญ', 085, '63231', '0635063910', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310155-1', 'นางสาว', 'นันทิตา', 'กรวนงูเหลือม', 074, '63231A', '0934266653', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310156-1', 'นาย', 'อนันตภพ', 'โค่นถอน', 073, '63231', '0827567695', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310157-1', 'นาย', 'สิทธิพงษ์', 'จตุเทน', 075, '63231A', '0945250596', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310158-1', 'นาย', 'พันธวัฒน์', 'พลทะยาย', 083, '63231A', '0611475828', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310162-9', 'นาย', 'ปิยวัฒน์', 'ชัยลิ้นฟ้า', 084, '63231', '0935538606', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310163-9', 'นาย', 'กิติกร', 'สิงห์บัวบาน', 075, '63231A', '0878770885', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310165-9', 'นาย', 'ธนโชติ', 'พูลสวัสดิ์', 079, '63231', '0984578318', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310166-9', 'นาย', 'ณัฐกิตติ์', 'ดีนก', 072, '63231', '0821468422', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310167-9', 'นาย', 'พิชพัฒน์', 'คำมี', 072, '63231', '0982236074', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310169-9', 'นาย', 'ศรายุ', 'พันธ์ปาง', 075, '63231B', '0934476246', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310170-7', 'นาย', 'ภาณุชาติ', 'ตีสถิตย์', 083, '63231A', '0617087711', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310171-7', 'นาย', 'ชัยณธรณ์', 'ตั้งใจ', 069, '63231B', '0641918042', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310174-7', 'นาย', 'วรภพ', 'อ้อมชมภู', 072, '63231', '0986271482', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310176-7', 'นาย', 'ประณิธาณ', 'อึงพุทรา', 083, '63231A', '0910152657', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310178-7', 'นาย', 'บรรดาศักดิ์', 'กล้าหาญ', 071, '63231', '0982293050', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310179-7', 'นาย', 'ทรงพล', 'ปรือปรัก', 072, '63231', '0981070384', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310182-5', 'นาย', 'อภิลักษณ์', 'คำพิมพ์', 086, '63231', '0925279453', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310183-5', 'นาย', 'ธีรศักดิ์', 'สวนเพชร', 069, '63231B', '0879645210', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310184-5', 'นาย', 'เขตตภูมิ', 'ดีอุดม', 086, '63231', '0967712660', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310186-5', 'นาย', 'พงศกร', 'จงแผ่กลาง', 083, '63231A', '0967844346', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310188-5', 'นาย', 'อดิศักดิ์', 'ทิมจะโปะ', 075, '63231B', '0884771408', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310189-5', 'นาย', 'อนวัทย์', 'ศรีภิรมย์', 075, '63231B', '0958973594', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310192-3', 'นาย', 'ณัฐวรรธน์', 'คล้อยเอี่ยม', 072, '63231', '0624477366', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310193-3', 'นาย', 'อภิสิทธิ์', 'ตุ้มทอง', 072, '63231', '093-394-0226', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310194-3', 'นางสาว', 'ณัฐากรณ์', 'ชะรัดรัมย์', 071, '63231', '0982171489', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310195-3', 'นาย', 'ณัฐพล', 'สารพล', 072, '63231', '0949343811', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310197-3', 'นาย', 'อนุชา', 'พิมพ์ประสาน', 073, '63231', '0948618890', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310198-3', 'นาย', 'บุริมพล', 'ใจสุข', 084, '63231', '0949081292', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310200-1', 'นางสาว', 'เยาวเรศ', 'หวดขุนทด', 073, '63231', '0642909827', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310201-1', 'นาย', 'พีรพล', 'จัตุกูล', 084, '63231', '0625814012', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310202-1', 'นาย', 'ศักดิ์ชัย', 'เกิดบุตร', 071, '63231', '0656508636', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310203-1', 'นาย', 'กฤษดา', 'เก่าด่านจาก', 083, '63231A', '0643270294', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310206-1', 'นางสาว', 'พรนิภา', 'วชิมาเภท', 074, '63231B', '0862433061', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310207-1', 'นาย', 'ชายชาญ', 'เพียรพยุงพงษ์', 083, '63231A', '0836213529', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310208-1', 'นาย', 'อาทิตย์', 'ปัจยะฆัง', 075, '63231B', '0922504539', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310209-1', 'นาย', 'จักรภพ', 'เกลากลาง', 084, '63231', '0629868741', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310210-9', 'นาย', 'กฤษณะ', 'เหลาซื่อ', 075, '63231B', '0972356815', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310212-9', 'นาย', 'สิทธิพงษ์', 'จงรักษ์', 083, '63231B', '0801503720', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310214-9', 'นาย', 'รังสิมันต์', 'อาษากลาง', 076, '63231A', '0928190948', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310216-9', 'นาย', 'ณรงค์ศักดิ์', 'จันทร์คุ้ม', 074, '63231B', '0623690082', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310217-9', 'นาย', 'ปริญญา', 'พิรักษา', 075, '63231B', '0960649869', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310218-9', 'นาย', 'กัณฑ์เอนก', 'รักสุจริต', 069, '63231B', '0821350675', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310220-7', 'นาย', 'อภิรักษ์', 'คณะสุข', 075, '63231B', '0634860581', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310222-7', 'นาย', 'พชรพล', 'ศรีสาผา', 082, '63231', '0973155395', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310224-7', 'นาย', 'ศิวนนท์', 'จันทร์เพ็ชร', 072, '63231', '0616488375', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310225-7', 'นาย', 'ธนกร', 'สีอั่ง', 069, '63231B', '0871502577', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310226-7', 'นาย', 'พฤกษ์', 'โคตุทา', 083, '63231B', '0864102087', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310229-7', 'นาย', 'เจตน์นิมิต', 'สำราญกิจ', 074, '63231B', '0943657180', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310230-5', 'นาย', 'ธรรมรัตน์', 'สวัสดี', 071, '63231', '0625534080', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310231-5', 'นาย', 'กิตติศักดิ์', 'เมืองกลาง', 076, '63231A', '0999055196', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310232-5', 'นาย', 'จีรเดช', 'นีขุนทด', 083, '63231B', '0845824340', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310233-5', 'นาย', 'จิรัฏฐ์', 'เทพไพศาล', 072, '63231', '0997296693', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310236-5', 'นาย', 'คฑาวุฒิ', 'หลอดทอง', 083, '63231B', '0933477436', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310237-5', 'นาย', 'กมลวัชร', 'ราชโคตร', 071, '63231', '0836838063', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310238-5', 'นาย', 'ธนินชัย', 'เลิศชัยภูมิ', 075, '63231B', '0637907560', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310239-5', 'นาย', 'นิติภูมิ', 'ธรรมวงศ์', 075, '63231B', '089-8290096', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310240-3', 'นาย', 'อดิสรณ์', 'หัดไทยทระ', 075, '63231B', '0610283811', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310241-3', 'นาย', 'ณัฐพงศ์', 'เสาวพันธ์', 073, '63231', '0610904116', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310242-3', 'นาย', 'กวี', 'นวลสุธา', 073, '63231', '0646204555', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310243-3', 'นาย', 'กฤษฎา', 'ปานสันเทียะ', 073, '63231', '0660023970', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310244-3', 'นาย', 'ชนุตม์', 'อภิเมธีธำรง', 072, '63231', '0611026405', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310247-3', 'นาย', 'ศุภโชค', 'แซ่พ่าน', 079, '63231', '0641367257', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310248-3', 'นาย', 'อนุสรณ์', 'ออดไธสง', 079, '63231', '0955807001', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310252-0', 'นาย', 'วีรศักดิ์', 'โตเกิด', 076, '63231A', '0980030715', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310255-0', 'นาย', 'ปัณณวิชญ์', 'มาตย์ศรีกลาง', 082, '63231', '0810734315', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310256-0', 'นาย', 'วรัญญู', 'สัมฤทธิ์', 079, '63231', '0805341424', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310258-0', 'นาย', 'อภิยุทธ', 'ม่วงกลาง', 082, '63231', '0810688238', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310259-0', 'นาย', 'ณัฏฐณิช', 'โตใจ', 082, '63231', '0630539827', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310260-8', 'นาย', 'อัฐพล', 'ลมขุนทด', 082, '63231', '0981950642', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310261-8', 'นาย', 'สุธี', 'ศรีเล็ก', 074, '63231A', '0971921961', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310263-8', 'นาย', 'ภูมินทร์', 'ทองสอาด', 079, '63231', '0806237059', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310264-8', 'นาย', 'ศตวรรษ', 'ศรีจันทร์', 079, '63231', '0933911319', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310265-8', 'นาย', 'ยศกร', 'กรอบเพ็ชร', 085, '63231', '0610809412', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310268-8', 'นาย', 'ธนภูมิ', 'สายชมภู', 076, '63231A', '0911363701', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310269-8', 'นาย', 'ธนวัฒน์', 'กิติพงษ์', 082, '63231', '0653429399', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310270-6', 'นาย', 'ศิระ', 'ยอดคีรี', 082, '63231', '0973309963', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310271-6', 'นาย', 'ทักษิณ', 'สูงสุมาลย์', 074, '63231A', '0876936624', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310272-6', 'นาย', 'นพเก้า', 'ครั้งพิบูลย์', 074, '63231A', '0955748011', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310273-6', 'นาย', 'พัชรพล', 'เรือกิจ', 074, '63231A', '0639494400', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310276-6', 'นาย', 'ปกรณ์เกียรติ', 'หมอจิตร์', 079, '63231', '0953903014', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310278-6', 'นาย', 'วุฒินันท์', 'นิเรียงรัมย์', 082, '63231', '-', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310279-6', 'นาย', 'วุฒิชัย', 'โมรานอก', 082, '63231', '0618094311', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310281-4', 'นาย', 'จิตรทิวัส', 'ภูวงศ์', 074, '63231A', '0638596783', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310284-4', 'นางสาว', 'ปิยาพัชร', 'ผาเวช', 072, '63231', '0610312219', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310285-4', 'นางสาว', 'ชื่นจิต', 'แดงท่าขาม', 072, '63231', '0659538252', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310286-4', 'นาย', 'ฐิติพล', 'แก้วสา', 076, '63231A', '0958106745', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310287-4', 'นาย', 'ภูวนาท', 'เดือนจะโป๊ะ', 076, '63231A', '0653124896', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310288-4', 'นาย', 'นิติพงศ์', 'จันทาสี', 082, '63231', '0615751342', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310290-2', 'นาย', 'บุริศร์', 'วรรณกุล', 082, '63231', '0985903104', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310296-2', 'นาย', 'สุรยุทธ', 'หนองงูเหลือม', 074, '63231B', '0631125183', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310297-2', 'นาย', 'สิริพงษ์', 'มะณีนวล', 074, '63231B', '0616690191', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310298-2', 'นาย', 'เดชฤทธิ์', 'สงนอก', 074, '63231B', '0995320328', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310301-0', 'นาย', 'ธรรมจักร์', 'อาศัยน้ำ', 085, '63231', '-', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310302-0', 'นาย', 'นนธวัช', 'แก้วเลื่อน', 076, '63231A', '0923237317', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310303-0', 'นาย', 'อนุรักษ์', 'อาศัยนา', 082, '63231', '0800035081', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310304-0', 'นาย', 'อธิพัฒน์', 'ชัยภา', 082, '63231', '0632634668', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310305-0', 'นาย', 'ธนชาติ', 'รัตนสุนทรสิทธิ์', 082, '63231', '0952674979', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310306-0', 'นาย', 'ปฏิภาณ', 'ขันขาว', 074, '63231B', '0642704967', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310307-0', 'นาย', 'อภิสิทธิ์', 'รอดกลาง', 074, '63231B', '0928920217', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310315-8', 'นาย', 'พนัส', 'ปิตะบุตร', 074, '63231B', '0909798241', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310316-8', 'นาย', 'สุพลกฤษณ์', 'พรมพิลา', 076, '63231A', '0957472276', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310317-8', 'นาย', 'นิพิฐพนธ์', 'ท่วมสูงเนิน', 085, '63231', '082245166', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310318-8', 'นาย', 'อานนท์', 'สุทธาระชีวะศาสตร์', 074, '63231A', '0884805717', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310319-8', 'นาย', 'ธนากร', 'เชื้อกลางใหญ่', 075, '63231A', '0981164243', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310320-6', 'นาย', 'นันทวุฒิ', 'หล้าน้อย', 069, '63231A', '0800601867', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310321-6', 'นาย', 'ศราวุฒิ', 'พิลาม', 069, '63231A', '0982062522', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310323-6', 'นาย', 'พีระวัฒน์', 'พึ่งครบุรี', 083, '63231B', '0884822678', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310325-6', 'นาย', 'นนทกร', 'ศรีสอาด', 075, '63231A', '0875535284', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310326-6', 'นาย', 'พงศธร', 'อาษา', 075, '63231A', '0943088187', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310327-6', 'นาย', 'ตฤษนันท์', 'ยองประโคน', 075, '63231A', '0939563900', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310328-6', 'นาย', 'ธนพจน์', 'สินธิทา', 075, '63231A', '0899455799', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310329-6', 'นาย', 'เจนณรงค์', 'ชูรัตน์', 075, '63231A', '0925325629', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310330-4', 'นาย', 'อานันท์', 'สุทธาระชีวะศาสตร์', 075, '63231A', '0931036861', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310332-4', 'นางสาว', 'สุฑาทิพย์', 'อินทร์นอก', 069, '63231A', '0951367712', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310336-4', 'นาย', 'ธีรภัทร', 'ลีกระโทก', 076, '63231A', '0933577859', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310341-2', 'นาย', 'จักรี', 'กิ่งส้มกลาง', 075, '63231B', '0621054410', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310342-2', 'นาย', 'วันชัย', 'ศรีมูลตรี', 069, '63231A', '0971348694', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310343-2', 'นาย', 'เจนภพ', 'จันทร์ยม', 069, '63231A', '0984171429', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310345-2', 'นาย', 'จิรโชติ', 'มุราษี', 069, '63231A', '0951868614', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310347-2', 'นาย', 'ชัชวาลย์', 'ตากงูเหลือม', 069, '63231A', '0969750338', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310348-2', 'นาย', 'ธนัชพร', 'อุทัยแพน', 069, '63231B', '0967290869', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310349-2', 'นาย', 'สหรัฐ', 'เอกอิ่มผล', 069, '63231B', '-', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310351-9', 'นาย', 'ธวัชชัย', 'โลมกระโทก', 069, '63231B', '0841156304', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310352-9', 'นาย', 'ธวัชชัย', 'บุญกล้า', 069, '63231B', '0611486805', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310353-9', 'นาย', 'พันกร', 'วงษ์ศักดา', 069, '63231B', '0929784988', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310354-9', 'นาย', 'ปรีชานันท์', 'มะละปะที', 069, '63231B', '0966403963', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310355-9', 'นาย', 'สหรัฐ', 'อาสนพรรณ', 083, '63231B', '0933958665', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310356-9', 'นาย', 'ศิวพันธ์', 'จอมคําสิงห์', 083, '63231B', '0803316232', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310358-9', 'นาย', 'พิเศษ', 'ดีอยากได้', 083, '63231B', '0954027283', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310361-7', 'นาย', 'ปุญญพัฒน์', 'ปลั่งกลาง', 071, '63231', '0610636817', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310362-7', 'นาย', 'ชนาธิป', 'แสงฉาย', 071, '63231', '0880526396', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310363-7', 'นางสาว', 'วันวิสา', 'กลิ่นศรีสุข', 071, '63231', '0979677930', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310364-7', 'นาย', 'กฤษฎา', 'จิตรดวงจันทร์', 071, '63231', '0973303605', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310366-7', 'นางสาว', 'นฤภร', 'อาศัยป่า', 071, '63231', '0819664881', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310367-7', 'นาย', 'กฤษฎา', 'บุญเผย', 071, '63231', '0934083742', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310368-7', 'นาย', 'ภูชิต', 'หาญสุวรรณ์', 084, '63231', '0989473215', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310369-7', 'นาย', 'วัฒนา', 'นามมา', 073, '63231', '0643269957', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310370-5', 'นางสาว', 'ชนนิกานต์', 'มุ่งช่วยกลาง', 073, '63231', '0933421534', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310373-5', 'นางสาว', 'ธัณย์สุตา', 'พีระหิรัญสิริ', 073, '63231', '0934897255', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310374-5', 'นาย', 'ชินวัตร', 'ทับสูงเนิน', 084, '63231', '0832725342', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310375-5', 'นาย', 'อริญชย์', 'โพธิ์ศรี', 075, '63231B', '0622313465', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310378-5', 'นาย', 'จิรโชติ', 'ทองอ้วน', 075, '63231B', '0982318861', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310379-5', 'นาย', 'ทนงศักดิ์', 'บุญวัง', 075, '63231B', '083129327', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310380-3', 'นาย', 'วัชรพงษ์', 'คำชะนาม', 074, '63231B', '0640233219', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310382-3', 'นาย', 'สราวุฒิ', 'เซ่งเครือ', 069, '63231B', '0616294550', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310385-3', 'นาย', 'ศิวกร', 'พรหมสวัสดิ์', 071, '63231', '0906504911', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310390-1', 'นาย', 'ธนาวัฒน์', 'ปัชฌาบุตร', 069, '63231B', '-', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310392-1', 'นาย', 'นภัสกร', 'บุญทำนุก', 069, '63231A', '0652963917', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310396-1', 'นาย', 'อนุสรณ์', 'วงศ์คำ', 071, '63231', '0658030225', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310401-9', 'นาย', 'ดัชกร', 'นาทอง', 076, '63231A', '0890297544', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310402-9', 'นาย', 'วิวัฒน์', 'ใจมา', 076, '63231A', '0639420479', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310403-9', 'นาย', 'ธนพล', 'แสนโท', 075, '63231B', '0930819691', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310404-9', 'นาย', 'เอกพจน์', 'ตราศรี', 075, '63231B', '0838138698', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310408-9', 'นางสาว', 'วรารัตน์', 'สิงห์แหลม', 069, '63231A', '0842574660', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310411-7', 'นางสาว', 'สุวรรณี', 'ผิวฉิมพลี', 069, '63231A', '0935120874', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310412-7', 'นางสาว', 'ณัฐณิชา', 'ทรงศรี', 069, '63231A', '0610549098', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310413-7', 'นางสาว', 'ปรางค์วลัย', 'ศิริทัน', 069, '63231A', '0928467234', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310414-7', 'นาย', 'ณัฐิวุฒิ', 'บุญช่วย', 069, '63231B', '0621899002', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310415-7', 'นาย', 'อติเทพ', 'ศรีสว่าง', 069, '63231B', '0951372050', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310417-7', 'นาย', 'พงศธร', 'ยินดี', 086, '63231', '0903742441', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310418-7', 'นาย', 'ธนวรินทร์', 'จันทร์หอม', 086, '63231', '0636272832', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310422-5', 'นาย', 'รัชพล', 'สิทธิ์ขุนทด', 069, '63231B', '0981132512', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310425-5', 'นาย', 'สุรธรรม', 'ช่วยแป้น', 083, '63231B', '0611071152', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310426-5', 'นางสาว', 'รัญชนา', 'ทานประสิทธิ์', 083, '63231B', '095-5070266', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310427-5', 'นาย', 'วุฒิกร', 'สอนจะโปะ', 083, '63231B', '0982125976', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310429-5', 'นาย', 'วัชร์ธรพงศ์', 'อรุณใหม่', 083, '63231B', '0872441923', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310430-3', 'นาย', 'ธนวัฒน์', 'พฤษราพรมราช', 083, '63231B', '0630547880', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310431-3', 'นาย', 'กฤษณะ', 'บรรเทิงใจ', 083, '63231B', '0625547745', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310432-3', 'นาย', 'ณัฐพงศ์', 'คำกิ่ง', 071, '63231', '0902732258', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310433-3', 'นาย', 'ณัฐวัตร', 'แสวงเจริญ', 071, '63231', '0969923161', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310435-3', 'นาย', 'วิทวัสชัย', 'แสนกล้า', 071, '63231', '0610744629', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310436-3', 'นางสาว', 'รัญชิดา', 'ทานประสิทธิ์', 084, '63231', '0967860422', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310438-3', 'นาย', 'ธนพงษ์', 'ศรีวาที', 084, '63231', '0941013822', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310439-3', 'นาย', 'อธิป', 'โพธิ์โสภา', 084, '63231', '0930572615', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310440-1', 'นางสาว', 'นันท์สินี', 'เชื่อมโนนสูง', 084, '63231', '0842061612', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310444-1', 'นาย', 'ภูผา', 'ไชยดี', 073, '63231', '0890359196', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310445-1', 'นาย', 'ณัฐพร', 'ไข่ครบุรี', 073, '63231', '0803579762', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310446-1', 'นางสาว', 'ศุภดามาศ', 'แหชัย', 073, '63231', '0985592608', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310447-1', 'นาย', 'ธนากร', 'ทองอินทร์', 073, '63231', '0931412817', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310448-1', 'นาย', 'วรเมธ', 'มาประสงค์', 069, '63231B', '0639161348', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310449-1', 'นาย', 'ศิวโรจน์', 'อารมณ์ดี', 082, '63231', '0807273707', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310451-8', 'นาย', 'ชนาธิป', 'ลาดคำจันทร์', 069, '63231B', '0935079248', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310463-6', 'นาย', 'เลิศศักดิ์', 'พันธุ์ยาง', 082, '63231', '0652523816', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310467-6', 'นาย', 'นายประทีป', 'ทิศกระโทก', 086, '63231', '0923823305', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310472-4', 'นาย', 'พิตรพิบูลย์', 'ดีมาก', 069, '63231B', '0988457653', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310479-4', 'นาย', 'ชลนพ', 'มะลิหวล', 085, '63231', '0855230018', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310484-2', 'นาย', 'อนุสรณ์', 'งอกโพธิ์', 076, '63231B', '0990017397', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310486-2', 'นาย', 'วศิน', 'วีระเถกิงชีวี', 085, '63231', '0636157572', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310487-2', 'นาย', 'พัฒนพงศ์', 'รัตนนท์', 085, '63231', '-', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310488-2', 'นาย', 'วรวุฒิ', 'ตรวจมรรคา', 076, '63231B', '0931214813', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310490-0', 'นาย', 'อภิวัฒน์', 'อรชุน', 073, '63231', '0617322102', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310492-0', 'นาย', 'อรรถพร', 'พลแสน', 076, '63231B', '0958986040', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310494-0', 'นาย', 'ณภัทร', 'วรวงศ์', 076, '63231B', '0801514256', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310495-0', 'นาย', 'ฐานันดร', 'ชุดพิมาย', 079, '63231', '0934836393', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310496-0', 'นาย', 'อรัญ', 'บัวชิต', 073, '63231', '0997763416', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310500-8', 'นาย', 'อภิวัฒน์', 'เทพเนาว์', 076, '63231B', '0985988130', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310513-6', 'นาย', 'ภาคภูมิ', 'เจิมกลาง', 069, '63231A', '0935403342', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310515-6', 'นาย', 'จิรภัทร', 'มิลินโชติพงศ์', 069, '63231B', '0956171321', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310516-6', 'นาย', 'สมชาย', 'อุตธูร', 069, '63231B', '0953894320', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310517-6', 'นาย', 'นิธิวุฒิ', 'คัมภิรานนท์', 069, '63231B', '0811863446', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310520-4', 'นาย', 'เชษฐา', 'บัวดก', 069, '63231A', '0649412899', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310522-4', 'นางสาว', 'น้ำฝน', 'ธงกระโทก', 069, '63231A', '0931066672', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310524-4', 'นาย', 'ณัฐนัย', 'ศิลปานนท์', 082, '63231', '0925126792', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310526-4', 'นาย', 'วิชัย', 'เสียบกระโทก', 082, '63231', '0934736538', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310527-4', 'นาย', 'ดุษฏี', 'แสนฉิมพลี', 082, '63231', '0981087176', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310528-4', 'นาย', 'ชยพล', 'จีนสระน้อย', 082, '63231', '0800203715', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310530-2', 'นาย', 'สุทธิกรณ์', 'เฮ้าจันทึก', 082, '63231', '0649487592', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310531-2', 'นาย', 'สิทธิชัย', 'ครองเคหา', 085, '63231', '0640970857', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310532-2', 'นาย', 'ณัฐพล', 'หริ่งสำโรง', 082, '63231', '0948762225', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310535-2', 'นาย', 'จิรนันท์', 'เพ็งศรี', 075, '63231B', '0971790473', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310536-2', 'นาย', 'รัฐวุฒิ', 'สังข์วิลัย', 075, '63231B', '0891901306', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310538-2', 'นาย', 'วัชรพงศ์', 'แก้วไพทูลย์', 082, '63231', '0627792897', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310539-2', 'นาย', 'ธีรภัทร์', 'ฉัตรปิยานนท์', 082, '63231', '0983502909', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310540-0', 'นาย', 'ศราวุธ', 'อบอุ่น', 074, '63231B', '0631729582', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310542-0', 'นางสาว', 'พุธิตา', 'สีดาเสถียร', 085, '63231', '0630070814', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310544-0', 'นาย', 'อุเทน', 'ศิริกระจาย', 082, '63231', '0826051098', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310548-0', 'นาย', 'ศักดิภัทร', 'ทองเชื้อ', 079, '63231', '0646652689', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310550-7', 'นาย', 'จตุรพัฒน์พงษ์', 'ทันลา', 079, '63231', '0610718177', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63172310552-7', 'นาย', 'ศิริชัย', 'คำเพราะ', 082, '63231', '', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110002-5', 'นางสาว', 'พรรณวิษา', 'เคสะนอก', 104, '63251', '0986685171', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110003-5', 'นางสาว', 'พรวลัยรัตน์', 'จิตรสระน้อย', 097, '63241', '0619547207', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110006-5', 'นางสาว', 'ศตพร', 'พิลารัตน์', 106, '63241', '0621766108', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110007-5', 'นางสาว', 'จุฬาลักษณ์', 'ปะทิทัง', 103, '63251', '0933239404', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110011-3', 'นาย', 'ภูมิรพี', 'โพธิ์สาราช', 103, '63251', '0983655224', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110012-3', 'นาย', 'พงษ์เตชิต', 'วรรณบวร', 101, '63241A', '0934245634', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110014-3', 'นางสาว', 'วรรณกร', 'โปร่งสันเทียะ', 097, '63241', '0902931221', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110016-3', 'นางสาว', 'ชวัลลักษณ์', 'บุตรเงิน', 106, '63241', '0934094415', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110018-3', 'นางสาว', 'วริศรา', 'ครึ้มค้างพลู', 104, '63251', '0656326092', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110019-3', 'นางสาว', 'ปลายฟ้า', 'กุลนอก', 097, '63241', '0981055714', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110020-1', 'นาย', 'สันติ', 'ฟางหนองดู่', 107, '63241', '0981836618', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110021-1', 'นาย', 'ณัฐพงษ์', 'วิริยะพันธ์', 096, '63241A', '0935706163', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110023-1', 'นางสาว', 'ฐานัส', 'เบญจมาศ', 097, '63241', '0611420870', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110024-1', 'นางสาว', 'ภัชชา', 'เมืองสุวรรณ', 097, '63241', '0636194519', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110026-1', 'นางสาว', 'อรฌา', 'ทองคำ', 104, '63251', '0646057109', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110027-1', 'นางสาว', 'วรรณนิษา', 'ทบแก่น', 096, '63241A', '0829126553', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110028-1', 'นาย', 'อุดมศักดิ์', 'ดุกขุนทด', 101, '63241B', '0616761145', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110029-1', 'นาย', 'สุรชาติ', 'ลุนพุฒ', 097, '63241', '0611341479', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110032-9', 'นางสาว', 'วัชริยา', 'มุ้งกระโทก', 104, '63251', '0887016306', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110033-9', 'นางสาว', 'ปภาวรินท์', 'บางจาก', 103, '63251', '0646511746', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110034-9', 'นาย', 'ชนพล', 'ศิลาสิทธิ์', 103, '63251', '0933724248', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110035-9', 'นางสาว', 'กรกช', 'สามฮ่อ', 101, '63241B', '0945633647', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110041-7', 'นางสาว', 'พัชรี', 'หินดำ', 096, '63241B', '0998375483', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110042-7', 'นาย', 'อัษฎา', 'ลิอ่อนร่มย์', 101, '63241B', '0836068862?', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110045-7', 'นาย', 'กฤษติชัย', 'จันทร์แก้ว', 103, '63251', '0951297498', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110047-7', 'นาย', 'ธเนศวร', 'นอบไทย', 096, '63241A', '0918313438', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110049-7', 'นาย', 'ณภัทร', 'อังควิริยะโชติ', 107, '63241', '0981452820', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110051-4', 'นางสาว', 'อลิชา', 'ถนอมสิน', 107, '63241', '0983861726', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110052-4', 'นาย', 'อัมรินทร์', 'ภูมี', 097, '63241', '0934988994', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110054-4', 'นางสาว', 'ดารณีพร', 'ใจภักดี', 103, '63251', '087-563-1022', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110055-4', 'นาย', 'วิษณุรักษ์', 'ทองสาย', 103, '63251', '0943832329', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110057-4', 'นาย', 'ศุภเสกข์', 'สังข์สาลี', 097, '63241', '0960025853', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110059-4', 'นางสาว', 'ชิดชนก', 'โสภี', 104, '63251', '0622067488', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110062-2', 'นาย', 'ทัตพงศ์', 'ยันตบุตร', 097, '63241', '0946170858', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110063-2', 'นาย', 'ปณิธิ', 'บินไธสง', 097, '63241', '0804795945', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110064-2', 'นาย', 'อนุชิต', 'ธรรมบุตร', 101, '63241A', '0825572102', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110067-2', 'นาย', 'วิศรุต', 'แซ่ลี้', 107, '63241', '0931937893', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110068-2', 'นางสาว', 'สุธิดา', 'เลิศฤทธิ์ศิริกุล', 097, '63241', '0621829058', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110069-2', 'นางสาว', 'วิรดา', 'บัวผาง', 101, '63241A', '0899483102', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110070-0', 'นางสาว', 'วนิดา', 'ตุ่ยไธสง', 097, '63241', '0981624372', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110073-0', 'นางสาว', 'จิราภา', 'ป้อมจัตุรัส', 101, '63241A', '0941362483', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110077-0', 'นาย', 'รัชชานนท์', 'ถาเบ้า', 096, '63241A', '-', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110079-0', 'นาย', 'ธีรพัตร์', 'งามตะคุ', 097, '63241', '0636216729', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110080-8', 'นาย', 'กิตปกรณ์', 'ไหวพริบ', 104, '63251', '0821307170', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110081-8', 'นาย', 'กิตติศักดิ์', 'หาญรบ', 101, '63241A', '0815798236', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110082-8', 'นางสาว', 'นันทวดี', 'มาดี', 096, '63241A', '0657029432', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110084-8', 'นางสาว', 'วริศรา', 'ขบวนดี', 103, '63251', '0646034858', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110086-8', 'นางสาว', 'ไอลดา', 'ดอกกลาง', 101, '63241A', '0912159312', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110088-8', 'นาย', 'ปุรเชษฐ์', 'ยอดท่าหว้า', 096, '63241A', '-', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110090-6', 'นางสาว', 'อาทิตยา', 'ขุนทิพย์', 107, '63241', '0933543682', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110092-6', 'นางสาว', 'อัญชิษฐา', 'พงษ์ปราโมทย์', 104, '63251', '0931538181', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110093-6', 'นางสาว', 'กาญจนา', 'ทรงกลิ่น', 107, '63241', '0858568072', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110094-6', 'นางสาว', 'กนกวรรณ', 'สิมทะราช', 101, '63241A', '0624676815', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110095-6', 'นางสาว', 'อารีรัตน์', 'เรกระโทก', 101, '63241A', '0620040179', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110096-6', 'นาย', 'ธนโชติ', 'จันทร์ชู', 101, '63241A', '0649637903', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110097-6', 'นาย', 'สิทธิโชค', 'ศูนย์สูงเนิน', 101, '63241B', '0957148141', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110100-4', 'นาย', 'พลากร', 'แขขุนทด', 101, '63241B', '0996970352', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110101-4', 'นาย', 'วิสัยทัศน์', 'วชิระพัฒนกิจ', 101, '63241B', '-', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110102-4', 'นางสาว', 'ศศิวิมล', 'โทขุนทด', 101, '63241B', '0935260189', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110110-2', 'นางสาว', 'พิทยาภรณ์', 'นิ่มสุพรรณ', 101, '63241B', '0815470457', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110111-2', 'นาย', 'พฤกษ์', 'ภักดี', 101, '63241B', '062081295', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110118-2', 'นางสาว', 'กุลสตรี', 'มาเที่ยง', 096, '63241B', '0993833857', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110120-0', 'นางสาว', 'อพัชชา', 'ไกรกลาง', 097, '63241', '0621860419', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110121-0', 'นางสาว', 'จิดาภา', 'เดชพร', 107, '63241', '0915545831', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110124-0', 'นาย', 'โกเมนทร์', 'บวรธนภรณ์', 101, '63241A', '0988794955', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110128-0', 'นางสาว', 'กนกรดา', 'เนากูฏ', 103, '63251', '0942647003', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110130-8', 'นางสาว', 'ชมพูนุท', 'หวังกลุ่มกลาง', 104, '63251', '0832418353', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110132-8', 'นาย', 'ชินดนัย', 'โสพรรณตระกูล', 101, '63241A', '-', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110133-8', 'นาย', 'จิรภัทร', 'จันทรสุขวรากุล', 104, '63251', '083-415-2101', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110135-8', 'นางสาว', 'ไออรุณ', 'อุ่นเสือ', 101, '63241A', '0899863948', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110137-8', 'นางสาว', 'ศุภาวรรณ', 'ลุนคุณ', 101, '63241A', '0922797325', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110138-8', 'นางสาว', 'ศศินา', 'ศาลางาม', 101, '63241B', '0616893334', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110139-8', 'นางสาว', 'ภัทรดา', 'สาวิสัย', 103, '63251', '0638390073', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110143-6', 'นาย', 'นวพล', 'ก๋งฉิน', 101, '63241B', '0984759483', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110144-6', 'นาย', 'วรเมธ', 'สีคราม', 103, '63251', '0826350242', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110145-6', 'นาย', 'วีระพล', 'จำปาราช', 103, '63251', '0967731186', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110151-3', 'นาย', 'ธนิสร', 'ภู่ศิลป์', 096, '63241A', '0617504485', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110153-3', 'นางสาว', 'สาวิกา', 'บุญหวาน', 103, '63251', '0634933625', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110154-3', 'นาย', 'จิรภาส', 'พลเนตร', 106, '63241', '0630327527', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110155-3', 'นาย', 'ธิติวัฒน์', 'เตชะแสนสวัสดิ์', 106, '63241', '0621747726', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110156-3', 'นางสาว', 'อรปรียา', 'ขันติ', 096, '63241A', '0621591089', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110157-3', 'นาย', 'มงคล', 'สมสมัยพงศ์กุล', 103, '63251', '-', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110158-3', 'นางสาว', 'นภัสวรรณ', 'ท่าพิมาย', 103, '63251', '0649420251', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110162-1', 'นาย', 'จิรศักดิ์', 'หินกลาง', 107, '63241', '-', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110164-1', 'นาย', 'ภูริช', 'สำราญบำรุง', 103, '63251', '0846006290', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110167-1', 'นาย', 'กานต์', 'ตั้งประเสริฐวุฒิ', 107, '63241', '0910696765', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110168-1', 'นางสาว', 'เจนจิรา', 'สายน้อย', 107, '63241', '0936394957', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110169-1', 'นางสาว', 'อมรรัตน์', 'จารัตน์', 107, '63241', '0934735700', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110171-9', 'นางสาว', 'สุภาพร', 'แถมจะโป๊ะ', 107, '63241', '0955521787', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110172-9', 'นาย', 'สหชาติ', 'ช่วยพิมาย', 107, '63241', '0611137592', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110173-9', 'นางสาว', 'เมธาวี', 'นุ่มสพาน', 107, '63241', '-', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110175-9', 'นาย', 'ต้นน้ำ', 'คาดสนิท', 103, '63251', '0610317992', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110178-9', 'นาย', 'ธนวัฒน์', 'อินชู', 101, '63241A', '0636272001', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110183-7', 'นางสาว', 'สิริยศ', 'ยศยิ่งยง', 101, '63241A', '0844301877', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110185-7', 'นาย', 'พสุวัสต์', 'วรธรรม', 096, '63241B', '0814318193', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110186-7', 'นางสาว', 'เกวลิน', 'คำพันธ์', 097, '63241', '0950515621', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110187-7', 'นางสาว', 'ศุภษร', 'อินทรเสนา', 097, '63241', '0956056046', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110188-7', 'นางสาว', 'ปริญา', 'ช่างสาร', 097, '63241', '0887451582', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110189-7', 'นาย', 'ชัชนันท์', 'สมสวนจิต', 103, '63251', '0971283190', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110190-5', 'นาย', 'จักรกฤษณ์', 'ทองเกลี้ยง', 103, '63251', '0990413892', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110191-5', 'นางสาว', 'ณัฐธิดา', 'มีสมบัติ', 103, '63251', '0930626368', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110192-5', 'นางสาว', 'วรัญญา', 'เพียรธรรม', 106, '63241', '0930724763', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110193-5', 'นางสาว', 'นิตยา', 'มะโนบาล', 106, '63241', '0918296460', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110194-5', 'นางสาว', 'อภิญญา', 'เกตกลางดอน', 104, '63251', '0909967260', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110196-5', 'นาย', 'ธัญธวัช', 'ศิริดล', 103, '63251', '0630368332', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110198-5', 'นางสาว', 'นภัสรา', 'ปรุสูงเนิน', 101, '63241A', '0948907131', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110202-3', 'นาย', 'ไชยวัฒน์', 'ปรุสูงเนิน', 101, '63241B', '0635836711', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110203-3', 'นาย', 'ภานุพงศ์', 'ภพสูงเนิน', 097, '63241', '0658161369', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110204-3', 'นาย', 'วุฒิภัทร', 'ปิ่นแก้ว', 096, '63241A', '0644540263', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110206-3', 'นาย', 'สุพศิน', 'นองพงษ์สกุล', 104, '63251', '0972900719', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110207-3', 'นางสาว', 'วริศรา', 'แป่มสูงเนิน', 107, '63241', '0944810309', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110210-1', 'นางสาว', 'มินตรา', 'ประทุมชัน', 096, '63241B', '0840372739', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110214-1', 'นางสาว', 'ณัฐกานต์', 'แก้วดก', 103, '63251', '0890753075', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110217-1', 'นางสาว', 'ณริสสา', 'ภูมิจันทึก', 096, '63241A', '0934817026', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110219-1', 'นาย', 'ณัฐภูมิ', 'เอสันเทียะ', 097, '63241', '0857636742', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110220-9', 'นางสาว', 'ชลธิชา', 'ปฐพีภัทร', 106, '63241', '0886487520', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110221-9', 'นาย', 'ชิงชัย', 'คำพันธ์', 106, '63241', '0624431385', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110223-9', 'นาย', 'ศิวกร', 'วงษ์มนัส', 104, '63251', '-', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110225-9', 'นาย', 'กิติภูมิ', 'งานขุนทด', 097, '63241', '0631125941', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110228-9', 'นางสาว', 'นัยนา', 'สวายน้อย', 097, '63241', '0879162212', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110230-7', 'นาย', 'พงศ์เดช', 'มูลกระโทก', 106, '63241', '0981083849', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110232-7', 'นางสาว', 'ศศิกานต์', 'สมีดี', 104, '63251', '0990740878', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110234-7', 'นาย', 'ศุภกร', 'คันธจิตตกุล', 107, '63241', '0821266614', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110235-7', 'นาย', 'ปฏิพล', 'บุญเพ็ง', 096, '63241A', '0852066701', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110236-7', 'นาย', 'กฤษฏิ์', 'ก่านหงษ์', 097, '63241', '0885757379', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110237-7', 'นางสาว', 'กัลย์สุดา', 'พวกจันทึก', 097, '63241', '0933620097', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110239-7', 'นาย', 'อนุกูล', 'โคตมา', 096, '63241B', '0610697119', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110243-5', 'นางสาว', 'สุรางคนา', 'พาที', 097, '63241B', '0623917885', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110244-5', 'นาย', 'ดิชมากร', 'พึ่งทหาร', 162, '63241B', '0838023220', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110245-5', 'นาย', 'พงศกร', 'ทองคำ', 162, '63241B', '0621409197', 1, '');
INSERT INTO `student` (`std_code`, `nameTitle`, `fname`, `lname`, `branch_code`, `groupStd`, `phone`, `status`, `img`) VALUES
	('63182110254-2', 'นาย', 'เกรียงไกร', 'คุ้มกลาง', 096, '63241A', '0990234341', 1, '');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;

-- Dumping structure for table dormitory.student_cost
CREATE TABLE IF NOT EXISTS `student_cost` (
  `receiptNumber` varchar(50) NOT NULL,
  `studentId` varchar(15) DEFAULT NULL,
  `dorimitory` varchar(15) DEFAULT NULL,
  `electric_first` varchar(15) DEFAULT NULL,
  `water_first` varchar(15) DEFAULT NULL,
  `insurance` varchar(15) DEFAULT NULL,
  `term` varchar(15) DEFAULT NULL,
  `update_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `cashier` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`receiptNumber`,`update_time`),
  KEY `FK__student` (`studentId`),
  KEY `FK__user` (`cashier`),
  CONSTRAINT `FK__student` FOREIGN KEY (`studentId`) REFERENCES `student` (`std_code`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table dormitory.student_cost: ~18 rows (approximately)
DELETE FROM `student_cost`;
/*!40000 ALTER TABLE `student_cost` DISABLE KEYS */;
INSERT INTO `student_cost` (`receiptNumber`, `studentId`, `dorimitory`, `electric_first`, `water_first`, `insurance`, `term`, `update_time`, `cashier`) VALUES
	('0858656272', NULL, '0', '500', '0', '0', '1', '2020-09-21 18:09:25', 'admin2');
INSERT INTO `student_cost` (`receiptNumber`, `studentId`, `dorimitory`, `electric_first`, `water_first`, `insurance`, `term`, `update_time`, `cashier`) VALUES
	('11068', NULL, '0', '500', '0', '0', '1', '2020-09-28 07:54:58', 'admin2');
INSERT INTO `student_cost` (`receiptNumber`, `studentId`, `dorimitory`, `electric_first`, `water_first`, `insurance`, `term`, `update_time`, `cashier`) VALUES
	('11088', NULL, '0', '500', '0', '0', '1', '2020-10-05 06:44:06', 'admin2');
INSERT INTO `student_cost` (`receiptNumber`, `studentId`, `dorimitory`, `electric_first`, `water_first`, `insurance`, `term`, `update_time`, `cashier`) VALUES
	('1213969025', '60172110559-7', '5500', '0', '0', '0', '1', '2020-08-31 09:08:15', 'admin2');
INSERT INTO `student_cost` (`receiptNumber`, `studentId`, `dorimitory`, `electric_first`, `water_first`, `insurance`, `term`, `update_time`, `cashier`) VALUES
	('1234434', NULL, '5900', '500', '0', '0', '2', '2020-10-05 03:06:44', 'admin1');
INSERT INTO `student_cost` (`receiptNumber`, `studentId`, `dorimitory`, `electric_first`, `water_first`, `insurance`, `term`, `update_time`, `cashier`) VALUES
	('12345678', NULL, '50', '0', '0', '0', '2', '2020-09-28 05:37:23', 'admin1');
INSERT INTO `student_cost` (`receiptNumber`, `studentId`, `dorimitory`, `electric_first`, `water_first`, `insurance`, `term`, `update_time`, `cashier`) VALUES
	('12345678', NULL, '10', '0', '0', '0', '2', '2020-09-28 05:43:05', 'admin1');
INSERT INTO `student_cost` (`receiptNumber`, `studentId`, `dorimitory`, `electric_first`, `water_first`, `insurance`, `term`, `update_time`, `cashier`) VALUES
	('3037097961', NULL, '0', '500', '0', '0', '1', '2020-09-21 13:49:43', 'admin1');
INSERT INTO `student_cost` (`receiptNumber`, `studentId`, `dorimitory`, `electric_first`, `water_first`, `insurance`, `term`, `update_time`, `cashier`) VALUES
	('3102030590', '60162110523-6', '5000', '1000', '0', '0', '1', '2020-09-02 11:18:26', 'admin2');
INSERT INTO `student_cost` (`receiptNumber`, `studentId`, `dorimitory`, `electric_first`, `water_first`, `insurance`, `term`, `update_time`, `cashier`) VALUES
	('3122667740', NULL, '3500', '1000', '0', '400', '1', '2020-09-21 01:31:20', 'admin2');
INSERT INTO `student_cost` (`receiptNumber`, `studentId`, `dorimitory`, `electric_first`, `water_first`, `insurance`, `term`, `update_time`, `cashier`) VALUES
	('3126819948', NULL, '0', '1000', '0', '0', '1', '2020-09-22 16:50:01', 'admin2');
INSERT INTO `student_cost` (`receiptNumber`, `studentId`, `dorimitory`, `electric_first`, `water_first`, `insurance`, `term`, `update_time`, `cashier`) VALUES
	('4192722283', NULL, '500', '0', '450', '100', '1', '2020-09-21 01:40:24', 'admin2');
INSERT INTO `student_cost` (`receiptNumber`, `studentId`, `dorimitory`, `electric_first`, `water_first`, `insurance`, `term`, `update_time`, `cashier`) VALUES
	('5247233907', NULL, '6000', '0', '0', '500', '1', '2020-09-21 14:12:22', 'admin1');
INSERT INTO `student_cost` (`receiptNumber`, `studentId`, `dorimitory`, `electric_first`, `water_first`, `insurance`, `term`, `update_time`, `cashier`) VALUES
	('7362779303', NULL, '0', '0', '50', '0', '1', '2020-08-31 05:49:54', 'admin1');
INSERT INTO `student_cost` (`receiptNumber`, `studentId`, `dorimitory`, `electric_first`, `water_first`, `insurance`, `term`, `update_time`, `cashier`) VALUES
	('7422032733', '60162110523-6', '700', '0', '0', '0', '1', '2020-09-02 11:18:48', 'admin2');
INSERT INTO `student_cost` (`receiptNumber`, `studentId`, `dorimitory`, `electric_first`, `water_first`, `insurance`, `term`, `update_time`, `cashier`) VALUES
	('8012778298', NULL, '2000', '0', '0', '0', '1', '2020-08-31 05:49:44', 'admin1');
INSERT INTO `student_cost` (`receiptNumber`, `studentId`, `dorimitory`, `electric_first`, `water_first`, `insurance`, `term`, `update_time`, `cashier`) VALUES
	('8742017679', '60162110524-6', '4000', '0', '0', '0', '1', '2020-09-02 11:16:18', 'admin2');
INSERT INTO `student_cost` (`receiptNumber`, `studentId`, `dorimitory`, `electric_first`, `water_first`, `insurance`, `term`, `update_time`, `cashier`) VALUES
	('9383972343', '60172110559-7', '0', '800', '0', '0', '1', '2020-08-31 09:08:45', 'admin2');
/*!40000 ALTER TABLE `student_cost` ENABLE KEYS */;

-- Dumping structure for table dormitory.time
CREATE TABLE IF NOT EXISTS `time` (
  `time_number` int(12) NOT NULL AUTO_INCREMENT COMMENT 'รหัสเวลา',
  `std_code` varchar(15) NOT NULL COMMENT 'รหัสนักศึกษา',
  `date_stamp` date NOT NULL COMMENT 'วันที่',
  `time_stamp` varchar(8) NOT NULL COMMENT 'บันทึกเวลา',
  `time_status` tinyint(1) NOT NULL COMMENT 'สถานะการเข้าหอพัก',
  PRIMARY KEY (`time_number`),
  KEY `FK_std_code` (`std_code`),
  CONSTRAINT `FK_std_code` FOREIGN KEY (`std_code`) REFERENCES `student` (`std_code`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=utf8;

-- Dumping data for table dormitory.time: ~14 rows (approximately)
DELETE FROM `time`;
/*!40000 ALTER TABLE `time` DISABLE KEYS */;
INSERT INTO `time` (`time_number`, `std_code`, `date_stamp`, `time_stamp`, `time_status`) VALUES
	(130, '60172110142-4', '2021-03-11', '09:48', 0);
INSERT INTO `time` (`time_number`, `std_code`, `date_stamp`, `time_stamp`, `time_status`) VALUES
	(131, '60172110142-4', '2021-03-11', '09:48', 0);
INSERT INTO `time` (`time_number`, `std_code`, `date_stamp`, `time_stamp`, `time_status`) VALUES
	(132, '60172110142-4', '2021-03-11', '09:48', 0);
INSERT INTO `time` (`time_number`, `std_code`, `date_stamp`, `time_stamp`, `time_status`) VALUES
	(133, '60172110142-4', '2021-03-11', '09:48', 0);
INSERT INTO `time` (`time_number`, `std_code`, `date_stamp`, `time_stamp`, `time_status`) VALUES
	(134, '60152110053-6', '2021-03-11', '09:48', 0);
INSERT INTO `time` (`time_number`, `std_code`, `date_stamp`, `time_stamp`, `time_status`) VALUES
	(135, '60152110053-6', '2021-03-11', '09:49', 0);
INSERT INTO `time` (`time_number`, `std_code`, `date_stamp`, `time_stamp`, `time_status`) VALUES
	(136, '60152110030-1', '2021-03-11', '09:49', 0);
INSERT INTO `time` (`time_number`, `std_code`, `date_stamp`, `time_stamp`, `time_status`) VALUES
	(137, '63171110084-1', '2021-03-11', '09:49', 0);
INSERT INTO `time` (`time_number`, `std_code`, `date_stamp`, `time_stamp`, `time_status`) VALUES
	(138, '60152110030-1', '2021-03-11', '09:49', 0);
INSERT INTO `time` (`time_number`, `std_code`, `date_stamp`, `time_stamp`, `time_status`) VALUES
	(139, '60152110030-1', '2021-03-11', '09:50', 0);
INSERT INTO `time` (`time_number`, `std_code`, `date_stamp`, `time_stamp`, `time_status`) VALUES
	(140, '60152110053-6', '2021-03-11', '09:50', 0);
INSERT INTO `time` (`time_number`, `std_code`, `date_stamp`, `time_stamp`, `time_status`) VALUES
	(141, '60152110053-6', '2021-03-11', '09:50', 0);
INSERT INTO `time` (`time_number`, `std_code`, `date_stamp`, `time_stamp`, `time_status`) VALUES
	(142, '60152110053-6', '2021-03-11', '09:51', 0);
INSERT INTO `time` (`time_number`, `std_code`, `date_stamp`, `time_stamp`, `time_status`) VALUES
	(143, '60152110030-1', '2021-03-11', '09:51', 0);
INSERT INTO `time` (`time_number`, `std_code`, `date_stamp`, `time_stamp`, `time_status`) VALUES
	(144, '60172110142-4', '2021-03-11', '14:29', 0);
INSERT INTO `time` (`time_number`, `std_code`, `date_stamp`, `time_stamp`, `time_status`) VALUES
	(145, '60172110142-4', '2021-03-11', '14:29', 0);
INSERT INTO `time` (`time_number`, `std_code`, `date_stamp`, `time_stamp`, `time_status`) VALUES
	(146, '60172110142-4', '2021-04-20', '17:00', 0);
/*!40000 ALTER TABLE `time` ENABLE KEYS */;

-- Dumping structure for table dormitory.time_set
CREATE TABLE IF NOT EXISTS `time_set` (
  `noTime` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ลำดับ',
  `timeStart` varchar(8) NOT NULL COMMENT 'เวลาที่เข้าสาย',
  `timeEnd` varchar(8) NOT NULL COMMENT 'เวลาสิ้นสุดเข้าสาย',
  PRIMARY KEY (`noTime`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table dormitory.time_set: ~0 rows (approximately)
DELETE FROM `time_set`;
/*!40000 ALTER TABLE `time_set` DISABLE KEYS */;
INSERT INTO `time_set` (`noTime`, `timeStart`, `timeEnd`) VALUES
	(2, '1:0', '2:0');
/*!40000 ALTER TABLE `time_set` ENABLE KEYS */;

-- Dumping structure for table dormitory.user
CREATE TABLE IF NOT EXISTS `user` (
  `username` varchar(30) NOT NULL COMMENT 'ชื่อผู้ใช้',
  `password` varchar(100) DEFAULT NULL COMMENT 'รหัสผ่าน',
  `nameTitle` varchar(50) DEFAULT NULL,
  `fname` varchar(100) DEFAULT NULL,
  `lname` varchar(100) DEFAULT NULL,
  `personalId` varchar(50) DEFAULT NULL,
  `role` varchar(30) DEFAULT NULL,
  `type` int(20) DEFAULT NULL,
  PRIMARY KEY (`username`),
  KEY `FK_user_admin_type` (`type`),
  CONSTRAINT `FK_user_admin_type` FOREIGN KEY (`type`) REFERENCES `admin_type` (`type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table dormitory.user: ~7 rows (approximately)
DELETE FROM `user`;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`username`, `password`, `nameTitle`, `fname`, `lname`, `personalId`, `role`, `type`) VALUES
	('60172110466-6', '25d55ad283aa400af464c76d713c07ad', NULL, NULL, NULL, NULL, 'student', 0);
INSERT INTO `user` (`username`, `password`, `nameTitle`, `fname`, `lname`, `personalId`, `role`, `type`) VALUES
	('60172310132-2', '25d55ad283aa400af464c76d713c07ad', NULL, NULL, NULL, NULL, 'student', 0);
INSERT INTO `user` (`username`, `password`, `nameTitle`, `fname`, `lname`, `personalId`, `role`, `type`) VALUES
	('admin', '61007100', 'MR.', 'PHANUWIT', 'KITTIRONG', NULL, 'admin', 1);
INSERT INTO `user` (`username`, `password`, `nameTitle`, `fname`, `lname`, `personalId`, `role`, `type`) VALUES
	('admin1', '25d55ad283aa400af464c76d713c07ad', 'นางสาว', 'กัญจนพร', 'แสนเจียม', '1234567891234', 'admin', 1);
INSERT INTO `user` (`username`, `password`, `nameTitle`, `fname`, `lname`, `personalId`, `role`, `type`) VALUES
	('admin2', '25d55ad283aa400af464c76d713c07ad', 'นางสาว', 'กัญจนพร', 'แสนเจียม', '1234567891235', 'admin', 2);
INSERT INTO `user` (`username`, `password`, `nameTitle`, `fname`, `lname`, `personalId`, `role`, `type`) VALUES
	('admin3', '25d55ad283aa400af464c76d713c07ad', 'นางสาว', 'กัญจนพร', 'แสนเจียม', '1234567891236', 'admin', 3);
INSERT INTO `user` (`username`, `password`, `nameTitle`, `fname`, `lname`, `personalId`, `role`, `type`) VALUES
	('big', '13032518', 'MR.', 'PHANUWIT', 'KITTIRONG', NULL, 'admin', 1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

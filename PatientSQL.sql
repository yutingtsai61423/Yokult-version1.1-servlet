-- 創建資料庫
-- CREATE DATABASE `YOKULT`;

USE `YOKULT`;

-- 會員資料
DROP TABLE IF EXISTS `MEMBER`;

CREATE TABLE `MEMBER` (
  `MEMID` VARCHAR(50) NOT NULL COMMENT '會員帳號',
  `EMAIL` VARCHAR(320) NOT NULL COMMENT '會員信箱',
  `PASSWORD` VARCHAR(10) NOT NULL COMMENT '會員密碼',
  `FIRSTNAME` VARCHAR(10) NOT NULL COMMENT '會員姓氏',
  `LASTNAME` VARCHAR(10) NOT NULL COMMENT '會員名字',
  `BIRTH` DATETIME COMMENT '會員生日',
  `CELLPHONE` VARCHAR(10) NOT NULL COMMENT '手機號碼',
  `ADDR` VARCHAR(50) COMMENT '居住地址',
  PRIMARY KEY (`MEMID`))
COMMENT = '會員資料';

INSERT INTO 
  `MEMBER` (`MEMID`, `EMAIL`, `PASSWORD`, `FIRSTNAME`, `LASTNAME`, `BIRTH`, `CELLPHONE`, `ADDR`)
VALUES
  ('TGA001', 'tga001@gmail.com', '123', '家豪', '李', '2022-04-11', '0910123456', '110台北市信義區市府路45號'),
  ('TGA002', 'tga002@gmail.com', '123', '美玉', '王', '2022-05-01', '0912345678', '407台中市西屯區惠來路二段101號'),
  ('TGA003', 'tga003@gmail.com', '123', '志明', '張', '2022-05-31', '0972345678', '717台南市仁德區文華路二段66號'),
  ('TGA004', 'tga004@gmail.com', '123', '淑華', '劉', '2022-06-05', '0954567890', '803高雄市鹽埕區大勇路1號'),
  ('TGA005', 'tga005@gmail.com', '123', '俊傑', '陳', '2022-08-25', '0987654321', '944屏東縣車城鄉後灣路2號');

-- 刪除醫師表格 -- 
DROP TABLE IF EXISTS DOCTOR;
-- 新增醫師表格DOCTOR
CREATE TABLE DOCTOR (
	`DOCTOR_ALPHABET` VARCHAR(50) DEFAULT 'D00' COMMENT '醫師代表文字',
	`DOCTOR_ID` INT NOT NULL AUTO_INCREMENT COMMENT '醫師流水編號',
    `DOCTOR_NAME` VARCHAR(50) NOT NULL COMMENT '醫師姓名',
    `DOCTOR_PHOTO` LONGBLOB COMMENT'醫師照片',
    `DOCTOR_CERTIFICATE` VARCHAR(50) COMMENT '醫師證書字號',
    `DOCTOR_EMAIL` VARCHAR(50) COMMENT '醫師信箱',
    `DOCTOR_PASSWARD` VARCHAR(50) COMMENT '醫師密碼',
    PRIMARY KEY(DOCTOR_ID)
);

-- 刪除看診時段表格 
DROP TABLE  IF EXISTS DOCTOR_SCHEDULE;
-- 新增看診時段表
CREATE TABLE DOCTOR_SCHEDULE (
	`SERIAL_NUMBER` INT NOT NULL AUTO_INCREMENT COMMENT '流水編號',
    `DOCTOR_ALPHABET` VARCHAR(50) DEFAULT 'D00' COMMENT '醫師代表文字',
    `DOCTOR_ID` INT NOT NULL COMMENT '醫師編號',
    `DOCTOR_SCHEDULE_DATE` DATE COMMENT '醫師看診日期',
    `DOCTOR_AMPM` VARCHAR(50) COMMENT '看診時段',
    `DOCTOR_STATUS` INT DEFAULT 1 COMMENT '看診狀態',
    PRIMARY KEY (`SERIAL_NUMBER`),
    CONSTRAINT FK_DOCTOR_SCHEDULE_DOCTOR_ID FOREIGN KEY (DOCTOR_ID) REFERENCES DOCTOR(DOCTOR_ID)
);

-- 刪除病人表格 
DROP TABLE  IF EXISTS PATIENT;
-- 建立病人表格 PATIENT
CREATE TABLE PATIENT (
	`SERIAL_NUMBER` INT NOT NULL AUTO_INCREMENT COMMENT '流水編號',
	`MEMID` VARCHAR(50) COMMENT '會員帳號',
	`PATIENT_IDCARD` VARCHAR(50) NOT NULL COMMENT '身分證字號',
	`BOOKING_DATE` DATE NOT NULL COMMENT '預約日期',
	`AMPM` VARCHAR(50) COMMENT '預約時段',
    `BOOKING_NUMBER` INT  COMMENT '預約號碼',
    `DOCTOR_ALPHABET` VARCHAR(50) DEFAULT 'D00' COMMENT '醫師代表文字',
    `DOCTOR_ID` INT COMMENT '醫師編號',
    `CHECKIN_CONDITION` INT DEFAULT 0 COMMENT '報到狀態',
    `CHART` TEXT COMMENT '病歷內容',
    PRIMARY KEY(`SERIAL_NUMBER`),
    CONSTRAINT FK_PATIENT_MEMBER_ID FOREIGN KEY (MEMID) REFERENCES MEMBER(MEMID),
    CONSTRAINT FK_PATIENT_DOCTOR_ID FOREIGN KEY (DOCTOR_ID) REFERENCES DOCTOR(DOCTOR_ID)
);

-- 新增測試資料
-- 新增醫師
INSERT INTO DOCTOR(DOCTOR_NAME, DOCTOR_PHOTO, DOCTOR_CERTIFICATE, DOCTOR_EMAIL, DOCTOR_PASSWARD ) VALUES
('吳貫鴻' ,NULL ,'0003388', 'doctordavid@gmail.com', '123456'),
('吳勇智' ,NULL ,'0003377', 'doctorpeter@gmail.com', '123456');
-- 新增醫師看診時段
INSERT INTO DOCTOR_SCHEDULE (DOCTOR_ID, DOCTOR_SCHEDULE_DATE, DOCTOR_AMPM, DOCTOR_STATUS) VALUES
(1, '2022-07-12', '早', 1),
(1, '2022-07-13', '早', 1),
(1, '2022-07-14', '早', 1),
(1, '2022-07-15', '午', 1),
(1, '2022-07-16', '早', 1),
(1, '2022-07-17', '早', 1),
(1, '2022-07-18', '午', 1),
(1, '2022-07-19', '早', 1),
(1, '2022-07-20', '早', 1),
(1, '2022-07-22', '早', 1),
(1, '2022-07-22', '晚', 1),
(1, '2022-07-23', '午', 1),
(1, '2022-07-24', '晚', 1),
(1, '2022-07-27', '午', 1),
(1, '2022-07-28', '午', 1),
(1, '2022-07-29', '早', 1),
(1, '2022-08-01', '早', 1),
(1, '2022-08-02', '早', 1),
(1, '2022-08-03', '午', 1),
(1, '2022-08-04', '早', 1),
(1, '2022-08-05', '早', 1),
(1, '2022-08-09', '午', 1),
(1, '2022-08-11', '早', 1),
(1, '2022-08-13', '早', 1),
(1, '2022-08-15', '午', 1),
(1, '2022-08-16', '早', 1),
(1, '2022-08-17', '早', 1),
(1, '2022-08-18', '午', 1),
(1, '2022-08-19', '早', 1),
(1, '2022-08-20', '早', 1),
(1, '2022-08-22', '早', 1),
(1, '2022-08-22', '晚', 1),
(1, '2022-08-23', '午', 1),
(1, '2022-08-24', '晚', 1),
(1, '2022-08-27', '午', 1),
(1, '2022-08-28', '午', 1),
(1, '2022-08-29', '晚', 1),
(1, '2022-08-30', '午', 1),
(1, '2022-08-31', '午', 1),
(2, '2022-08-01', '晚', 1),
(2, '2022-08-02', '早', 1),
(2, '2022-08-03', '午', 1),
(2, '2022-08-06', '晚', 1),
(2, '2022-08-07', '晚', 1),
(2, '2022-08-08', '午', 1),
(2, '2022-08-11', '晚', 1),
(2, '2022-08-13', '晚', 1),
(2, '2022-08-14', '晚', 1),
(2, '2022-08-15', '早', 1),
(2, '2022-08-17', '早', 1),
(2, '2022-08-17', '晚', 1),
(2, '2022-08-18', '晚', 1),
(2, '2022-08-19', '晚', 1),
(2, '2022-08-20', '晚', 1),
(2, '2022-08-21', '晚', 1),
(2, '2022-08-22', '早', 1),
(2, '2022-08-22', '晚', 1),
(2, '2022-08-23', '午', 1),
(2, '2022-08-24', '晚', 1),
(2, '2022-08-27', '晚', 1),
(2, '2022-08-28', '晚', 1),
(2, '2022-08-29', '早', 1),
(2, '2022-08-30', '晚', 1),
(2, '2022-08-31', '晚', 1),
(1, '2022-09-01', '早', 1),
(1, '2022-09-02', '早', 1),
(1, '2022-09-03', '午', 1),
(1, '2022-09-04', '早', 1),
(1, '2022-09-05', '早', 1),
(1, '2022-09-09', '午', 1),
(1, '2022-09-11', '早', 1),
(1, '2022-09-13', '早', 1),
(1, '2022-09-15', '午', 1),
(1, '2022-09-16', '早', 1),
(1, '2022-09-17', '早', 1),
(1, '2022-09-18', '午', 1),
(1, '2022-09-19', '早', 1),
(1, '2022-09-20', '早', 1),
(1, '2022-09-22', '早', 1),
(1, '2022-09-22', '晚', 1),
(1, '2022-09-23', '午', 1),
(1, '2022-09-24', '晚', 1),
(1, '2022-09-27', '午', 1),
(1, '2022-09-28', '午', 1),
(1, '2022-09-29', '晚', 1),
(1, '2022-09-30', '午', 1),
(2, '2022-09-01', '晚', 1),
(2, '2022-09-02', '早', 1),
(2, '2022-09-03', '午', 1),
(2, '2022-09-06', '晚', 1),
(2, '2022-09-07', '晚', 1),
(2, '2022-09-09', '午', 1),
(2, '2022-09-11', '晚', 1),
(2, '2022-09-13', '晚', 1),
(2, '2022-09-14', '晚', 1),
(2, '2022-09-15', '早', 1),
(2, '2022-09-17', '早', 1),
(2, '2022-09-17', '晚', 1),
(2, '2022-09-18', '晚', 1),
(2, '2022-09-19', '晚', 1),
(2, '2022-09-20', '晚', 1),
(2, '2022-09-21', '晚', 1),
(2, '2022-09-22', '早', 1),
(2, '2022-09-22', '晚', 1),
(2, '2022-09-23', '午', 1),
(2, '2022-09-24', '晚', 1),
(2, '2022-09-27', '晚', 1),
(2, '2022-09-28', '晚', 1),
(2, '2022-09-29', '早', 1),
(2, '2022-09-30', '晚', 1);

-- 新增掛號資料
INSERT INTO PATIENT(MEMID, PATIENT_IDCARD, BOOKING_DATE, AMPM, BOOKING_NUMBER, DOCTOR_ID, CHECKIN_CONDITION, CHART) VALUES
('TGA001','A123456789', '2022-07-12', '早', 1, 1,1, "主訴:患者表示左邊第一顆門牙疼痛。
診斷:齲齒。
治療內容:根管治療。
建議:加強每日三餐牙線清潔與漱口水使用。"),
('TGA002','B123456789', '2022-07-16', '早', 1, 1,1, "主訴:定期洗牙回診
診斷:檢查後無異狀
治療內容:全口洗牙
建議:持續維持目前清潔習慣"),
('TGA001','A123456789', '2022-07-20', '早', 1, 1, 1,"主訴:患者希望牙齒變白\n診斷:無。\n治療內容:上排牙齒冷光美白療程\n建議:第一周會較痠痛，建議搭配抗敏感牙膏使用"),
('TGA002','B123456789', '2022-07-22', '早', 1, 2, 0,""),
('TGA001','A123456789', '2022-07-23', '午', 1, 2, 0, ""),
('TGA002','B123456789', '2022-07-27', '午', 1, 2, 0, ""),
('TGA002','B123456789', '2022-07-28', '午', 1, 2, 0, "");

-- 修改病歷資料
-- UPDATE PATIENT SET CHART = "在病歷上記載病人同意你所建議的治療、處置或者用藥等。例如病人同意你所建議的蛀牙處置方式，或者選擇你所建議的選項中的哪一項，這些記載就是病人自己選擇及同意最好的證明。"
-- WHERE BOOKING_DATE="2022-07-16" AND DOCTOR_ID = "1";
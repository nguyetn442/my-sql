DROP DATABASE IF EXISTS TestingSystem;

CREATE DATABASE TestingSystem;

USE TestingSystem;


CREATE TABLE Department(
DepartmentID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
DepartmentName NVARCHAR(30) NOT NULL UNIQUE KEY
);


CREATE TABLE `Position` (
PositionID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
PositionName ENUM('Dev','Test','Scrum Master','PM') NOT NULL UNIQUE
KEY
);


CREATE TABLE `Account`(
AccountID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY
KEY,
Email VARCHAR(50) NOT NULL UNIQUE KEY,
Username VARCHAR(50) NOT NULL UNIQUE KEY,
FullName NVARCHAR(50) NOT NULL,
DepartmentID TINYINT UNSIGNED NOT NULL,
PositionID TINYINT UNSIGNED NOT NULL,
CreateDate DATETIME DEFAULT NOW(),
FOREIGN KEY(DepartmentID) REFERENCES Department(DepartmentID),
FOREIGN KEY(PositionID) REFERENCES `Position`(PositionID)
);


CREATE TABLE `Group`(
GroupID TINYINT UNSIGNED AUTO_INCREMENT
PRIMARY KEY,

GroupName NVARCHAR(50) NOT NULL UNIQUE KEY,
CreatorID TINYINT UNSIGNED,
CreateDate DATETIME DEFAULT NOW(),
FOREIGN KEY(CreatorID) REFERENCES `Account`(AccountId)
);


CREATE TABLE GroupAccount(
GroupID TINYINT UNSIGNED NOT NULL,
AccountID TINYINT UNSIGNED NOT NULL,
JoinDate DATETIME DEFAULT NOW(),
PRIMARY KEY (GroupID,AccountID),
FOREIGN KEY(GroupID) REFERENCES `Group`(GroupID),
FOREIGN KEY(AccountID) REFERENCES `Account`(AccountID)
);


CREATE TABLE TypeQuestion (
TypeID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
TypeName ENUM('Essay','Multiple-Choice') NOT NULL UNIQUE KEY
);


CREATE TABLE CategoryQuestion(
CategoryID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
CategoryName NVARCHAR(50) NOT NULL UNIQUE KEY
);


CREATE TABLE Question(
QuestionID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Content NVARCHAR(100) NOT NULL,
CategoryID TINYINT UNSIGNED NOT NULL,
TypeID TINYINT UNSIGNED NOT NULL,
CreatorID TINYINT UNSIGNED NOT NULL,

CreateDate DATETIME DEFAULT NOW(),
FOREIGN KEY(CategoryID) REFERENCES CategoryQuestion(CategoryID),
FOREIGN KEY(TypeID) REFERENCES TypeQuestion(TypeID),
FOREIGN KEY(CreatorID) REFERENCES `Account`(AccountId)
);


CREATE TABLE Answer(
AnswerID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Content NVARCHAR(100) NOT NULL,
QuestionID TINYINT UNSIGNED NOT NULL,
isCorrect BIT DEFAULT 1,
FOREIGN KEY(QuestionID) REFERENCES Question(QuestionID)
);


CREATE TABLE Exam(
ExamID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY
KEY,
`Code` CHAR(10) NOT NULL,
Title NVARCHAR(50) NOT NULL,
CategoryID TINYINT UNSIGNED NOT NULL,
Duration TINYINT UNSIGNED NOT NULL,
CreatorID TINYINT UNSIGNED NOT NULL,
CreateDate DATETIME DEFAULT NOW(),
FOREIGN KEY(CategoryID) REFERENCES CategoryQuestion(CategoryID),
FOREIGN KEY(CreatorID) REFERENCES `Account`(AccountId)
);


CREATE TABLE ExamQuestion(
ExamID TINYINT UNSIGNED NOT NULL,
QuestionID TINYINT UNSIGNED NOT NULL,
FOREIGN KEY(QuestionID) REFERENCES Question(QuestionID),

FOREIGN KEY(ExamID) REFERENCES Exam(ExamID) ,
PRIMARY KEY (ExamID,QuestionID)
);
INSERT INTO Department(DepartmentName)
VALUES

(N'Marketing' ),
(N'Sale' ),
(N'Bảo vệ' ),
(N'Nhân sự' ),
(N'Kỹ thuật' ),
(N'Tài chính' ),
(N'Phó giám đốc'),
(N'Giám đốc' ),
(N'Thư kí' ),
(N'No person' ),
(N'Bán hàng' );

INSERT INTO Position (PositionName )
VALUES ('Dev' ),
('Test' ),
('Scrum Master'),
('PM' );

INSERT INTO `Account`(Email , Username
, FullName , DepartmentID , PositionID,

CreateDate)
VALUES ('Email1@gmail.com' ,
'Username1' ,'Fullname1' , '5' , '1'
,'2020-03-05'),

('Email2@gmail.com' ,
'Username2' ,'Fullname2' , '1' , '2'
,'2020-03-05'),

('Email3@gmail.com' , 'Username3' ,'Fullname3'

, '2' , '2' ,'2020-03-07'),

('Email4@gmail.com' , 'Username4' ,'Fullname4'

, '3' , '4' ,'2020-03-08'),

('Email5@gmail.com' , 'Username5' ,'Fullname5'

, '4' , '4' ,'2020-03-10'),

('Email6@gmail.com' , 'Username6' ,'Fullname6'

, '6' , '3' ,'2020-04-05'),

('Email7@gmail.com' , 'Username7' ,'Fullname7'
, '2' , '2' , NULL ),
('Email8@gmail.com' , 'Username8' ,'Fullname8'

, '8' , '1' ,'2020-04-07'),

('Email9@gmail.com' , 'Username9' ,'Fullname9'

, '2' , '2' ,'2020-04-07'),
('Email10@gmail.com' , 'Username10' ,'Fullname10'

, '10' , '1' ,'2020-04-09'),

('Email11@gmail.com' , 'Username11' ,'Fullname11'

, '10' , '1' , DEFAULT),

('Email12@gmail.com' , 'Username12'
,'Fullname12' , '10' , '1' , DEFAULT);
INSERT INTO `Group` ( GroupName , CreatorID , CreateDate)
VALUES (N'Testing System' , 5
,'2019-03-05'),

(N'Development' , 1

,'2020-03-07'),
(N'VTI Sale 01' , 2 ,'2020-03-09'),
(N'VTI Sale 02' , 3 ,'2020-03-10'),
(N'VTI Sale 03' , 4 ,'2020-03-28'),
(N'VTI Creator' , 6 ,'2020-04-06'),
(N'VTI Marketing 01' , 7 ,'2020-04-07'),
(N'Management' , 8 ,'2020-04-08'),
(N'Chat with love' , 9 ,'2020-04-09'),
(N'Vi Ti Ai' , 10 ,'2020-04-10');
INSERT INTO `GroupAccount` ( GroupID , AccountID , JoinDate )
VALUES ( 1 , 1
,'2019-03-05'),

( 1 , 2

,'2020-03-07'),

( 3 , 3

,'2020-03-09'),

( 3 , 4

,'2020-03-10'),

( 5 , 5

,'2020-03-28'),

( 1 , 3

,'2020-04-06'),

( 1 , 7

,'2020-04-07'),

( 8 , 3

,'2020-04-08'),

( 1 , 9

,'2020-04-09'),

( 10 , 10

,'2020-04-10');

INSERT INTO TypeQuestion (TypeName )
VALUES ('Essay' ),
('Multiple-Choice' );

INSERT INTO CategoryQuestion (CategoryName )
VALUES ('Java' ),
('ASP.NET' ),
('ADO.NET' ),
('SQL' ),
('Postman' ),
('Ruby' ),
('Python' ),
('C++' ),
('C Sharp' ),
('PHP' );

INSERT INTO Question (Content , CategoryID, TypeID , CreatorID
, CreateDate )
VALUES (N'Câu hỏi về Java' , 1 ,
'1' , '2' ,'2020-04-05'),

(N'Câu Hỏi về PHP' , 10 ,

'2' , '2' ,'2020-04-05'),

(N'Hỏi về C#' , 9 ,

'2' , '3' ,'2020-04-06'),

(N'Hỏi về Ruby' , 6 ,

'1' , '4' ,'2020-04-06'),

(N'Hỏi về Postman' , 5 ,

'1' , '5' ,'2020-04-06'),

(N'Hỏi về ADO.NET' , 3 ,

'2' , '6' ,'2020-04-06'),

(N'Hỏi về ASP.NET' , 2 ,

'1' , '7' ,'2020-04-06'),

(N'Hỏi về C++' , 8 ,

'1' , '8' ,'2020-04-07'),

(N'Hỏi về SQL' , 4 ,

'2' , '9' ,'2020-04-07'),

(N'Hỏi về Python' , 7 ,

'1' , '10' ,'2020-04-07');
INSERT INTO Answer ( Content , QuestionID , isCorrect )
VALUES (N'Trả lời 01' , 1 , 0
),

(N'Trả lời 02' , 1 , 1

),
(N'Trả lời 03', 1 , 0 ),
(N'Trả lời 04', 1 , 1 ),
(N'Trả lời 05', 2 , 1 ),
(N'Trả lời 06', 3 , 1 ),
(N'Trả lời 07', 4 , 0 ),
(N'Trả lời 08', 8 , 0 ),
(N'Trả lời 09', 9 , 1 ),
(N'Trả lời 10', 10 , 1 );

INSERT INTO Exam (`Code` , Title , CategoryID
, Duration , CreatorID , CreateDate )
VALUES ('VTIQ001' , N'Đề thi C#' ,
1 , 60 , '5' ,'2019-04-05'),
('VTIQ002' , N'Đề thi PHP' ,
10 , 60 , '2' ,'2019-04-05'),
('VTIQ003' , N'Đề thi C++' , 9 ,
120 , '2' ,'2019-04-07'),
('VTIQ004' , N'Đề thi Java' , 6 , 60

, '3' ,'2020-04-08'),

('VTIQ005' , N'Đề thi Ruby' , 5 , 120

, '4' ,'2020-04-10'),

('VTIQ006' , N'Đề thi Postman' , 3 ,
60 , '6' ,'2020-04-05'),
('VTIQ007' , N'Đề thi SQL' , 2 ,
60 , '7' ,'2020-04-05'),
('VTIQ008' , N'Đề thi Python' , 8 ,
60 , '8' ,'2020-04-07'),
('VTIQ009' , N'Đề thi ADO.NET' , 4 ,
90 , '9' ,'2020-04-07'),
('VTIQ010' , N'Đề thi ASP.NET' , 7 ,
90 , '10' ,'2020-04-08');

INSERT INTO ExamQuestion(ExamID , QuestionID )
VALUES ( 1 , 5 ),
( 2 , 10 ),
( 3 , 4 ),
( 4 , 3 ),
( 5 , 7 ),
( 6 , 10 ),
( 7 , 2 ),
( 8 , 10 ),
( 9 , 9 ),
( 10 , 8 );

select * from department;

select departmentid from department where DepartmentName = N'Sale';

SELECT * FROM `Account` WHERE LENGTH(Fullname) = (SELECT MAX(LENGTH(Fullname)) FROM `Account`)
ORDER BY Fullname DESC;

WITH cte_dep3 AS
(
SELECT * FROM `Account` WHERE DepartmentID =3
)
SELECT * FROM `cte_dep3`
WHERE LENGTH(Fullname) = (SELECT MAX(LENGTH(Fullname)) FROM `cte_dep3`)
ORDER BY Fullname ASC;

SELECT GroupName FROM `Group` WHERE CreateDate < '2019-12-20';

SELECT * FROM testingsystem.answer;
SELECT a.QuestionID, count(a.QuestionID) AS SL FROM answer a GROUP BY a.QuestionID HAVING count(a.QuestionID) >=4;

SELECT `Code` FROM Exam WHERE Duration >= 60 AND CreateDate < '2019-12-20';

SELECT * FROM `Group` ORDER BY CreateDate DESC LIMIT 5;

SELECT departmentID, count(accountID) AS SL from `Account` where departmentID=2;

SELECT Fullname from `Account` where (SUBSTRING_INDEX(Fullname,'',-1)) like 'D%o';

DELETE FROM Exam WHERE createdate < '2019-12-20';

DELETE FROM `question` WHERE (SUBSTRING_INDEX(Content,'',2)) ='câu hỏi';
 
UPDATE `Account` SET Fullname = N'Nguyễn Bá Lộc',
Email = 'loc.nguyenba@vti.com.vn'
WHERE AccountID = 5;

UPDATE `GroupAccount` SET AccountID = 5 WHERE GroupID = 4;
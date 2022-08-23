CREATE DATABASE testing_system_assignment_1;
use testing_system_assignment_1;

create table department (
	departmentID varchar(50),
    DepartmentName varchar(50)
);

create table Position (
	PositionID varchar(50),
    PositionName varchar(50)
);

create table Accout (
	AccountID varchar(50),
    Email varchar(50),
    Username varchar(50),
    FullName varchar(50),
    DepartmantID varchar(50),
    PositionID varchar(50),
    CreateDate date
);

CREATE TABLE `Group` (
	GroupID varchar(50),
    GroupName varchar(50),
    creatorID  varchar(50),
    createDate date
);

create table GroupAccount (
	GroupID varchar(50),
    AccountID varchar(50),
    JoinDate date
);

create table typeQuestion(
	TypeID varchar(50),
    TypeName varchar(50)
);

create table CategoryQuestion (
	CategoryID varchar(50),
    categoryName varchar(50)
);

create table Question (
	QuestionID varchar(50),
    Content varchar(50),
    CategoryID varchar(50),
    TypeID varchar(50),
    Creator varchar(50),
    CreateDate date
    
);

Create table Answer (
	AnswerID varchar(50),
    Content varchar(50),
    QuestionID varchar(50),
    isCorrect varchar(50)
);

Create table Exam (
	ExamID varchar(50),
    `Code` int,
    Title varchar(50),
    CategoryID varchar(50),
    Durration int,
    CreatorID varchar(50),
    CreateDate date
);

Create table ExamQuestion (
	ExamID varchar(50),
    QuestionID varchar(50)
);

alter table exam
	drop column code_a
DROP table IF EXISTS exam;
Create table Exam (
	ExamID varchar(50),
    `Code` int,
    Title varchar(50),
    CategoryID varchar(50),
    Durration int,
    CreatorID varchar(50),
    CreateDate date
);
DROP table IF EXISTS group_a;
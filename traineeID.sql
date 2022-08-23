create table Trainee(
TraineeID varchar(50),
Full_Name varchar(50),
Birth_Date date,
Gender varchar(50),
ET_IQ int check (ET_IQ>=0 and ET_IQ<=20 ),
ET_Gmath int check (ET_Gmath>=0 and ET_Gmath<=20 ),
ET_English int check (ET_English>=0 and ET_English<=50 ),
Training_Class char(50),
Evaluation_Notes text,
VTI_Account char(50) not null unique
);

create table data_types(
	ID int auto_increment primary key,
	name varchar(50),
	code nvarchar(5),
	modifieddate date
);

create table data_type_2(
	ID int auto_increment primary key,
	name varchar(50),
	Birthday date,
	Gender tinyint
);
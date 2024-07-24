create table Doctor
(
name nvarchar(30) not null ,
LastName nvarchar(40) not null ,
gender bit not null ,
code int constraint D_code_PK primary key not null,
OfficeNum int constraint OfficeNum_D default 1 ,
expertise nvarchar(40) not null,
WorkHours tinyint constraint workH_D default 10,
phoneNumber nvarchar(11) not null 
)
create table HeadNurse
(
name nvarchar(30) not null,
lastName nvarchar(40) not null,
gender bit not null, 
age int ,
NurseCode int constraint Nurse_c primary key not null,
WorkHours tinyint constraint workH_D default 20,
phoneNumber nvarchar(11) not null 
)
create table medicine
(
name nvarchar(40) unique not null ,
MedCode int constraint Code_medicine primary key not null, 
expireDate date default 1/1/2023 , 
Number int not null ,
price int not null
)
create table expenses
(
code int constraint code_exp primary key not null,
MedPrice int not null , 
DoctorPrice int not null ,
NursePrice int not null , 
facilityPrice int not null , 
Total int not null 
)
create table Adultpatient
(
name nvarchar(30) not null,
lastName nvarchar(40) not null,
codeMeli int not null ,
gender bit not null, 
age int constraint age_AdultP check (age >= 18), 
FatherName nvarchar(30),
AP_code int constraint AP_code_PK primary key not null,
hight int ,
weight int ,
desease nvarchar(100) not null,
RoomNumber int constraint roomNum_AP default 1 ,
phoneNumber nvarchar(11) not null ,
doctor int constraint doctorCode_AP foreign key references Doctor(code),
nurse int constraint nurse_AP foreign key references HeadNurse(NurseCode),
medicine int constraint medicine_AP foreign key references medicine(MedCode),
expenses_c int constraint expenses_AP foreign key references expenses(code)
)
create table Kidpatient
(
name nvarchar(30) not null,
lastName nvarchar(40) not null,
codeMeli int not null ,
gender bit not null, 
age int constraint age_AdultP check (age < 18), 
FatherName nvarchar(30),
KP_code int constraint KP_code_PK primary key not null,
hight int ,
weight int ,
desease nvarchar(100) not null,
RoomNumber int constraint roomNum_KP default 1 ,
phoneNumber nvarchar(11) not null ,
doctor int constraint doctorCode_KP foreign key references Doctor(code),
nurse int constraint nurse_KP foreign key references HeadNurse(NurseCode),
medicine int constraint medicine_KP foreign key references medicine(MedCode),
expenses_c int constraint expenses_AP foreign key references expenses(code)
)


--give values to the tables
insert into Doctor values('ali','hoseini',0 ,400,2,'ortoped',30, 09356662985)
insert into Doctor values('sara','pakan',1 ,450,4,'govaresh',20, 09124558733)
insert into HeadNurse values('mahtab','shirazi',0 ,40,300,40,09028772842)
insert into medicine values('asprin' , 1001 ,5,20000)

--delete the doctor with code 400
delete from Doctor
where code in(400)

--select all the info of the doctor wich has the code 450
select *
from Doctor
where code in(450)



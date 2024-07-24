create database Insurace

create table management
(
name nvarchar(50) not null,
lastName nvarchar(100) not null,
id int constraint id_pk primary key
)

create table DamageAssessmentExpert
(
name nvarchar(50) not null,
lastName nvarchar(100) not null,
id int constraint id_DAE_pk primary key
)

create table insuranceExpert
(
name nvarchar(50) not null,
lastName nvarchar(100) not null,
id int constraint id_IE_pk primary key
)

create table customer
(
name nvarchar(50) not null,
lastName nvarchar(100) not null,
id int constraint id_C_pk primary key
)

create table financeExpert
(
name nvarchar(50) not null,
lastName nvarchar(100) not null,
id int constraint id_FE_pk primary key
)

create table report1
(
id_management int constraint id_M_report1_FK foreign key references management(id),
id_DamageAssessmentExpert int constraint id_DAE_report1_FK foreign key references DamageAssessmentExpert(id),
num int not null
)

create table report2
(
id_management int constraint id_M_report2_FK foreign key references management(id),
id_insuranceExpert int constraint id_IE_report2_FK foreign key references insuranceExpert(id),
num int not null
)

create table insuranceCheck
(
id_DamageAssessmentExpert int constraint id_DAE_IC_FK foreign key references DamageAssessmentExpert(id),
id_insuranceExpert int constraint id_IE_IC_FK foreign key references insuranceExpert(id),
)

create table finanaceReport
(
id_management int constraint id_M_FR_FK foreign key references management(id),
id_insuranceExpert int constraint id_IE_FR_FK foreign key references insuranceExpert(id),
money int not null
)

create table insuranceRequest
(
id_insuranceExpert int constraint id_IE_IR_FK foreign key references insuranceExpert(id),
id_customer int constraint id_C_IR_FK foreign key references customer(id),
accepted bit default 0 
)

insert into management values('saba' , 'razi' , 1)
insert into DamageAssessmentExpert values('reyhane' , 'shahrokhian' , 5)
insert into insuranceExpert values('ali','sadeghi', 10)
insert into insuranceExpert values('sina','rezayi', 15)
insert into insuranceExpert values('hasti','hemati', 20)
insert into insuranceExpert values('mahasti','heshmati', 25)
insert into insuranceExpert values('saye','naeemi', 30)
insert into customer values('maryam','jafari', 100)
insert into financeExpert values ('mohammad' , 'salamati' , 3)

select top 2*
from insuranceExpert

select * from insuranceExpert
where name like '%hasti'

select * from insuranceExpert
where id between 10 and 20

select * from insuranceExpert
order by name

declare @hold int = 20
select lastName 
from insuranceExpert
where @hold > id 

create procedure pro_Hold
as
declare @hold int = 20
begin
select lastName 
from insuranceExpert
where @hold > id 
end

pro_Hold


create trigger tri_Hold 
on finanaceReport 
after insert 
as
begin 
insert into finanaceReport(money) values (10000)
end

insert into finanaceReport values(1,10,22) 
select * from finanaceReport

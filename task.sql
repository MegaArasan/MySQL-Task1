-- create user table
create database guvi;
use  guvi;

create table users(
id int not null auto_increment,
username varchar(20),
courses varchar(20),
email varchar(20) not null,
mentors varchar(10),
primary key (id)
);

insert into users(username,courses,email,mentors)
values("megam","Full Stack Developer","megam@gmail.com","raghav");
insert into users(username,courses,email,mentors)
values("arasan","Data Scientist","arasan@gmail.com","mohammed");
insert into users(username,courses,email,mentors)
values("mano","Full Stack Developer","mano@gmail.com","raghav");
insert into users(username,courses,email,mentors)
values("karthick","Data Scientist","kartick@gmail.com","mohammed");
insert into users(username,courses,email,mentors)
values("raghav","","raghav@gmail.com","");

select * from users;

-- create codekata table
use guvi;

create table codekata(
user_id int not null,
stringproblem int,
numberproblem int,
arrayproblem int
);

insert into codekata(user_id,stringproblem,numberproblem,arrayproblem)
values(1,18,25,45);
insert into codekata(user_id,stringproblem,numberproblem,arrayproblem)
values(2,25,65,45);
insert into codekata(user_id,stringproblem,numberproblem,arrayproblem)
values(3,56,23,87);
insert into codekata(user_id,stringproblem,numberproblem,arrayproblem)
values(4,23,85,65);
insert into codekata(user_id,stringproblem,numberproblem,arrayproblem)
values(5,23,45,65);
select * from codekata;

-- create attendance table
use guvi;

create table attendance(
user_id int ,
attendance_percent int not null
);

insert into attendance(user_id,attendance_percent)
values(1,90);
insert into attendance(user_id,attendance_percent)
values(2,65);
insert into attendance(user_id,attendance_percent)
values(3,79);
insert into attendance(user_id,attendance_percent)
values(4,29);
insert into attendance(user_id,attendance_percent)
values(5,100);

select * from attendance;

-- create table topics
use guvi;

create table topics(
months text not null,
topics text not null,
mentor text not null
);

insert into topics(months,topics,mentor)
values ("june","introduction to react","raghav");
insert into topics(months,topics,mentor)
values ("july","express js","raghav");
insert into topics(months,topics,mentor)
values ("august","node js","raghav");
insert into topics(months,topics,mentor)
values ("sep","mongo db","raghav");
insert into topics(months,topics,mentor)
values ("june","introduction to data scientist","mohammed");

select * from topics;

-- create table tasks
use guvi;

create table tasks(
user_id int not null,
tasks_completed int,
pending_tasks int
);

insert into tasks(user_id,tasks_completed,pending_tasks)
values(1,25,5);
insert into tasks(user_id,tasks_completed,pending_tasks)
values(2,2,28);
insert into tasks(user_id,tasks_completed,pending_tasks)
values(3,15,15);
insert into tasks(user_id,tasks_completed,pending_tasks)
values(4,18,12);
insert into tasks(user_id,tasks_completed,pending_tasks)
values(5,20,10);

select * from tasks;

-- create table company_drives
use guvi;

create table company_drives(
user_id int not null,
attended_drives int 
);

insert into company_drives(user_id,attended_drives)
values(1,7);
insert into company_drives(user_id,attended_drives)
values(2,1);
insert into company_drives(user_id,attended_drives)
values(3,25);
insert into company_drives(user_id,attended_drives)
values(4,18);
insert into company_drives(user_id,attended_drives)
values(5,3);

select * from company_drives;

-- create table mentors
use guvi;

create table mentors(
mentor_id int not null,
mentor_name text not null,
courses_taken text not null
);

insert into mentors(mentor_id,mentor_name,courses_taken)
values (1,"raghav","Full Stack Developement");
insert into mentors(mentor_id,mentor_name,courses_taken)
values (2,"mohammed","Data Scientist");
insert into mentors(mentor_id,mentor_name,courses_taken)
values (3,"mano","javascript");
insert into mentors(mentor_id,mentor_name,courses_taken)
values (4,"raghav kumar","Front End Development");
insert into mentors(mentor_id,mentor_name,courses_taken)
values (5,"arasan","Back End Developemeny");

select * from mentors;

-- create table students_activated_courses
use guvi;

create table students_activated_courses(
course_id int not null,
course_name text not null,
user_id int not null
);

insert into  students_activated_courses(course_id,course_name,user_id)
values(101,"Full Stack Developmemnt",1);
insert into  students_activated_courses(course_id,course_name,user_id)
values(102,"Data Scientist",2);
insert into  students_activated_courses(course_id,course_name,user_id)
values(101,"Full Stack Developmemnt",3);
insert into  students_activated_courses(course_id,course_name,user_id)
values(102,"Data Scientist",4);

select * from students_activated_courses;

-- create table courses
use guvi;

create table courses(
course_id int not null,
course_name text not null
);

insert into courses(course_id,course_name)
values (101,"Full Stack Developement");
insert into courses(course_id,course_name)
values (102,"Data Scientist");
insert into courses(course_id,course_name)
values (103,"javascript");
insert into courses(course_id,course_name)
values (104,"Front End Development");
insert into courses(course_id,course_name)
values (105,"Back End Developemeny");

select * from courses;

-- QUERIES
-- 1. get number problems solved in codekata by combining the users
select sum(numberproblem) from codekata;

-- 2. display the no of company drives attended by a user
select * from company_drives;

--  5. combine and display students_activated_courses and courses for a specific user groping them based on the course
select * from students_activated_courses
join courses on students_activated_courses.course_id=courses.course_id;

-- list all the mentors
select mentor_name from mentors;

-- list the number of students that are assigned for a mentor
select distinct mentors, count(username) as students  from users
group by mentors;
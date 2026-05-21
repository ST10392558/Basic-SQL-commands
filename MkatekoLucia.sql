create database myDB;
use myDB;
create table customer (
customer_id int, 
customer_fullname varchar(50),
customer_email varchar(20)
);
select * from customer;
insert into customer 
values(1, "Debbie Duncan", "dduncan@gmail.com"); 
select customer_fullname from customer;

create table orders (
order_id int,
order_number int,
customer_ID int,
order_date date);

insert into orders values(
1, 020149, 1, "2024-02-14");
select * from orders;

UPDATE orders SET order_date = '2024-02-13' WHERE order_id = 1;
SET SQL_SAFE_UPDATES = 0; 

delete from orders where order_id = 1;

create table patient(
patientID int,
patientName varchar (30),
patientSurname varchar (30),
patientDOB date);
select*from patient;

insert into patient values(1, "Debbie", "Theart", "1980-03-17"),
						  (2, "Thomas", "Duncan", "1976-08-12");

create table doctor(
doctorID int,
doctorName varchar(30),
doctorSurname varchar(30));

insert into doctor values (1, "Zintle", "Nukani"),
						  (2, "Ravi", "Maharaj");

create table appointments(
appointmentID int,
patientID int,
doctorID int,
appointmentDate date,
appointmentTime time,
appointmentDuration int);
select*from appointments;
 insert into appointments values (1, 1, 2, "2024-01-15", "09:00", 15),
								 (2, 2, 2, "2024-01-18", "15:00", 30),
								 (3, 1, 1, "2024-01-20", "10:00", 15),
                                 (4, 1, 2, "2024-01-21", "11:00", 15);
select*from appointments where appointmentDate >= "2024-01-16" and appointmentDate<= "2024-01-20";

select patientName, patientSurname,                              
COUNT(appointmentID) AS total_appointments
from patient
join appointments on appointments.patientID = patient.patientID
group by patient.patientID, patient.patientName, patient.patientSurname ORDER BY total_appointments DESC;    /*This SQL statement is used to display the names and surnames of patients with the 
total number of appointments they have and the results are in descending order 
based on the number of appointments*/ 

SELECT 
    appointments.appointmentDate,
    appointments.appointmentTime,
    doctor.doctorName,
    doctor.doctorSurname,
    patient.patientName,
    patient.patientSurname
FROM appointments
JOIN doctor ON appointments.doctorID = doctor.doctorID
JOIN patient ON appointments.patientID = patient.patientID
ORDER BY appointments.appointmentDate DESC;           /*This SQL statement is used to display all the appointments. The statement 
displays the appointment date (in descending order), the time, the doctor's 
name and surname, and the patient's name and surname */

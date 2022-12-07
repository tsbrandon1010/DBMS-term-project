IF NOT EXISTS (select * from sys.databases
					where Name = 'BrandonDB')
	Create Database BrandonDB;
go 
use BrandonDB;

IF EXISTS(select * from sys.tables
				where Name = 'Student')
	DROP TABLE dbo.Student;
go

if EXISTS(select * from sys.tables
				where Name = 'StudentCategory')
	DROP TABLE dbo.studentCategory;
go


IF EXISTS(select * from sys.tables
				where Name = 'NextOfKin')
	DROP TABLE dbo.NextOfKin;
go

IF EXISTS(select * from sys.tables
				where Name = 'Adviser')
	DROP TABLE dbo.Adviser;
go

IF EXISTS(select * from sys.tables
				where Name = 'StudentFlats')
	DROP TABLE dbo.StudentFlats;
go

IF EXISTS(select * from sys.tables
				where Name = 'HallsOfResidence')
	DROP TABLE dbo.HallsOfResidence;
go

IF EXISTS(select * from sys.tables
				where Name = 'ResidenceStaff')
	DROP TABLE dbo.ResidenceStaff;
go

IF EXISTS(select * from sys.tables
				where Name = 'ApartmentInspections')
	DROP TABLE dbo.ApartmentInspections;
go

IF EXISTS(select * from sys.tables
				where Name = 'Payment')
	DROP TABLE dbo.Payment;
go

IF EXISTS(select * from sys.tables
				where Name = 'Invoices')
	DROP TABLE dbo.Invoices;
go

IF EXISTS(select * from sys.tables
				where Name = 'Leases')
	DROP TABLE dbo.Leases;
go

IF EXISTS(select * from sys.tables
				where Name = 'Rooms')
	DROP TABLE dbo.Rooms;
go

IF EXISTS(select * from sys.tables
				where Name = 'Courses')
	DROP TABLE dbo.Courses;
go

IF EXISTS(select * from sys.tables
				where Name = 'CourseInstructor')
	DROP TABLE dbo.CourseInstructor;
go

IF EXISTS(select * from sys.tables
				where Name = 'AddressTBL')
	DROP TABLE dbo.AddressTBL;
go


CREATE TABLE dbo.AddressTBL (
	addressNo int NOT NULL PRIMARY KEY,
	street varchar(255),
	city varchar(255),
	postCode int
);

CREATE TABLE dbo.Rooms (
	placeNo int NOT NULL PRIMARY KEY,
	roomNo int NOT NULL,
	monthlyRentRate int NOT NULL
);

CREATE TABLE dbo.StudentCategory (
	studentCategoryNo int NOT NULL PRIMARY KEY,
	schoolYear int CHECK (schoolYear > 0 AND schoolYear < 7),
	category varchar(50) CHECK (category = 'Undergraduate' OR
								 category = 'Postgraduate')
);

CREATE TABLE dbo.Adviser (
	adviserNo int NOT NULL PRIMARY KEY,
	firstName varchar(100),
	lastName varchar(100),
	position varchar(100),
	nameOfDepartment varchar(255),
	phoneNo char(10),
	email varchar(100),
	roomNumber int
);

CREATE TABLE dbo.NextOfKin (
	nextOfKinNo int NOT NULL PRIMARY KEY,
	firstName varchar(100),
	lastName varchar(100),
	relationship varchar(100),
	addressNo int NOT NULL,
	phoneNo char(10),
	FOREIGN KEY (addressNo) REFERENCES AddressTBL(addressNo)
);

CREATE TABLE dbo.StudentFlats (
	flatNo int NOT NULL PRIMARY KEY,
	apartmentNo int NOT NULL,
	addressNo int NOT NULL,
	numberOfRooms int CHECK (numberOfRooms > 2 AND numberOfRooms < 6),
	placeNo int NOT NULL,
	FOREIGN KEY (addressNo) REFERENCES AddressTBL(addressNo),
	FOREIGN KEY (placeNo) REFERENCES Rooms(placeNo)
);

CREATE TABLE dbo.ResidenceStaff (
	staffNo int NOT NULL PRIMARY KEY,
	firstName varchar(100),
	lastName varchar(100),
	email varchar(100),
	dateOfBirth DATE,
	gender varchar(100),
	position varchar(100) CHECK (position = 'Hall Manager' OR 
								 position = 'Administrative Assistant' OR
								 position = 'Cleaner'),
	workLocation varchar(100) CHECK (workLocation = 'Residence Office' OR
									 workLocation = 'Hall')
);

CREATE TABLE dbo.HallsOfResidence (
	residenceNo int NOT NULL PRIMARY KEY,
	hallName varchar(100),
	addressNo int NOT NULL,
	phoneNo char(10),
	hallManagerNo int NOT NULL,
	placeNo int NOT NULL,
	FOREIGN KEY (addressNo) REFERENCES AddressTBL(addressNo),
	FOREIGN KEY (hallManagerNo) REFERENCES ResidenceStaff(staffNo),
	FOREIGN KEY (placeNo) REFERENCES Rooms(placeNo)
);

CREATE TABLE dbo.Student (
	bannerNo int NOT NULL PRIMARY KEY,
	firstName varchar(100),
	lastName varchar(100),
	addressNo int NOT NULL,
	phoneNo char(10),
	email varchar(100),
	dateOfBirth DATE,
	gender varchar(100),
	nationality varchar(255),
	specialAccomidations varchar(255),
	currentStatus varchar(255) CHECK (currentStatus = 'Placed' or currentStatus = 'Waiting'),
	major varchar(255),
	minor varchar(255),
	adviserNo int NOT NULL,
	residenceNo int,
	flatNo int,
	placeNo int,
	nextOfKinNo int,

	FOREIGN KEY (addressNo) REFERENCES AddressTBL(addressNo),
	FOREIGN KEY (bannerNo) REFERENCES StudentCategory(studentCategoryNo),
	FOREIGN KEY (adviserNo) REFERENCES Adviser(adviserNo),
	FOREIGN KEY (nextOfKinNo) REFERENCES NextOfKin(nextOfKinNo),
	FOREIGN KEY (residenceNo) REFERENCES HallsOfResidence(residenceNo),
	FOREIGN KEY (flatNo) REFERENCES StudentFlats(flatNo),
	FOREIGN KEY (placeNo) REFERENCES Rooms(placeNo)
);


CREATE TABLE dbo.ApartmentInspections (
	staffNo int NOT NULL,
	dateOfInspection DATE NOT NULL,
	placeNo int NOT NULL,
	flatNo int NOT NULL,
	propertyStatus varchar(3) CHECK (propertyStatus = 'Yes' or propertyStatus = 'No'),
	additionalComments varchar(255),
	FOREIGN KEY (staffNo) REFERENCES ResidenceStaff(staffNo),
	FOREIGN KEY (placeNo) REFERENCES Rooms(placeNo),
	FOREIGN KEY (flatNo) REFERENCES StudentFlats(flatNo)
);

CREATE TABLE dbo.Payment (
	paymentNo int PRIMARY KEY,
	datePayed DATE,
	paymentMethod varchar(100),
	firstReminderDate DATE,
	secondReminderDate DATE
);

CREATE TABLE dbo.Leases (
	leaseNo int NOT NULL PRIMARY KEY,
	durationOfLease int, --- in months
	bannerNo int NOT NULL,
	placeNo int NOT NULL,
	residenceNo int,
	flatNo int,
	roomEnterDate DATE NOT NULL,
	roomExitDate DATE,
	FOREIGN KEY(bannerNo) REFERENCES Student(bannerNo),
	FOREIGN KEY(placeNo) REFERENCES Rooms(placeNo),
	FOREIGN KEY(residenceNo) REFERENCES HallsOfResidence(residenceNo),
	FOREIGN KEY(flatNo) REFERENCES StudentFlats(flatNo)
);

CREATE TABLE dbo.Invoices (
	invoiceNo int NOT NULL PRIMARY KEY,
	leaseNo int NOT NULL,
	semester varchar(100),
	paymentDue DATE NOT NULL,
	bannerNo int NOT NULL,
	paymentNo int NOT NULL,
	FOREIGN KEY (leaseNo) REFERENCES Leases(leaseNo),
	FOREIGN KEY (paymentNo) REFERENCES Payment(paymentNo)
);

CREATE TABLE dbo.CourseInstructor (
	instructorNo INT NOT NULL PRIMARY KEY,
	firstName varchar(100),
	lastName varchar(100),
	phoneNo char(10),
	email varchar(100),
	roomNo int,
	departmentName varchar(100)
);

CREATE TABLE dbo.Courses (
	sectionNo INT NOT NULL PRIMARY KEY,
	courseNo int,
	courseTitle varchar(255),
	instructorNo int NOT NULL,
	FOREIGN KEY (instructorNo) REFERENCES CourseInstructor(instructorNo)
);


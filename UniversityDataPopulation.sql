use BrandonDB

Insert Into AddressTBL(addressNo, street, city, postCode)
Values (216, '32230 12 Mile Road', 'Farmington Hills', 48336), (789, '2210 Middlebelt Road', 'Farmington Hills', 48336), 
		(437, '5639 Grand River Avenue', 'Farmington', 48321), (422, '5608 Orchard Lake Road', 'Farmington', 48321),
		(120, '5673 10 Mile Road', 'Southfield', 48033), (156, '2234 Merriman Road', 'Livonia', 48152), (237, '4437 Big Beaver Road', 'Troy', 48007);

Insert Into StudentCategory(studentCategoryNo, schoolYear, category)
Values (1, 3, 'Undergraduate'), (2, 1, 'Postgraduate');

Insert Into Adviser(adviserNo, firstName, lastName, position, nameOfDepartment, phoneNo, email, roomNumber)
Values (3233, 'John', 'Doe', 'Instructor', 'Computer Science', 3438880000, 'johnDoe@ltu.edu', 329),
		(5639, 'Rick', 'Man', 'Instructor', 'Political Science', 3439805555, 'rickMan@ltu.edu', 430);

Insert Into NextOfKin(nextOfKinNo, firstName, lastName, relationship, addressNo, phoneNo)
Values (121, 'Parent', 'Brandon', 'Parent', 216, 2489990000);

Insert Into StudentFlats(flatNo, apartmentNo, addressNo, numberOfRooms)
Values (0023, 117, 789, 3);

Insert Into ResidenceStaff(staffNo, firstName, lastName, email, dateOfBirth, gender, position, workLocation, addressNo)
Values (0113, 'Chloe', 'Morningstar', 'chloeMorningstar@ltu.edu', '1992-10-02', 'Female', 'Hall Manager', 'Hall', 120),
	   (1193, 'Jeff', 'Grey', 'jgrey@ltu.edu', '1960-12-03', 'Male', 'Administrative Assistant', 'Residence Office', 156),
	   (8893, 'Jerome', 'Powell', 'jpow@ltu.edu', '1961-04-02', 'Male', 'Cleaner', 'Hall', 237);

Insert Into HallsOfResidence(residenceNo, hallName, addressNo, phoneNo, hallManagerNo)
Values (3273, 'Ridley Hall', 437, 3709996789, 0113), (3253, 'Riley Hall', 437, 3709996789, 0113);

Insert Into Rooms(placeNo, roomNo, monthlyRentRate, residenceNo, flatNo)
Values (1190, 120, 500, NULL, 0023), (1120, 131, 430, 3273, NULL), (1430, 121, 450, NULL, 0023), (3340, 127, 400, 3273, NULL), (1269, 137, 500, 3253, NULL);

Insert Into Student(bannerNo, firstName, lastName, addressNo, studentCategoryNo, phoneNo, email, dateOfBirth, gender,
					nationality, specialAccomidations, currentStatus, major, minor,
					adviserNo, residenceNo, flatNo, placeNo, nextOfKinNo)
Values (000769693, 'Thomas', 'Brandon', 216, 1, 2480000000, 'tbrandon@ltu.edu', '2002-10-10', 'Male', 'American', 'None', 'Placed', 'Computer Science', 'None',
		3233, NULL, 0023, 1190, 121), (111090304, 'Katie', 'Brandon', 216, 1, NULL, 'kbrandon@cmu.edu', '2004-09-03', 'Female', 'American', 'None', 'Waiting', 'Mathematics',
								'Education', 3233, 3273, NULL, 1120, 121), (999912345, 'Ryan', 'Servis', 422, 2, 1234445698, 'ryanservis@gvsu.edu', '2000-06-07', 'Male',
																	  'American', 'None', 'Placed', 'Political Science', 'Law', 5639, NULL, 0023, 1430, NULL);

Insert Into ApartmentInspections(staffNo, dateOfInspection, placeNo, flatNo, propertyStatus, additionalComments)
Values (0113, '2022-12-06', 1190, 0023, 'Yes', NULL), (0113, '2022-10-05', 1430, 0023, 'No', 'An unauthorized pet was found in the residence');

Insert Into Payment(paymentNo, datePayed, paymentMethod, firstReminderDate, secondReminderDate)
Values (232, '2021-08-15', 'Visa', NULL, NULL), (342, '2022-08-20', 'Check', '2022-08-15', '2022-08-20');

Insert Into Leases(leaseNo, durationOfLease, bannerNo, placeNo, residenceNo, flatNo, roomEnterDate, roomExitDate)
Values (8811, 3, 000769693, 1190, NULL, 0023, '2021-05-10', NULL), (7690, 2, 111090304, 1120, 3273, NULL, '2022-08-21', NULL), 
	   (5489, 3, 999912345, 1430, NULL, 0023, '2022-05-10', NULL);

Insert Into Invoices(invoiceNo, leaseNo, semester, paymentDue, bannerNo, paymentNo)
Values (65709, 8811, 'Fall', '2021-08-26', 000769693, 232), (12390, 7690, 'Fall', '2022-08-25', 111090304, 342), 
	   (14389, 5489, 'Summer', '20221205', 999912345, NULL);

Insert Into CourseInstructor(instructorNo, firstName, lastName, phoneNo, email, roomNo, departmentName)
Values (1111, 'Bob', 'Smith', 0123456789, 'bobsmith@gmail.com', 111, 'Math'), (1112, 'Angie', 'Smith', 2103456789, 'angiesmith@gmail.com', 111, 'Math'),
		(2111, 'Rhett', 'Boshard', 4200698008, 'rhettboshard@hotmail.com', 240, 'Physics');

Insert Into Courses(sectionNo, courseNo, courseTitle, instructorNo)
Values (1323, 3663, 'Quantum Physics', 2111), (1322, 1001, 'Calculus 1', 1111), (1321, 1001, 'Calculus 1', 1112);


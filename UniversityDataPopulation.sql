use BrandonDB



Insert Into AddressTBL(addressNo, street, city, postCode)
Values (216, '32230 12 Mile Road', 'Farmington Hills', 48336), (789, '2210 Middlebelt Road', 'Farmington Hills', 48336), 
		(437, '5639 Grand River Avenue', 'Farmington', 48321);

Insert Into Rooms(placeNo, roomNo, monthlyRentRate)
Values (1190, 120, 500), (1120, 131, 430);

Insert Into StudentCategory(studentCategoryNo, schoolYear, category)
Values (000769693, 3, 'Undergraduate');

Insert Into Adviser(adviserNo, firstName, lastName, position, nameOfDepartment, phoneNo, email, roomNumber)
Values (3233, 'John', 'Doe', 'Instructor', 'Computer Science', 3438880000, 'johnDoe@ltu.edu', 329);

Insert Into NextOfKin(nextOfKinNo, firstName, lastName, relationship, addressNo, phoneNo)
Values (121, 'Parent', 'Brandon', 'Parent', 216, 2489990000);

Insert Into StudentFlats(flatNo, apartmentNo, addressNo, numberOfRooms, placeNo)
Values (0023, 117, 789, 3, 1190);

Insert Into ResidenceStaff(staffNo, firstName, lastName, email, dateOfBirth, gender, position, workLocation)
Values (0113, 'Chloe', 'Morningstar', 'chloeMorningstar@ltu.edu', 1992-10-2, 'Female', 'Hall Manager', 'Hall');

Insert Into HallsOfResidence(residenceNo, hallName, addressNo, phoneNo, hallManagerNo, placeNo)
Values (3273, 'Ridley Hall', 3709996789, 437 , 0113, 1120);

Insert Into Student(bannerNo, firstName, lastName, addressNo, phoneNo, email, dateOfBirth, gender,
					nationality, specialAccomidations, currentStatus, major, minor,
					adviserNo, residenceNo, flatNo, nextOfKinNo)
Values (000769693, 'Thomas', 'Brandon', 216, 2480000000, 'tbrandon@ltu.edu', 2002-10-10, 'Male', 'American', 'None', 'Placed', 'Computer Science', 'None',
		3233, NULL, 0023, 121);

Insert Into ApartmentInspections(staffNo, dateOfInspection, placeNo, flatNo, propertyStatus, additionalComments)
Values (0113, 2022-12-06, 1190, 0023, 'Yes', NULL);

Insert Into Payment(paymentNo, datePayed, paymentMethod, firstReminderDate, secondReminderDate)
Values (232, 2021-8-15, 'Visa', NULL, NULL);

Insert Into Leases(leaseNo, durationOfLease, bannerNo, placeNo, residenceNo, flatNo, roomEnterDate, roomExitDate)
Values (8811, 12, 000769693, 1190, NULL, 0023, 2021-5-10, NULL);

Insert Into Invoices(invoiceNo, leaseNo, semester, paymentDue, bannerNo, paymentNo)
Values (65709, 8811, 'Fall', 2021-8-26, 000769693, 232);

Insert Into CourseInstructor(instructorNo, firstName, lastName, phoneNo, email, roomNo, departmentName)
Values (1111, 'Bob', 'Smith', 0123456789, 'bobsmith@gmail.com', 111, 'Math'), (1112, 'Angie', 'Smith', 2103456789, 'angiesmith@gmail.com', 111, 'Math'),
		(2111, 'Rhett', 'Boshard', 4200698008, 'rhettboshard@hotmail.com', 240, 'Physics');

Insert Into Courses(sectionNo, courseNo, courseTitle, instructorNo)
Values (1323, 3663, 'Quantum Physics', 2111), (1322, 1001, 'Calculus 1', 1111), (1321, 1001, 'Calculus 1', 1112);


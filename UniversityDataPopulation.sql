use BrandonDB



Insert Into AddressTBL(addressNo, street, city, postCode)
Values ();

Insert Into Rooms(placeNo, roomNo, monthlyRentRate)
Values ();

Insert Into StudentCategory(studentCategoryNo, schoolYear, category)
Values ();

Insert Into Adviser(adviserNo, firstName, lastName, position, nameOfDepartment, phoneNo, email, roomNumber)
Values ();

Insert Into NextOfKin(nextOfKinNo, firstName, lastName, relationship, addressNo, phoneNo)
Values ();

Insert Into StudentFlats(flatNo, apartmentNo, addressNo, numberOfRooms, placeNo)
Values ();

Insert Into ResidenceStaff(staffNo, firstName, lastName, email, dateOfBirth, gender, position, workLocation)
Values ();

Insert Into HallsOfResidence(residenceNo, hallName, phoneNo, hallManagerNo, phoneNo)
Values ();

Insert Into Student(bannerNo, firstName, lastName, addressNo, phoneNo, email, dateOfBirth, gender,
					studentCategoryNo, nationality, specialAccomidations, currentStatus, major, minor,
					adviserNo, residenceNo, flatNo, nextOfKinNo)
Values ();

Insert Into ApartmentInspections(staffNo, dateOfInspection, placeNo, flatNo, propertyStatus, additionalComments)
Values ();

Insert Into Payment(paymentNo, datePayed, paymentMethod, firstReminderDate, secondReminderDate)
Values ();

Insert Into Leases(leaseNo, durationOfLease, bannerNo, placeNo, residenceNo, flatNo, roomEnterDate, roomExitDate)
Values ();

Insert Into Invoices(invoiceNo, leaseNo, semester, paymentDue, bannerNo, paymentNo)
Values ();

Insert Into CourseInstructor(instructorNo, firstName, lastName, phoneNo, email, roomNo, departmentName)
Values (1111, 'Bob', 'Smith', 0123456789, 'bobsmith@gmail.com', 111, 'Math'), (1112, 'Angie', 'Smith', 2103456789, 'angiesmith@gmail.com', 111, 'Math'),
		(2111, 'Rhett', 'Boshard', 4200698008, 'rhettboshard@hotmail.com', 240, 'Physics');

Insert Into Courses(sectionNo, courseNo, courseTitle, instructorNo)
Values (1323, 3663, 'Quantum Physics', 2111), (1322, 1001, 'Calculus 1', 1111), (1321, 1001, 'Calculus 1', 1112);


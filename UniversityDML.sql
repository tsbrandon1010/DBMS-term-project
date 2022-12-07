
use BrandonDB

-- Present a report listing the Manager’s name and telephone number for each hall of residence. 
Select HallsOfResidence.hallManagerNo, HallsOfResidence.phoneNo, ResidenceStaff.firstName, ResidenceStaff.lastName
From ResidenceStaff
Right Join  HallsOfResidence ON HallsOfResidence.hallManagerNo = ResidenceStaff.staffNo;

-- Present a report listing the names and banner numbers of students with the details of their lease agreements. 
Select Leases.*, Student.firstName, Student.lastName  
From Leases
Right Join Student ON Leases.bannerNo = Student.bannerNo;

-- Display the details of lease agreements that include the summer semester
Select Leases.*, Invoices.semester
From Leases
Right Join Invoices ON Invoices.leaseNo = Leases.leaseNo
Where Invoices.semester = 'Summer'

-- Display the details of the total rent paid by a given student.
-- list all of the Leases (unique), get the rent rate from the placeNo, multiply the rent rate by the duration of lease 
Select Leases.bannerNo, Rooms.monthlyRentRate * Leases.durationOfLease * 4 AS rentPaid
From Leases
Right Join Rooms ON Leases.placeNo = Rooms.placeNo;

-- Present a report on students who have not paid their invoices by a given date.
Select Invoices.bannerNo, Invoices.paymentDue, Invoices.paymentNo, Student.firstName, Student.lastName, Student.email, Student.phoneNo
From Invoices
Right Join Student ON Invoices.bannerNo = Student.bannerNo
Where Invoices.paymentDue <= CONVERT(date, '2022-12-07') AND Invoices.paymentNo IS NULL

-- Display the details of apartment inspections where the property was found to be in an unsatisfactory condition.
Select *
From ApartmentInspections
Where propertyStatus = 'No'

-- Present a report of the names and banner numbers of students with their room number and place number in a particular hall of residence.
Select Student.bannerNo, Student.firstName, Student.lastName, Student.residenceNo, Student.placeNo
From Student
Right Join HallsOfResidence ON Student.residenceNo = HallsOfResidence.residenceNo
Where Student.flatNo IS NULL And HallsOfResidence.hallName = 'Ridley Hall'

-- Present a report listing the details of all students currently on the waiting list for accommodation; that is; who were not placed.
Select * 
From Student
Where Student.currentStatus = 'Waiting'

-- Display the total number of students in each student category
Select Count(Student.studentCategoryNo) AS categoryCount
From Student
Right Join StudentCategory ON Student.studentCategoryNo = StudentCategory.studentCategoryNo
Group By Student.studentCategoryNo

-- Present a report of the names and banner numbers for all students who have not supplied details of their next-of-kin
Select bannerNo, firstName, lastName
From Student
Where nextOfKinNo IS NULL

-- Display the name and internal telephone number of the Adviser for a particular student.
Select firstName, lastName, phoneNo
From Adviser
Where adviserNo  = (Select adviserNo
					From Student
					Where bannerNo = 999912345)

-- Display the minimum, maximum, and average monthly rent for rooms in residence halls
Select Min(monthlyRentRate) AS minimumRent, Max(monthlyRentRate) AS maximumRent, Avg(monthlyRentRate) AS averageRent
From Rooms
Where residenceNo IS NOT NULL AND flatNo IS NULL

-- Display the total number of places in each residence hall.
Select Count(Rooms.placeNo) AS placesInHall
From Rooms
left Join HallsOfResidence ON Rooms.residenceNo = HallsOfResidence.residenceNo
Group By HallsOfResidence.residenceNo


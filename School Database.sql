CREATE SCHEMA IF NOT EXISTS `Final` ;
USE `Final` ;


CREATE TABLE IF NOT EXISTS `Final`.`College` (
  `CollegeName` VARCHAR(50) NOT NULL,
  `CollegeTotalStudents` INT NULL,
  PRIMARY KEY (`CollegeName`))
ENGINE = InnoDB;
CREATE UNIQUE INDEX `CollegeName_UNIQUE` ON `Final`.`College` (`CollegeName` ASC);



CREATE TABLE IF NOT EXISTS `Final`.`Buildings` (
  `BuildingID` INT NOT NULL,
  `BuildingName` VARCHAR(45) NULL,
  `CollegeName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`BuildingID`),
  CONSTRAINT `FK_Buildings_CollegeName`
    FOREIGN KEY (`CollegeName`)
    REFERENCES `Final`.`College` (`CollegeName`)
    )
ENGINE = InnoDB;
CREATE UNIQUE INDEX `BuildingID_UNIQUE` ON `Final`.`Buildings` (`BuildingID` ASC);
CREATE INDEX `CollegeName_idx` ON `Final`.`Buildings` (`CollegeName` ASC);



CREATE TABLE IF NOT EXISTS `Final`.`Classrooms` (
  `RoomNumber` INT NOT NULL,
  `HasProjector` VARCHAR(3) NULL,
  `BuildingID` INT NULL,
  PRIMARY KEY (`RoomNumber`),
  CONSTRAINT `FK_Classrooms_BuildingID`
    FOREIGN KEY (`BuildingID`)
    REFERENCES `Final`.`Buildings` (`BuildingID`)
    )
ENGINE = InnoDB;
CREATE UNIQUE INDEX `RoomNumber_UNIQUE` ON `Final`.`Classrooms` (`RoomNumber` ASC);
CREATE INDEX `BuildingID_idx` ON `Final`.`Classrooms` (`BuildingID` ASC);



CREATE TABLE IF NOT EXISTS `Final`.`Textbook` (
  `TextbookISBN` INT NOT NULL,
  `TextbookTitle` VARCHAR(45) NULL,
  `TextbookAuthor` VARCHAR(45) NULL,
  PRIMARY KEY (`TextbookISBN`))
ENGINE = InnoDB;
CREATE UNIQUE INDEX `TextbookISBN_UNIQUE` ON `Final`.`Textbook` (`TextbookISBN` ASC);



CREATE TABLE IF NOT EXISTS `Final`.`Course` (
  `CourseID` INT NOT NULL,
  `CourseName` VARCHAR(45) NULL,
  `TextbookISBN` INT NULL,
  PRIMARY KEY (`CourseID`),
  CONSTRAINT `FK_Course_TextbookISBN`
    FOREIGN KEY (`TextbookISBN`)
    REFERENCES `Final`.`Textbook` (`TextbookISBN`)
	)
ENGINE = InnoDB;
CREATE UNIQUE INDEX `CourseID_UNIQUE` ON `Final`.`Course` (`CourseID` ASC);
CREATE INDEX `TextbookISBN_idx` ON `Final`.`Course` (`TextbookISBN` ASC);



CREATE TABLE IF NOT EXISTS `Final`.`Person` (
  `PersonID` INT NOT NULL,
  `PersonPhoneNumber` VARCHAR(45) NULL,
  `PersonName` VARCHAR(45) NULL,
  PRIMARY KEY (`PersonID`))
ENGINE = InnoDB;
CREATE UNIQUE INDEX `PersonID_UNIQUE` ON `Final`.`Person` (`PersonID` ASC);





CREATE TABLE IF NOT EXISTS `Final`.`Faculty` (
  `FacultyID` INT NOT NULL,
  `FacultyTitle` VARCHAR(45) NULL,
  `FacultySalary` INT NULL,
  `FacultyName` VARCHAR(45) NULL,
  `PersonID` INT NULL,
  PRIMARY KEY (`FacultyID`),
  CONSTRAINT `FK_Faculty_PersonID`
    FOREIGN KEY (`PersonID`)
    REFERENCES `Final`.`Person` (`PersonID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
CREATE UNIQUE INDEX `FacultyID_UNIQUE` ON `Final`.`Faculty` (`FacultyID` ASC);
CREATE INDEX `PersonID_idx` ON `Final`.`Faculty` (`PersonID` ASC);




CREATE TABLE IF NOT EXISTS `Final`.`Interns` (
  `InternID` INT NOT NULL,
  `PersonID` INT NULL,
  `InternHourlyWage` INT NULL,
  PRIMARY KEY (`InternID`),
  CONSTRAINT `FK_Interns_PersonID`
    FOREIGN KEY (`PersonID`)
    REFERENCES `Final`.`Person` (`PersonID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
CREATE UNIQUE INDEX `Level_UNIQUE` ON `Final`.`Interns` (`InternID` ASC);
CREATE INDEX `PersonID_idx` ON `Final`.`Interns` (`PersonID` ASC);



CREATE TABLE IF NOT EXISTS `Final`.`Section` (
  `SectionID` INT NOT NULL,
  `SectionDate` DATE NULL,
  `RoomNumber` INT NULL,
  `CourseID` INT NULL,
  `BuildingID` INT NULL,
  `PersonID` INT NULL,
  PRIMARY KEY (`SectionID`),
  CONSTRAINT `FK_Section_CourseID`
    FOREIGN KEY (`CourseID`)
    REFERENCES `Final`.`Course` (`CourseID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Section_BuildingID`
    FOREIGN KEY (`BuildingID`)
    REFERENCES `Final`.`Buildings` (`BuildingID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Section_PersonID`
    FOREIGN KEY (`PersonID`)
    REFERENCES `Final`.`Person` (`PersonID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Section_RoomNumber`
    FOREIGN KEY (`RoomNumber`)
    REFERENCES `Final`.`Classrooms` (`RoomNumber`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
CREATE UNIQUE INDEX `SectionID_UNIQUE` ON `Final`.`Section` (`SectionID` ASC);
CREATE INDEX `RoomNumber_idx` ON `Final`.`Section` (`RoomNumber` ASC);
CREATE INDEX `CourseID_idx` ON `Final`.`Section` (`CourseID` ASC);
CREATE INDEX `BuildingID_idx` ON `Final`.`Section` (`BuildingID` ASC);
CREATE INDEX `PersonID_idx` ON `Final`.`Section` (`PersonID` ASC);



CREATE TABLE IF NOT EXISTS `Final`.`Student` (
  `StudentID` INT NOT NULL,
  `StudentGPA` DOUBLE(10, 2) NULL,
  `StudentName` VARCHAR(45) NULL,
  `PersonID` INT NULL,
  PRIMARY KEY (`StudentID`),
  CONSTRAINT `FK_Student_PersonID`
    FOREIGN KEY (`PersonID`)
    REFERENCES `Final`.`Person` (`PersonID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
CREATE UNIQUE INDEX `StudentID_UNIQUE` ON `Final`.`Student` (`StudentID` ASC);
CREATE INDEX `PersonID_idx` ON `Final`.`Student` (`PersonID` ASC);








INSERT INTO `Final`.`College` (`CollegeName`, `CollegeTotalStudents`) VALUES ('IAUCTB', 26711);



INSERT INTO `Final`.`Buildings` (`BuildingID`, `BuildingName`, `CollegeName`) VALUES (1, 'Memari', 'IAUCTB');
INSERT INTO `Final`.`Buildings` (`BuildingID`, `BuildingName`, `CollegeName`) VALUES (2, 'Fani', 'IAUCTB');
INSERT INTO `Final`.`Buildings` (`BuildingID`, `BuildingName`, `CollegeName`) VALUES (3, 'test', 'IAUCTB');



INSERT INTO `Final`.`Classrooms` (`RoomNumber`, `HasProjector`, `BuildingID`) VALUES (201, 'Y', 1);
INSERT INTO `Final`.`Classrooms` (`RoomNumber`, `HasProjector`, `BuildingID`) VALUES (202, 'N', 1);
INSERT INTO `Final`.`Classrooms` (`RoomNumber`, `HasProjector`, `BuildingID`) VALUES (203, 'Y', 1);
INSERT INTO `Final`.`Classrooms` (`RoomNumber`, `HasProjector`, `BuildingID`) VALUES (303, 'N', 5);
INSERT INTO `Final`.`Classrooms` (`RoomNumber`, `HasProjector`, `BuildingID`) VALUES (304, 'Y', 5);
INSERT INTO `Final`.`Classrooms` (`RoomNumber`, `HasProjector`, `BuildingID`) VALUES (305, 'N', 5);



INSERT INTO `Final`.`Textbook` (`TextbookISBN`, `TextbookTitle`, `TextbookAuthor`) VALUES (200, 'Computer Science', 'Jamshid Jamshidi');
INSERT INTO `Final`.`Textbook` (`TextbookISBN`, `TextbookTitle`, `TextbookAuthor`) VALUES (201, 'Liang Java', 'Kourosh Kabir');
INSERT INTO `Final`.`Textbook` (`TextbookISBN`, `TextbookTitle`, `TextbookAuthor`) VALUES (202, 'Liang Java', 'Dariush Yousefi');
INSERT INTO `Final`.`Textbook` (`TextbookISBN`, `TextbookTitle`, `TextbookAuthor`) VALUES (203, 'Data Structures & Algorithms', 'Fatemeh Fatemehian');
INSERT INTO `Final`.`Textbook` (`TextbookISBN`, `TextbookTitle`, `TextbookAuthor`) VALUES (204, 'Machine Learning', 'Soroush Soroushian');
INSERT INTO `Final`.`Textbook` (`TextbookISBN`, `TextbookTitle`, `TextbookAuthor`) VALUES (205, 'Networking CCNA', 'Yousef Mac');
INSERT INTO `Final`.`Textbook` (`TextbookISBN`, `TextbookTitle`, `TextbookAuthor`) VALUES (206, 'Intro to Calculus', 'Parsa Kiarostami');
INSERT INTO `Final`.`Textbook` (`TextbookISBN`, `TextbookTitle`, `TextbookAuthor`) VALUES (207, 'Advanced Topics in Calculus', 'Arash Kamangir');
INSERT INTO `Final`.`Textbook` (`TextbookISBN`, `TextbookTitle`, `TextbookAuthor`) VALUES (208, 'JavaScript', 'Abas Abasi');
INSERT INTO `Final`.`Textbook` (`TextbookISBN`, `TextbookTitle`, `TextbookAuthor`) VALUES (209, 'Flutter', 'Hossein Hosseini');
INSERT INTO `Final`.`Textbook` (`TextbookISBN`, `TextbookTitle`, `TextbookAuthor`) VALUES (210, 'Math for Computer Science', 'Mahdi Abhami');
INSERT INTO `Final`.`Textbook` (`TextbookISBN`, `TextbookTitle`, `TextbookAuthor`) VALUES (211, 'React', 'Maryam Maryamian');
INSERT INTO `Final`.`Textbook` (`TextbookISBN`, `TextbookTitle`, `TextbookAuthor`) VALUES (212, 'Python', 'Zahra Zargar');
INSERT INTO `Final`.`Textbook` (`TextbookISBN`, `TextbookTitle`, `TextbookAuthor`) VALUES (213, 'C#', 'Nima Nimayi');
INSERT INTO `Final`.`Textbook` (`TextbookISBN`, `TextbookTitle`, `TextbookAuthor`) VALUES (214, 'Clean Code', 'Uncle Bob');
INSERT INTO `Final`.`Textbook` (`TextbookISBN`, `TextbookTitle`, `TextbookAuthor`) VALUES (215, 'Clean Architecture', 'Ali Barzegar');
INSERT INTO `Final`.`Textbook` (`TextbookISBN`, `TextbookTitle`, `TextbookAuthor`) VALUES (216, 'Clean Coder', 'Mohammad Adgi');




INSERT INTO `Final`.`Course` (`CourseID`, `CourseName`, `TextbookISBN`) VALUES (1, 'Computer Science I', 200);
INSERT INTO `Final`.`Course` (`CourseID`, `CourseName`, `TextbookISBN`) VALUES (2, 'Computer Science II', 201);
INSERT INTO `Final`.`Course` (`CourseID`, `CourseName`, `TextbookISBN`) VALUES (3, 'Computer Science III', 202);
INSERT INTO `Final`.`Course` (`CourseID`, `CourseName`, `TextbookISBN`) VALUES (4, 'Data Structures', 203);
INSERT INTO `Final`.`Course` (`CourseID`, `CourseName`, `TextbookISBN`) VALUES (5, 'Computer Assembly', 204);
INSERT INTO `Final`.`Course` (`CourseID`, `CourseName`, `TextbookISBN`) VALUES (6, 'Intro To Networking', 205);
INSERT INTO `Final`.`Course` (`CourseID`, `CourseName`, `TextbookISBN`) VALUES (7, 'Javascript', 206);
INSERT INTO `Final`.`Course` (`CourseID`, `CourseName`, `TextbookISBN`) VALUES (8, 'JavaScript II', 207);
INSERT INTO `Final`.`Course` (`CourseID`, `CourseName`, `TextbookISBN`) VALUES (9, 'Vuejs', 208);
INSERT INTO `Final`.`Course` (`CourseID`, `CourseName`, `TextbookISBN`) VALUES (10, 'React', 209);
INSERT INTO `Final`.`Course` (`CourseID`, `CourseName`, `TextbookISBN`) VALUES (11, 'Clean Coding', 210);
INSERT INTO `Final`.`Course` (`CourseID`, `CourseName`, `TextbookISBN`) VALUES (12, 'Easy Flutter', 211);
INSERT INTO `Final`.`Course` (`CourseID`, `CourseName`, `TextbookISBN`) VALUES (13, 'Block Chain', 212);
INSERT INTO `Final`.`Course` (`CourseID`, `CourseName`, `TextbookISBN`) VALUES (14, 'Python GUI', 213);
INSERT INTO `Final`.`Course` (`CourseID`, `CourseName`, `TextbookISBN`) VALUES (15, 'AspDotNet', 214);
INSERT INTO `Final`.`Course` (`CourseID`, `CourseName`, `TextbookISBN`) VALUES (16, 'Nodejs', 215);
INSERT INTO `Final`.`Course` (`CourseID`, `CourseName`, `TextbookISBN`) VALUES (17, 'Nestjs', 216);




INSERT INTO `Final`.`Person` (`PersonID`, `PersonPhoneNumber`, `PersonName`) VALUES (1, '09138798196', 'Arash Deli');
INSERT INTO `Final`.`Person` (`PersonID`, `PersonPhoneNumber`, `PersonName`) VALUES (2, '09500879629', 'Armin Delgosar');
INSERT INTO `Final`.`Person` (`PersonID`, `PersonPhoneNumber`, `PersonName`) VALUES (3, '09423592494', 'Mehdi Zojaj');
INSERT INTO `Final`.`Person` (`PersonID`, `PersonPhoneNumber`, `PersonName`) VALUES (4, '09734592137', 'Maryam Maher');
INSERT INTO `Final`.`Person` (`PersonID`, `PersonPhoneNumber`, `PersonName`) VALUES (5, '09922583235', 'Soroush Kheirkhah');
INSERT INTO `Final`.`Person` (`PersonID`, `PersonPhoneNumber`, `PersonName`) VALUES (6, '09674438494', 'Melahat Nasihat');
INSERT INTO `Final`.`Person` (`PersonID`, `PersonPhoneNumber`, `PersonName`) VALUES (7, '09808269838', 'Arman Safayi');
INSERT INTO `Final`.`Person` (`PersonID`, `PersonPhoneNumber`, `PersonName`) VALUES (8, '09459542468', 'Ali Saraie');
INSERT INTO `Final`.`Person` (`PersonID`, `PersonPhoneNumber`, `PersonName`) VALUES (9, '09296537915', 'Youset Mac');
INSERT INTO `Final`.`Person` (`PersonID`, `PersonPhoneNumber`, `PersonName`) VALUES (10, '09758132684', 'Mahan Rahimi');
INSERT INTO `Final`.`Person` (`PersonID`, `PersonPhoneNumber`, `PersonName`) VALUES (11, '09471679678', 'Peyman Ghadimi');
INSERT INTO `Final`.`Person` (`PersonID`, `PersonPhoneNumber`, `PersonName`) VALUES (12, '09318289950', 'Parsa Nouri');
INSERT INTO `Final`.`Person` (`PersonID`, `PersonPhoneNumber`, `PersonName`) VALUES (13, '09127104980', 'Sina Gholipour');
INSERT INTO `Final`.`Person` (`PersonID`, `PersonPhoneNumber`, `PersonName`) VALUES (14, '09818726300', 'Iman Naieni');
INSERT INTO `Final`.`Person` (`PersonID`, `PersonPhoneNumber`, `PersonName`) VALUES (15, '09715508311', 'Arash Forozesh');
INSERT INTO `Final`.`Person` (`PersonID`, `PersonPhoneNumber`, `PersonName`) VALUES (16, '09435930489', 'Mohammad Badvi');
INSERT INTO `Final`.`Person` (`PersonID`, `PersonPhoneNumber`, `PersonName`) VALUES (17, '09659295814', 'Ali Esmaeili');
INSERT INTO `Final`.`Person` (`PersonID`, `PersonPhoneNumber`, `PersonName`) VALUES (18, '09184549398', 'Maryam Arvan');
INSERT INTO `Final`.`Person` (`PersonID`, `PersonPhoneNumber`, `PersonName`) VALUES (19, '09877980711', 'Zahra Barzegar');
INSERT INTO `Final`.`Person` (`PersonID`, `PersonPhoneNumber`, `PersonName`) VALUES (20, '09160774962', 'mehdi Rahimi');
INSERT INTO `Final`.`Person` (`PersonID`, `PersonPhoneNumber`, `PersonName`) VALUES (21, '09025398391', 'Kourosh Kheirkhah');
INSERT INTO `Final`.`Person` (`PersonID`, `PersonPhoneNumber`, `PersonName`) VALUES (22, '09808748107', 'Yousef Kheirkhah');
INSERT INTO `Final`.`Person` (`PersonID`, `PersonPhoneNumber`, `PersonName`) VALUES (23, '09197581098', 'Arshia Kheirkhah');





INSERT INTO `Final`.`Faculty` (`FacultyID`, `FacultyTitle`, `FacultySalary`, `FacultyName`, `PersonID`) VALUES (1, 'Head Of Computer Science', 100000, 'Soroush Kheirkhah', 1);
INSERT INTO `Final`.`Faculty` (`FacultyID`, `FacultyTitle`, `FacultySalary`, `FacultyName`, `PersonID`) VALUES (2, 'Head Of Mathematics', 90000, 'Sepideh Kheirkhah', 2);
INSERT INTO `Final`.`Faculty` (`FacultyID`, `FacultyTitle`, `FacultySalary`, `FacultyName`, `PersonID`) VALUES (3, 'Head Of English', 85000, 'Sarvin Kheirkhah', 3);
INSERT INTO `Final`.`Faculty` (`FacultyID`, `FacultyTitle`, `FacultySalary`, `FacultyName`, `PersonID`) VALUES (4, 'Head Of Accounting', 80000, 'Felan Felani', 4);
INSERT INTO `Final`.`Faculty` (`FacultyID`, `FacultyTitle`, `FacultySalary`, `FacultyName`, `PersonID`) VALUES (5, 'Head Of Vuejs', 75000, 'Ali Saraie', 5);
INSERT INTO `Final`.`Faculty` (`FacultyID`, `FacultyTitle`, `FacultySalary`, `FacultyName`, `PersonID`) VALUES (6, 'Head Of React', 60000, 'Yousef Maktabi', 6);
INSERT INTO `Final`.`Faculty` (`FacultyID`, `FacultyTitle`, `FacultySalary`, `FacultyName`, `PersonID`) VALUES (7, 'Professor Of Mathematics', 60000, 'Fatemeh Kheirkhah', 7);
INSERT INTO `Final`.`Faculty` (`FacultyID`, `FacultyTitle`, `FacultySalary`, `FacultyName`, `PersonID`) VALUES (8, 'Professor Of English', 60000, 'Maryam Arvani', 8);
INSERT INTO `Final`.`Faculty` (`FacultyID`, `FacultyTitle`, `FacultySalary`, `FacultyName`, `PersonID`) VALUES (9, 'Professor Of Accounting', 60000, 'Arash Arashin', 9);
INSERT INTO `Final`.`Faculty` (`FacultyID`, `FacultyTitle`, `FacultySalary`, `FacultyName`, `PersonID`) VALUES (10, 'Professor Of Life Sciences', 60000, 'Soroushian Soroush', 10);




INSERT INTO `Final`.`Interns` (`InternID`, `PersonID`, `InternHourlyWage`) VALUES (1, 21, 14.50);
INSERT INTO `Final`.`Interns` (`InternID`, `PersonID`, `InternHourlyWage`) VALUES (2, 22, 15);
INSERT INTO `Final`.`Interns` (`InternID`, `PersonID`, `InternHourlyWage`) VALUES (3, 23, 11);




INSERT INTO `Final`.`Section` (`SectionID`, `SectionDate`, `RoomNumber`, `CourseID`, `BuildingID`, `PersonID`) VALUES (100, '2020-12-27', 201, 3, 1, 1);
INSERT INTO `Final`.`Section` (`SectionID`, `SectionDate`, `RoomNumber`, `CourseID`, `BuildingID`, `PersonID`) VALUES (101, '2020-12-27', 202, 7, 1, 2);
INSERT INTO `Final`.`Section` (`SectionID`, `SectionDate`, `RoomNumber`, `CourseID`, `BuildingID`, `PersonID`) VALUES (102, '2020-12-27', 203, 12, 1, 3);
INSERT INTO `Final`.`Section` (`SectionID`, `SectionDate`, `RoomNumber`, `CourseID`, `BuildingID`, `PersonID`) VALUES (103, '2020-12-27', 303, 15, 5, 4);
INSERT INTO `Final`.`Section` (`SectionID`, `SectionDate`, `RoomNumber`, `CourseID`, `BuildingID`, `PersonID`) VALUES (104, '2020-12-27', 304, 17, 5, 5);




INSERT INTO `Final`.`Student` (`StudentID`, `StudentGPA`, `StudentName`, `PersonID`) VALUES (1, 4.0, 'Soroush', 11);
INSERT INTO `Final`.`Student` (`StudentID`, `StudentGPA`, `StudentName`, `PersonID`) VALUES (2, 3.2, 'Ali', 12);
INSERT INTO `Final`.`Student` (`StudentID`, `StudentGPA`, `StudentName`, `PersonID`) VALUES (3, 3.7, 'Fatemeh', 13);
INSERT INTO `Final`.`Student` (`StudentID`, `StudentGPA`, `StudentName`, `PersonID`) VALUES (4, 2.5, 'Abas', 14);
INSERT INTO `Final`.`Student` (`StudentID`, `StudentGPA`, `StudentName`, `PersonID`) VALUES (5, 2.0, 'Arash', 15);
INSERT INTO `Final`.`Student` (`StudentID`, `StudentGPA`, `StudentName`, `PersonID`) VALUES (6, 4.0, 'Pedram', 16);
INSERT INTO `Final`.`Student` (`StudentID`, `StudentGPA`, `StudentName`, `PersonID`) VALUES (7, 3.3, 'Mehdi', 17);
INSERT INTO `Final`.`Student` (`StudentID`, `StudentGPA`, `StudentName`, `PersonID`) VALUES (8, 2.9, 'Aref', 18);
INSERT INTO `Final`.`Student` (`StudentID`, `StudentGPA`, `StudentName`, `PersonID`) VALUES (9, 1.3, 'Parsa', 19);
INSERT INTO `Final`.`Student` (`StudentID`, `StudentGPA`, `StudentName`, `PersonID`) VALUES (10, 3.7, 'Zahra', 20);




CREATE TABLE Rents
( 
	RentID               int  NOT NULL ,
	VNumber              char(5)  NOT NULL ,
	RenterID             int  NOT NULL ,
	StartTime            datetime  NULL ,
	EndTime              datetime  NULL ,
	PRIMARY KEY  CLUSTERED (RentID ASC)
)
go

CREATE TABLE Tasks
( 
	TaskID               char(5)  NOT NULL ,
	PersonNumber         char(5)  NOT NULL ,
	VNumber              char(5)  NOT NULL ,
	DateStarted          datetime  NULL ,
	DateCompleted        datetime  NULL ,
	Comment              char(25)  NULL ,
	PRIMARY KEY  CLUSTERED (TaskID ASC)
)
go


ALTER TABLE Rents
	ADD  FOREIGN KEY (VNumber) REFERENCES Vehicle(VNumber)
go

ALTER TABLE Rents
	ADD  FOREIGN KEY (RenterID) REFERENCES Renter(RenterID)
go


ALTER TABLE Tasks
	ADD  FOREIGN KEY (PersonNumber) REFERENCES Maintenance(PersonNumber)
go

ALTER TABLE Tasks
	ADD  FOREIGN KEY (VNumber) REFERENCES Vehicle(VNumber)
go

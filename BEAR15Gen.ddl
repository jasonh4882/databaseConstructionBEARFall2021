
CREATE TABLE Bike
( 
	VNumber              char(5)  NOT NULL ,
	Type                 char(1)  NULL ,
	HourRate             float  NULL ,
	MaxCharge            float  NULL ,
	Size                 int  NULL ,
	PRIMARY KEY  CLUSTERED (VNumber ASC)
)
go

CREATE TABLE Bike_Type
( 
	Type                 char(1)  NOT NULL ,
	Description          char(6)  NULL ,
	PRIMARY KEY  CLUSTERED (Type ASC)
)
go

CREATE TABLE Certification
( 
	PersonNumber         char(5)  NOT NULL ,
	CertType             char(1)  NULL ,
	Description          char(9)  NULL ,
	DatePassed           datetime  NULL ,
	PRIMARY KEY  CLUSTERED (PersonNumber ASC)
)
go

CREATE TABLE ElectricVehicle
( 
	VNumber              char(5)  NOT NULL ,
	Miles                int  NULL ,
	BaseRate             float  NULL ,
	MinuteRate           float  NULL ,
	VIN                  char(10)  NULL ,
	PRIMARY KEY  CLUSTERED (VNumber ASC)
)
go

CREATE TABLE Maintenance
( 
	PersonNumber         char(5)  NOT NULL ,
	PRIMARY KEY  CLUSTERED (PersonNumber ASC)
)
go

CREATE TABLE Management
( 
	PersonNumber         char(5)  NOT NULL ,
	LastAccessDate       datetime  NULL ,
	PRIMARY KEY  CLUSTERED (PersonNumber ASC)
)
go

CREATE TABLE Personnel
( 
	PersonNumber         char(5)  NOT NULL ,
	BeginningDate        datetime  NULL ,
	EndDate              datetime  NULL ,
	Name                 char(18)  NULL ,
	PRIMARY KEY  CLUSTERED (PersonNumber ASC)
)
go

CREATE TABLE Renter
( 
	RenterID             int  NOT NULL ,
	DOB                  datetime  NULL ,
	License              char(10)  NULL ,
	Name                 char(30)  NULL ,
	Address              char(50)  NULL ,
	PRIMARY KEY  CLUSTERED (RenterID ASC)
)
go

CREATE TABLE Rents
( 
	RenterID             int  NOT NULL ,
	VNumber              char(5)  NOT NULL ,
	StartTime            datetime  NULL ,
	EndTime              datetime  NULL ,
	PRIMARY KEY  CLUSTERED (RenterID ASC,VNumber ASC)
)
go

CREATE TABLE Site
( 
	SiteID               char(2)  NOT NULL ,
	Address              char(50)  NULL ,
	Name                 char(30)  NULL ,
	PersonNumber         char(5)  NULL ,
	PRIMARY KEY  CLUSTERED (SiteID ASC)
)
go

CREATE TABLE Status
( 
	Status               char(1)  NOT NULL ,
	Description          char(11)  NULL ,
	PRIMARY KEY  CLUSTERED (Status ASC)
)
go

CREATE TABLE Tasks
( 
	PersonNumber         char(5)  NOT NULL ,
	VNumber              char(5)  NOT NULL ,
	DateStarted          datetime  NULL ,
	DateCompleted        datetime  NULL ,
	Comment              char(25)  NULL ,
	PRIMARY KEY  CLUSTERED (PersonNumber ASC,VNumber ASC)
)
go

CREATE TABLE Vehicle
( 
	VNumber              char(5)  NOT NULL ,
	Type                 char(1)  NULL ,
	Status               char(1)  NULL ,
	Rents                int  NULL ,
	SiteID               char(2)  NULL ,
	PurchaseDate         char(8)  NULL ,
	PRIMARY KEY  CLUSTERED (VNumber ASC)
)
go


ALTER TABLE Bike
	ADD  FOREIGN KEY (VNumber) REFERENCES Vehicle(VNumber)
go

ALTER TABLE Bike
	ADD  FOREIGN KEY (Type) REFERENCES Bike_Type(Type)
go


ALTER TABLE Certification
	ADD  FOREIGN KEY (PersonNumber) REFERENCES Maintenance(PersonNumber)
go


ALTER TABLE ElectricVehicle
	ADD  FOREIGN KEY (VNumber) REFERENCES Vehicle(VNumber)
go


ALTER TABLE Maintenance
	ADD  FOREIGN KEY (PersonNumber) REFERENCES Personnel(PersonNumber)
go


ALTER TABLE Management
	ADD  FOREIGN KEY (PersonNumber) REFERENCES Personnel(PersonNumber)
go


ALTER TABLE Rents
	ADD  FOREIGN KEY (VNumber) REFERENCES Vehicle(VNumber)
go

ALTER TABLE Rents
	ADD  FOREIGN KEY (RenterID) REFERENCES Renter(RenterID)
go


ALTER TABLE Site
	ADD  FOREIGN KEY (PersonNumber) REFERENCES Management(PersonNumber)
go


ALTER TABLE Tasks
	ADD  FOREIGN KEY (PersonNumber) REFERENCES Maintenance(PersonNumber)
go

ALTER TABLE Tasks
	ADD  FOREIGN KEY (VNumber) REFERENCES Vehicle(VNumber)
go


ALTER TABLE Vehicle
	ADD  FOREIGN KEY (SiteID) REFERENCES Site(SiteID)
go

ALTER TABLE Vehicle
	ADD  FOREIGN KEY (Status) REFERENCES Status(Status)
go

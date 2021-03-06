CREATE DATABASE TripPlanner

USE TripPlanner

CREATE TABLE [User](
Id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
[Name] NVARCHAR(30) NOT NULL,
DOB DATE NOT NULL,
PhoneNumber NVARCHAR(14) NOT NULL,
[Address] NVARCHAR(100) NOT NULL,
)

CREATE TABLE Passport(
PassportNumber NVARCHAR(9) NOT NULL PRIMARY KEY,
Expiration DATE NOT NULL,
PhoneNumber NVARCHAR(14) NOT NULL,
[Address] NVARCHAR(100) NOT NULL,
UserID INT UNIQUE FOREIGN KEY REFERENCES [User](Id)
)

CREATE TABLE Trip(
Id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
StartDate DATE NOT NULL,
EndDate DATE NOT NULL,
StartDestination NVARCHAR(50) NOT NULL,
EndDestination NVARCHAR(50) NOT NULL,
TravelMode NVARCHAR(5) NOT NULL,
Budget FLOAT NOT NULL,
UserId INT FOREIGN KEY REFERENCES [User](Id)
)

CREATE TABLE Hotel(
Id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
CheckIn DATE NOT NULL,
CheckOut DATE NOT NULL,
PhoneNumber NVARCHAR(14) NOT NULL,
[Address] NVARCHAR(100) NOT NULL,
NightlyCost FLOAT NOT NULL,
)

CREATE TABLE TripHotel(
Id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
HotelId INT FOREIGN KEY REFERENCES Hotel(Id),
TripId INT FOREIGN KEY REFERENCES Trip(Id)
)
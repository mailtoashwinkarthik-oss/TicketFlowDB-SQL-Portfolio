/*
    TicketFlowDB Portfolio Project
    Module 1: Create the database and tables
*/

IF DB_ID('TicketFlowDB') IS NULL
BEGIN
    CREATE DATABASE TicketFlowDB;
END;
GO

USE TicketFlowDB;
GO

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    Fullname NVARCHAR(100) NOT NULL,
    Email NVARCHAR(100) UNIQUE NOT NULL,
    City NVARCHAR(50) NOT NULL,
    RegistrationDate DATETIME NOT NULL DEFAULT GETDATE()
);
GO

CREATE TABLE Venues (
    VenueID INT PRIMARY KEY IDENTITY(1,1),
    VenueName NVARCHAR(100) NOT NULL,
    City NVARCHAR(50) NOT NULL,
    Capacity INT NOT NULL
);
GO

CREATE TABLE Events (
    EventID INT PRIMARY KEY IDENTITY(1,1),
    VenueID INT NOT NULL,
    EventName NVARCHAR(100) NOT NULL,
    EventDate DATETIME NOT NULL,
    Category NVARCHAR(50) NOT NULL,
    TicketPrice DECIMAL(10,2) NOT NULL,
    TicketsAvailable INT NOT NULL,
    EventStatus NVARCHAR(20) NOT NULL
        CHECK (EventStatus IN ('Scheduled', 'Cancelled', 'Completed')),
    FOREIGN KEY (VenueID) REFERENCES Venues(VenueID)
);
GO

CREATE TABLE Bookings (
    BookingID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT NOT NULL,
    EventID INT NOT NULL,
    BookingDate DATETIME NOT NULL DEFAULT GETDATE(),
    NumberOfTickets INT NOT NULL,
    TotalPrice DECIMAL(10,2) NOT NULL,
    BookingStatus NVARCHAR(20) NOT NULL
        CONSTRAINT DF_Bookings_BookingStatus DEFAULT 'Confirmed'
        CONSTRAINT CK_Bookings_BookingStatus
            CHECK (BookingStatus IN ('Confirmed', 'Cancelled')),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (EventID) REFERENCES Events(EventID)
);
GO

-- Verify the tables.
SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE'
ORDER BY TABLE_NAME;

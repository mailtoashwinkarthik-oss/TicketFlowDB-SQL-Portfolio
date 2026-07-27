/*
    Run this after 01_create_database_and_tables.sql.
    CustomerID, VenueID, EventID and BookingID are generated automatically.
*/

USE TicketFlowDB;
GO

INSERT INTO Customers (Fullname, Email, City, RegistrationDate)
VALUES
    ('Aisha Khan', 'aisha.khan@example.com', 'London', '2026-01-10'),
    ('Ben Carter', 'ben.carter@example.com', 'Manchester', '2026-01-15'),
    ('Chloe Evans', 'chloe.evans@example.com', 'Birmingham', '2026-02-01'),
    ('Daniel Lewis', 'daniel.lewis@example.com', 'Liverpool', '2026-02-12'),
    ('Emily Brown', 'emily.brown@example.com', 'Leeds', '2026-03-05'),
    ('Farhan Ali', 'farhan.ali@example.com', 'Bristol', '2026-03-18'),
    ('Grace Wilson', 'grace.wilson@example.com', 'Oxford', '2026-04-02'),
    ('Harry Taylor', 'harry.taylor@example.com', 'Cambridge', '2026-04-20');
GO

INSERT INTO Venues (VenueName, City, Capacity)
VALUES
    ('Riverside Arena', 'London', 5000),
    ('Northern Conference Centre', 'Manchester', 2500),
    ('City Arts Theatre', 'Birmingham', 1200);
GO

INSERT INTO Events
    (VenueID, EventName, EventDate, Category, TicketPrice, TicketsAvailable, EventStatus)
VALUES
    (1, 'Summer Music Festival', '2026-08-15T18:00:00', 'Music', 45.00, 500, 'Scheduled'),
    (2, 'Future Technology Expo', '2026-09-10T09:00:00', 'Technology', 60.00, 300, 'Scheduled'),
    (3, 'Comedy Night Live', '2026-08-28T19:30:00', 'Comedy', 25.00, 150, 'Scheduled'),
    (1, 'London Food Festival', '2026-10-05T11:00:00', 'Food', 35.00, 400, 'Scheduled'),
    (3, 'Family Theatre Show', '2026-09-20T14:00:00', 'Theatre', 18.00, 200, 'Scheduled'),
    (2, 'Business Leadership Conference', '2026-11-12T09:30:00', 'Business', 75.00, 250, 'Scheduled');
GO

INSERT INTO Bookings
    (CustomerID, EventID, BookingDate, NumberOfTickets, TotalPrice, BookingStatus)
VALUES
    (1, 1, '2026-05-01', 2, 90.00, 'Confirmed'),
    (2, 2, '2026-05-03', 1, 60.00, 'Confirmed'),
    (3, 3, '2026-05-06', 3, 75.00, 'Confirmed'),
    (4, 4, '2026-05-10', 2, 70.00, 'Confirmed'),
    (5, 5, '2026-05-14', 4, 72.00, 'Confirmed'),
    (6, 6, '2026-05-18', 1, 75.00, 'Confirmed'),
    (7, 1, '2026-05-22', 1, 45.00, 'Confirmed'),
    (8, 2, '2026-05-25', 2, 120.00, 'Confirmed'),
    (1, 3, '2026-06-02', 2, 50.00, 'Cancelled'),
    (3, 5, '2026-06-07', 3, 54.00, 'Confirmed');
GO

SELECT COUNT(*) AS CustomerCount FROM Customers;
SELECT COUNT(*) AS VenueCount FROM Venues;
SELECT COUNT(*) AS EventCount FROM Events;
SELECT COUNT(*) AS BookingCount FROM Bookings;

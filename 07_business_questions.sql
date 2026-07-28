/*
    TicketFlowDB - Stage 7 final business questions

    Each query answers one business question from the Module 1
    portfolio guide.
*/

USE TicketFlowDB;
GO

------------------------------------------------------------
-- 7.1 Which events are currently scheduled?
------------------------------------------------------------

SELECT
    EventID,
    EventName,
    Category,
    EventDate,
    TicketPrice,
    TicketsAvailable,
    EventStatus
FROM Events
WHERE EventStatus = 'Scheduled'
ORDER BY EventDate;
GO

------------------------------------------------------------
-- 7.2 Which events have fewer than 50 tickets available?
------------------------------------------------------------

SELECT
    EventID,
    EventName,
    EventDate,
    TicketsAvailable,
    EventStatus
FROM Events
WHERE TicketsAvailable < 50
ORDER BY TicketsAvailable ASC;
GO

------------------------------------------------------------
-- 7.3 Which customers registered most recently?
------------------------------------------------------------

SELECT
    CustomerID,
    Fullname,
    Email,
    City,
    RegistrationDate
FROM Customers
ORDER BY RegistrationDate DESC;
GO

------------------------------------------------------------
-- 7.4 Which bookings have been cancelled?
------------------------------------------------------------

SELECT
    b.BookingID,
    c.Fullname,
    e.EventName,
    b.BookingDate,
    b.NumberOfTickets,
    b.TotalPrice,
    b.BookingStatus
FROM Bookings AS b
JOIN Customers AS c
    ON b.CustomerID = c.CustomerID
JOIN Events AS e
    ON b.EventID = e.EventID
WHERE b.BookingStatus = 'Cancelled'
ORDER BY b.BookingDate DESC;
GO

------------------------------------------------------------
-- 7.5 Which events belong to Music or Technology categories?
------------------------------------------------------------

SELECT
    EventID,
    EventName,
    Category,
    EventDate,
    TicketPrice,
    EventStatus
FROM Events
WHERE Category IN ('Music', 'Technology')
ORDER BY Category, EventDate;
GO

------------------------------------------------------------
-- 7.6 Which customers have names beginning with A or M?
------------------------------------------------------------

SELECT
    CustomerID,
    Fullname,
    Email,
    City
FROM Customers
WHERE Fullname LIKE 'A%'
   OR Fullname LIKE 'M%'
ORDER BY Fullname;
GO

------------------------------------------------------------
-- 7.7 Which events cost between £25 and £75?
------------------------------------------------------------

SELECT
    EventID,
    EventName,
    Category,
    EventDate,
    TicketPrice,
    EventStatus
FROM Events
WHERE TicketPrice BETWEEN 25.00 AND 75.00
ORDER BY TicketPrice ASC;
GO

------------------------------------------------------------
-- 7.8 Which bookings have a total value above £100?
------------------------------------------------------------

SELECT
    b.BookingID,
    c.Fullname,
    e.EventName,
    b.NumberOfTickets,
    b.TotalPrice,
    b.BookingStatus
FROM Bookings AS b
JOIN Customers AS c
    ON b.CustomerID = c.CustomerID
JOIN Events AS e
    ON b.EventID = e.EventID
WHERE b.TotalPrice > 100.00
ORDER BY b.TotalPrice DESC;
GO


USE TicketFlowDB;
GO

-- 1. Display all customers.
SELECT
    CustomerID,
    Fullname,
    Email,
    City,
    RegistrationDate
FROM Customers
ORDER BY CustomerID;

-- 2. Display all scheduled events.
SELECT
    EventID,
    VenueID,
    EventName,
    EventDate,
    TicketPrice,
    TicketsAvailable,
    EventStatus
FROM Events
WHERE EventStatus = 'Scheduled'
ORDER BY EventDate;

-- 3. Display events costing more than £40.
SELECT
    EventID,
    EventName,
    EventDate,
    TicketPrice,
    EventStatus
FROM Events
WHERE TicketPrice > 40
ORDER BY TicketPrice;

-- 4. Display events from cheapest to most expensive.
SELECT
    EventID,
    EventName,
    TicketPrice
FROM Events
ORDER BY TicketPrice ASC;

-- 5. Display customers from London.
SELECT
    CustomerID,
    Fullname,
    Email,
    City,
    RegistrationDate
FROM Customers
WHERE City = 'London'
ORDER BY Fullname;

-- 6. Display confirmed bookings.
SELECT
    BookingID,
    CustomerID,
    EventID,
    BookingDate,
    NumberOfTickets,
    TotalPrice,
    BookingStatus
FROM Bookings
WHERE BookingStatus = 'Confirmed'
ORDER BY BookingDate;

-- 7. Display bookings containing two or more tickets.
SELECT
    b.BookingID,
    b.CustomerID,
    c.Fullname,
    b.NumberOfTickets,
    b.TotalPrice
FROM Bookings AS b
JOIN Customers AS c
    ON b.CustomerID = c.CustomerID
WHERE b.NumberOfTickets >= 2
ORDER BY b.NumberOfTickets DESC;

-- 8. Display events occurring within a selected date range.
SELECT
    EventID,
    EventName,
    EventDate,
    TicketPrice,
    EventStatus
FROM Events
WHERE EventDate >= '2026-08-01'
  AND EventDate < '2026-10-01'
ORDER BY EventDate;

-- 9. Display the five most expensive events.
SELECT TOP 5
    EventID,
    EventName,
    EventDate,
    TicketPrice,
    EventStatus
FROM Events
ORDER BY TicketPrice DESC;

-- 10. Display each event category once.
-- This query requires the Category column added during your practice.
SELECT DISTINCT
    Category
FROM Events
WHERE Category IS NOT NULL
ORDER BY Category;


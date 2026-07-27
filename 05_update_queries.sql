/*
    TicketFlowDB - Stage 5 UPDATE practice

    Safety pattern:
    1. SELECT the target row.
    2. Run the targeted UPDATE.
    3. SELECT the row again to verify the result.

    Run each numbered exercise once.
*/

USE TicketFlowDB;
GO

------------------------------------------------------------
-- 5.1 Correct one customer's city
------------------------------------------------------------

-- Preview
SELECT CustomerID, Fullname, Email, City
FROM Customers
WHERE Email = 'ben.carter@example.com';

-- Update
UPDATE Customers
SET City = 'Salford'
WHERE Email = 'ben.carter@example.com';

-- Verify
SELECT CustomerID, Fullname, Email, City
FROM Customers
WHERE Email = 'ben.carter@example.com';

------------------------------------------------------------
-- 5.2 Change one customer's email address
------------------------------------------------------------

-- Preview
SELECT CustomerID, Fullname, Email
FROM Customers
WHERE Email = 'chloe.evans@example.com';

-- Update
UPDATE Customers
SET Email = 'chloe.evans.new@example.com'
WHERE Email = 'chloe.evans@example.com';

-- Verify
SELECT CustomerID, Fullname, Email
FROM Customers
WHERE Fullname = 'Chloe Evans';

------------------------------------------------------------
-- 5.3 Increase the price of one event
------------------------------------------------------------

-- Preview
SELECT EventID, EventName, TicketPrice
FROM Events
WHERE EventName = 'Summer Music Festival';

-- Update the price from £45 to £50
UPDATE Events
SET TicketPrice = 50.00
WHERE EventName = 'Summer Music Festival';

-- Verify
SELECT EventID, EventName, TicketPrice
FROM Events
WHERE EventName = 'Summer Music Festival';

------------------------------------------------------------
-- 5.4 Mark a past event as completed
------------------------------------------------------------

-- Preview all past scheduled events
SELECT EventID, EventName, EventDate, EventStatus
FROM Events
WHERE EventDate < GETDATE()
  AND EventStatus = 'Scheduled';

-- Update only past scheduled events
UPDATE Events
SET EventStatus = 'Completed'
WHERE EventDate < GETDATE()
  AND EventStatus = 'Scheduled';

-- Verify
SELECT EventID, EventName, EventDate, EventStatus
FROM Events
WHERE EventStatus = 'Completed';

------------------------------------------------------------
-- 5.5 Reduce available tickets for one event
------------------------------------------------------------

-- Preview
SELECT EventID, EventName, TicketsAvailable
FROM Events
WHERE EventID = 1;

-- Reduce availability by 10, but never allow a negative value
UPDATE Events
SET TicketsAvailable = TicketsAvailable - 10
WHERE EventID = 1
  AND TicketsAvailable >= 10;

-- Verify
SELECT EventID, EventName, TicketsAvailable
FROM Events
WHERE EventID = 1;

------------------------------------------------------------
-- 5.6 Mark one booking as cancelled
------------------------------------------------------------

-- Preview
SELECT
    BookingID,
    CustomerID,
    EventID,
    BookingStatus
FROM Bookings
WHERE BookingID = 1;

-- Update
UPDATE Bookings
SET BookingStatus = 'Cancelled'
WHERE BookingID = 1
  AND BookingStatus = 'Confirmed';

-- Verify
SELECT
    BookingID,
    CustomerID,
    EventID,
    BookingStatus
FROM Bookings
WHERE BookingID = 1;


/*
    TicketFlowDB - Stage 6 DELETE practice

    Safety pattern:
    1. Create a clearly labelled test customer with no bookings.
    2. Preview the exact customer.
    3. Delete only that customer.
    4. Verify that the customer no longer exists.

    Run sections 6.1 and 6.2 together once.
*/

USE TicketFlowDB;
GO

------------------------------------------------------------
-- 6.1 Create and preview a test customer with no bookings
------------------------------------------------------------

-- Insert the test customer only when it does not already exist.
IF NOT EXISTS (
    SELECT 1
    FROM Customers
    WHERE Email = 'delete.test@example.com'
)
BEGIN
    INSERT INTO Customers (Fullname, Email, City)
    VALUES ('Delete Test Customer', 'delete.test@example.com', 'Test City');
END;
GO

-- Preview the exact row before deleting it.
SELECT
    CustomerID,
    Fullname,
    Email,
    City,
    RegistrationDate
FROM Customers
WHERE Email = 'delete.test@example.com';
GO

------------------------------------------------------------
-- 6.2 Delete only the test customer and verify the result
------------------------------------------------------------

DELETE FROM Customers
WHERE Email = 'delete.test@example.com';
GO

-- Expected result: zero rows.
SELECT
    CustomerID,
    Fullname,
    Email,
    City,
    RegistrationDate
FROM Customers
WHERE Email = 'delete.test@example.com';
GO

------------------------------------------------------------
-- 6.3 Demonstrate foreign-key protection
------------------------------------------------------------

-- Preview customers who have at least one booking.
SELECT DISTINCT
    c.CustomerID,
    c.Fullname,
    c.Email
FROM Customers AS c
JOIN Bookings AS b
    ON c.CustomerID = b.CustomerID
ORDER BY c.CustomerID;
GO

/*
    Highlight and run the DELETE below separately if you want to
    demonstrate SQL Server's foreign-key protection.

    Expected result:
    SQL Server refuses the deletion because the customer is still
    referenced by the Bookings table. Keep the foreign-key constraint.

    DELETE FROM Customers
    WHERE CustomerID = 1;
*/


# Implementation Notes

## 1. Application Overview
The Student Registration and Grading Management System manages students, courses, registrations and grades.

## 2. Records
User-defined records and %ROWTYPE were used to store and retrieve student information.

## 3. Collections
An associative array was used to store multiple student names.

## 4. Cursors
Implicit cursors were demonstrated using INSERT, UPDATE and DELETE with SQL%ROWCOUNT, SQL%FOUND and SQL%NOTFOUND.

An explicit cursor retrieved student records using OPEN, FETCH and CLOSE.

## 5. Bulk Processing
BULK COLLECT retrieved multiple grade records at once. FORALL updated multiple records together.

Bulk processing reduces repeated communication between the PL/SQL engine and SQL engine, improving performance compared with row-by-row processing.

## 6. Procedures
REGISTER_STUDENT registers students for courses and uses IN and OUT parameters.

APPLY_GRADE_BONUS updates multiple grades using bulk processing.

## 7. Functions
GET_STUDENT_AVERAGE calculates and returns a student's average grade.

## 8. Exception Handling
The project demonstrates NO_DATA_FOUND, DUP_VAL_ON_INDEX, user-defined exceptions and RAISE_APPLICATION_ERROR.

## 9. Testing
Successful and unsuccessful operations were tested to verify the application.
## 10. Detailed Bulk Processing Review

### BULK COLLECT
The APPLY_GRADE_BONUS procedure retrieves registration IDs and
existing scores from the GRADES table using BULK COLLECT.

The retrieved values are stored in two collections:
- v_registration_ids
- v_scores

This allows multiple records to be retrieved into PL/SQL memory
in a single operation.

### FORALL
FORALL processes the collected registration IDs using a bulk
UPDATE statement instead of executing individual UPDATE
statements in a conventional PL/SQL loop.

### Grade Protection
The LEAST function ensures that adding a bonus does not
increase a student's score beyond 100.

### Row Count
SQL%ROWCOUNT is assigned to p_rows_updated to return the
number of rows affected by the bulk update.

### Transaction Management
The procedure does not commit automatically. Transaction
control remains with the calling program, allowing the caller
to commit or roll back changes.

### Bulk DML Exception Handling Review
The current implementation uses FORALL without SAVE EXCEPTIONS.
Consequently, individual DML failures are not collected and
reported through SQL%BULK_EXCEPTIONS.

This is an identified improvement area for the project.
SAVE EXCEPTIONS and SQL%BULK_EXCEPTIONS should be used where
individual bulk-operation failures need to be collected and
reported.

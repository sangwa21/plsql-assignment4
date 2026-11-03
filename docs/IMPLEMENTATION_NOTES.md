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
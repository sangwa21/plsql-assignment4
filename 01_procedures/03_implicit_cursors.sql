SET SERVEROUTPUT ON;

BEGIN
    INSERT INTO STUDENTS
        (FIRST_NAME, LAST_NAME, EMAIL, DATE_OF_BIRTH)
    VALUES
        ('Grace', 'Mukamana', 'grace@example.com',
         DATE '2003-05-10');

    DBMS_OUTPUT.PUT_LINE(
        'INSERT affected: ' || SQL%ROWCOUNT || ' row(s)'
    );

    UPDATE STUDENTS
    SET LAST_NAME = 'Uwimana'
    WHERE EMAIL = 'grace@example.com';

    DBMS_OUTPUT.PUT_LINE(
        'UPDATE affected: ' || SQL%ROWCOUNT || ' row(s)'
    );

    DELETE FROM STUDENTS
    WHERE EMAIL = 'grace@example.com';

    DBMS_OUTPUT.PUT_LINE(
        'DELETE affected: ' || SQL%ROWCOUNT || ' row(s)'
    );

    COMMIT;
END;
/
BEGIN
    UPDATE STUDENTS
    SET LAST_NAME = LAST_NAME
    WHERE STUDENT_ID = 1;

    IF SQL%FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Student was found and updated.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('No student was found.');
    END IF;

    UPDATE STUDENTS
    SET LAST_NAME = LAST_NAME
    WHERE STUDENT_ID = 999;

    IF SQL%NOTFOUND THEN
        DBMS_OUTPUT.PUT_LINE('No student was found for ID 999.');
    END IF;
END;
/
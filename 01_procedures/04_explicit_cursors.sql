DECLARE
    CURSOR student_cursor IS
        SELECT STUDENT_ID, FIRST_NAME, LAST_NAME
        FROM STUDENTS
        ORDER BY STUDENT_ID;

    v_student_id STUDENTS.STUDENT_ID%TYPE;
    v_first_name STUDENTS.FIRST_NAME%TYPE;
    v_last_name STUDENTS.LAST_NAME%TYPE;

BEGIN
    OPEN student_cursor;

    LOOP
        FETCH student_cursor
        INTO v_student_id, v_first_name, v_last_name;

        EXIT WHEN student_cursor%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(
            v_student_id || ' - ' ||
            v_first_name || ' ' || v_last_name
        );
    END LOOP;

    CLOSE student_cursor;
END;
/
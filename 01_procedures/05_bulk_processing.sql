DECLARE
    TYPE student_id_array IS TABLE OF STUDENTS.STUDENT_ID%TYPE;

    v_student_ids student_id_array;
BEGIN
    SELECT STUDENT_ID
    BULK COLLECT INTO v_student_ids
    FROM STUDENTS;

    DBMS_OUTPUT.PUT_LINE(
        'Students collected: ' || v_student_ids.COUNT
    );

    FORALL i IN 1 .. v_student_ids.COUNT
        UPDATE STUDENTS
        SET LAST_NAME = UPPER(LAST_NAME)
        WHERE STUDENT_ID = v_student_ids(i);

    DBMS_OUTPUT.PUT_LINE(
        'Students updated: ' || SQL%ROWCOUNT
    );

    ROLLBACK;
END;
/
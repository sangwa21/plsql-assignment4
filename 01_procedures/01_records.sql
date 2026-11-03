DECLARE
    TYPE student_record_type IS RECORD (
        student_id NUMBER,
        first_name VARCHAR2(50),
        last_name  VARCHAR2(50)
    );

    v_student student_record_type;

BEGIN
    v_student.student_id := 1;
    v_student.first_name := 'Malise';
    v_student.last_name := 'Sangwa';

    DBMS_OUTPUT.PUT_LINE('Student ID: ' || v_student.student_id);
    DBMS_OUTPUT.PUT_LINE('First Name: ' || v_student.first_name);
    DBMS_OUTPUT.PUT_LINE('Last Name: ' || v_student.last_name);
END;
/
DECLARE
    v_student STUDENTS%ROWTYPE;

BEGIN
    SELECT *
    INTO v_student
    FROM STUDENTS
    WHERE STUDENT_ID = 1;

    DBMS_OUTPUT.PUT_LINE('Student ID: ' || v_student.STUDENT_ID);
    DBMS_OUTPUT.PUT_LINE('First Name: ' || v_student.FIRST_NAME);
    DBMS_OUTPUT.PUT_LINE('Last Name: ' || v_student.LAST_NAME);
    DBMS_OUTPUT.PUT_LINE('Email: ' || v_student.EMAIL);
END;
/

SET SERVEROUTPUT ON;

-- TEST 1: Calculate student average
BEGIN
    DBMS_OUTPUT.PUT_LINE(
        'Malise Average: ' || get_student_average(1)
    );
END;
/

-- TEST 2: Register a student for a new course
DECLARE
    v_registration_id NUMBER;
BEGIN
    register_student(
        p_student_id => 1,
        p_course_id => 3,
        p_registration_id => v_registration_id
    );

    DBMS_OUTPUT.PUT_LINE(
        'Registration ID: ' || v_registration_id
    );

    ROLLBACK;
END;
/

-- TEST 3: Bulk grade processing
DECLARE
    v_updated NUMBER;
BEGIN
    apply_grade_bonus(
        p_bonus => 5,
        p_rows_updated => v_updated
    );

    DBMS_OUTPUT.PUT_LINE(
        'Grades updated: ' || v_updated
    );

    ROLLBACK;
END;
/
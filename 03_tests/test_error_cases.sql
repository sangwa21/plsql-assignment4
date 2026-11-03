SET SERVEROUTPUT ON;

-- TEST 1: Student does not exist
DECLARE
    v_registration_id NUMBER;
BEGIN
    register_student(
        p_student_id => 999,
        p_course_id => 1,
        p_registration_id => v_registration_id
    );
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Registration error: ' || SQLERRM);
END;
/

-- TEST 2: Student already registered
DECLARE
    v_registration_id NUMBER;
BEGIN
    register_student(
        p_student_id => 1,
        p_course_id => 1,
        p_registration_id => v_registration_id
    );
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Duplicate error: ' || SQLERRM);
END;
/

-- TEST 3: Invalid bonus
DECLARE
    v_updated NUMBER;
BEGIN
    apply_grade_bonus(
        p_bonus => 15,
        p_rows_updated => v_updated
    );
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Bonus error: ' || SQLERRM);
END;
/

-- TEST 4: Student has no grades
BEGIN
    DBMS_OUTPUT.PUT_LINE(
        'Average: ' || get_student_average(999)
    );
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Function error: ' || SQLERRM);
END;
/
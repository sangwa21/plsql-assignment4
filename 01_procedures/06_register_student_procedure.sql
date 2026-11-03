CREATE OR REPLACE PROCEDURE register_student (
    p_student_id IN NUMBER,
    p_course_id IN NUMBER,
    p_registration_id OUT NUMBER
)
AS
    v_student_id NUMBER;
    v_course_id NUMBER;
BEGIN
    -- Check that the student exists
    SELECT STUDENT_ID
    INTO v_student_id
    FROM STUDENTS
    WHERE STUDENT_ID = p_student_id;

    -- Check that the course exists
    SELECT COURSE_ID
    INTO v_course_id
    FROM COURSES
    WHERE COURSE_ID = p_course_id;

    -- Register the student
    INSERT INTO REGISTRATIONS (
        STUDENT_ID, COURSE_ID
    )
    VALUES (
        p_student_id, p_course_id
    )
    RETURNING REGISTRATION_ID INTO p_registration_id;

    DBMS_OUTPUT.PUT_LINE('Registration successful!');
    DBMS_OUTPUT.PUT_LINE('Registration ID: ' || p_registration_id);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(
            -20001, 'Student or course does not exist.'
        );

    WHEN DUP_VAL_ON_INDEX THEN
        RAISE_APPLICATION_ERROR(
            -20002, 'Student is already registered for this course.'
        );

    WHEN OTHERS THEN
        RAISE;
END;
/
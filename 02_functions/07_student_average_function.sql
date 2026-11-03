CREATE OR REPLACE FUNCTION get_student_average (
    p_student_id IN NUMBER
)
RETURN NUMBER
AS
    v_average NUMBER;
BEGIN
    SELECT AVG(g.SCORE)
    INTO v_average
    FROM STUDENTS s
    JOIN REGISTRATIONS r
        ON s.STUDENT_ID = r.STUDENT_ID
    JOIN GRADES g
        ON r.REGISTRATION_ID = g.REGISTRATION_ID
    WHERE s.STUDENT_ID = p_student_id;

    IF v_average IS NULL THEN
        RAISE_APPLICATION_ERROR(
            -20003, 'No grades found for this student.'
        );
    END IF;

    RETURN ROUND(v_average, 2);
END;
/
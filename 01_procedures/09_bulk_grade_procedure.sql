CREATE OR REPLACE PROCEDURE apply_grade_bonus (
    p_bonus IN NUMBER,
    p_rows_updated OUT NUMBER
)
AS
    TYPE registration_array IS TABLE OF GRADES.REGISTRATION_ID%TYPE;
    TYPE score_array IS TABLE OF GRADES.SCORE%TYPE;

    v_registration_ids registration_array;
    v_scores score_array;

BEGIN
    IF p_bonus <= 0 OR p_bonus > 10 THEN
        RAISE_APPLICATION_ERROR(
            -20004, 'Bonus must be greater than 0 and at most 10.'
        );
    END IF;

    SELECT REGISTRATION_ID, SCORE
    BULK COLLECT INTO v_registration_ids, v_scores
    FROM GRADES;

    IF v_registration_ids.COUNT = 0 THEN
        RAISE_APPLICATION_ERROR(-20005, 'No grades available.');
    END IF;

    FORALL i IN 1 .. v_registration_ids.COUNT
        UPDATE GRADES
        SET SCORE = LEAST(v_scores(i) + p_bonus, 100)
        WHERE REGISTRATION_ID = v_registration_ids(i);

    p_rows_updated := SQL%ROWCOUNT;

EXCEPTION
    WHEN OTHERS THEN
        RAISE;
END;
/
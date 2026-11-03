DECLARE
    e_invalid_score EXCEPTION;
    v_score NUMBER := 120;

BEGIN
    IF v_score < 0 OR v_score > 100 THEN
        RAISE e_invalid_score;
    END IF;

    DBMS_OUTPUT.PUT_LINE('Valid score: ' || v_score);

EXCEPTION
    WHEN e_invalid_score THEN
        DBMS_OUTPUT.PUT_LINE(
            'Error: Score must be between 0 and 100.'
        );
END;
/
DECLARE
    TYPE student_name_array IS TABLE OF VARCHAR2(100)
        INDEX BY PLS_INTEGER;

    v_student_names student_name_array;

BEGIN
    v_student_names(1) := 'Malise Sangwa';
    v_student_names(2) := 'Alice Uwase';
    v_student_names(3) := 'David Mugisha';

    DBMS_OUTPUT.PUT_LINE('Student 1: ' || v_student_names(1));
    DBMS_OUTPUT.PUT_LINE('Student 2: ' || v_student_names(2));
    DBMS_OUTPUT.PUT_LINE('Student 3: ' || v_student_names(3));
END;
/
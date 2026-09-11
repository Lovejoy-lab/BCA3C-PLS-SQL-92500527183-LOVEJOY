SET SERVEROUTPUT ON;

DECLARE
CURSOR emp_cur IS
SELECT ename, sal
FROM emp
ORDER BY sal DESC;

v_count NUMBER := 0;
BEGIN
DBMS_OUTPUT.PUT_LINE('Top 3 Highest Paid Employees');
DBMS_OUTPUT.PUT.LINE('----------------------------');

FOR emp_rec IN emp_cur LOOP
v_count := v_count + 1;

EXIT WHEN v_count > 3;

DBMS_OUTPUT.PUT_LINE(v_count || '. NAME: ' || emp_rec.ename || ' salary: ' || emp_rec.sal);

END LOOP;
END;
/
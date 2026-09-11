SET SERVEROUTPUT ON;

DECLARE
CURSOR emp_cur IS
SELECT emp_name, department , basic_salary
FROM employees
ORDER BY basic_salary DESC;

v_emp_name      employees.emp_name%TYPE;
v_department    employees.department%TYPE;
v_basic_salary  employees.basic_salary%TYPE;

BEGIN
DBMS_OUTPUT.PUT.LINE('Top 5 Employees with Highest Basic Salary');
DBMS_OUTPUT.PUT.LINE('-------------');
DBMS_OUTPUT.PUT.LINE(RPAD('Name',20) || RPAD('Department',20) || 'Basic Salary');
DBMS_OUTPUT.PUT.LINE('----------------');

OPEN emp_cur;
LOOP
FETCH emp_cur INTO v_emp_name, v_department, v_basic_salary;

EXIT WHEN emp_cur%NOTFOUND;

DBMS_OUTPUT.PUT_LINE(
RPAD(v_emp_name,20) || RPAD(v_department,20) || v_basic_salary
);

EXIT WHEN emp_cur%ROWCOUNT = 5;
END LOOP;
CLOSE emp_cur;

EXCEPTION 
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('Error occurred: ') || SQLERRM);
IF emp_cur%ISOPEN THEN
CLOSE emp_cur;
END IF;

END;
/
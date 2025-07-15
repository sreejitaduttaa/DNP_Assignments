CREATE OR REPLACE PROCEDURE UpdateEmployeeBonus (
    dept_id IN NUMBER,
    bonus_percent IN NUMBER
) IS
BEGIN
  UPDATE EMPLOYEES
  SET SALARY = SALARY + (SALARY * bonus_percent / 100)
  WHERE DEPARTMENT_ID = dept_id;
  
  COMMIT;
END;
/

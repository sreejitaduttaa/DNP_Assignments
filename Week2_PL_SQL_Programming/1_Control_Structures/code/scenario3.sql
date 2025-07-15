BEGIN
  FOR loan IN (
    SELECT L.LOAN_ID, L.DUE_DATE, C.NAME
    FROM LOANS L
    JOIN CUSTOMERS C ON L.CUSTOMER_ID = C.CUSTOMER_ID
    WHERE L.DUE_DATE BETWEEN SYSDATE AND SYSDATE + 30
  ) LOOP
    DBMS_OUTPUT.PUT_LINE('Reminder: Loan ID ' || loan.LOAN_ID || ' for customer ' || loan.NAME ||
                         ' is due on ' || TO_CHAR(loan.DUE_DATE, 'DD-MON-YYYY'));
  END LOOP;
END;
/

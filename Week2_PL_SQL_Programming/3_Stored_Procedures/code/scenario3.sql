CREATE OR REPLACE PROCEDURE TransferFunds (
    from_account IN NUMBER,
    to_account IN NUMBER,
    amount IN NUMBER
) IS
    insufficient_balance EXCEPTION;
    curr_balance NUMBER;
BEGIN
  -- Check balance of source account
  SELECT BALANCE INTO curr_balance
  FROM ACCOUNTS
  WHERE ACCOUNT_ID = from_account;

  IF curr_balance < amount THEN
    RAISE insufficient_balance;
  END IF;

  -- Deduct from source
  UPDATE ACCOUNTS
  SET BALANCE = BALANCE - amount
  WHERE ACCOUNT_ID = from_account;

  -- Add to target
  UPDATE ACCOUNTS
  SET BALANCE = BALANCE + amount
  WHERE ACCOUNT_ID = to_account;

  COMMIT;

EXCEPTION
  WHEN insufficient_balance THEN
    DBMS_OUTPUT.PUT_LINE('Transfer failed: insufficient balance.');
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Account not found.');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Unexpected error: ' || SQLERRM);
END;
/

CREATE TABLE BankLoanInfoT
(
    Bno CHAR(5) PRIMARY KEY,
    LoanNum INT,
    LoanEno VARCHAR(100)
);
INSERT INTO BankLoanInfoT
    (Bno,LoanNum)
SELECT Bno, COUNT(Ldate)
FROM LoanT
GROUP BY Bno;
DECLARE task_6 CURSOR
FOR SELECT Bno, LoanNum
FROM BankLoanInfoT
OPEN task_6
DECLARE @Bno CHAR(5),@LoanEno VARCHAR(100),@LoanNum INT
FETCH NEXT FROM task_6 INTO @Bno,@LoanNum
WHILE @@FETCH_STATUS=0 BEGIN
    SET @LoanEno=''
    SET @LoanNum=@LoanNum-1
    DECLARE task_6_1 CURSOR
FOR SELECT Eno
    FROM LoanT
    WHERE Bno=@Bno
    OPEN task_6_1
    DECLARE @Eno CHAR(3)
    FETCH NEXT FROM task_6_1 INTO @Eno
    WHILE @@FETCH_STATUS=0 BEGIN
        SET @LoanEno=@LoanEno+@Eno
        IF @LoanNum>0 BEGIN
            SET @LoanEno=@LoanEno+'£¬'
            SET @LoanNum=@LoanNum-1
        END
        FETCH NEXT FROM task_6_1 INTO @Eno
    END
    CLOSE task_6_1
    DEALLOCATE task_6_1
    UPDATE BankLoanInfoT
    SET LoanEno=@LoanEno
    WHERE Bno=@Bno;
    FETCH NEXT FROM task_6 INTO @Bno,@LoanNum
END
CLOSE task_6
DEALLOCATE task_6
DECLARE task_4 CURSOR
FOR SELECT DISTINCT Bname
FROM BankT, LoanT
WHERE BankT.Bno=LoanT.Bno AND Ldate IS NOT NULL
OPEN task_4
DECLARE @Bname NVARCHAR(10)
FETCH NEXT FROM task_4
INTO @Bname
WHILE @@FETCH_STATUS = 0 BEGIN
    PRINT @Bname+'总贷款金额最多的前两名法人贷款信息：
法人名称　　　　　　　　　　总贷款金额（万元）'
    DECLARE task_4_1 CURSOR
FOR SELECT Ename, Lamount
    FROM LegalEntityT, LoanT
    WHERE LegalEntityT.Eno = LoanT.Eno AND Bno = (SELECT Bno
        FROM BankT
        WHERE Bname = @Bname) AND (Lamount >= (SELECT MAX(Lamount)
        FROM LoanT
        WHERE Bno = (SELECT Bno
            FROM BankT
            WHERE Bname = @Bname) and Lamount < (SELECT MAX(Lamount)
            FROM LoanT
            WHERE Bno = (SELECT Bno
            FROM BankT
            WHERE Bname = @Bname))) OR Lamount = (SELECT MAX(Lamount)
        FROM LoanT
        WHERE Bno = (SELECT Bno
        FROM BankT
        WHERE Bname = @Bname)))
    ORDER BY Lamount DESC
    OPEN task_4_1
    DECLARE @Ename NVARCHAR(15), @Lamount NVARCHAR(5)
    FETCH NEXT FROM task_4_1
INTO @Ename, @Lamount
    WHILE @@FETCH_STATUS = 0 BEGIN
        PRINT @Ename+'　　　　　　'+@Lamount
        FETCH NEXT FROM task_4_1
INTO @Ename, @Lamount
    END
    CLOSE task_4_1
    DEALLOCATE task_4_1
    FETCH NEXT FROM task_4
INTO @Bname
END
CLOSE task_4
DEALLOCATE task_4

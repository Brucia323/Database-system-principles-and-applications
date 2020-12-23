DECLARE task_5 CURSOR
FOR SELECT Bno, COUNT(Ldate)
FROM LoanT
GROUP BY Bno
OPEN task_5
DECLARE @Bno CHAR(5),@count CHAR(2),@str NVARCHAR(100),@num int
FETCH NEXT FROM task_5 INTO @Bno,@count
WHILE @@FETCH_STATUS=0 BEGIN
    SET @str=NULL
    SET @str=@Bno+'一共提供'+@count+'次贷款，法人代码为：'
    SET @num=CONVERT(int,@count)-1
    DECLARE task_5_1 CURSOR
FOR SELECT Eno
    FROM LoanT
    WHERE Bno=@Bno
    OPEN task_5_1
    DECLARE @Eno CHAR(3)
    FETCH NEXT FROM task_5_1 INTO @Eno
    WHILE @@FETCH_STATUS=0 BEGIN
        SET @str=@str+@Eno
        IF @num>0 BEGIN
            SET @str=@str+'，'
            SET @num=@num-1
        END
        FETCH NEXT FROM task_5_1 INTO @Eno
    END
    CLOSE task_5_1
    DEALLOCATE task_5_1
    PRINT @str
    FETCH NEXT FROM task_5 INTO @Bno,@count
END
CLOSE task_5
DEALLOCATE task_5
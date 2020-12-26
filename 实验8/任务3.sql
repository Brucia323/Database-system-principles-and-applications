CREATE TRIGGER task_3
   ON  LoanT
   AFTER UPDATE
AS 
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON;

    -- Insert statements for trigger here
    IF NOT EXISTS (SELECT *
    FROM sysobjects
    WHERE name = 'modificaitonLamountT') BEGIN
        CREATE TABLE modificaitonLamountT
        (
            Eno CHAR(3),
            Bno CHAR(5),
            Ldate DATETIME,
            Lterm INT,
            oldAmount INT,
            newAmount INT
        )
        INSERT INTO modificaitonLamountT
            (Eno,Bno,Ldate,newAmount,Lterm)
        SELECT *
        FROM inserted
        UPDATE modificaitonLamountT SET oldAmount=( SELECT lamount
        FROM deleted) WHERE Ldate = (SELECT Ldate
        FROM inserted)
    END
	ELSE BEGIN
        INSERT INTO modificaitonLamountT
            (Eno,Bno,Ldate,Lterm,newAmount)
        SELECT *
        FROM inserted
        UPDATE modificaitonLamountT SET oldAmount=( SELECT lamount
        FROM deleted) WHERE Ldate = (SELECT Ldate
        FROM inserted)
    END
END

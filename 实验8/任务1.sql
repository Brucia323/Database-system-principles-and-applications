CREATE TRIGGER task_1
   ON  LoanT
   INSTEAD OF INSERT
AS 
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON;

    -- Insert statements for trigger here
    IF (SELECT Lterm
    FROM inserted) > 10 BEGIN
        DECLARE @Eno CHAR(3)
        SELECT @Eno = Eno
        FROM inserted
        IF (SELECT Enature
        FROM LegalEntityT
        WHERE Eno=@Eno)='私营' BEGIN
            PRINT '私营企业贷款年限不得超过10年'
            ROLLBACK TRANSACTION
        END
    END
END

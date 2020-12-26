CREATE TRIGGER task_2
   ON  LoanT
   AFTER DELETE
AS 
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON;

    -- Insert statements for trigger here
    IF NOT EXISTS (SELECT *
    FROM sysobjects
    WHERE name = 'backupLoanT')
	SELECT *
    INTO backupLoanT
    FROM deleted
	ELSE
	INSERT INTO backupLoanT
    SELECT *
    FROM deleted
END

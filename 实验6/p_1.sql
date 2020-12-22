SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		zcy
-- Create date: 2020-12-19
-- Description:	创建并执行存储过程p_1,查询“工商银行北京A支行”的贷款情况，要求列出法人名称、贷款日期和贷款金额。
-- =============================================
ALTER PROCEDURE [dbo].[p_1]
-- Add the parameters for the stored procedure here
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON;

    -- Insert statements for procedure here
    SELECT Ename, Ldate, Lamount
    FROM LegalEntityT, LoanT
    WHERE LegalEntityT.Eno = LoanT.Eno AND Bno = (SELECT Bno
        FROM BankT
        WHERE Bname = '工商银行北京A支行')
END
GO

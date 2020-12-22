SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		zcy
-- Create date: 2020-12-19
-- Description:	创建带输入参数的存储过程p_2，查询某家指定银行的贷款情况，要求列出法人名称、贷款日期和贷款金额。执行该存储过程查询“工商银行北京B支行”的贷款情况。
-- =============================================
CREATE PROCEDURE [dbo].[p_2]
    -- Add the parameters for the stored procedure here
    @Bname nvarchar(10)
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
        WHERE Bname = @Bname)
END
GO

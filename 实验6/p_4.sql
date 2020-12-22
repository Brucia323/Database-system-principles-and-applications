SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		zcy
-- Create date: 2020-12-19
-- Description:	创建带多个输入参数的存储过程p_4，查询某个指定法人在某家指定银行的贷款情况，要求列出法人名称、银行名称、贷款日期和贷款金额。执行该存储过程查询“浦庆石化有限公司 ”在“建设银行上海A分行”的贷款情况。
-- =============================================
CREATE PROCEDURE [dbo].[p_4]
    -- Add the parameters for the stored procedure here
    @Ename nvarchar(15),
    @Bname nvarchar(10)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON;

    -- Insert statements for procedure here
    SELECT Ename, Bname, Ldate, Lamount
    FROM BankT, LegalEntityT, LoanT
    WHERE BankT.Bno = LoanT.Bno AND LegalEntityT.Eno = LoanT.Eno AND Ename = @Ename AND Bname = @Bname
END
GO

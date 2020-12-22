SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		zcy
-- Create date: 2020-12-19
-- Description:	创建存储过程p_7，统计：在指定银行贷款且贷款金额高于此银行平均贷款金额的法人名称、贷款日期和贷款金额。如果指定银行为 “工商银行北京B支行”，执行此存储过程，查询符合条件的贷款人。
-- =============================================
CREATE PROCEDURE [dbo].[p_7]
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
        WHERE Bname = @Bname) AND Lamount > (SELECT AVG(Lamount)
        FROM LoanT
        WHERE Bno = (SELECT Bno
        FROM BankT
        WHERE Bname = @Bname))
END
GO

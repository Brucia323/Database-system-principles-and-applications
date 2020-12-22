SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		zcy
-- Create date: 2020-12-19
-- Description:	创建带输入参数和输出参数的存储过程p_5，统计指定城市的银行在指定日期以后的贷款总金额和平均贷款金额，将统计结果作为输出参数。执行该存储过程查询“北京”市的所有银行在‘2008-1-1’以后的贷款总金额和平均贷款金额。
-- =============================================
CREATE PROCEDURE [dbo].[p_5]
    -- Add the parameters for the stored procedure here
    @sum int OUTPUT,
    @avg int OUTPUT,
    @Bname nvarchar(15),
    @Ldate smalldatetime
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON;

    -- Insert statements for procedure here
    SELECT @sum = SUM(Lamount), @avg = AVG(Lamount)
    FROM LoanT, BankT
    WHERE LoanT.Bno = BankT.Bno AND Bname like '%' + @Bname + '%' AND Ldate > @Ldate
END
GO

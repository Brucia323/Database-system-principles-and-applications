SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		zcy
-- Create date: 2020-12-21
-- Description:	利用存储过程和游标，实现查询指定城市的银行信息，并按下列形式输出：
--银行代码:B1100 银行名称:工商银行北京分行 电话:010-4573
--若银行的联系电话为空值，则输出“未知”
-- =============================================
CREATE PROCEDURE [dbo].[task_2]
    -- Add the parameters for the stored procedure here
    @city nvarchar(10)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON;

    -- Insert statements for procedure here
    DECLARE task_2 CURSOR
  FOR SELECT *
    FROM BankT
    WHERE Bname LIKE '%'+@city+'%'
    OPEN task_2
    DECLARE @bank_id CHAR(5),@bank_name NVARCHAR(20),@bank_tel CHAR(15)
    FETCH NEXT FROM task_2
  into @bank_id,@bank_name,@bank_tel
    WHILE @@FETCH_STATUS=0
  BEGIN
        IF @bank_tel IS NULL
  SET @bank_tel='未知'
        PRINT '银行代码：'+@bank_id+' 银行名称：'+@bank_name+' 联系电话：'+@bank_tel
        FETCH NEXT FROM task_2 INTO @bank_id,@bank_name,@bank_tel
    END
    CLOSE task_2
    DEALLOCATE task_2
END
GO

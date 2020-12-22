SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		zcy
-- Create date: 2020-12-19
-- Description:	创建带输入参数、输出参数和默认值的存储过程p_6，统计：m+(m+1)+(m+2)+„+n的和，其中m和n都为整数，且m<n，m、n的默认值分别为1和100。执行该存储过程，计算1~20以内整数的和。
-- =============================================
CREATE PROCEDURE [dbo].[p_6]
    -- Add the parameters for the stored procedure here
    @m int = 1,
    @n int = 100,
    @sum int output
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET @sum = 0;

    -- Insert statements for procedure here
    while @m < @n
	begin
        set @sum = @sum + @m
        set @m = @m +1
    end
END
GO

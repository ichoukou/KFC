USE [CMS]
GO
/****** Object:  StoredProcedure [dbo].[SP_GetPartnerLinkList]    Script Date: 03/13/2012 16:08:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [SP_InsertAPKDownLoadlog]
	@VERSION varchar(255),
	@CHANNEL varchar(255),
	@IPADDRESS varchar(50)
AS
BEGIN
	INSERT INTO [dbo].[APKDownLoad_log] ([DATETIME],[VERSION] ,[CHANNEL] ,[IPADDRESS]) VALUES (GETDATE() ,@VERSION ,@CHANNEL ,@IPADDRESS)

	IF EXISTS (SELECT [PartnerID] FROM [CMS].[dbo].[PartnerLinkManager] where [PartnerID]= @CHANNEL)
    BEGIN
        UPDATE [CMS].[dbo].[PartnerLinkManager]
        SET Hits=(case when Hits is null then 1 else Hits + 1 end)
        WHERE [PartnerID]= @CHANNEL
    END
END

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CMS_SYS_ROLES]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CMS_SYS_ROLES](
	[Role_ID] [int] IDENTITY(1,1) NOT NULL,
	[Role_Name] [nvarchar](50) NOT NULL,
	[Role_Description] [nvarchar](256) NULL,
	[Role_Active] [bit] NULL DEFAULT ((1)),
	[Create_Time] [datetime] NULL CONSTRAINT [DF_CMS_SYS_ROLES_Create_Time]  DEFAULT (getdate()),
	[Update_Time] [datetime] NULL CONSTRAINT [DF_CMS_SYS_ROLES_Update_Time]  DEFAULT (getdate()),
	[Role_Creator] [nvarchar](50) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CMS_SYS_USERS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CMS_SYS_USERS](
	[User_UserID] [int] IDENTITY(1,1) NOT NULL,
	[User_Account] [nvarchar](100) NOT NULL,
	[User_Pwd] [nvarchar](32) NULL,
	[User_DspName] [nvarchar](100) NULL,
	[User_HRID] [nvarchar](20) NULL,
	[User_Email] [nvarchar](100) NULL,
	[User_Tel] [nvarchar](50) NULL,
	[User_JoinDate] [datetime] NULL,
	[User_CostCenter] [nvarchar](30) NULL,
	[User_Language] [nvarchar](50) NULL,
	[User_Level] [nvarchar](20) NULL,
	[User_Active] [bit] NOT NULL CONSTRAINT [DF__SYS_BPS_U__USER___19DFD96B]  DEFAULT ((1)),
	[User_Sex] [nvarchar](50) NOT NULL CONSTRAINT [DF__SYS_BPS_U__USER___1AD3FDA4]  DEFAULT ('male'),
	[User_Birthday] [datetime] NULL,
	[User_Title] [nvarchar](300) NULL,
	[User_Education] [nvarchar](50) NULL,
	[User_FirstName] [nvarchar](50) NULL,
	[User_LastName] [nvarchar](50) NULL,
	[User_SalesManager] [nvarchar](50) NULL,
	[Group_ID] [int] NULL CONSTRAINT [DF__SYS_BPS_U__GROUP__1BC821DD]  DEFAULT ((0)),
	[User_LineManager] [nvarchar](50) NULL,
	[User_Department] [nvarchar](100) NULL,
	[Create_Time] [datetime] NULL CONSTRAINT [DF_CMS_SYS_USERS_Create_Time]  DEFAULT (getdate()),
	[Update_Time] [datetime] NULL CONSTRAINT [DF_CMS_SYS_USERS_Update_Time]  DEFAULT (getdate()),
	[User_Creator] [nvarchar](50) NULL,
 CONSTRAINT [PK_SYS_BPS_USERS] PRIMARY KEY CLUSTERED 
(
	[User_Account] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CMS_SYS_MENU]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CMS_SYS_MENU](
	[Menu_ID] [int]  Identity(1,1) NOT NULL,
	[Parent_MenuId] [int] NULL,
	[Menu_Name] [nvarchar](100) NULL,
	[Menu_Url] [varchar](255) NULL,
	[Menu_Target] [varchar](10) NULL,
	[Menu_Show] [int] NULL,
	[Menu_OrderID] [int] NULL,
	[Menu_Type] [int] NOT NULL,
	[Menu_Level] [int] NOT NULL,
	[Menu_Limit] [int] NULL DEFAULT ((0)),
	[Create_Time] [datetime] NULL CONSTRAINT [DF_CMS_SYS_MENU_Create_Time]  DEFAULT (getdate()),
	[Update_Time] [datetime] NULL DEFAULT (getdate()),
	[Menu_Creator] [nvarchar](50) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CMS_SYS_PERMISSION]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CMS_SYS_PERMISSION](
	[GUID] [uniqueidentifier] NULL DEFAULT (newid()),
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[USER_ID] [nvarchar](50) NULL,
	[Permission_Code] [int] NULL,
	[Permission_Type] [int] NULL,
	[Module_ID] [int] NULL,
	[Module_Type] [int] NULL,
	[Module_Right] [int] NULL,
	[IsActive] [bit] NULL CONSTRAINT [DF_CMS_SYS_PERMISSION_IsActive]  DEFAULT ((1)),
	[Creator] [nvarchar](30) NULL,
	[Create_Time] [datetime] NULL DEFAULT (getdate()),
	[UpdatedBy] [nvarchar](30) NULL,
	[Update_Time] [datetime] NULL,
	[TimeSpan] [timestamp] NULL,
 CONSTRAINT [PK_COMMON_COMPETENCE] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1:用户;2:机构;3:角色' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'CMS_SYS_PERMISSION', @level2type=N'COLUMN', @level2name=N'Permission_Type'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单ID或具体模块ID' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'CMS_SYS_PERMISSION', @level2type=N'COLUMN', @level2name=N'Module_ID'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1:模块;2:页面' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'CMS_SYS_PERMISSION', @level2type=N'COLUMN', @level2name=N'Module_Type'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1:显示并可用;0:显示但不可用;-1:不显示;' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'CMS_SYS_PERMISSION', @level2type=N'COLUMN', @level2name=N'Module_Right'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'CMS_SYS_PERMISSION', @level2type=N'COLUMN', @level2name=N'Creator'

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CMS_SYS_GROUPS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CMS_SYS_GROUPS](
	[Group_ID] [int] IDENTITY(1,1) NOT NULL,
	[Group_Name] [nchar](30) NOT NULL,
	[Group_ParentID] [int] NULL DEFAULT ((0)),
	[Group_ParentName] [nchar](30) NULL,
	[Group_Type] [nchar](20) NULL,
	[Group_Code] [nvarchar](50) NULL,
	[Group_Level] [int] NULL DEFAULT ((0))
) ON [PRIMARY]
END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自动增加' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'CMS_SYS_GROUPS', @level2type=N'COLUMN', @level2name=N'Group_ID'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'组织名称' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'CMS_SYS_GROUPS', @level2type=N'COLUMN', @level2name=N'Group_Name'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父节点ID' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'CMS_SYS_GROUPS', @level2type=N'COLUMN', @level2name=N'Group_ParentID'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父节点名称' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'CMS_SYS_GROUPS', @level2type=N'COLUMN', @level2name=N'Group_ParentName'


/****** Object:  Table [dbo].[CMS_SYS_USER_ELEMENT]    Script Date: 12/12/2011 18:29:51 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CMS_SYS_USER_ELEMENT]') AND type in (N'U'))
DROP TABLE [dbo].[CMS_SYS_USER_ELEMENT]
GO

/****** Object:  Table [dbo].[CMS_SYS_USER_ELEMENT]    Script Date: 12/12/2011 18:29:51 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[CMS_SYS_USER_ELEMENT](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Role_ID] [int] NULL,
	[User_Account] [nvarchar](100) NULL,
	[UE_Type] [nvarchar](50) NULL,
	[Create_Time] [datetime] NULL,
	[Update_Time] [datetime] NULL,
	[UE_Creator] [nvarchar](50) NULL
) ON [PRIMARY]

GO


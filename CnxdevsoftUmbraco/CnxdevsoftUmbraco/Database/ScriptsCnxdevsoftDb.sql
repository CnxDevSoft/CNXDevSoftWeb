USE [master]
GO
/****** Object:  Database [CnxdevsoftDb]    Script Date: 6/7/2020 2:23:26 PM ******/
CREATE DATABASE [CnxdevsoftDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CnxdevsoftDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\CnxdevsoftDb.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CnxdevsoftDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\CnxdevsoftDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [CnxdevsoftDb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CnxdevsoftDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CnxdevsoftDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CnxdevsoftDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CnxdevsoftDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CnxdevsoftDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CnxdevsoftDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [CnxdevsoftDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CnxdevsoftDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CnxdevsoftDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CnxdevsoftDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CnxdevsoftDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CnxdevsoftDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CnxdevsoftDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CnxdevsoftDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CnxdevsoftDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CnxdevsoftDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CnxdevsoftDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CnxdevsoftDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CnxdevsoftDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CnxdevsoftDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CnxdevsoftDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CnxdevsoftDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CnxdevsoftDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CnxdevsoftDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CnxdevsoftDb] SET  MULTI_USER 
GO
ALTER DATABASE [CnxdevsoftDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CnxdevsoftDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CnxdevsoftDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CnxdevsoftDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CnxdevsoftDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CnxdevsoftDb] SET QUERY_STORE = OFF
GO
USE [CnxdevsoftDb]
GO
/****** Object:  Table [dbo].[cmsContentNu]    Script Date: 6/7/2020 2:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsContentNu](
	[nodeId] [int] NOT NULL,
	[published] [bit] NOT NULL,
	[data] [ntext] NOT NULL,
	[rv] [bigint] NOT NULL,
 CONSTRAINT [PK_cmsContentNu] PRIMARY KEY CLUSTERED 
(
	[nodeId] ASC,
	[published] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsContentType]    Script Date: 6/7/2020 2:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsContentType](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[nodeId] [int] NOT NULL,
	[alias] [nvarchar](255) NULL,
	[icon] [nvarchar](255) NULL,
	[thumbnail] [nvarchar](255) NOT NULL,
	[description] [nvarchar](1500) NULL,
	[isContainer] [bit] NOT NULL,
	[isElement] [bit] NOT NULL,
	[allowAtRoot] [bit] NOT NULL,
	[variations] [int] NOT NULL,
 CONSTRAINT [PK_cmsContentType] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsContentType2ContentType]    Script Date: 6/7/2020 2:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsContentType2ContentType](
	[parentContentTypeId] [int] NOT NULL,
	[childContentTypeId] [int] NOT NULL,
 CONSTRAINT [PK_cmsContentType2ContentType] PRIMARY KEY CLUSTERED 
(
	[parentContentTypeId] ASC,
	[childContentTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsContentTypeAllowedContentType]    Script Date: 6/7/2020 2:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsContentTypeAllowedContentType](
	[Id] [int] NOT NULL,
	[AllowedId] [int] NOT NULL,
	[SortOrder] [int] NOT NULL,
 CONSTRAINT [PK_cmsContentTypeAllowedContentType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC,
	[AllowedId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsDictionary]    Script Date: 6/7/2020 2:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsDictionary](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[parent] [uniqueidentifier] NULL,
	[key] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_cmsDictionary] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsDocumentType]    Script Date: 6/7/2020 2:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsDocumentType](
	[contentTypeNodeId] [int] NOT NULL,
	[templateNodeId] [int] NOT NULL,
	[IsDefault] [bit] NOT NULL,
 CONSTRAINT [PK_cmsDocumentType] PRIMARY KEY CLUSTERED 
(
	[contentTypeNodeId] ASC,
	[templateNodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsLanguageText]    Script Date: 6/7/2020 2:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsLanguageText](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[languageId] [int] NOT NULL,
	[UniqueId] [uniqueidentifier] NOT NULL,
	[value] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_cmsLanguageText] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsMacro]    Script Date: 6/7/2020 2:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsMacro](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[uniqueId] [uniqueidentifier] NOT NULL,
	[macroUseInEditor] [bit] NOT NULL,
	[macroRefreshRate] [int] NOT NULL,
	[macroAlias] [nvarchar](255) NOT NULL,
	[macroName] [nvarchar](255) NULL,
	[macroCacheByPage] [bit] NOT NULL,
	[macroCachePersonalized] [bit] NOT NULL,
	[macroDontRender] [bit] NOT NULL,
	[macroSource] [nvarchar](255) NOT NULL,
	[macroType] [int] NOT NULL,
 CONSTRAINT [PK_cmsMacro] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsMacroProperty]    Script Date: 6/7/2020 2:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsMacroProperty](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[uniquePropertyId] [uniqueidentifier] NOT NULL,
	[editorAlias] [nvarchar](255) NOT NULL,
	[macro] [int] NOT NULL,
	[macroPropertySortOrder] [int] NOT NULL,
	[macroPropertyAlias] [nvarchar](50) NOT NULL,
	[macroPropertyName] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_cmsMacroProperty] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsMember]    Script Date: 6/7/2020 2:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsMember](
	[nodeId] [int] NOT NULL,
	[Email] [nvarchar](1000) NOT NULL,
	[LoginName] [nvarchar](1000) NOT NULL,
	[Password] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_cmsMember] PRIMARY KEY CLUSTERED 
(
	[nodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsMember2MemberGroup]    Script Date: 6/7/2020 2:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsMember2MemberGroup](
	[Member] [int] NOT NULL,
	[MemberGroup] [int] NOT NULL,
 CONSTRAINT [PK_cmsMember2MemberGroup] PRIMARY KEY CLUSTERED 
(
	[Member] ASC,
	[MemberGroup] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsMemberType]    Script Date: 6/7/2020 2:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsMemberType](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[NodeId] [int] NOT NULL,
	[propertytypeId] [int] NOT NULL,
	[memberCanEdit] [bit] NOT NULL,
	[viewOnProfile] [bit] NOT NULL,
	[isSensitive] [bit] NOT NULL,
 CONSTRAINT [PK_cmsMemberType] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsPropertyType]    Script Date: 6/7/2020 2:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsPropertyType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[dataTypeId] [int] NOT NULL,
	[contentTypeId] [int] NOT NULL,
	[propertyTypeGroupId] [int] NULL,
	[Alias] [nvarchar](255) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[sortOrder] [int] NOT NULL,
	[mandatory] [bit] NOT NULL,
	[mandatoryMessage] [nvarchar](500) NULL,
	[validationRegExp] [nvarchar](255) NULL,
	[validationRegExpMessage] [nvarchar](500) NULL,
	[Description] [nvarchar](2000) NULL,
	[variations] [int] NOT NULL,
	[UniqueID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_cmsPropertyType] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsPropertyTypeGroup]    Script Date: 6/7/2020 2:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsPropertyTypeGroup](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[contenttypeNodeId] [int] NOT NULL,
	[text] [nvarchar](255) NOT NULL,
	[sortorder] [int] NOT NULL,
	[uniqueID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_cmsPropertyTypeGroup] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsTagRelationship]    Script Date: 6/7/2020 2:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsTagRelationship](
	[nodeId] [int] NOT NULL,
	[tagId] [int] NOT NULL,
	[propertyTypeId] [int] NOT NULL,
 CONSTRAINT [PK_cmsTagRelationship] PRIMARY KEY CLUSTERED 
(
	[nodeId] ASC,
	[propertyTypeId] ASC,
	[tagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsTags]    Script Date: 6/7/2020 2:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsTags](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[group] [nvarchar](100) NOT NULL,
	[languageId] [int] NULL,
	[tag] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_cmsTags] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsTemplate]    Script Date: 6/7/2020 2:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsTemplate](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[nodeId] [int] NOT NULL,
	[alias] [nvarchar](100) NULL,
 CONSTRAINT [PK_cmsTemplate] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoAccess]    Script Date: 6/7/2020 2:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoAccess](
	[id] [uniqueidentifier] NOT NULL,
	[nodeId] [int] NOT NULL,
	[loginNodeId] [int] NOT NULL,
	[noAccessNodeId] [int] NOT NULL,
	[createDate] [datetime] NOT NULL,
	[updateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_umbracoAccess] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoAccessRule]    Script Date: 6/7/2020 2:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoAccessRule](
	[id] [uniqueidentifier] NOT NULL,
	[accessId] [uniqueidentifier] NOT NULL,
	[ruleValue] [nvarchar](255) NOT NULL,
	[ruleType] [nvarchar](255) NOT NULL,
	[createDate] [datetime] NOT NULL,
	[updateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_umbracoAccessRule] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoAudit]    Script Date: 6/7/2020 2:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoAudit](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[performingUserId] [int] NOT NULL,
	[performingDetails] [nvarchar](1024) NULL,
	[performingIp] [nvarchar](64) NULL,
	[eventDateUtc] [datetime] NOT NULL,
	[affectedUserId] [int] NOT NULL,
	[affectedDetails] [nvarchar](1024) NULL,
	[eventType] [nvarchar](256) NOT NULL,
	[eventDetails] [nvarchar](1024) NULL,
 CONSTRAINT [PK_umbracoAudit] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoCacheInstruction]    Script Date: 6/7/2020 2:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoCacheInstruction](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[utcStamp] [datetime] NOT NULL,
	[jsonInstruction] [ntext] NOT NULL,
	[originated] [nvarchar](500) NOT NULL,
	[instructionCount] [int] NOT NULL,
 CONSTRAINT [PK_umbracoCacheInstruction] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoConsent]    Script Date: 6/7/2020 2:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoConsent](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[current] [bit] NOT NULL,
	[source] [nvarchar](512) NOT NULL,
	[context] [nvarchar](128) NOT NULL,
	[action] [nvarchar](512) NOT NULL,
	[createDate] [datetime] NOT NULL,
	[state] [int] NOT NULL,
	[comment] [nvarchar](255) NULL,
 CONSTRAINT [PK_umbracoConsent] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoContent]    Script Date: 6/7/2020 2:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoContent](
	[nodeId] [int] NOT NULL,
	[contentTypeId] [int] NOT NULL,
 CONSTRAINT [PK_umbracoContent] PRIMARY KEY CLUSTERED 
(
	[nodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoContentSchedule]    Script Date: 6/7/2020 2:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoContentSchedule](
	[id] [uniqueidentifier] NOT NULL,
	[nodeId] [int] NOT NULL,
	[languageId] [int] NULL,
	[date] [datetime] NOT NULL,
	[action] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_umbracoContentSchedule] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoContentVersion]    Script Date: 6/7/2020 2:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoContentVersion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nodeId] [int] NOT NULL,
	[versionDate] [datetime] NOT NULL,
	[userId] [int] NULL,
	[current] [bit] NOT NULL,
	[text] [nvarchar](255) NULL,
 CONSTRAINT [PK_umbracoContentVersion] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoContentVersionCultureVariation]    Script Date: 6/7/2020 2:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoContentVersionCultureVariation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[versionId] [int] NOT NULL,
	[languageId] [int] NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[date] [datetime] NOT NULL,
	[availableUserId] [int] NULL,
 CONSTRAINT [PK_umbracoContentVersionCultureVariation] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoDataType]    Script Date: 6/7/2020 2:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoDataType](
	[nodeId] [int] NOT NULL,
	[propertyEditorAlias] [nvarchar](255) NOT NULL,
	[dbType] [nvarchar](50) NOT NULL,
	[config] [ntext] NULL,
 CONSTRAINT [PK_umbracoDataType] PRIMARY KEY CLUSTERED 
(
	[nodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoDocument]    Script Date: 6/7/2020 2:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoDocument](
	[nodeId] [int] NOT NULL,
	[published] [bit] NOT NULL,
	[edited] [bit] NOT NULL,
 CONSTRAINT [PK_umbracoDocument] PRIMARY KEY CLUSTERED 
(
	[nodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoDocumentCultureVariation]    Script Date: 6/7/2020 2:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoDocumentCultureVariation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nodeId] [int] NOT NULL,
	[languageId] [int] NOT NULL,
	[edited] [bit] NOT NULL,
	[available] [bit] NOT NULL,
	[published] [bit] NOT NULL,
	[name] [nvarchar](255) NULL,
 CONSTRAINT [PK_umbracoDocumentCultureVariation] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoDocumentVersion]    Script Date: 6/7/2020 2:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoDocumentVersion](
	[id] [int] NOT NULL,
	[templateId] [int] NULL,
	[published] [bit] NOT NULL,
 CONSTRAINT [PK_umbracoDocumentVersion] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoDomain]    Script Date: 6/7/2020 2:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoDomain](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[domainDefaultLanguage] [int] NULL,
	[domainRootStructureID] [int] NULL,
	[domainName] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_umbracoDomain] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoExternalLogin]    Script Date: 6/7/2020 2:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoExternalLogin](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NOT NULL,
	[loginProvider] [nvarchar](4000) NOT NULL,
	[providerKey] [nvarchar](4000) NOT NULL,
	[createDate] [datetime] NOT NULL,
 CONSTRAINT [PK_umbracoExternalLogin] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoKeyValue]    Script Date: 6/7/2020 2:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoKeyValue](
	[key] [nvarchar](256) NOT NULL,
	[value] [nvarchar](255) NULL,
	[updated] [datetime] NOT NULL,
 CONSTRAINT [PK_umbracoKeyValue] PRIMARY KEY CLUSTERED 
(
	[key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoLanguage]    Script Date: 6/7/2020 2:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoLanguage](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[languageISOCode] [nvarchar](14) NULL,
	[languageCultureName] [nvarchar](100) NULL,
	[isDefaultVariantLang] [bit] NOT NULL,
	[mandatory] [bit] NOT NULL,
	[fallbackLanguageId] [int] NULL,
 CONSTRAINT [PK_umbracoLanguage] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoLock]    Script Date: 6/7/2020 2:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoLock](
	[id] [int] NOT NULL,
	[value] [int] NOT NULL,
	[name] [nvarchar](64) NOT NULL,
 CONSTRAINT [PK_umbracoLock] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoLog]    Script Date: 6/7/2020 2:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoLog](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NULL,
	[NodeId] [int] NOT NULL,
	[entityType] [nvarchar](50) NULL,
	[Datestamp] [datetime] NOT NULL,
	[logHeader] [nvarchar](50) NOT NULL,
	[logComment] [nvarchar](4000) NULL,
	[parameters] [nvarchar](500) NULL,
 CONSTRAINT [PK_umbracoLog] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoMediaVersion]    Script Date: 6/7/2020 2:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoMediaVersion](
	[id] [int] NOT NULL,
	[path] [nvarchar](255) NULL,
 CONSTRAINT [PK_umbracoMediaVersion] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoNode]    Script Date: 6/7/2020 2:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoNode](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[uniqueId] [uniqueidentifier] NOT NULL,
	[parentId] [int] NOT NULL,
	[level] [int] NOT NULL,
	[path] [nvarchar](150) NOT NULL,
	[sortOrder] [int] NOT NULL,
	[trashed] [bit] NOT NULL,
	[nodeUser] [int] NULL,
	[text] [nvarchar](255) NULL,
	[nodeObjectType] [uniqueidentifier] NULL,
	[createDate] [datetime] NOT NULL,
 CONSTRAINT [PK_umbracoNode] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoPropertyData]    Script Date: 6/7/2020 2:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoPropertyData](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[versionId] [int] NOT NULL,
	[propertyTypeId] [int] NOT NULL,
	[languageId] [int] NULL,
	[segment] [nvarchar](256) NULL,
	[intValue] [int] NULL,
	[decimalValue] [decimal](38, 6) NULL,
	[dateValue] [datetime] NULL,
	[varcharValue] [nvarchar](512) NULL,
	[textValue] [ntext] NULL,
 CONSTRAINT [PK_umbracoPropertyData] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoRedirectUrl]    Script Date: 6/7/2020 2:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoRedirectUrl](
	[id] [uniqueidentifier] NOT NULL,
	[contentKey] [uniqueidentifier] NOT NULL,
	[createDateUtc] [datetime] NOT NULL,
	[url] [nvarchar](255) NOT NULL,
	[culture] [nvarchar](255) NULL,
	[urlHash] [nvarchar](40) NOT NULL,
 CONSTRAINT [PK_umbracoRedirectUrl] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoRelation]    Script Date: 6/7/2020 2:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoRelation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[parentId] [int] NOT NULL,
	[childId] [int] NOT NULL,
	[relType] [int] NOT NULL,
	[datetime] [datetime] NOT NULL,
	[comment] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_umbracoRelation] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoRelationType]    Script Date: 6/7/2020 2:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoRelationType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[typeUniqueId] [uniqueidentifier] NOT NULL,
	[dual] [bit] NOT NULL,
	[parentObjectType] [uniqueidentifier] NULL,
	[childObjectType] [uniqueidentifier] NULL,
	[name] [nvarchar](255) NOT NULL,
	[alias] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_umbracoRelationType] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoServer]    Script Date: 6/7/2020 2:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoServer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[address] [nvarchar](500) NOT NULL,
	[computerName] [nvarchar](255) NOT NULL,
	[registeredDate] [datetime] NOT NULL,
	[lastNotifiedDate] [datetime] NOT NULL,
	[isActive] [bit] NOT NULL,
	[isMaster] [bit] NOT NULL,
 CONSTRAINT [PK_umbracoServer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoUser]    Script Date: 6/7/2020 2:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUser](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userDisabled] [bit] NOT NULL,
	[userNoConsole] [bit] NOT NULL,
	[userName] [nvarchar](255) NOT NULL,
	[userLogin] [nvarchar](125) NOT NULL,
	[userPassword] [nvarchar](500) NOT NULL,
	[passwordConfig] [nvarchar](500) NULL,
	[userEmail] [nvarchar](255) NOT NULL,
	[userLanguage] [nvarchar](10) NULL,
	[securityStampToken] [nvarchar](255) NULL,
	[failedLoginAttempts] [int] NULL,
	[lastLockoutDate] [datetime] NULL,
	[lastPasswordChangeDate] [datetime] NULL,
	[lastLoginDate] [datetime] NULL,
	[emailConfirmedDate] [datetime] NULL,
	[invitedDate] [datetime] NULL,
	[createDate] [datetime] NOT NULL,
	[updateDate] [datetime] NOT NULL,
	[avatar] [nvarchar](500) NULL,
	[tourData] [ntext] NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoUser2NodeNotify]    Script Date: 6/7/2020 2:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUser2NodeNotify](
	[userId] [int] NOT NULL,
	[nodeId] [int] NOT NULL,
	[action] [nchar](1) NOT NULL,
 CONSTRAINT [PK_umbracoUser2NodeNotify] PRIMARY KEY CLUSTERED 
(
	[userId] ASC,
	[nodeId] ASC,
	[action] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoUser2UserGroup]    Script Date: 6/7/2020 2:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUser2UserGroup](
	[userId] [int] NOT NULL,
	[userGroupId] [int] NOT NULL,
 CONSTRAINT [PK_user2userGroup] PRIMARY KEY CLUSTERED 
(
	[userId] ASC,
	[userGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoUserGroup]    Script Date: 6/7/2020 2:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUserGroup](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userGroupAlias] [nvarchar](200) NOT NULL,
	[userGroupName] [nvarchar](200) NOT NULL,
	[userGroupDefaultPermissions] [nvarchar](50) NULL,
	[createDate] [datetime] NOT NULL,
	[updateDate] [datetime] NOT NULL,
	[icon] [nvarchar](255) NULL,
	[startContentId] [int] NULL,
	[startMediaId] [int] NULL,
 CONSTRAINT [PK_umbracoUserGroup] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoUserGroup2App]    Script Date: 6/7/2020 2:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUserGroup2App](
	[userGroupId] [int] NOT NULL,
	[app] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_userGroup2App] PRIMARY KEY CLUSTERED 
(
	[userGroupId] ASC,
	[app] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoUserGroup2NodePermission]    Script Date: 6/7/2020 2:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUserGroup2NodePermission](
	[userGroupId] [int] NOT NULL,
	[nodeId] [int] NOT NULL,
	[permission] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_umbracoUserGroup2NodePermission] PRIMARY KEY CLUSTERED 
(
	[userGroupId] ASC,
	[nodeId] ASC,
	[permission] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoUserLogin]    Script Date: 6/7/2020 2:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUserLogin](
	[sessionId] [uniqueidentifier] NOT NULL,
	[userId] [int] NOT NULL,
	[loggedInUtc] [datetime] NOT NULL,
	[lastValidatedUtc] [datetime] NOT NULL,
	[loggedOutUtc] [datetime] NULL,
	[ipAddress] [nvarchar](255) NULL,
 CONSTRAINT [PK_umbracoUserLogin] PRIMARY KEY CLUSTERED 
(
	[sessionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoUserStartNode]    Script Date: 6/7/2020 2:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUserStartNode](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NOT NULL,
	[startNode] [int] NOT NULL,
	[startNodeType] [int] NOT NULL,
 CONSTRAINT [PK_userStartNode] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1095, 0, N'{"properties":{"heroHeader":[{"culture":"","seg":"","val":"Umbraco Demo"}],"heroDescription":[{"culture":"","seg":"","val":"Moonfish, steelhead, lamprey southern flounder tadpole fish sculpin bigeye, blue-redstripe danio collared dogfish. Smalleye squaretail goldfish arowana butterflyfish pipefish wolf-herring jewel tetra, shiner; gibberfish red velvetfish. Thornyhead yellowfin pike threadsail ayu cutlassfish."}],"heroCTACaption":[{"culture":"","seg":"","val":"Check our products"}],"HeroCtalink":[{"culture":"","seg":"","val":"umb://document/ec4aafcc0c254f25a8fe705bfae1d324"}],"bodyText":[{"culture":"","seg":"","val":"{\n  \"name\": \"1 column layout\",\n  \"sections\": [\n    {\n      \"grid\": 12,\n      \"rows\": [\n        {\n          \"name\": \"Full Width\",\n          \"areas\": [\n            {\n              \"grid\": 12,\n              \"allowAll\": false,\n              \"allowed\": [\n                \"media\",\n                \"macro\",\n                \"embed\",\n                \"headline\"\n              ],\n              \"hasConfig\": false,\n              \"controls\": [\n                {\n                  \"value\": {\n                    \"macroAlias\": \"latestBlogposts\",\n                    \"macroParamsDictionary\": {\n                      \"numberOfPosts\": \"3\",\n                      \"startNodeId\": \"umb://document/1d770f10d1ca4a269d68071e2c9f7ac1\"\n                    }\n                  },\n                  \"editor\": {\n                    \"name\": \"Macro\",\n                    \"alias\": \"macro\",\n                    \"view\": \"macro\",\n                    \"render\": null,\n                    \"icon\": \"icon-settings-alt\",\n                    \"config\": {}\n                  },\n                  \"active\": false\n                }\n              ]\n            }\n          ],\n          \"hasConfig\": false,\n          \"id\": \"314cb47b-fbe1-eeb6-f7cc-38db875d0f06\"\n        }\n      ]\n    }\n  ]\n}"}],"footerHeader":[{"culture":"","seg":"","val":"Umbraco Demo"}],"footerDescription":[{"culture":"","seg":"","val":"Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Vivamus suscipit tortor eget felis porttitor volutpat"}],"footerCTACaption":[{"culture":"","seg":"","val":"Read All on the Blog"}],"FooterCtalink":[{"culture":"","seg":"","val":"umb://document/1d770f10d1ca4a269d68071e2c9f7ac1"}],"footerAddress":[{"culture":"","seg":"","val":"Umbraco HQ - Unicorn Square - Haubergsvej 1 - 5000 Odense C - Denmark - +45 70 26 11 62"}],"HeroBackgroundImage":[{"culture":"","seg":"","val":"umb://media/662af6ca411a4c93a6c722c4845698e7"}],"font":[{"culture":"","seg":"","val":"serif"}],"colorTheme":[{"culture":"","seg":"","val":"earth"}],"sitename":[{"culture":"","seg":"","val":"Umbraco Sample Site"}],"SiteLogo":[]},"cultureData":{},"urlSegment":"home"}', 1)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1095, 1, N'{"properties":{"heroHeader":[{"culture":"","seg":"","val":"Umbraco Demo"}],"heroDescription":[{"culture":"","seg":"","val":"Moonfish, steelhead, lamprey southern flounder tadpole fish sculpin bigeye, blue-redstripe danio collared dogfish. Smalleye squaretail goldfish arowana butterflyfish pipefish wolf-herring jewel tetra, shiner; gibberfish red velvetfish. Thornyhead yellowfin pike threadsail ayu cutlassfish."}],"heroCTACaption":[{"culture":"","seg":"","val":"Check our products"}],"HeroCtalink":[{"culture":"","seg":"","val":"umb://document/ec4aafcc0c254f25a8fe705bfae1d324"}],"bodyText":[{"culture":"","seg":"","val":"{\n  \"name\": \"1 column layout\",\n  \"sections\": [\n    {\n      \"grid\": 12,\n      \"rows\": [\n        {\n          \"name\": \"Full Width\",\n          \"areas\": [\n            {\n              \"grid\": 12,\n              \"allowAll\": false,\n              \"allowed\": [\n                \"media\",\n                \"macro\",\n                \"embed\",\n                \"headline\"\n              ],\n              \"hasConfig\": false,\n              \"controls\": [\n                {\n                  \"value\": {\n                    \"macroAlias\": \"latestBlogposts\",\n                    \"macroParamsDictionary\": {\n                      \"numberOfPosts\": \"3\",\n                      \"startNodeId\": \"umb://document/1d770f10d1ca4a269d68071e2c9f7ac1\"\n                    }\n                  },\n                  \"editor\": {\n                    \"name\": \"Macro\",\n                    \"alias\": \"macro\",\n                    \"view\": \"macro\",\n                    \"render\": null,\n                    \"icon\": \"icon-settings-alt\",\n                    \"config\": {}\n                  },\n                  \"active\": false\n                }\n              ]\n            }\n          ],\n          \"hasConfig\": false,\n          \"id\": \"314cb47b-fbe1-eeb6-f7cc-38db875d0f06\"\n        }\n      ]\n    }\n  ]\n}"}],"footerHeader":[{"culture":"","seg":"","val":"Umbraco Demo"}],"footerDescription":[{"culture":"","seg":"","val":"Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Vivamus suscipit tortor eget felis porttitor volutpat"}],"footerCTACaption":[{"culture":"","seg":"","val":"Read All on the Blog"}],"FooterCtalink":[{"culture":"","seg":"","val":"umb://document/1d770f10d1ca4a269d68071e2c9f7ac1"}],"footerAddress":[{"culture":"","seg":"","val":"Umbraco HQ - Unicorn Square - Haubergsvej 1 - 5000 Odense C - Denmark - +45 70 26 11 62"}],"HeroBackgroundImage":[{"culture":"","seg":"","val":"umb://media/662af6ca411a4c93a6c722c4845698e7"}],"font":[{"culture":"","seg":"","val":"serif"}],"colorTheme":[{"culture":"","seg":"","val":"earth"}],"sitename":[{"culture":"","seg":"","val":"Umbraco Sample Site"}],"SiteLogo":[]},"cultureData":{},"urlSegment":"home"}', 0)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1096, 0, N'{"properties":{"pageTitle":[{"culture":"","seg":"","val":"Our Gorgeous Selection"}],"bodyText":[{"culture":"","seg":"","val":"{\n  \"name\": \"1 column layout\",\n  \"sections\": [\n    {\n      \"grid\": 12,\n      \"allowAll\": true,\n      \"rows\": []\n    }\n  ]\n}"}],"seoMetaDescription":[],"keywords":[{"culture":"","seg":"","val":"[]"}],"umbracoNavihide":[{"culture":"","seg":"","val":0}],"defaultCurrency":[{"culture":"","seg":"","val":"[\"€\"]"}],"featuredProducts":[{"culture":"","seg":"","val":"umb://document/262beb7053a649b89e98cfde2e85a78e,umb://document/df1eb830411b4d41a3433917b76d533c,umb://document/4e96411ab8e1435f93222faee30ef5f2,umb://document/d390a562107d4f028df757aa86bad752,umb://document/bb7d5ae007ac40b8b5b918c36947fb56,umb://document/202cdc2f1a4540f4a653a7b321e1c54c,umb://document/103171c8e11c40029bb2f3404cada22a,umb://document/061662b9b02a4dcfaf5992b603e8e3e1"}]},"cultureData":{},"urlSegment":"products"}', 1)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1096, 1, N'{"properties":{"pageTitle":[{"culture":"","seg":"","val":"Our Gorgeous Selection"}],"bodyText":[{"culture":"","seg":"","val":"{\n  \"name\": \"1 column layout\",\n  \"sections\": [\n    {\n      \"grid\": 12,\n      \"allowAll\": true,\n      \"rows\": []\n    }\n  ]\n}"}],"seoMetaDescription":[],"keywords":[{"culture":"","seg":"","val":"[]"}],"umbracoNavihide":[{"culture":"","seg":"","val":0}],"defaultCurrency":[{"culture":"","seg":"","val":"[\"€\"]"}],"featuredProducts":[{"culture":"","seg":"","val":"umb://document/262beb7053a649b89e98cfde2e85a78e,umb://document/df1eb830411b4d41a3433917b76d533c,umb://document/4e96411ab8e1435f93222faee30ef5f2,umb://document/d390a562107d4f028df757aa86bad752,umb://document/bb7d5ae007ac40b8b5b918c36947fb56,umb://document/202cdc2f1a4540f4a653a7b321e1c54c,umb://document/103171c8e11c40029bb2f3404cada22a,umb://document/061662b9b02a4dcfaf5992b603e8e3e1"}]},"cultureData":{},"urlSegment":"products"}', 0)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1097, 0, N'{"properties":{"productName":[{"culture":"","seg":"","val":"Tattoo"}],"price":[{"culture":"","seg":"","val":499.0}],"category":[{"culture":"","seg":"","val":"tattoo,dedication"}],"description":[{"culture":"","seg":"","val":"Cras ultricies ligula sed magna dictum porta."}],"sku":[{"culture":"","seg":"","val":"UMB-TATTOO"}],"photos":[{"culture":"","seg":"","val":"umb://media/20e3a8ffad1b4fe9b48cb8461c46d2d0"}],"features":[],"bodyText":[{"culture":"","seg":"","val":"{\n  \"name\": \"1 column layout\",\n  \"sections\": [\n    {\n      \"grid\": 12,\n      \"allowAll\": true,\n      \"rows\": []\n    }\n  ]\n}"}]},"cultureData":{},"urlSegment":"tattoo"}', 1)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1097, 1, N'{"properties":{"productName":[{"culture":"","seg":"","val":"Tattoo"}],"price":[{"culture":"","seg":"","val":499.0}],"category":[{"culture":"","seg":"","val":"tattoo,dedication"}],"description":[{"culture":"","seg":"","val":"Cras ultricies ligula sed magna dictum porta."}],"sku":[{"culture":"","seg":"","val":"UMB-TATTOO"}],"photos":[{"culture":"","seg":"","val":"umb://media/20e3a8ffad1b4fe9b48cb8461c46d2d0"}],"features":[],"bodyText":[{"culture":"","seg":"","val":"{\n  \"name\": \"1 column layout\",\n  \"sections\": [\n    {\n      \"grid\": 12,\n      \"allowAll\": true,\n      \"rows\": []\n    }\n  ]\n}"}]},"cultureData":{},"urlSegment":"tattoo"}', 0)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1098, 0, N'{"properties":{"productName":[{"culture":"","seg":"","val":"Unicorn"}],"price":[{"culture":"","seg":"","val":249.0}],"category":[{"culture":"","seg":"","val":"animals"}],"description":[{"culture":"","seg":"","val":"Quisque velit nisi, pretium ut lacinia in, elementum id enim. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Cras ultricies ligula sed magna dictum porta."}],"sku":[{"culture":"","seg":"","val":"UMB-UNICORN"}],"photos":[{"culture":"","seg":"","val":"umb://media/1bc5280b8658402789d958e2576e469b"}],"features":[],"bodyText":[{"culture":"","seg":"","val":"{\n  \"name\": \"1 column layout\",\n  \"sections\": [\n    {\n      \"grid\": 12,\n      \"allowAll\": true,\n      \"rows\": []\n    }\n  ]\n}"}]},"cultureData":{},"urlSegment":"unicorn"}', 1)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1098, 1, N'{"properties":{"productName":[{"culture":"","seg":"","val":"Unicorn"}],"price":[{"culture":"","seg":"","val":249.0}],"category":[{"culture":"","seg":"","val":"animals"}],"description":[{"culture":"","seg":"","val":"Quisque velit nisi, pretium ut lacinia in, elementum id enim. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Cras ultricies ligula sed magna dictum porta."}],"sku":[{"culture":"","seg":"","val":"UMB-UNICORN"}],"photos":[{"culture":"","seg":"","val":"umb://media/1bc5280b8658402789d958e2576e469b"}],"features":[],"bodyText":[{"culture":"","seg":"","val":"{\n  \"name\": \"1 column layout\",\n  \"sections\": [\n    {\n      \"grid\": 12,\n      \"allowAll\": true,\n      \"rows\": []\n    }\n  ]\n}"}]},"cultureData":{},"urlSegment":"unicorn"}', 0)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1099, 0, N'{"properties":{"productName":[{"culture":"","seg":"","val":"Ping Pong Ball"}],"price":[{"culture":"","seg":"","val":2.0}],"category":[{"culture":"","seg":"","val":"sports,bingo"}],"description":[{"culture":"","seg":"","val":"Vivamus suscipit tortor eget felis porttitor volutpat. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Cras ultricies ligula sed magna dictum porta."}],"sku":[{"culture":"","seg":"","val":"UMB-PINGPONG"}],"photos":[{"culture":"","seg":"","val":"umb://media/c09ec77f08e3466aac58c979befd3cd6"}],"features":[],"bodyText":[{"culture":"","seg":"","val":"{\n  \"name\": \"1 column layout\",\n  \"sections\": [\n    {\n      \"grid\": 12,\n      \"allowAll\": true,\n      \"rows\": []\n    }\n  ]\n}"}]},"cultureData":{},"urlSegment":"ping-pong-ball"}', 1)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1099, 1, N'{"properties":{"productName":[{"culture":"","seg":"","val":"Ping Pong Ball"}],"price":[{"culture":"","seg":"","val":2.0}],"category":[{"culture":"","seg":"","val":"sports,bingo"}],"description":[{"culture":"","seg":"","val":"Vivamus suscipit tortor eget felis porttitor volutpat. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Cras ultricies ligula sed magna dictum porta."}],"sku":[{"culture":"","seg":"","val":"UMB-PINGPONG"}],"photos":[{"culture":"","seg":"","val":"umb://media/c09ec77f08e3466aac58c979befd3cd6"}],"features":[],"bodyText":[{"culture":"","seg":"","val":"{\n  \"name\": \"1 column layout\",\n  \"sections\": [\n    {\n      \"grid\": 12,\n      \"allowAll\": true,\n      \"rows\": []\n    }\n  ]\n}"}]},"cultureData":{},"urlSegment":"ping-pong-ball"}', 0)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1100, 0, N'{"properties":{"productName":[{"culture":"","seg":"","val":"Bowling Ball"}],"price":[{"culture":"","seg":"","val":899.0}],"category":[{"culture":"","seg":"","val":"sports,bingo"}],"description":[{"culture":"","seg":"","val":"Cras ultricies ligula sed magna dictum porta."}],"sku":[{"culture":"","seg":"","val":"UMB-BOWLING"}],"photos":[{"culture":"","seg":"","val":"umb://media/b76ddb4ee603401499066087984740ec"}],"features":[],"bodyText":[{"culture":"","seg":"","val":"{\n  \"name\": \"1 column layout\",\n  \"sections\": [\n    {\n      \"grid\": 12,\n      \"allowAll\": true,\n      \"rows\": []\n    }\n  ]\n}"}]},"cultureData":{},"urlSegment":"bowling-ball"}', 1)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1100, 1, N'{"properties":{"productName":[{"culture":"","seg":"","val":"Bowling Ball"}],"price":[{"culture":"","seg":"","val":899.0}],"category":[{"culture":"","seg":"","val":"sports,bingo"}],"description":[{"culture":"","seg":"","val":"Cras ultricies ligula sed magna dictum porta."}],"sku":[{"culture":"","seg":"","val":"UMB-BOWLING"}],"photos":[{"culture":"","seg":"","val":"umb://media/b76ddb4ee603401499066087984740ec"}],"features":[],"bodyText":[{"culture":"","seg":"","val":"{\n  \"name\": \"1 column layout\",\n  \"sections\": [\n    {\n      \"grid\": 12,\n      \"allowAll\": true,\n      \"rows\": []\n    }\n  ]\n}"}]},"cultureData":{},"urlSegment":"bowling-ball"}', 0)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1101, 0, N'{"properties":{"productName":[{"culture":"","seg":"","val":"Jumpsuit"}],"price":[{"culture":"","seg":"","val":89.0}],"category":[{"culture":"","seg":"","val":"fashion,bingo"}],"description":[{"culture":"","seg":"","val":"Proin eget tortor risus. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Quisque velit nisi, pretium ut lacinia in, elementum id enim. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Cras ultricies ligula sed magna dictum porta."}],"sku":[{"culture":"","seg":"","val":"UMB-JUMPSUIT"}],"photos":[{"culture":"","seg":"","val":"umb://media/46a025d6095a4b148b961b59ca4e951c"}],"features":[],"bodyText":[{"culture":"","seg":"","val":"{\n  \"name\": \"1 column layout\",\n  \"sections\": [\n    {\n      \"grid\": 12,\n      \"allowAll\": true,\n      \"rows\": []\n    }\n  ]\n}"}]},"cultureData":{},"urlSegment":"jumpsuit"}', 1)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1101, 1, N'{"properties":{"productName":[{"culture":"","seg":"","val":"Jumpsuit"}],"price":[{"culture":"","seg":"","val":89.0}],"category":[{"culture":"","seg":"","val":"fashion,bingo"}],"description":[{"culture":"","seg":"","val":"Proin eget tortor risus. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Quisque velit nisi, pretium ut lacinia in, elementum id enim. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Cras ultricies ligula sed magna dictum porta."}],"sku":[{"culture":"","seg":"","val":"UMB-JUMPSUIT"}],"photos":[{"culture":"","seg":"","val":"umb://media/46a025d6095a4b148b961b59ca4e951c"}],"features":[],"bodyText":[{"culture":"","seg":"","val":"{\n  \"name\": \"1 column layout\",\n  \"sections\": [\n    {\n      \"grid\": 12,\n      \"allowAll\": true,\n      \"rows\": []\n    }\n  ]\n}"}]},"cultureData":{},"urlSegment":"jumpsuit"}', 0)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1102, 0, N'{"properties":{"productName":[{"culture":"","seg":"","val":"Banjo"}],"price":[{"culture":"","seg":"","val":399.0}],"category":[{"culture":"","seg":"","val":"bingo,music"}],"description":[{"culture":"","seg":"","val":"Vivamus suscipit tortor eget felis porttitor volutpat. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula. Proin eget tortor risus."}],"sku":[{"culture":"","seg":"","val":"UMB-BANJO"}],"photos":[{"culture":"","seg":"","val":"umb://media/17552d12081d4d01b68132c495d6576f"}],"features":[],"bodyText":[{"culture":"","seg":"","val":"{\n  \"name\": \"1 column layout\",\n  \"sections\": [\n    {\n      \"grid\": 12,\n      \"allowAll\": true,\n      \"rows\": []\n    }\n  ]\n}"}]},"cultureData":{},"urlSegment":"banjo"}', 1)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1102, 1, N'{"properties":{"productName":[{"culture":"","seg":"","val":"Banjo"}],"price":[{"culture":"","seg":"","val":399.0}],"category":[{"culture":"","seg":"","val":"bingo,music"}],"description":[{"culture":"","seg":"","val":"Vivamus suscipit tortor eget felis porttitor volutpat. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula. Proin eget tortor risus."}],"sku":[{"culture":"","seg":"","val":"UMB-BANJO"}],"photos":[{"culture":"","seg":"","val":"umb://media/17552d12081d4d01b68132c495d6576f"}],"features":[],"bodyText":[{"culture":"","seg":"","val":"{\n  \"name\": \"1 column layout\",\n  \"sections\": [\n    {\n      \"grid\": 12,\n      \"allowAll\": true,\n      \"rows\": []\n    }\n  ]\n}"}]},"cultureData":{},"urlSegment":"banjo"}', 0)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1103, 0, N'{"properties":{"productName":[{"culture":"","seg":"","val":"Knitted Unicorn West"}],"price":[{"culture":"","seg":"","val":1899.0}],"category":[{"culture":"","seg":"","val":"bingo,fashion"}],"description":[{"culture":"","seg":"","val":"Knitted Unicorn West"}],"sku":[{"culture":"","seg":"","val":"UMB-WEST"}],"photos":[{"culture":"","seg":"","val":"umb://media/1d0b713a022a49c8b842a2463c83a553"}],"features":[],"bodyText":[{"culture":"","seg":"","val":"{\n  \"name\": \"1 column layout\",\n  \"sections\": [\n    {\n      \"grid\": 12,\n      \"allowAll\": true,\n      \"rows\": []\n    }\n  ]\n}"}]},"cultureData":{},"urlSegment":"knitted-west"}', 1)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1103, 1, N'{"properties":{"productName":[{"culture":"","seg":"","val":"Knitted Unicorn West"}],"price":[{"culture":"","seg":"","val":1899.0}],"category":[{"culture":"","seg":"","val":"bingo,fashion"}],"description":[{"culture":"","seg":"","val":"Knitted Unicorn West"}],"sku":[{"culture":"","seg":"","val":"UMB-WEST"}],"photos":[{"culture":"","seg":"","val":"umb://media/1d0b713a022a49c8b842a2463c83a553"}],"features":[],"bodyText":[{"culture":"","seg":"","val":"{\n  \"name\": \"1 column layout\",\n  \"sections\": [\n    {\n      \"grid\": 12,\n      \"allowAll\": true,\n      \"rows\": []\n    }\n  ]\n}"}]},"cultureData":{},"urlSegment":"knitted-west"}', 0)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1104, 0, N'{"properties":{"productName":[{"culture":"","seg":"","val":"Biker Jacket"}],"price":[{"culture":"","seg":"","val":199.0}],"category":[{"culture":"","seg":"","val":"bingo,clothing"}],"description":[{"culture":"","seg":"","val":"Donec rutrum congue leo eget malesuada. Vivamus suscipit tortor eget felis porttitor volutpat."}],"sku":[{"culture":"","seg":"","val":"UMB-BIKER-JACKET"}],"photos":[{"culture":"","seg":"","val":"umb://media/55514845b8bd487cb3709724852fd6bb"}],"features":[{"culture":"","seg":"","val":"[{\"key\":\"6a47c043-7699-49c6-a0ed-b335b135ea2b\",\"name\":\"Free shipping\",\"ncContentTypeAlias\":\"feature\",\"featureName\":\"Free shipping\",\"featureDetails\":\"Isn''t that awesome - you only pay for the product\"},{\"key\":\"075c935f-4987-4a46-bed9-3286c27f0121\",\"name\":\"1 Day return policy\",\"ncContentTypeAlias\":\"feature\",\"featureName\":\"1 Day return policy\",\"featureDetails\":\"You''ll need to make up your mind fast\"},{\"key\":\"457e0ee3-c066-46fa-b379-a083b38aaa20\",\"name\":\"100 Years warranty\",\"ncContentTypeAlias\":\"feature\",\"featureName\":\"100 Years warranty\",\"featureDetails\":\"But if you''re satisfied it''ll last a lifetime\"}]"}],"bodyText":[{"culture":"","seg":"","val":"{\n  \"name\": \"1 column layout\",\n  \"sections\": [\n    {\n      \"grid\": 12,\n      \"allowAll\": true,\n      \"rows\": []\n    }\n  ]\n}"}]},"cultureData":{},"urlSegment":"biker-jacket"}', 1)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1104, 1, N'{"properties":{"productName":[{"culture":"","seg":"","val":"Biker Jacket"}],"price":[{"culture":"","seg":"","val":199.0}],"category":[{"culture":"","seg":"","val":"bingo,clothing"}],"description":[{"culture":"","seg":"","val":"Donec rutrum congue leo eget malesuada. Vivamus suscipit tortor eget felis porttitor volutpat."}],"sku":[{"culture":"","seg":"","val":"UMB-BIKER-JACKET"}],"photos":[{"culture":"","seg":"","val":"umb://media/55514845b8bd487cb3709724852fd6bb"}],"features":[{"culture":"","seg":"","val":"[{\"key\":\"6a47c043-7699-49c6-a0ed-b335b135ea2b\",\"name\":\"Free shipping\",\"ncContentTypeAlias\":\"feature\",\"featureName\":\"Free shipping\",\"featureDetails\":\"Isn''t that awesome - you only pay for the product\"},{\"key\":\"075c935f-4987-4a46-bed9-3286c27f0121\",\"name\":\"1 Day return policy\",\"ncContentTypeAlias\":\"feature\",\"featureName\":\"1 Day return policy\",\"featureDetails\":\"You''ll need to make up your mind fast\"},{\"key\":\"457e0ee3-c066-46fa-b379-a083b38aaa20\",\"name\":\"100 Years warranty\",\"ncContentTypeAlias\":\"feature\",\"featureName\":\"100 Years warranty\",\"featureDetails\":\"But if you''re satisfied it''ll last a lifetime\"}]"}],"bodyText":[{"culture":"","seg":"","val":"{\n  \"name\": \"1 column layout\",\n  \"sections\": [\n    {\n      \"grid\": 12,\n      \"allowAll\": true,\n      \"rows\": []\n    }\n  ]\n}"}]},"cultureData":{},"urlSegment":"biker-jacket"}', 0)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1105, 0, N'{"properties":{"seoMetaDescription":[],"keywords":[{"culture":"","seg":"","val":"[]"}],"umbracoNavihide":[{"culture":"","seg":"","val":0}],"pageTitle":[{"culture":"","seg":"","val":"Nice crazy people"}],"bodyText":[{"culture":"","seg":"","val":"{\n  \"name\": \"1 column layout\",\n  \"sections\": [\n    {\n      \"grid\": 12,\n      \"allowAll\": true,\n      \"rows\": []\n    }\n  ]\n}"}],"featuredPeople":[]},"cultureData":{},"urlSegment":"people"}', 1)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1105, 1, N'{"properties":{"seoMetaDescription":[],"keywords":[{"culture":"","seg":"","val":"[]"}],"umbracoNavihide":[{"culture":"","seg":"","val":0}],"pageTitle":[{"culture":"","seg":"","val":"Nice crazy people"}],"bodyText":[{"culture":"","seg":"","val":"{\n  \"name\": \"1 column layout\",\n  \"sections\": [\n    {\n      \"grid\": 12,\n      \"allowAll\": true,\n      \"rows\": []\n    }\n  ]\n}"}],"featuredPeople":[]},"cultureData":{},"urlSegment":"people"}', 0)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1106, 0, N'{"properties":{"seoMetaDescription":[],"keywords":[{"culture":"","seg":"","val":"[]"}],"umbracoNavihide":[{"culture":"","seg":"","val":0}],"photo":[{"culture":"","seg":"","val":"umb://media/cf1ab8dcad0f4a8e974b87b84777b0d6"}],"department":[{"culture":"","seg":"","val":"mvp,Denmark"}],"email":[],"twitterUsername":[],"facebookUsername":[],"linkedInUsername":[],"instagramUsername":[]},"cultureData":{},"urlSegment":"jan-skovgaard"}', 1)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1106, 1, N'{"properties":{"seoMetaDescription":[],"keywords":[{"culture":"","seg":"","val":"[]"}],"umbracoNavihide":[{"culture":"","seg":"","val":0}],"photo":[{"culture":"","seg":"","val":"umb://media/cf1ab8dcad0f4a8e974b87b84777b0d6"}],"department":[{"culture":"","seg":"","val":"mvp,Denmark"}],"email":[],"twitterUsername":[],"facebookUsername":[],"linkedInUsername":[],"instagramUsername":[]},"cultureData":{},"urlSegment":"jan-skovgaard"}', 0)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1107, 0, N'{"properties":{"seoMetaDescription":[],"keywords":[{"culture":"","seg":"","val":"[]"}],"umbracoNavihide":[{"culture":"","seg":"","val":0}],"photo":[{"culture":"","seg":"","val":"umb://media/eee91c05b2e84031a056dcd7f28eff89"}],"department":[{"culture":"","seg":"","val":"United Kingdom,mvp"}],"email":[],"twitterUsername":[{"culture":"","seg":"","val":"mattbrailsford"}],"facebookUsername":[],"linkedInUsername":[],"instagramUsername":[{"culture":"","seg":"","val":"circuitbeard"}]},"cultureData":{},"urlSegment":"matt-brailsford"}', 1)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1107, 1, N'{"properties":{"seoMetaDescription":[],"keywords":[{"culture":"","seg":"","val":"[]"}],"umbracoNavihide":[{"culture":"","seg":"","val":0}],"photo":[{"culture":"","seg":"","val":"umb://media/eee91c05b2e84031a056dcd7f28eff89"}],"department":[{"culture":"","seg":"","val":"United Kingdom,mvp"}],"email":[],"twitterUsername":[{"culture":"","seg":"","val":"mattbrailsford"}],"facebookUsername":[],"linkedInUsername":[],"instagramUsername":[{"culture":"","seg":"","val":"circuitbeard"}]},"cultureData":{},"urlSegment":"matt-brailsford"}', 0)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1108, 0, N'{"properties":{"seoMetaDescription":[],"keywords":[{"culture":"","seg":"","val":"[]"}],"umbracoNavihide":[{"culture":"","seg":"","val":0}],"photo":[{"culture":"","seg":"","val":"umb://media/fa763e0d0ceb408c8720365d57e06e32"}],"department":[{"culture":"","seg":"","val":"United Kingdom,mvp"}],"email":[],"twitterUsername":[],"facebookUsername":[],"linkedInUsername":[],"instagramUsername":[]},"cultureData":{},"urlSegment":"lee-kelleher"}', 1)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1108, 1, N'{"properties":{"seoMetaDescription":[],"keywords":[{"culture":"","seg":"","val":"[]"}],"umbracoNavihide":[{"culture":"","seg":"","val":0}],"photo":[{"culture":"","seg":"","val":"umb://media/fa763e0d0ceb408c8720365d57e06e32"}],"department":[{"culture":"","seg":"","val":"United Kingdom,mvp"}],"email":[],"twitterUsername":[],"facebookUsername":[],"linkedInUsername":[],"instagramUsername":[]},"cultureData":{},"urlSegment":"lee-kelleher"}', 0)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1109, 0, N'{"properties":{"seoMetaDescription":[],"keywords":[{"culture":"","seg":"","val":"[]"}],"umbracoNavihide":[{"culture":"","seg":"","val":0}],"photo":[{"culture":"","seg":"","val":"umb://media/c0969cab13ab4de9819a848619ac2b5d"}],"department":[{"culture":"","seg":"","val":"United Kingdom,mvp"}],"email":[],"twitterUsername":[],"facebookUsername":[],"linkedInUsername":[],"instagramUsername":[]},"cultureData":{},"urlSegment":"jeavon-leopold"}', 1)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1109, 1, N'{"properties":{"seoMetaDescription":[],"keywords":[{"culture":"","seg":"","val":"[]"}],"umbracoNavihide":[{"culture":"","seg":"","val":0}],"photo":[{"culture":"","seg":"","val":"umb://media/c0969cab13ab4de9819a848619ac2b5d"}],"department":[{"culture":"","seg":"","val":"United Kingdom,mvp"}],"email":[],"twitterUsername":[],"facebookUsername":[],"linkedInUsername":[],"instagramUsername":[]},"cultureData":{},"urlSegment":"jeavon-leopold"}', 0)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1110, 0, N'{"properties":{"seoMetaDescription":[],"keywords":[{"culture":"","seg":"","val":"[]"}],"umbracoNavihide":[{"culture":"","seg":"","val":0}],"photo":[{"culture":"","seg":"","val":"umb://media/34371d0892c84015912ebaacd002c5d0"}],"department":[{"culture":"","seg":"","val":"Netherlands,mvp"}],"email":[],"twitterUsername":[],"facebookUsername":[],"linkedInUsername":[],"instagramUsername":[]},"cultureData":{},"urlSegment":"jeroen-breuer"}', 1)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1110, 1, N'{"properties":{"seoMetaDescription":[],"keywords":[{"culture":"","seg":"","val":"[]"}],"umbracoNavihide":[{"culture":"","seg":"","val":0}],"photo":[{"culture":"","seg":"","val":"umb://media/34371d0892c84015912ebaacd002c5d0"}],"department":[{"culture":"","seg":"","val":"Netherlands,mvp"}],"email":[],"twitterUsername":[],"facebookUsername":[],"linkedInUsername":[],"instagramUsername":[]},"cultureData":{},"urlSegment":"jeroen-breuer"}', 0)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1111, 0, N'{"properties":{"pageTitle":[{"culture":"","seg":"","val":"About Us"}],"bodyText":[{"culture":"","seg":"","val":"{\"name\":\"1 column layout\",\"sections\":[{\"grid\":\"12\",\"rows\":[{\"name\":\"FullWidth\",\"id\":\"f10995f1-918d-3e50-e50d-8c41bbe297ce\",\"areas\":[{\"grid\":\"12\",\"controls\":[{\"value\":\"Oooh la la\",\"editor\":{\"alias\":\"headline\",\"view\":\"textstring\"},\"styles\":null,\"config\":null}],\"styles\":null,\"config\":null}],\"styles\":null,\"config\":null},{\"name\":\"Article\",\"id\":\"4d6e2221-e2d9-95bc-8ceb-624bc8df8e3f\",\"areas\":[{\"grid\":\"4\",\"controls\":[{\"value\":{\"udi\":\"umb://media/c0969cab13ab4de9819a848619ac2b5d\",\"image\":\"/media/ja2hllog/18095416144_44a566a5f4_h.jpg\"},\"editor\":{\"alias\":\"media\",\"view\":\"media\"},\"styles\":null,\"config\":null}],\"styles\":null,\"config\":null},{\"grid\":\"8\",\"controls\":[{\"value\":\"<p>Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Curabitur aliquet quam id dui posuere blandit. Vivamus suscipit tortor eget felis porttitor volutpat. Proin eget tortor risus. Sed porttitor lectus nibh. Cras ultricies ligula sed magna dictum porta. Pellentesque in ipsum id orci porta dapibus. Pellentesque in ipsum id orci porta dapibus. Nulla porttitor accumsan tincidunt. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a.</p>\\n<p>Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Curabitur aliquet quam id dui posuere blandit. Vivamus suscipit tortor eget felis porttitor volutpat. Proin eget tortor risus. Sed porttitor lectus nibh. Cras ultricies ligula sed magna dictum porta. Pellentesque in ipsum id orci porta dapibus. Pellentesque in ipsum id orci porta dapibus. Nulla porttitor accumsan tincidunt. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a.</p>\",\"editor\":{\"alias\":\"rte\",\"view\":\"rte\"},\"styles\":null,\"config\":null},{\"value\":\"<iframe width=\\\"360\\\" height=\\\"203\\\" src=\\\"https://www.youtube.com/embed/HPgKSCp_Y_U?feature=oembed\\\" frameborder=\\\"0\\\" allow=\\\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\\\" allowfullscreen></iframe>\",\"editor\":{\"alias\":\"embed\",\"view\":\"embed\"},\"styles\":null,\"config\":null}],\"styles\":null,\"config\":null}],\"styles\":null,\"config\":null}]}]}"}],"seoMetaDescription":[],"keywords":[{"culture":"","seg":"","val":"[]"}],"umbracoNavihide":[{"culture":"","seg":"","val":0}]},"cultureData":{},"urlSegment":"about-us"}', 2)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1111, 1, N'{"properties":{"pageTitle":[{"culture":"","seg":"","val":"About Us"}],"bodyText":[{"culture":"","seg":"","val":"{\"name\":\"1 column layout\",\"sections\":[{\"grid\":\"12\",\"rows\":[{\"name\":\"FullWidth\",\"id\":\"f10995f1-918d-3e50-e50d-8c41bbe297ce\",\"areas\":[{\"grid\":\"12\",\"controls\":[{\"value\":\"Oooh la la\",\"editor\":{\"alias\":\"headline\",\"view\":\"textstring\"},\"styles\":null,\"config\":null}],\"styles\":null,\"config\":null}],\"styles\":null,\"config\":null},{\"name\":\"Article\",\"id\":\"4d6e2221-e2d9-95bc-8ceb-624bc8df8e3f\",\"areas\":[{\"grid\":\"4\",\"controls\":[{\"value\":{\"udi\":\"umb://media/c0969cab13ab4de9819a848619ac2b5d\",\"image\":\"/media/ja2hllog/18095416144_44a566a5f4_h.jpg\"},\"editor\":{\"alias\":\"media\",\"view\":\"media\"},\"styles\":null,\"config\":null}],\"styles\":null,\"config\":null},{\"grid\":\"8\",\"controls\":[{\"value\":\"<p>Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Curabitur aliquet quam id dui posuere blandit. Vivamus suscipit tortor eget felis porttitor volutpat. Proin eget tortor risus. Sed porttitor lectus nibh. Cras ultricies ligula sed magna dictum porta. Pellentesque in ipsum id orci porta dapibus. Pellentesque in ipsum id orci porta dapibus. Nulla porttitor accumsan tincidunt. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a.</p>\\n<p>Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Curabitur aliquet quam id dui posuere blandit. Vivamus suscipit tortor eget felis porttitor volutpat. Proin eget tortor risus. Sed porttitor lectus nibh. Cras ultricies ligula sed magna dictum porta. Pellentesque in ipsum id orci porta dapibus. Pellentesque in ipsum id orci porta dapibus. Nulla porttitor accumsan tincidunt. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a.</p>\",\"editor\":{\"alias\":\"rte\",\"view\":\"rte\"},\"styles\":null,\"config\":null},{\"value\":\"<iframe width=\\\"360\\\" height=\\\"203\\\" src=\\\"https://www.youtube.com/embed/HPgKSCp_Y_U?feature=oembed\\\" frameborder=\\\"0\\\" allow=\\\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\\\" allowfullscreen></iframe>\",\"editor\":{\"alias\":\"embed\",\"view\":\"embed\"},\"styles\":null,\"config\":null}],\"styles\":null,\"config\":null}],\"styles\":null,\"config\":null}]}]}"}],"seoMetaDescription":[],"keywords":[{"culture":"","seg":"","val":"[]"}],"umbracoNavihide":[{"culture":"","seg":"","val":0}]},"cultureData":{},"urlSegment":"about-us"}', 0)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1112, 0, N'{"properties":{"pageTitle":[{"culture":"","seg":"","val":"About this Starter Kit"}],"bodyText":[{"culture":"","seg":"","val":"{\n  \"name\": \"1 column layout\",\n  \"sections\": [\n    {\n      \"grid\": 12,\n      \"allowAll\": true,      \n      \"rows\": []\n    }\n  ]\n}"}],"seoMetaDescription":[],"keywords":[{"culture":"","seg":"","val":"[]"}],"umbracoNavihide":[{"culture":"","seg":"","val":0}]},"cultureData":{},"urlSegment":"about-this-starter-kit"}', 1)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1112, 1, N'{"properties":{"pageTitle":[{"culture":"","seg":"","val":"About this Starter Kit"}],"bodyText":[{"culture":"","seg":"","val":"{\n  \"name\": \"1 column layout\",\n  \"sections\": [\n    {\n      \"grid\": 12,\n      \"allowAll\": true,      \n      \"rows\": []\n    }\n  ]\n}"}],"seoMetaDescription":[],"keywords":[{"culture":"","seg":"","val":"[]"}],"umbracoNavihide":[{"culture":"","seg":"","val":0}]},"cultureData":{},"urlSegment":"about-this-starter-kit"}', 0)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1113, 0, N'{"properties":{"pageTitle":[{"culture":"","seg":"","val":"Things to improve"}],"bodyText":[{"culture":"","seg":"","val":"{\n  \"name\": \"1 column layout\",\n  \"sections\": [\n    {\n      \"grid\": 12,\n      \"allowAll\": true,\n      \"rows\": [\n        {\n          \"label\": \"\",\n          \"name\": \"Full Width\",\n          \"areas\": [\n            {\n              \"grid\": 12,\n              \"allowAll\": false,\n              \"hasConfig\": false,\n              \"controls\": [\n                {\n                  \"value\": \"<p>Here''s what could be improved in the Starter Kit so far:</p>\\n<p> </p>\\n<p>For v1:</p>\\n<ul>\\n<li>Use a custom grid editor for testimonials</li>\\n<li>Integrated Analytics on pages</li>\\n<li>Call To Action Button in the grid (with \\\"Tag Manager\\\" integration)</li>\\n<li>Macro for fetching products (with friendly grid preview)</li>\\n<li>Design Review (polish)</li>\\n<li>Verify licenses of photos (Niels)</li>\\n</ul>\\n<p>For vNext</p>\\n<ul>\\n<li><span style=\\\"text-decoration: line-through;\\\">Swap text with uploaded logo</span></li>\\n<li>Nicer pickers of products and employees</li>\\n<li>Custom Listview for products and employees</li>\\n<li>Discus template on blog posts</li>\\n<li>404 template</li>\\n<li>Member Login/Register/Profile/Forgot password</li>\\n<li>Update default styling of grid header</li>\\n<li>On a Blog post -&gt; Share/Social (tweet this / facebook this)</li>\\n</ul>\",\n                  \"editor\": {\n                    \"alias\": \"rte\"\n                  },\n                  \"active\": true,\n                }\n              ],\n              \"active\": true,\n              \"hasActiveChild\": true\n            }\n          ],\n          \"hasConfig\": false,\n          \"id\": \"5ea1e364-8406-e5e6-a82c-45985fd6054e\",\n          \"hasActiveChild\": true,\n          \"active\": true\n        }\n      ]\n    }\n  ]\n}"}],"seoMetaDescription":[],"keywords":[{"culture":"","seg":"","val":"[]"}],"umbracoNavihide":[{"culture":"","seg":"","val":0}]},"cultureData":{},"urlSegment":"todo-list-for-the-starter-kit"}', 1)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1113, 1, N'{"properties":{"pageTitle":[{"culture":"","seg":"","val":"Things to improve"}],"bodyText":[{"culture":"","seg":"","val":"{\n  \"name\": \"1 column layout\",\n  \"sections\": [\n    {\n      \"grid\": 12,\n      \"allowAll\": true,\n      \"rows\": [\n        {\n          \"label\": \"\",\n          \"name\": \"Full Width\",\n          \"areas\": [\n            {\n              \"grid\": 12,\n              \"allowAll\": false,\n              \"hasConfig\": false,\n              \"controls\": [\n                {\n                  \"value\": \"<p>Here''s what could be improved in the Starter Kit so far:</p>\\n<p> </p>\\n<p>For v1:</p>\\n<ul>\\n<li>Use a custom grid editor for testimonials</li>\\n<li>Integrated Analytics on pages</li>\\n<li>Call To Action Button in the grid (with \\\"Tag Manager\\\" integration)</li>\\n<li>Macro for fetching products (with friendly grid preview)</li>\\n<li>Design Review (polish)</li>\\n<li>Verify licenses of photos (Niels)</li>\\n</ul>\\n<p>For vNext</p>\\n<ul>\\n<li><span style=\\\"text-decoration: line-through;\\\">Swap text with uploaded logo</span></li>\\n<li>Nicer pickers of products and employees</li>\\n<li>Custom Listview for products and employees</li>\\n<li>Discus template on blog posts</li>\\n<li>404 template</li>\\n<li>Member Login/Register/Profile/Forgot password</li>\\n<li>Update default styling of grid header</li>\\n<li>On a Blog post -&gt; Share/Social (tweet this / facebook this)</li>\\n</ul>\",\n                  \"editor\": {\n                    \"alias\": \"rte\"\n                  },\n                  \"active\": true,\n                }\n              ],\n              \"active\": true,\n              \"hasActiveChild\": true\n            }\n          ],\n          \"hasConfig\": false,\n          \"id\": \"5ea1e364-8406-e5e6-a82c-45985fd6054e\",\n          \"hasActiveChild\": true,\n          \"active\": true\n        }\n      ]\n    }\n  ]\n}"}],"seoMetaDescription":[],"keywords":[{"culture":"","seg":"","val":"[]"}],"umbracoNavihide":[{"culture":"","seg":"","val":0}]},"cultureData":{},"urlSegment":"todo-list-for-the-starter-kit"}', 0)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1114, 0, N'{"properties":{"seoMetaDescription":[],"keywords":[{"culture":"","seg":"","val":"[]"}],"umbracoNavihide":[{"culture":"","seg":"","val":0}],"pageTitle":[{"culture":"","seg":"","val":"Behind The Scenes"}],"bodyText":[{"culture":"","seg":"","val":"{\n  \"name\": \"1 column layout\",\n  \"sections\": [\n    {\n      \"grid\": 12,\n      \"allowAll\": true,\n      \"rows\": []\n    }\n  ]\n}"}],"howManyPostsShouldBeShown":[{"culture":"","seg":"","val":"2"}],"disqusShortname":[]},"cultureData":{},"urlSegment":"blog"}', 1)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1114, 1, N'{"properties":{"seoMetaDescription":[],"keywords":[{"culture":"","seg":"","val":"[]"}],"umbracoNavihide":[{"culture":"","seg":"","val":0}],"pageTitle":[{"culture":"","seg":"","val":"Behind The Scenes"}],"bodyText":[{"culture":"","seg":"","val":"{\n  \"name\": \"1 column layout\",\n  \"sections\": [\n    {\n      \"grid\": 12,\n      \"allowAll\": true,\n      \"rows\": []\n    }\n  ]\n}"}],"howManyPostsShouldBeShown":[{"culture":"","seg":"","val":"2"}],"disqusShortname":[]},"cultureData":{},"urlSegment":"blog"}', 0)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1115, 0, N'{"properties":{"seoMetaDescription":[],"keywords":[{"culture":"","seg":"","val":"[]"}],"umbracoNavihide":[{"culture":"","seg":"","val":0}],"pageTitle":[{"culture":"","seg":"","val":"My Blog Post"}],"categories":[{"culture":"","seg":"","val":"[\"demo\",\"umbraco\",\"starter kit\"]"}],"excerpt":[{"culture":"","seg":"","val":"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla quis lorem ut libero malesuada feugiat. Donec rutrum congue leo eget malesuada. Donec rutrum congue leo eget malesuada."}],"bodyText":[{"culture":"","seg":"","val":"{\n  \"name\": \"1 column layout\",\n  \"sections\": [\n    {\n      \"grid\": 12,\n      \"allowAll\": true,\n      \"rows\": [\n        {\n          \"label\": \"\",\n          \"name\": \"Full Width\",\n          \"areas\": [\n            {\n              \"grid\": 12,\n              \"allowAll\": false,\n              \"hasConfig\": false,\n              \"controls\": [\n                {\n                  \"value\": \"<p>Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Donec sollicitudin molestie malesuada. Vivamus suscipit tortor eget felis porttitor volutpat. Sed porttitor lectus nibh. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Donec sollicitudin molestie malesuada.</p>\\n<p>Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Donec sollicitudin molestie malesuada. Vivamus suscipit tortor eget felis porttitor volutpat. Sed porttitor lectus nibh. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Donec sollicitudin molestie malesuada.</p>\\n<p>Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Donec sollicitudin molestie malesuada. Vivamus suscipit tortor eget felis porttitor volutpat. Sed porttitor lectus nibh. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Donec sollicitudin molestie malesuada.</p>\",\n                  \"editor\": {\n                    \"alias\": \"rte\"\n                  },\n                  \"active\": true,\n                }\n              ],\n              \"active\": true\n            }\n          ],\n          \"hasConfig\": false,\n          \"id\": \"1f96a69f-0cb9-4a00-6a76-f8cec30befec\",\n          \"hasActiveChild\": true,\n          \"active\": true\n        }\n      ]\n    }\n  ]\n}"}]},"cultureData":{},"urlSegment":"my-blog-post"}', 1)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1115, 1, N'{"properties":{"seoMetaDescription":[],"keywords":[{"culture":"","seg":"","val":"[]"}],"umbracoNavihide":[{"culture":"","seg":"","val":0}],"pageTitle":[{"culture":"","seg":"","val":"My Blog Post"}],"categories":[{"culture":"","seg":"","val":"[\"demo\",\"umbraco\",\"starter kit\"]"}],"excerpt":[{"culture":"","seg":"","val":"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla quis lorem ut libero malesuada feugiat. Donec rutrum congue leo eget malesuada. Donec rutrum congue leo eget malesuada."}],"bodyText":[{"culture":"","seg":"","val":"{\n  \"name\": \"1 column layout\",\n  \"sections\": [\n    {\n      \"grid\": 12,\n      \"allowAll\": true,\n      \"rows\": [\n        {\n          \"label\": \"\",\n          \"name\": \"Full Width\",\n          \"areas\": [\n            {\n              \"grid\": 12,\n              \"allowAll\": false,\n              \"hasConfig\": false,\n              \"controls\": [\n                {\n                  \"value\": \"<p>Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Donec sollicitudin molestie malesuada. Vivamus suscipit tortor eget felis porttitor volutpat. Sed porttitor lectus nibh. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Donec sollicitudin molestie malesuada.</p>\\n<p>Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Donec sollicitudin molestie malesuada. Vivamus suscipit tortor eget felis porttitor volutpat. Sed porttitor lectus nibh. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Donec sollicitudin molestie malesuada.</p>\\n<p>Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Donec sollicitudin molestie malesuada. Vivamus suscipit tortor eget felis porttitor volutpat. Sed porttitor lectus nibh. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Donec sollicitudin molestie malesuada.</p>\",\n                  \"editor\": {\n                    \"alias\": \"rte\"\n                  },\n                  \"active\": true,\n                }\n              ],\n              \"active\": true\n            }\n          ],\n          \"hasConfig\": false,\n          \"id\": \"1f96a69f-0cb9-4a00-6a76-f8cec30befec\",\n          \"hasActiveChild\": true,\n          \"active\": true\n        }\n      ]\n    }\n  ]\n}"}]},"cultureData":{},"urlSegment":"my-blog-post"}', 0)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1116, 0, N'{"properties":{"seoMetaDescription":[],"keywords":[{"culture":"","seg":"","val":"[]"}],"umbracoNavihide":[{"culture":"","seg":"","val":0}],"pageTitle":[{"culture":"","seg":"","val":"Now it gets exciting"}],"categories":[{"culture":"","seg":"","val":"[\"cg16\",\"codegarden\",\"umbraco\"]"}],"excerpt":[{"culture":"","seg":"","val":"Donec sollicitudin molestie malesuada. Vivamus suscipit tortor eget felis porttitor volutpat. Sed porttitor lectus nibh."}],"bodyText":[{"culture":"","seg":"","val":"{\"name\":\"1 column layout\",\"sections\":[{\"grid\":\"12\",\"rows\":[{\"name\":\"Article\",\"id\":\"011e74f2-b4de-0e4e-1cb9-23b2356b1213\",\"areas\":[{\"grid\":\"4\",\"controls\":[{\"value\":{\"udi\":\"umb://media/55514845b8bd487cb3709724852fd6bb\",\"image\":\"/media/cp3jdwxe/4730684907_8a7f8759cb_b.jpg\"},\"editor\":{\"alias\":\"media\",\"view\":null},\"styles\":null,\"config\":null}],\"styles\":null,\"config\":null},{\"grid\":\"8\",\"controls\":[{\"value\":\"<p>Donec sollicitudin molestie malesuada. Proin eget tortor risus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Nulla porttitor accumsan tincidunt. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Nulla porttitor accumsan tincidunt. Donec rutrum congue leo eget malesuada.</p>\\n<p>Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula. Pellentesque in ipsum id orci porta dapibus. Donec rutrum congue leo eget malesuada. Nulla porttitor accumsan tincidunt. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Proin eget tortor risus. Pellentesque in ipsum id orci porta dapibus. Proin eget tortor risus. Sed porttitor lectus nibh.</p>\\n<p>Pellentesque in ipsum id orci porta dapibus. Curabitur aliquet quam id dui posuere blandit. Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Donec rutrum congue leo eget malesuada. Donec rutrum congue leo eget malesuada. Sed porttitor lectus nibh. Nulla quis lorem ut libero malesuada feugiat.</p>\",\"editor\":{\"alias\":\"rte\",\"view\":null},\"styles\":null,\"config\":null}],\"styles\":null,\"config\":null}],\"styles\":null,\"config\":null}]}]}"}]},"cultureData":{},"urlSegment":"another-one"}', 2)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1116, 1, N'{"properties":{"seoMetaDescription":[],"keywords":[{"culture":"","seg":"","val":"[]"}],"umbracoNavihide":[{"culture":"","seg":"","val":0}],"pageTitle":[{"culture":"","seg":"","val":"Now it gets exciting"}],"categories":[{"culture":"","seg":"","val":"[\"cg16\",\"codegarden\",\"umbraco\"]"}],"excerpt":[{"culture":"","seg":"","val":"Donec sollicitudin molestie malesuada. Vivamus suscipit tortor eget felis porttitor volutpat. Sed porttitor lectus nibh."}],"bodyText":[{"culture":"","seg":"","val":"{\"name\":\"1 column layout\",\"sections\":[{\"grid\":\"12\",\"rows\":[{\"name\":\"Article\",\"id\":\"011e74f2-b4de-0e4e-1cb9-23b2356b1213\",\"areas\":[{\"grid\":\"4\",\"controls\":[{\"value\":{\"udi\":\"umb://media/55514845b8bd487cb3709724852fd6bb\",\"image\":\"/media/cp3jdwxe/4730684907_8a7f8759cb_b.jpg\"},\"editor\":{\"alias\":\"media\",\"view\":null},\"styles\":null,\"config\":null}],\"styles\":null,\"config\":null},{\"grid\":\"8\",\"controls\":[{\"value\":\"<p>Donec sollicitudin molestie malesuada. Proin eget tortor risus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Nulla porttitor accumsan tincidunt. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Nulla porttitor accumsan tincidunt. Donec rutrum congue leo eget malesuada.</p>\\n<p>Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula. Pellentesque in ipsum id orci porta dapibus. Donec rutrum congue leo eget malesuada. Nulla porttitor accumsan tincidunt. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Proin eget tortor risus. Pellentesque in ipsum id orci porta dapibus. Proin eget tortor risus. Sed porttitor lectus nibh.</p>\\n<p>Pellentesque in ipsum id orci porta dapibus. Curabitur aliquet quam id dui posuere blandit. Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Donec rutrum congue leo eget malesuada. Donec rutrum congue leo eget malesuada. Sed porttitor lectus nibh. Nulla quis lorem ut libero malesuada feugiat.</p>\",\"editor\":{\"alias\":\"rte\",\"view\":null},\"styles\":null,\"config\":null}],\"styles\":null,\"config\":null}],\"styles\":null,\"config\":null}]}]}"}]},"cultureData":{},"urlSegment":"another-one"}', 0)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1117, 0, N'{"properties":{"seoMetaDescription":[],"keywords":[{"culture":"","seg":"","val":"[]"}],"umbracoNavihide":[{"culture":"","seg":"","val":0}],"pageTitle":[{"culture":"","seg":"","val":"This will be great"}],"categories":[{"culture":"","seg":"","val":"[\"great\",\"umbraco\"]"}],"excerpt":[{"culture":"","seg":"","val":"Proin eget tortor risus. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Vivamus magna justo, lacinia eget consectetur sed"}],"bodyText":[{"culture":"","seg":"","val":"{\n  \"name\": \"1 column layout\",\n  \"sections\": [\n    {\n      \"grid\": 12,\n      \"allowAll\": true,\n      \"rows\": [\n        {\n          \"label\": \"\",\n          \"name\": \"Full Width\",\n          \"areas\": [\n            {\n              \"grid\": 12,\n              \"allowAll\": false,\n              \"hasConfig\": false,\n              \"controls\": [\n                {\n                  \"value\": \"<p>Vivamus suscipit tortor eget felis porttitor volutpat. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Quisque velit nisi, pretium ut lacinia in, elementum id enim. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Proin eget tortor risus. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Donec rutrum congue leo eget malesuada. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula.</p>\",\n                  \"editor\": {\n                    \"alias\": \"rte\"\n                  },\n                  \"active\": false,\n                },\n                {\n                  \"value\": \"\",\n                  \"editor\": {\n                    \"alias\": \"embed\"\n                  },\n                  \"active\": false,\n                },\n                {\n                  \"value\": \"<p> </p>\\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec sollicitudin molestie malesuada. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. Cras ultricies ligula sed magna dictum porta. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras ultricies ligula sed magna dictum porta. Pellentesque in ipsum id orci porta dapibus.</p>\\n<p>Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Nulla quis lorem ut libero malesuada feugiat. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Sed porttitor lectus nibh. Vivamus suscipit tortor eget felis porttitor volutpat. Nulla porttitor accumsan tincidunt. Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Nulla porttitor accumsan tincidunt.</p>\\n<p>Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Vivamus suscipit tortor eget felis porttitor volutpat. Sed porttitor lectus nibh. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Quisque velit nisi, pretium ut lacinia in, elementum id enim. Donec rutrum congue leo eget malesuada. Nulla porttitor accumsan tincidunt. Nulla quis lorem ut libero malesuada feugiat. Quisque velit nisi, pretium ut lacinia in, elementum id enim. Donec sollicitudin molestie malesuada.</p>\\n<p>Proin eget tortor risus. Donec rutrum congue leo eget malesuada. Pellentesque in ipsum id orci porta dapibus. Donec rutrum congue leo eget malesuada. Nulla quis lorem ut libero malesuada feugiat. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Donec sollicitudin molestie malesuada. Vivamus suscipit tortor eget felis porttitor volutpat.</p>\",\n                  \"editor\": {\n                    \"alias\": \"rte\"\n                  },\n                  \"active\": true,\n                }\n              ],\n              \"active\": true,\n              \"hasActiveChild\": true\n            }\n          ],\n          \"hasConfig\": false,\n          \"id\": \"4820aba2-8d6b-4a7e-7f57-e0490a9b475e\",\n          \"hasActiveChild\": true,\n          \"active\": true\n        }\n      ]\n    }\n  ]\n}"}]},"cultureData":{},"urlSegment":"this-will-be-great"}', 1)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1117, 1, N'{"properties":{"seoMetaDescription":[],"keywords":[{"culture":"","seg":"","val":"[]"}],"umbracoNavihide":[{"culture":"","seg":"","val":0}],"pageTitle":[{"culture":"","seg":"","val":"This will be great"}],"categories":[{"culture":"","seg":"","val":"[\"great\",\"umbraco\"]"}],"excerpt":[{"culture":"","seg":"","val":"Proin eget tortor risus. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Vivamus magna justo, lacinia eget consectetur sed"}],"bodyText":[{"culture":"","seg":"","val":"{\n  \"name\": \"1 column layout\",\n  \"sections\": [\n    {\n      \"grid\": 12,\n      \"allowAll\": true,\n      \"rows\": [\n        {\n          \"label\": \"\",\n          \"name\": \"Full Width\",\n          \"areas\": [\n            {\n              \"grid\": 12,\n              \"allowAll\": false,\n              \"hasConfig\": false,\n              \"controls\": [\n                {\n                  \"value\": \"<p>Vivamus suscipit tortor eget felis porttitor volutpat. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Quisque velit nisi, pretium ut lacinia in, elementum id enim. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Proin eget tortor risus. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Donec rutrum congue leo eget malesuada. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula.</p>\",\n                  \"editor\": {\n                    \"alias\": \"rte\"\n                  },\n                  \"active\": false,\n                },\n                {\n                  \"value\": \"\",\n                  \"editor\": {\n                    \"alias\": \"embed\"\n                  },\n                  \"active\": false,\n                },\n                {\n                  \"value\": \"<p> </p>\\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec sollicitudin molestie malesuada. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. Cras ultricies ligula sed magna dictum porta. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras ultricies ligula sed magna dictum porta. Pellentesque in ipsum id orci porta dapibus.</p>\\n<p>Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Nulla quis lorem ut libero malesuada feugiat. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Sed porttitor lectus nibh. Vivamus suscipit tortor eget felis porttitor volutpat. Nulla porttitor accumsan tincidunt. Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Nulla porttitor accumsan tincidunt.</p>\\n<p>Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Vivamus suscipit tortor eget felis porttitor volutpat. Sed porttitor lectus nibh. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Quisque velit nisi, pretium ut lacinia in, elementum id enim. Donec rutrum congue leo eget malesuada. Nulla porttitor accumsan tincidunt. Nulla quis lorem ut libero malesuada feugiat. Quisque velit nisi, pretium ut lacinia in, elementum id enim. Donec sollicitudin molestie malesuada.</p>\\n<p>Proin eget tortor risus. Donec rutrum congue leo eget malesuada. Pellentesque in ipsum id orci porta dapibus. Donec rutrum congue leo eget malesuada. Nulla quis lorem ut libero malesuada feugiat. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Donec sollicitudin molestie malesuada. Vivamus suscipit tortor eget felis porttitor volutpat.</p>\",\n                  \"editor\": {\n                    \"alias\": \"rte\"\n                  },\n                  \"active\": true,\n                }\n              ],\n              \"active\": true,\n              \"hasActiveChild\": true\n            }\n          ],\n          \"hasConfig\": false,\n          \"id\": \"4820aba2-8d6b-4a7e-7f57-e0490a9b475e\",\n          \"hasActiveChild\": true,\n          \"active\": true\n        }\n      ]\n    }\n  ]\n}"}]},"cultureData":{},"urlSegment":"this-will-be-great"}', 0)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1118, 0, N'{"properties":{"seoMetaDescription":[],"keywords":[{"culture":"","seg":"","val":"[]"}],"umbracoNavihide":[{"culture":"","seg":"","val":0}],"pageTitle":[{"culture":"","seg":"","val":"Let''s have a chat"}],"contactFormHeader":[{"culture":"","seg":"","val":"Send Us A Message"}],"contactIntro":[{"culture":"","seg":"","val":"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam eget lacinia nisl. Aenean sollicitudin diam vitae enim ultrices, semper euismod magna efficitur.</p>"}],"contactForm":[{"culture":"","seg":"","val":"adf160f1-39f5-44c0-b01d-9e2da32bf093"}],"mapHeader":[{"culture":"","seg":"","val":"You''ll find us here"}],"mapCoordinates":[{"culture":"","seg":"","val":"55.40622012982414,10.388404726982117,18"}]},"cultureData":{},"urlSegment":"contact"}', 1)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1118, 1, N'{"properties":{"seoMetaDescription":[],"keywords":[{"culture":"","seg":"","val":"[]"}],"umbracoNavihide":[{"culture":"","seg":"","val":0}],"pageTitle":[{"culture":"","seg":"","val":"Let''s have a chat"}],"contactFormHeader":[{"culture":"","seg":"","val":"Send Us A Message"}],"contactIntro":[{"culture":"","seg":"","val":"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam eget lacinia nisl. Aenean sollicitudin diam vitae enim ultrices, semper euismod magna efficitur.</p>"}],"contactForm":[{"culture":"","seg":"","val":"adf160f1-39f5-44c0-b01d-9e2da32bf093"}],"mapHeader":[{"culture":"","seg":"","val":"You''ll find us here"}],"mapCoordinates":[{"culture":"","seg":"","val":"55.40622012982414,10.388404726982117,18"}]},"cultureData":{},"urlSegment":"contact"}', 0)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1119, 0, N'{"properties":{},"cultureData":{},"urlSegment":"design"}', 0)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1120, 0, N'{"properties":{},"cultureData":{},"urlSegment":"people"}', 0)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1121, 0, N'{"properties":{},"cultureData":{},"urlSegment":"products"}', 0)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1122, 0, N'{"properties":{"umbracoFile":[{"culture":"","seg":"","val":"{\"src\":\"/media/dz4hz34t/16403439029_f500be349b_o.jpg\",\"crops\":null}"}],"umbracoWidth":[{"culture":"","seg":"","val":1600}],"umbracoHeight":[{"culture":"","seg":"","val":1067}],"umbracoBytes":[{"culture":"","seg":"","val":"759116"}],"umbracoExtension":[{"culture":"","seg":"","val":"jpg"}]},"cultureData":{},"urlSegment":"umbraco-campari-meeting-room"}', 0)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1123, 0, N'{"properties":{"umbracoFile":[{"culture":"","seg":"","val":"{\"src\":\"/media/cp3jdwxe/4730684907_8a7f8759cb_b.jpg\",\"crops\":null}"}],"umbracoWidth":[{"culture":"","seg":"","val":680}],"umbracoHeight":[{"culture":"","seg":"","val":1024}],"umbracoBytes":[{"culture":"","seg":"","val":"224349"}],"umbracoExtension":[{"culture":"","seg":"","val":"jpg"}]},"cultureData":{},"urlSegment":"biker-jacket"}', 0)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1124, 0, N'{"properties":{"umbracoFile":[{"culture":"","seg":"","val":"{\"src\":\"/media/hnyfzknb/7371127652_e01b6ab56f_b.jpg\",\"crops\":null}"}],"umbracoWidth":[{"culture":"","seg":"","val":683}],"umbracoHeight":[{"culture":"","seg":"","val":1024}],"umbracoBytes":[{"culture":"","seg":"","val":"258796"}],"umbracoExtension":[{"culture":"","seg":"","val":"jpg"}]},"cultureData":{},"urlSegment":"tattoo"}', 0)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1125, 0, N'{"properties":{"umbracoFile":[{"culture":"","seg":"","val":"{\"src\":\"/media/yktp5wup/14272036539_469ca21d5c_h.jpg\",\"crops\":null}"}],"umbracoWidth":[{"culture":"","seg":"","val":1067}],"umbracoHeight":[{"culture":"","seg":"","val":1600}],"umbracoBytes":[{"culture":"","seg":"","val":"367954"}],"umbracoExtension":[{"culture":"","seg":"","val":"jpg"}]},"cultureData":{},"urlSegment":"unicorn"}', 0)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1126, 0, N'{"properties":{"umbracoFile":[{"culture":"","seg":"","val":"{\"src\":\"/media/25pekb0k/5852022211_9028df67c0_b.jpg\",\"crops\":null}"}],"umbracoWidth":[{"culture":"","seg":"","val":1024}],"umbracoHeight":[{"culture":"","seg":"","val":683}],"umbracoBytes":[{"culture":"","seg":"","val":"205417"}],"umbracoExtension":[{"culture":"","seg":"","val":"jpg"}]},"cultureData":{},"urlSegment":"ping-pong-ball"}', 0)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1127, 0, N'{"properties":{"umbracoFile":[{"culture":"","seg":"","val":"{\"src\":\"/media/o1xljr1e/5852022091_87c5d045ab_b.jpg\",\"crops\":null}"}],"umbracoWidth":[{"culture":"","seg":"","val":684}],"umbracoHeight":[{"culture":"","seg":"","val":1024}],"umbracoBytes":[{"culture":"","seg":"","val":"222536"}],"umbracoExtension":[{"culture":"","seg":"","val":"jpg"}]},"cultureData":{},"urlSegment":"bowling-ball"}', 0)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1128, 0, N'{"properties":{"umbracoFile":[{"culture":"","seg":"","val":"{\"src\":\"/media/203ljfha/7377957524_347859faac_b.jpg\",\"crops\":null}"}],"umbracoWidth":[{"culture":"","seg":"","val":683}],"umbracoHeight":[{"culture":"","seg":"","val":1024}],"umbracoBytes":[{"culture":"","seg":"","val":"369611"}],"umbracoExtension":[{"culture":"","seg":"","val":"jpg"}]},"cultureData":{},"urlSegment":"jumpsuit"}', 0)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1129, 0, N'{"properties":{"umbracoFile":[{"culture":"","seg":"","val":"{\"src\":\"/media/swqg1al3/7373036290_5e8420bf36_b.jpg\",\"crops\":null}"}],"umbracoWidth":[{"culture":"","seg":"","val":1024}],"umbracoHeight":[{"culture":"","seg":"","val":683}],"umbracoBytes":[{"culture":"","seg":"","val":"299546"}],"umbracoExtension":[{"culture":"","seg":"","val":"jpg"}]},"cultureData":{},"urlSegment":"banjo"}', 0)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1130, 0, N'{"properties":{"umbracoFile":[{"culture":"","seg":"","val":"{\"src\":\"/media/mb2hcol5/7373036208_30257976a0_b.jpg\",\"crops\":null}"}],"umbracoWidth":[{"culture":"","seg":"","val":683}],"umbracoHeight":[{"culture":"","seg":"","val":1024}],"umbracoBytes":[{"culture":"","seg":"","val":"602717"}],"umbracoExtension":[{"culture":"","seg":"","val":"jpg"}]},"cultureData":{},"urlSegment":"knitted-west"}', 0)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1131, 0, N'{"properties":{"umbracoFile":[{"culture":"","seg":"","val":"{\"src\":\"/media/4icfo4ms/18720470241_ff77768544_h.jpg\",\"crops\":null}"}],"umbracoWidth":[{"culture":"","seg":"","val":1600}],"umbracoHeight":[{"culture":"","seg":"","val":1067}],"umbracoBytes":[{"culture":"","seg":"","val":"240126"}],"umbracoExtension":[{"culture":"","seg":"","val":"jpg"}]},"cultureData":{},"urlSegment":"jan-skovgaard"}', 0)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1132, 0, N'{"properties":{"umbracoFile":[{"culture":"","seg":"","val":"{\"src\":\"/media/x05fznos/18531852339_981b067419_h.jpg\",\"crops\":null}"}],"umbracoWidth":[{"culture":"","seg":"","val":1600}],"umbracoHeight":[{"culture":"","seg":"","val":1067}],"umbracoBytes":[{"culture":"","seg":"","val":"438249"}],"umbracoExtension":[{"culture":"","seg":"","val":"jpg"}]},"cultureData":{},"urlSegment":"matt-brailsford"}', 0)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1133, 0, N'{"properties":{"umbracoFile":[{"culture":"","seg":"","val":"{\"src\":\"/media/pqnlb42z/18531854019_351c579559_h.jpg\",\"crops\":null}"}],"umbracoWidth":[{"culture":"","seg":"","val":1600}],"umbracoHeight":[{"culture":"","seg":"","val":1067}],"umbracoBytes":[{"culture":"","seg":"","val":"324821"}],"umbracoExtension":[{"culture":"","seg":"","val":"jpg"}]},"cultureData":{},"urlSegment":"lee-kelleher"}', 0)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1134, 0, N'{"properties":{"umbracoFile":[{"culture":"","seg":"","val":"{\"src\":\"/media/ja2hllog/18095416144_44a566a5f4_h.jpg\",\"crops\":null}"}],"umbracoWidth":[{"culture":"","seg":"","val":1600}],"umbracoHeight":[{"culture":"","seg":"","val":1067}],"umbracoBytes":[{"culture":"","seg":"","val":"348162"}],"umbracoExtension":[{"culture":"","seg":"","val":"jpg"}]},"cultureData":{},"urlSegment":"jeavon-leopold"}', 0)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1135, 0, N'{"properties":{"umbracoFile":[{"culture":"","seg":"","val":"{\"src\":\"/media/bn2fxjpy/18530280048_459b8b61b2_h.jpg\",\"crops\":null}"}],"umbracoWidth":[{"culture":"","seg":"","val":1600}],"umbracoHeight":[{"culture":"","seg":"","val":1067}],"umbracoBytes":[{"culture":"","seg":"","val":"240519"}],"umbracoExtension":[{"culture":"","seg":"","val":"jpg"}]},"cultureData":{},"urlSegment":"jeroen-breuer"}', 0)
SET IDENTITY_INSERT [dbo].[cmsContentType] ON 

INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (531, 1044, N'Member', N'icon-user', N'icon-user', NULL, 0, 0, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (532, 1031, N'Folder', N'icon-folder', N'icon-folder', NULL, 0, 0, 1, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (533, 1032, N'Image', N'icon-picture', N'icon-picture', NULL, 0, 0, 1, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (534, 1033, N'File', N'icon-document', N'icon-document', NULL, 0, 0, 1, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (535, 1083, N'contentBase', N'icon-document', N'folder.png', NULL, 0, 0, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (536, 1084, N'navigationBase', N'icon-nodes color-black', N'folder.png', NULL, 0, 0, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (537, 1085, N'products', N'icon-shopping-basket color-black', N'folder.png', NULL, 1, 0, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (538, 1086, N'product', N'icon-sweatshirt color-black', N'folder.png', NULL, 0, 0, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (539, 1087, N'person', N'icon-user-female color-black', N'folder.png', NULL, 0, 0, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (540, 1088, N'people', N'icon-user-females-alt color-black', N'folder.png', NULL, 1, 0, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (541, 1089, N'home', N'icon-home color-black', N'folder.png', NULL, 0, 0, 1, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (542, 1090, N'feature', N'icon-plugin color-black', N'folder.png', NULL, 0, 1, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (543, 1091, N'contentPage', N'icon-document', N'folder.png', NULL, 0, 0, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (544, 1092, N'contact', N'icon-map-location color-black', N'folder.png', NULL, 0, 0, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (545, 1093, N'blogpost', N'icon-calendar color-black', N'folder.png', NULL, 0, 0, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (546, 1094, N'blog', N'icon-calendar-alt color-black', N'folder.png', NULL, 1, 0, 0, 0)
SET IDENTITY_INSERT [dbo].[cmsContentType] OFF
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1083, 1085)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1083, 1088)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1083, 1091)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1083, 1094)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1084, 1085)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1084, 1087)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1084, 1088)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1084, 1091)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1084, 1092)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1084, 1093)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1084, 1094)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1031, 1031, 0)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1031, 1032, 0)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1031, 1033, 0)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1085, 1086, 0)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1088, 1087, 0)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1089, 1085, 4)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1089, 1088, 3)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1089, 1091, 2)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1089, 1092, 1)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1089, 1094, 0)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1091, 1091, 0)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1094, 1093, 0)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1085, 1081, 1)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1086, 1080, 1)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1087, 1079, 1)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1088, 1078, 1)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1089, 1076, 1)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1091, 1075, 1)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1092, 1074, 1)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1093, 1073, 1)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1094, 1072, 1)
SET IDENTITY_INSERT [dbo].[cmsMacro] ON 

INSERT [dbo].[cmsMacro] ([id], [uniqueId], [macroUseInEditor], [macroRefreshRate], [macroAlias], [macroName], [macroCacheByPage], [macroCachePersonalized], [macroDontRender], [macroSource], [macroType]) VALUES (1, N'025bbcc8-a2da-4df6-86cb-fbf2828f5aa4', 1, 0, N'latestBlogposts', N'Get Latest Blogposts', 0, 0, 0, N'~/Views/MacroPartials/LatestBlogposts.cshtml', 7)
INSERT [dbo].[cmsMacro] ([id], [uniqueId], [macroUseInEditor], [macroRefreshRate], [macroAlias], [macroName], [macroCacheByPage], [macroCachePersonalized], [macroDontRender], [macroSource], [macroType]) VALUES (2, N'e18e9896-4f41-4214-965e-7a0ab2d42953', 1, 0, N'featuredProduct', N'Select Featured Products', 0, 0, 0, N'~/Views/MacroPartials/FeaturedProducts.cshtml', 7)
SET IDENTITY_INSERT [dbo].[cmsMacro] OFF
SET IDENTITY_INSERT [dbo].[cmsMacroProperty] ON 

INSERT [dbo].[cmsMacroProperty] ([id], [uniquePropertyId], [editorAlias], [macro], [macroPropertySortOrder], [macroPropertyAlias], [macroPropertyName]) VALUES (1, N'b537b76b-97a3-42ac-8642-1171676f00ed', N'Umbraco.Integer', 1, 0, N'numberOfPosts', N'How many posts should be shown')
INSERT [dbo].[cmsMacroProperty] ([id], [uniquePropertyId], [editorAlias], [macro], [macroPropertySortOrder], [macroPropertyAlias], [macroPropertyName]) VALUES (2, N'a564c352-9b9b-451a-8bf2-672602e9da6c', N'Umbraco.ContentPicker', 1, 1, N'startNodeId', N'Where to get blog posts from')
INSERT [dbo].[cmsMacroProperty] ([id], [uniquePropertyId], [editorAlias], [macro], [macroPropertySortOrder], [macroPropertyAlias], [macroPropertyName]) VALUES (3, N'840905b4-a8fe-4930-ba36-d3aa43720df0', N'Umbraco.ContentPicker', 2, 0, N'product', N'Choose Product')
SET IDENTITY_INSERT [dbo].[cmsMacroProperty] OFF
SET IDENTITY_INSERT [dbo].[cmsPropertyType] ON 

INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (6, 1043, 1032, 3, N'umbracoFile', N'Upload image', 0, 1, NULL, NULL, NULL, NULL, 0, N'00000006-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (7, -91, 1032, 3, N'umbracoWidth', N'Width', 0, 0, NULL, NULL, NULL, N'in pixels', 0, N'00000007-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (8, -91, 1032, 3, N'umbracoHeight', N'Height', 0, 0, NULL, NULL, NULL, N'in pixels', 0, N'00000008-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (9, -93, 1032, 3, N'umbracoBytes', N'Size', 0, 0, NULL, NULL, NULL, N'in bytes', 0, N'00000009-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (10, -92, 1032, 3, N'umbracoExtension', N'Type', 0, 0, NULL, NULL, NULL, NULL, 0, N'0000000a-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (24, -90, 1033, 4, N'umbracoFile', N'Upload file', 0, 1, NULL, NULL, NULL, NULL, 0, N'00000018-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (25, -92, 1033, 4, N'umbracoExtension', N'Type', 0, 0, NULL, NULL, NULL, NULL, 0, N'00000019-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (26, -93, 1033, 4, N'umbracoBytes', N'Size', 0, 0, NULL, NULL, NULL, N'in bytes', 0, N'0000001a-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (28, -89, 1044, 11, N'umbracoMemberComments', N'Comments', 0, 0, NULL, NULL, NULL, NULL, 0, N'0000001c-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (29, -91, 1044, 11, N'umbracoMemberFailedPasswordAttempts', N'Failed Password Attempts', 1, 0, NULL, NULL, NULL, NULL, 0, N'0000001d-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (30, -49, 1044, 11, N'umbracoMemberApproved', N'Is Approved', 2, 0, NULL, NULL, NULL, NULL, 0, N'0000001e-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (31, -49, 1044, 11, N'umbracoMemberLockedOut', N'Is Locked Out', 3, 0, NULL, NULL, NULL, NULL, 0, N'0000001f-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (32, -94, 1044, 11, N'umbracoMemberLastLockoutDate', N'Last Lockout Date', 4, 0, NULL, NULL, NULL, NULL, 0, N'00000020-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (33, -94, 1044, 11, N'umbracoMemberLastLogin', N'Last Login Date', 5, 0, NULL, NULL, NULL, NULL, 0, N'00000021-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (34, -94, 1044, 11, N'umbracoMemberLastPasswordChangeDate', N'Last Password Change Date', 6, 0, NULL, NULL, NULL, NULL, 0, N'00000022-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (35, -94, 1044, 11, N'umbracoMemberPasswordRetrievalQuestion', N'Password Question', 7, 0, NULL, NULL, NULL, NULL, 0, N'00000023-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (36, -94, 1044, 11, N'umbracoMemberPasswordRetrievalAnswer', N'Password Answer', 8, 0, NULL, NULL, NULL, NULL, 0, N'00000024-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (37, -88, 1083, 12, N'pageTitle', N'Page Title', 0, 1, N'', NULL, N'', N'The title of the page, this is also the first text in a google search result. The ideal length is between 40 and 60 characters', 0, N'794f46df-b84f-4108-9c08-84871a95432c')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (38, 1060, 1083, 12, N'bodyText', N'Content', 1, 0, N'', NULL, N'', N'', 0, N'9aeb114a-848f-4359-85f7-7598a827e637')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (39, -89, 1084, 13, N'seoMetaDescription', N'Description', 0, 0, N'', NULL, N'', N'A brief description of the content on your page. This text is shown below the title in a google search result and also used for Social Sharing Cards. The ideal length is between 130 and 155 characters', 0, N'91277fe6-bea0-421d-9380-ff05fd09422b')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (40, 1065, 1084, 13, N'keywords', N'Keywords', 1, 0, N'', NULL, N'', N'Keywords that describe the content of the page. This is considered optional since most modern search engines don''t use this anymore', 0, N'f1eec619-9457-4e9a-ba31-6f2743ee8e6a')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (41, -49, 1084, 13, N'umbracoNavihide', N'Hide in Navigation', 2, 0, N'', NULL, N'', N'If you don''t want this page to appear in the navigation, check this box', 0, N'8b698660-7df3-4519-923b-9a0f19ad7d92')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (42, 1069, 1085, 14, N'defaultCurrency', N'Default Currency', 0, 1, N'', NULL, N'', N'This is just used to prefix pricing', 0, N'e63a0e73-1867-4bf5-8232-e04247d5ca77')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (43, 1070, 1085, 14, N'featuredProducts', N'Featured Products', 1, 0, N'', NULL, N'', NULL, 0, N'15e2dcd4-5e6b-4e09-bb9c-0535568fe145')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (44, -88, 1086, 15, N'productName', N'Product Name', 0, 1, N'', NULL, N'', NULL, 0, N'ad6740fb-f2df-4e6a-8052-b90f5ebf45e7')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (45, 1068, 1086, 15, N'price', N'Price', 1, 1, N'', NULL, N'', NULL, 0, N'e817ef26-f92e-4a84-b42c-a68a897f52c2')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (46, 1064, 1086, 15, N'category', N'Category', 2, 1, N'', NULL, N'', NULL, 0, N'89b667e3-66d9-4cbc-8344-9fa2be42a8f3')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (47, -89, 1086, 15, N'description', N'Description', 3, 1, N'', NULL, N'', NULL, 0, N'ec922708-ca13-4fbc-a5d9-c7703a0cf82f')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (48, -88, 1086, 15, N'sku', N'SKU', 4, 0, N'', NULL, N'', NULL, 0, N'a8ebf6c1-f5ca-49fa-b987-7d68256d7edf')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (49, 1067, 1086, 15, N'photos', N'Photos', 5, 1, N'', NULL, N'', NULL, 0, N'f126acac-bb2e-45c1-8a3b-cb93001582d9')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (50, 1066, 1086, 16, N'features', N'Features', 0, 0, N'', NULL, N'', NULL, 0, N'f66d83e2-4b5c-456b-b4b3-8e79c7503971')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (51, 1060, 1086, 17, N'bodyText', N'Content', 0, 0, N'', NULL, N'', NULL, 0, N'be57178d-f048-4320-840a-ada4179bca32')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (52, 1063, 1087, 18, N'photo', N'Photo', 0, 0, N'', NULL, N'', NULL, 0, N'b349558d-2e89-44ce-9f04-ed73cfce532d')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (53, 1062, 1087, 18, N'department', N'Department', 1, 0, N'', NULL, N'', NULL, 0, N'70bed629-a090-4c05-9c83-f3325820502c')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (54, -88, 1087, 18, N'email', N'Email', 2, 0, N'', NULL, N'', NULL, 0, N'82c74396-05a9-478f-9f40-31499cba7089')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (55, -88, 1087, 19, N'twitterUsername', N'Twitter username', 0, 0, N'', NULL, N'', NULL, 0, N'522d1ecf-010b-4271-bdf7-1f1a2da57a49')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (56, -88, 1087, 19, N'facebookUsername', N'Facebook username', 1, 0, N'', NULL, N'', NULL, 0, N'7b55f836-509c-46d8-811f-1f967171da66')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (57, -88, 1087, 19, N'linkedInUsername', N'LinkedIn username', 2, 0, N'', NULL, N'', NULL, 0, N'a4d105dc-9d71-4016-b1b4-15b257c16be8')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (58, -88, 1087, 19, N'instagramUsername', N'Instagram Username', 3, 0, N'', NULL, N'', NULL, 0, N'ec592a9a-874f-4d23-89c0-b8b167fe8873')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (59, 1061, 1088, 20, N'featuredPeople', N'Featured People', 2, 0, N'', NULL, N'', NULL, 0, N'271c4ead-7a92-4e1e-a66d-237b4f92b4d9')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (60, -88, 1089, 21, N'heroHeader', N'Header', 0, 1, N'', NULL, N'', N'This is the main headline for the hero area on the Homepage', 0, N'49d66bd9-5b8f-4c95-9d27-8f4a30aa6e24')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (61, -89, 1089, 21, N'heroDescription', N'Description', 1, 1, N'', NULL, N'', NULL, 0, N'5927f903-8668-4f90-bc0e-c50808e1e68b')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (62, -88, 1089, 21, N'heroCTACaption', N'Call To Action Caption', 2, 1, N'', NULL, N'', N'The caption on the button', 0, N'2acbcca8-e49b-45de-9b25-a956b80fc0da')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (63, 1051, 1089, 21, N'HeroCtalink', N'Call To Action Link', 3, 1, N'', NULL, N'', NULL, 0, N'744c76b7-1e59-4595-a7cb-0b907285a093')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (64, 1053, 1089, 22, N'bodyText', N'Content', 0, 0, N'', NULL, N'', NULL, 0, N'a42eb867-32d1-460e-9b08-aa4c11074d6b')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (65, -88, 1089, 23, N'footerHeader', N'Header', 0, 0, N'', NULL, N'', NULL, 0, N'5469821b-c7da-4f80-b537-0328245308f2')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (66, -89, 1089, 23, N'footerDescription', N'Description', 1, 0, N'', NULL, N'', NULL, 0, N'51ed48f4-e7f1-463d-bfa2-ec9d5cb5bab8')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (67, -88, 1089, 23, N'footerCTACaption', N'Call To Action Caption', 2, 0, N'', NULL, N'', N'Caption on the Call To Action Button', 0, N'a76ca983-3903-4f5b-97fa-b18a9b8796f7')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (68, 1051, 1089, 23, N'FooterCtalink', N'Call To Action Link', 3, 1, N'', NULL, N'', NULL, 0, N'e805fe79-c2d9-49fe-9c98-a8d748b84fb0')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (69, -88, 1089, 23, N'footerAddress', N'Address', 4, 1, N'', NULL, N'', NULL, 0, N'bfd681a2-eb6a-42f3-982f-0fa67f0434cc')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (70, 1048, 1089, 24, N'HeroBackgroundImage', N'Hero Background', 0, 1, N'', NULL, N'', N'Spice up the homepage by adding a beautiful photo that relates to your business', 0, N'54389758-69e6-4ee9-b190-740270709563')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (71, 1054, 1089, 24, N'font', N'Font', 1, 1, N'', NULL, N'', N'', 0, N'facc41a0-6822-40b0-a210-53ba5b4f848e')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (72, 1052, 1089, 24, N'colorTheme', N'Color Theme', 2, 1, N'', NULL, N'', N'', 0, N'b618ad19-6da0-403a-8c0f-2695d3c48dfa')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (73, -88, 1089, 24, N'sitename', N'Sitename', 3, 1, N'', NULL, N'', N'Used on the homepage as well as the title and social cards', 0, N'027401b0-458e-4603-8e72-93af007101cc')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (74, 1048, 1089, 24, N'SiteLogo', N'Logo', 4, 0, N'', NULL, N'', N'Optional. If you add a logo it''ll be used in the upper left corner instead of the site name. Make sure to use a transparent logo for best results', 0, N'f351745a-1e9c-44b1-ba0b-195a7467058b')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (75, -88, 1090, 25, N'featureName', N'Name', 0, 1, N'', NULL, N'', NULL, 0, N'87f3f9ea-41aa-49a2-aef1-426ce0bd1e45')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (76, -89, 1090, 25, N'featureDetails', N'Details', 1, 0, N'', NULL, N'', NULL, 0, N'6fae2d06-5e16-4d1c-8d51-9bc90d2b9ff6')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (77, -88, 1092, 26, N'pageTitle', N'Page Title', 0, 1, N'', NULL, N'', N'The title of the page, this is also the first text in a google search result. The ideal length is between 40 and 60 characters', 0, N'043dd7c1-b9ff-45ab-920f-d271e0603822')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (78, -88, 1092, 26, N'contactFormHeader', N'Contact Form Header', 1, 1, N'', NULL, N'', NULL, 0, N'3054c4d6-265e-4d0e-9651-15bec4099613')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (79, 1059, 1092, 26, N'contactIntro', N'Contact Intro', 2, 1, N'', NULL, N'', NULL, 0, N'75b7c4db-6afa-4dd9-9c37-2a978f407974')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (80, -92, 1092, 26, N'contactForm', N'Pick a Contact Form', 3, 0, N'', NULL, N'', N'If Umbraco Forms is installed you''ll be able to select a form', 0, N'be3e221b-b75a-4469-8946-5bf9eb23d6f8')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (81, -88, 1092, 27, N'mapHeader', N'Map Header', 0, 0, N'', NULL, N'', NULL, 0, N'72478ee1-c727-4902-ac5e-fece9ce53258')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (82, 1071, 1092, 27, N'mapCoordinates', N'Map Coordinates', 1, 0, N'', NULL, N'', NULL, 0, N'1a96fff0-6f62-4638-8972-28d77143fbc1')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (83, -88, 1093, 28, N'pageTitle', N'Page Title', 0, 1, N'', NULL, N'', N'The title of the page, this is also the first text in a google search result. The ideal length is between 40 and 60 characters', 0, N'1e6434e5-1716-4f4b-a496-16566ec7fc79')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (84, 1065, 1093, 28, N'categories', N'Categories (tags)', 1, 0, N'', NULL, N'', NULL, 0, N'fbb5eaf2-c425-4378-805c-f0ee53595dc9')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (85, -89, 1093, 28, N'excerpt', N'Excerpt', 2, 1, N'', NULL, N'', N'Introduction to your blog post. This is also used in the summaries on the front of the blog as well as the homepage', 0, N'96c4408f-20c7-4bea-b11e-d7a917b07066')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (86, 1060, 1093, 28, N'bodyText', N'Content', 3, 0, N'', NULL, N'', NULL, 0, N'f28253ac-c27b-4c20-9942-dd4ef5639b6d')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (87, 1056, 1094, 29, N'howManyPostsShouldBeShown', N'How many posts should be shown?', 0, 1, N'', NULL, N'', NULL, 0, N'e4e9fcea-5482-436d-aa46-60a2a024db73')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (88, -88, 1094, 29, N'disqusShortname', N'Disqus Shortname', 1, 0, N'', NULL, N'', N'To use comments, you''ll need to sign up for Disqus and enter your shortname here (more info: https://help.disqus.com/customer/portal/articles/472097-universal-embed-code)', 0, N'4b154dea-949e-466f-b856-eb109cad1999')
SET IDENTITY_INSERT [dbo].[cmsPropertyType] OFF
SET IDENTITY_INSERT [dbo].[cmsPropertyTypeGroup] ON 

INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (3, 1032, N'Image', 1, N'79ed4d07-254a-42cf-8fa9-ebe1c116a596')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (4, 1033, N'File', 1, N'50899f9c-023a-4466-b623-aba9049885fe')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (11, 1044, N'Membership', 1, N'0756729d-d665-46e3-b84a-37aceaa614f8')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (12, 1083, N'Content', 0, N'f2e80c3e-a2ba-4cd2-aa51-61098728bf49')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (13, 1084, N'Navigation & SEO', 0, N'bac484ed-4a0b-4c2d-8330-3b8fa5051dcb')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (14, 1085, N'Shop', 0, N'10669b2d-d83b-4520-a3c9-f582161afdf4')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (15, 1086, N'Product Details', 0, N'e3a5cfd8-e7d2-4114-92bc-74a360697555')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (16, 1086, N'Features', 1, N'6ee9ae05-a56d-473c-b537-1e3d71b33897')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (17, 1086, N'Detailed Description', 2, N'969ee66f-70a3-429e-8bf4-a9bc31a96f20')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (18, 1087, N'Details', 0, N'92978b95-bf0c-4e9c-9b62-9a003f850d76')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (19, 1087, N'Social', 0, N'ed47ef02-1eb9-49de-92d1-f3e063ad53be')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (20, 1088, N'Content', 0, N'f29bfb98-c1ad-439a-bb0a-156d421b04d5')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (21, 1089, N'Hero', 0, N'895e50bd-0cfc-4142-beb9-061055acce25')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (22, 1089, N'Content', 1, N'c2663b2e-1755-4c6a-9ba3-c87191cdcc56')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (23, 1089, N'Footer', 2, N'3cbdb422-5a27-4db9-a7a4-d7588c2e6e3e')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (24, 1089, N'Design', 3, N'e0f88436-1193-4236-bc9e-34242f9acc72')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (25, 1090, N'Feature', 0, N'72009e67-46bd-49cb-9f89-9451e839fd8d')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (26, 1092, N'Form', 0, N'bbeca187-7bbc-4769-8ee1-598674b4f7de')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (27, 1092, N'Map', 1, N'cfe389a9-978e-444d-b396-cacf26249d63')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (28, 1093, N'Content', 0, N'5b607e19-08e6-4cb3-9aed-332717810fbf')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (29, 1094, N'Settings', 0, N'e2f607aa-d44d-4f4d-b3b3-68431386133c')
SET IDENTITY_INSERT [dbo].[cmsPropertyTypeGroup] OFF
INSERT [dbo].[cmsTagRelationship] ([nodeId], [tagId], [propertyTypeId]) VALUES (1097, 1, 46)
INSERT [dbo].[cmsTagRelationship] ([nodeId], [tagId], [propertyTypeId]) VALUES (1097, 2, 46)
INSERT [dbo].[cmsTagRelationship] ([nodeId], [tagId], [propertyTypeId]) VALUES (1098, 3, 46)
INSERT [dbo].[cmsTagRelationship] ([nodeId], [tagId], [propertyTypeId]) VALUES (1099, 4, 46)
INSERT [dbo].[cmsTagRelationship] ([nodeId], [tagId], [propertyTypeId]) VALUES (1099, 5, 46)
INSERT [dbo].[cmsTagRelationship] ([nodeId], [tagId], [propertyTypeId]) VALUES (1100, 4, 46)
INSERT [dbo].[cmsTagRelationship] ([nodeId], [tagId], [propertyTypeId]) VALUES (1100, 5, 46)
INSERT [dbo].[cmsTagRelationship] ([nodeId], [tagId], [propertyTypeId]) VALUES (1101, 4, 46)
INSERT [dbo].[cmsTagRelationship] ([nodeId], [tagId], [propertyTypeId]) VALUES (1101, 6, 46)
INSERT [dbo].[cmsTagRelationship] ([nodeId], [tagId], [propertyTypeId]) VALUES (1102, 4, 46)
INSERT [dbo].[cmsTagRelationship] ([nodeId], [tagId], [propertyTypeId]) VALUES (1102, 7, 46)
INSERT [dbo].[cmsTagRelationship] ([nodeId], [tagId], [propertyTypeId]) VALUES (1103, 4, 46)
INSERT [dbo].[cmsTagRelationship] ([nodeId], [tagId], [propertyTypeId]) VALUES (1103, 6, 46)
INSERT [dbo].[cmsTagRelationship] ([nodeId], [tagId], [propertyTypeId]) VALUES (1104, 4, 46)
INSERT [dbo].[cmsTagRelationship] ([nodeId], [tagId], [propertyTypeId]) VALUES (1104, 8, 46)
INSERT [dbo].[cmsTagRelationship] ([nodeId], [tagId], [propertyTypeId]) VALUES (1106, 9, 53)
INSERT [dbo].[cmsTagRelationship] ([nodeId], [tagId], [propertyTypeId]) VALUES (1106, 10, 53)
INSERT [dbo].[cmsTagRelationship] ([nodeId], [tagId], [propertyTypeId]) VALUES (1107, 10, 53)
INSERT [dbo].[cmsTagRelationship] ([nodeId], [tagId], [propertyTypeId]) VALUES (1107, 11, 53)
INSERT [dbo].[cmsTagRelationship] ([nodeId], [tagId], [propertyTypeId]) VALUES (1108, 10, 53)
INSERT [dbo].[cmsTagRelationship] ([nodeId], [tagId], [propertyTypeId]) VALUES (1108, 11, 53)
INSERT [dbo].[cmsTagRelationship] ([nodeId], [tagId], [propertyTypeId]) VALUES (1109, 10, 53)
INSERT [dbo].[cmsTagRelationship] ([nodeId], [tagId], [propertyTypeId]) VALUES (1109, 11, 53)
INSERT [dbo].[cmsTagRelationship] ([nodeId], [tagId], [propertyTypeId]) VALUES (1110, 10, 53)
INSERT [dbo].[cmsTagRelationship] ([nodeId], [tagId], [propertyTypeId]) VALUES (1110, 12, 53)
INSERT [dbo].[cmsTagRelationship] ([nodeId], [tagId], [propertyTypeId]) VALUES (1115, 13, 84)
INSERT [dbo].[cmsTagRelationship] ([nodeId], [tagId], [propertyTypeId]) VALUES (1115, 14, 84)
INSERT [dbo].[cmsTagRelationship] ([nodeId], [tagId], [propertyTypeId]) VALUES (1115, 15, 84)
INSERT [dbo].[cmsTagRelationship] ([nodeId], [tagId], [propertyTypeId]) VALUES (1116, 15, 84)
INSERT [dbo].[cmsTagRelationship] ([nodeId], [tagId], [propertyTypeId]) VALUES (1116, 16, 84)
INSERT [dbo].[cmsTagRelationship] ([nodeId], [tagId], [propertyTypeId]) VALUES (1116, 17, 84)
INSERT [dbo].[cmsTagRelationship] ([nodeId], [tagId], [propertyTypeId]) VALUES (1117, 15, 84)
INSERT [dbo].[cmsTagRelationship] ([nodeId], [tagId], [propertyTypeId]) VALUES (1117, 18, 84)
SET IDENTITY_INSERT [dbo].[cmsTags] ON 

INSERT [dbo].[cmsTags] ([id], [group], [languageId], [tag]) VALUES (3, N'default', NULL, N'animals')
INSERT [dbo].[cmsTags] ([id], [group], [languageId], [tag]) VALUES (4, N'default', NULL, N'bingo')
INSERT [dbo].[cmsTags] ([id], [group], [languageId], [tag]) VALUES (16, N'default', NULL, N'cg16')
INSERT [dbo].[cmsTags] ([id], [group], [languageId], [tag]) VALUES (8, N'default', NULL, N'clothing')
INSERT [dbo].[cmsTags] ([id], [group], [languageId], [tag]) VALUES (17, N'default', NULL, N'codegarden')
INSERT [dbo].[cmsTags] ([id], [group], [languageId], [tag]) VALUES (1, N'default', NULL, N'dedication')
INSERT [dbo].[cmsTags] ([id], [group], [languageId], [tag]) VALUES (13, N'default', NULL, N'demo')
INSERT [dbo].[cmsTags] ([id], [group], [languageId], [tag]) VALUES (9, N'default', NULL, N'Denmark')
INSERT [dbo].[cmsTags] ([id], [group], [languageId], [tag]) VALUES (6, N'default', NULL, N'fashion')
INSERT [dbo].[cmsTags] ([id], [group], [languageId], [tag]) VALUES (18, N'default', NULL, N'great')
INSERT [dbo].[cmsTags] ([id], [group], [languageId], [tag]) VALUES (7, N'default', NULL, N'music')
INSERT [dbo].[cmsTags] ([id], [group], [languageId], [tag]) VALUES (10, N'default', NULL, N'mvp')
INSERT [dbo].[cmsTags] ([id], [group], [languageId], [tag]) VALUES (12, N'default', NULL, N'Netherlands')
INSERT [dbo].[cmsTags] ([id], [group], [languageId], [tag]) VALUES (5, N'default', NULL, N'sports')
INSERT [dbo].[cmsTags] ([id], [group], [languageId], [tag]) VALUES (14, N'default', NULL, N'starter kit')
INSERT [dbo].[cmsTags] ([id], [group], [languageId], [tag]) VALUES (2, N'default', NULL, N'tattoo')
INSERT [dbo].[cmsTags] ([id], [group], [languageId], [tag]) VALUES (15, N'default', NULL, N'umbraco')
INSERT [dbo].[cmsTags] ([id], [group], [languageId], [tag]) VALUES (11, N'default', NULL, N'United Kingdom')
SET IDENTITY_INSERT [dbo].[cmsTags] OFF
SET IDENTITY_INSERT [dbo].[cmsTemplate] ON 

INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias]) VALUES (1, 1072, N'Blog')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias]) VALUES (2, 1073, N'Blogpost')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias]) VALUES (3, 1074, N'contact')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias]) VALUES (4, 1075, N'contentPage')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias]) VALUES (5, 1076, N'home')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias]) VALUES (6, 1077, N'master')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias]) VALUES (7, 1078, N'people')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias]) VALUES (8, 1079, N'Person')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias]) VALUES (9, 1080, N'Product')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias]) VALUES (10, 1081, N'Products')
SET IDENTITY_INSERT [dbo].[cmsTemplate] OFF
SET IDENTITY_INSERT [dbo].[umbracoAudit] ON 

INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1, 0, N'User "SYTEM" ', N'::1', CAST(N'2020-06-03T07:52:06.107' AS DateTime), -1, N'User "Administrator" ', N'umbraco/user/save', N'updating RawPasswordValue, LastPasswordChangeDate, UpdateDate, SecurityStamp')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (2, 0, N'User "SYTEM" ', N'::1', CAST(N'2020-06-03T07:52:06.293' AS DateTime), -1, N'User "apichai" <apichairattana111@gmail.com>', N'umbraco/user/save', N'updating Email, Name, Username, UpdateDate, SecurityStamp')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (3, 0, N'User "SYTEM" ', N'::1', CAST(N'2020-06-03T07:52:23.943' AS DateTime), -1, N'User "apichai" <apichairattana111@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (4, 0, N'User "SYTEM" ', N'::1', CAST(N'2020-06-03T07:52:57.147' AS DateTime), -1, N'User "apichai" <apichairattana111@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (5, 0, N'User "SYTEM" ', N'::1', CAST(N'2020-06-03T07:52:57.193' AS DateTime), -1, N'User "apichai" <apichairattana111@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (6, 0, N'User "SYTEM" ', N'::1', CAST(N'2020-06-07T06:27:19.240' AS DateTime), -1, N'User "apichai" <apichairattana111@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (7, 0, N'User "SYTEM" ', N'::1', CAST(N'2020-06-07T06:27:19.290' AS DateTime), -1, N'User "apichai" <apichairattana111@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
SET IDENTITY_INSERT [dbo].[umbracoAudit] OFF
SET IDENTITY_INSERT [dbo].[umbracoCacheInstruction] ON 

INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (2, CAST(N'2020-06-07T06:27:19.773' AS DateTime), N'[{"RefreshType":3,"RefresherId":"e057af6d-2ee6-41f4-8045-3694010f0aa6","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[-1]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-OAG5O3P//LM/W3SVC/2/ROOT [P9484/D2] E27A01691608474CAD8FAADA8961E36D', 1)
SET IDENTITY_INSERT [dbo].[umbracoCacheInstruction] OFF
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1095, 1089)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1096, 1085)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1097, 1086)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1098, 1086)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1099, 1086)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1100, 1086)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1101, 1086)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1102, 1086)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1103, 1086)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1104, 1086)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1105, 1088)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1106, 1087)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1107, 1087)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1108, 1087)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1109, 1087)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1110, 1087)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1111, 1091)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1112, 1091)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1113, 1091)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1114, 1094)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1115, 1093)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1116, 1093)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1117, 1093)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1118, 1092)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1119, 1031)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1120, 1031)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1121, 1031)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1122, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1123, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1124, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1125, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1126, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1127, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1128, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1129, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1130, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1131, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1132, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1133, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1134, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1135, 1032)
SET IDENTITY_INSERT [dbo].[umbracoContentVersion] ON 

INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (1, 1095, CAST(N'2020-06-03T14:52:19.603' AS DateTime), -1, 0, N'Home')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (2, 1096, CAST(N'2020-06-03T14:52:19.673' AS DateTime), -1, 0, N'Products')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (3, 1097, CAST(N'2020-06-03T14:52:19.707' AS DateTime), -1, 0, N'Tattoo')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (4, 1098, CAST(N'2020-06-03T14:52:19.917' AS DateTime), -1, 0, N'Unicorn')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (5, 1099, CAST(N'2020-06-03T14:52:19.947' AS DateTime), -1, 0, N'Ping Pong Ball')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (6, 1100, CAST(N'2020-06-03T14:52:19.973' AS DateTime), -1, 0, N'Bowling Ball')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (7, 1101, CAST(N'2020-06-03T14:52:19.997' AS DateTime), -1, 0, N'Jumpsuit')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (8, 1102, CAST(N'2020-06-03T14:52:20.030' AS DateTime), -1, 0, N'Banjo')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (9, 1103, CAST(N'2020-06-03T14:52:20.057' AS DateTime), -1, 0, N'Knitted West')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (10, 1104, CAST(N'2020-06-03T14:52:20.090' AS DateTime), -1, 0, N'Biker Jacket')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (11, 1105, CAST(N'2020-06-03T14:52:20.117' AS DateTime), -1, 0, N'People')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (12, 1106, CAST(N'2020-06-03T14:52:20.130' AS DateTime), -1, 0, N'Jan Skovgaard')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (13, 1107, CAST(N'2020-06-03T14:52:20.157' AS DateTime), -1, 0, N'Matt Brailsford')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (14, 1108, CAST(N'2020-06-03T14:52:20.187' AS DateTime), -1, 0, N'Lee Kelleher')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (15, 1109, CAST(N'2020-06-03T14:52:20.207' AS DateTime), -1, 0, N'Jeavon Leopold')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (16, 1110, CAST(N'2020-06-03T14:52:20.230' AS DateTime), -1, 0, N'Jeroen Breuer')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (17, 1111, CAST(N'2020-06-03T14:52:20.257' AS DateTime), -1, 0, N'About Us')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (18, 1112, CAST(N'2020-06-03T14:52:20.270' AS DateTime), -1, 0, N'About this Starter Kit')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (19, 1113, CAST(N'2020-06-03T14:52:20.280' AS DateTime), -1, 0, N'Todo list for the Starter Kit')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (20, 1114, CAST(N'2020-06-03T14:52:20.290' AS DateTime), -1, 0, N'Blog')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (21, 1115, CAST(N'2020-06-03T14:52:20.300' AS DateTime), -1, 0, N'My Blog Post')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (22, 1116, CAST(N'2020-06-03T14:52:20.327' AS DateTime), -1, 0, N'Another one')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (23, 1117, CAST(N'2020-06-03T14:52:20.357' AS DateTime), -1, 0, N'This will be great')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (24, 1118, CAST(N'2020-06-03T14:52:20.383' AS DateTime), -1, 0, N'Contact')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (25, 1119, CAST(N'2020-06-03T14:52:18.197' AS DateTime), NULL, 1, N'Design')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (26, 1120, CAST(N'2020-06-03T14:52:18.223' AS DateTime), NULL, 1, N'People')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (27, 1121, CAST(N'2020-06-03T14:52:18.237' AS DateTime), NULL, 1, N'Products')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (28, 1122, CAST(N'2020-06-03T14:52:18.357' AS DateTime), NULL, 1, N'Umbraco Campari Meeting Room')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (29, 1123, CAST(N'2020-06-03T14:52:18.393' AS DateTime), NULL, 1, N'Biker Jacket')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (30, 1124, CAST(N'2020-06-03T14:52:18.427' AS DateTime), NULL, 1, N'Tattoo')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (31, 1125, CAST(N'2020-06-03T14:52:18.477' AS DateTime), NULL, 1, N'Unicorn')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (32, 1126, CAST(N'2020-06-03T14:52:18.507' AS DateTime), NULL, 1, N'Ping Pong Ball')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (33, 1127, CAST(N'2020-06-03T14:52:18.540' AS DateTime), NULL, 1, N'Bowling Ball')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (34, 1128, CAST(N'2020-06-03T14:52:18.577' AS DateTime), NULL, 1, N'Jumpsuit')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (35, 1129, CAST(N'2020-06-03T14:52:18.613' AS DateTime), NULL, 1, N'Banjo')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (36, 1130, CAST(N'2020-06-03T14:52:18.657' AS DateTime), NULL, 1, N'Knitted West')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (37, 1131, CAST(N'2020-06-03T14:52:18.790' AS DateTime), NULL, 1, N'Jan Skovgaard')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (38, 1132, CAST(N'2020-06-03T14:52:18.927' AS DateTime), NULL, 1, N'Matt Brailsford')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (39, 1133, CAST(N'2020-06-03T14:52:19.073' AS DateTime), NULL, 1, N'Lee Kelleher')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (40, 1134, CAST(N'2020-06-03T14:52:19.210' AS DateTime), NULL, 1, N'Jeavon Leopold')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (41, 1135, CAST(N'2020-06-03T14:52:19.340' AS DateTime), NULL, 1, N'Jeroen Breuer')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (42, 1095, CAST(N'2020-06-03T14:52:19.603' AS DateTime), -1, 1, N'Home')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (43, 1096, CAST(N'2020-06-03T14:52:19.673' AS DateTime), -1, 1, N'Products')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (44, 1097, CAST(N'2020-06-03T14:52:19.707' AS DateTime), -1, 1, N'Tattoo')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (45, 1098, CAST(N'2020-06-03T14:52:19.917' AS DateTime), -1, 1, N'Unicorn')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (46, 1099, CAST(N'2020-06-03T14:52:19.947' AS DateTime), -1, 1, N'Ping Pong Ball')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (47, 1100, CAST(N'2020-06-03T14:52:19.973' AS DateTime), -1, 1, N'Bowling Ball')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (48, 1101, CAST(N'2020-06-03T14:52:19.997' AS DateTime), -1, 1, N'Jumpsuit')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (49, 1102, CAST(N'2020-06-03T14:52:20.030' AS DateTime), -1, 1, N'Banjo')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (50, 1103, CAST(N'2020-06-03T14:52:20.057' AS DateTime), -1, 1, N'Knitted West')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (51, 1104, CAST(N'2020-06-03T14:52:20.090' AS DateTime), -1, 1, N'Biker Jacket')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (52, 1105, CAST(N'2020-06-03T14:52:20.117' AS DateTime), -1, 1, N'People')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (53, 1106, CAST(N'2020-06-03T14:52:20.130' AS DateTime), -1, 1, N'Jan Skovgaard')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (54, 1107, CAST(N'2020-06-03T14:52:20.157' AS DateTime), -1, 1, N'Matt Brailsford')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (55, 1108, CAST(N'2020-06-03T14:52:20.187' AS DateTime), -1, 1, N'Lee Kelleher')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (56, 1109, CAST(N'2020-06-03T14:52:20.207' AS DateTime), -1, 1, N'Jeavon Leopold')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (57, 1110, CAST(N'2020-06-03T14:52:20.230' AS DateTime), -1, 1, N'Jeroen Breuer')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (58, 1111, CAST(N'2020-06-03T14:52:20.257' AS DateTime), -1, 1, N'About Us')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (59, 1112, CAST(N'2020-06-03T14:52:20.270' AS DateTime), -1, 1, N'About this Starter Kit')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (60, 1113, CAST(N'2020-06-03T14:52:20.280' AS DateTime), -1, 1, N'Todo list for the Starter Kit')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (61, 1114, CAST(N'2020-06-03T14:52:20.290' AS DateTime), -1, 1, N'Blog')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (62, 1115, CAST(N'2020-06-03T14:52:20.300' AS DateTime), -1, 1, N'My Blog Post')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (63, 1116, CAST(N'2020-06-03T14:52:20.327' AS DateTime), -1, 1, N'Another one')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (64, 1117, CAST(N'2020-06-03T14:52:20.357' AS DateTime), -1, 1, N'This will be great')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (65, 1118, CAST(N'2020-06-03T14:52:20.383' AS DateTime), -1, 1, N'Contact')
SET IDENTITY_INSERT [dbo].[umbracoContentVersion] OFF
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-99, N'Umbraco.Label', N'Decimal', N'{"umbracoDataValueType":"DECIMAL"}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-98, N'Umbraco.Label', N'Date', N'{"umbracoDataValueType":"TIME"}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-97, N'Umbraco.ListView', N'Nvarchar', N'{"pageSize":10, "orderBy":"username", "orderDirection":"asc", "includeProperties":[{"alias":"username","isSystem":1},{"alias":"email","isSystem":1},{"alias":"updateDate","header":"Last edited","isSystem":1}]}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-96, N'Umbraco.ListView', N'Nvarchar', N'{"pageSize":100, "orderBy":"updateDate", "orderDirection":"desc", "layouts":[{"name": "Grid","path": "views/propertyeditors/listview/layouts/grid/grid.html", "icon": "icon-thumbnails-small", "isSystem": 1, "selected": true},{"name": "List","path": "views/propertyeditors/listview/layouts/list/list.html","icon": "icon-list", "isSystem": 1,"selected": true}], "includeProperties":[{"alias":"updateDate","header":"Last edited","isSystem":1},{"alias":"owner","header":"Updated by","isSystem":1}]}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-95, N'Umbraco.ListView', N'Nvarchar', N'{"pageSize":100, "orderBy":"updateDate", "orderDirection":"desc", "layouts":[{"name": "Grid","path": "views/propertyeditors/listview/layouts/grid/grid.html", "icon": "icon-thumbnails-small", "isSystem": 1, "selected": true},{"name": "List","path": "views/propertyeditors/listview/layouts/list/list.html","icon": "icon-list", "isSystem": 1,"selected": true}], "includeProperties":[{"alias":"updateDate","header":"Last edited","isSystem":1},{"alias":"owner","header":"Updated by","isSystem":1}]}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-94, N'Umbraco.Label', N'Date', N'{"umbracoDataValueType":"DATETIME"}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-93, N'Umbraco.Label', N'Nvarchar', N'{"umbracoDataValueType":"BIGINT"}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-92, N'Umbraco.Label', N'Nvarchar', N'{"umbracoDataValueType":"STRING"}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-91, N'Umbraco.Label', N'Integer', N'{"umbracoDataValueType":"INT"}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-90, N'Umbraco.UploadField', N'Nvarchar', NULL)
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-89, N'Umbraco.TextArea', N'Ntext', NULL)
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-88, N'Umbraco.TextBox', N'Nvarchar', NULL)
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-87, N'Umbraco.TinyMCE', N'Ntext', N'{"value":",code,undo,redo,cut,copy,mcepasteword,stylepicker,bold,italic,bullist,numlist,outdent,indent,mcelink,unlink,mceinsertanchor,mceimage,umbracomacro,mceinserttable,umbracoembed,mcecharmap,|1|1,2,3,|0|500,400|1049,|true|"}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-51, N'Umbraco.Integer', N'Integer', NULL)
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-49, N'Umbraco.TrueFalse', N'Integer', NULL)
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-43, N'Umbraco.CheckBoxList', N'Nvarchar', NULL)
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-42, N'Umbraco.DropDown.Flexible', N'Nvarchar', N'{"multiple":true}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-41, N'Umbraco.DateTime', N'Date', N'{"format":"YYYY-MM-DD"}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-40, N'Umbraco.RadioButtonList', N'Nvarchar', NULL)
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-39, N'Umbraco.DropDown.Flexible', N'Nvarchar', N'{"multiple":false}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-37, N'Umbraco.ColorPicker', N'Nvarchar', NULL)
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-36, N'Umbraco.DateTime', N'Date', NULL)
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1041, N'Umbraco.Tags', N'Ntext', N'{"group":"default", "storageType":"Json"}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1043, N'Umbraco.ImageCropper', N'Ntext', NULL)
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1046, N'Umbraco.ContentPicker', N'Nvarchar', NULL)
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1047, N'Umbraco.MemberPicker', N'Nvarchar', NULL)
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1048, N'Umbraco.MediaPicker', N'Ntext', N'{"multiPicker":false,"onlyImages":false,"disableFolderSelect":false,"startNodeId":null,"ignoreUserStartNodes":false}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1049, N'Umbraco.MediaPicker', N'Ntext', N'{"multiPicker":1}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1050, N'Umbraco.MultiUrlPicker', N'Ntext', NULL)
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1051, N'Umbraco.ContentPicker', N'Nvarchar', N'{"showOpenButton":false,"startNodeId":"umb://document/ca4249ed2b234337b52263cabe5587d1","ignoreUserStartNodes":false}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1052, N'Umbraco.RadioButtonList', N'Nvarchar', N'{"items":[{"id":1,"value":"water"},{"id":2,"value":"earth"},{"id":3,"value":"sun"}]}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1053, N'Umbraco.Grid', N'Ntext', N'{"items":{"styles":[],"config":[],"columns":12,"templates":[{"name":"1 column layout","sections":[{"grid":12}]}],"layouts":[{"name":"Full Width","areas":[{"grid":12,"allowAll":false,"allowed":["media","macro","embed","headline"]}]},{"name":"Half and half","areas":[{"grid":6,"allowAll":false,"allowed":["rte","media","macro","embed","headline","quote"]},{"grid":6,"allowAll":false,"allowed":["quote","headline","embed","macro","media","rte"]}]},{"name":"Testimonials","areas":[{"grid":4,"allowAll":false,"allowed":[]},{"grid":4,"allowAll":false,"allowed":[]},{"grid":4,"allowAll":false,"allowed":[]}]}]},"rte":{"toolbar":["code","bold","italic","styleselect","alignleft","aligncenter","alignright","bullist","numlist","outdent","indent","link","image","ace"],"stylesheets":[],"maxImageSize":500,"mode":"classic","dimensions":{"height":500}},"ignoreUserStartNodes":false,"mediaParentId":null}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1054, N'Umbraco.RadioButtonList', N'Nvarchar', N'{"items":[{"id":1,"value":"standard"},{"id":2,"value":"serif"},{"id":3,"value":"mono"}]}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1055, N'Umbraco.MediaPicker', N'Ntext', N'{"multiPicker":false,"onlyImages":true,"disableFolderSelect":true,"startNodeId":"umb://document/b61e08cd366445759a7295848cb803ac","ignoreUserStartNodes":false}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1056, N'Umbraco.Slider', N'Nvarchar', N'{"enableRange":false,"initVal1":0.0,"initVal2":0.0,"minVal":0.0,"maxVal":0.0,"step":0.0}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1057, N'Umbraco.Tags', N'Nvarchar', N'{"group":"default","storageType":1,"Delimiter":"\u0000"}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1058, N'UmbracoForms.FormPicker', N'Nvarchar', N'{"allowedForms":[]}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1059, N'Umbraco.TinyMCE', N'Ntext', N'{"editor":{"toolbar":["undo","redo","styleselect","bold","italic","alignleft","aligncenter","alignright","bullist","numlist","outdent","indent","link"],"stylesheets":[],"maxImageSize":500,"mode":"classic","dimensions":{"height":500}},"hideLabel":false,"ignoreUserStartNodes":false,"mediaParentId":null}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1060, N'Umbraco.Grid', N'Ntext', N'{"items":{"styles":[],"config":[],"columns":12,"templates":[{"name":"1 column layout","sections":[{"grid":12,"allowAll":true}]}],"layouts":[{"label":"Article","name":"Article","areas":[{"grid":4},{"grid":8}]},{"name":"Three Columns","areas":[{"grid":4,"allowAll":true},{"grid":4,"allowAll":true},{"grid":4,"allowAll":true}]},{"name":"FullWidth","areas":[{"grid":12,"allowAll":true}]}]},"rte":{"toolbar":["code","bold","italic","styleselect","alignleft","aligncenter","alignright","bullist","numlist","outdent","indent","link","image","ace","redo","undo","strikethrough","table"],"stylesheets":[],"maxImageSize":500,"mode":"classic","dimensions":{"height":500}},"ignoreUserStartNodes":false,"mediaParentId":null}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1061, N'Umbraco.MultiNodeTreePicker', N'Ntext', N'{"startNode":null,"filter":"person","minNumber":0,"maxNumber":0,"showOpenButton":false,"ignoreUserStartNodes":false}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1062, N'Umbraco.Tags', N'Nvarchar', N'{"group":"default","storageType":0,"Delimiter":"\u0000"}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1063, N'Umbraco.MediaPicker', N'Ntext', N'{"multiPicker":false,"onlyImages":true,"disableFolderSelect":true,"startNodeId":"umb://media/1fd2ecaff3714c009306867fa4585e7a","ignoreUserStartNodes":false}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1064, N'Umbraco.Tags', N'Nvarchar', N'{"group":"default","storageType":0,"Delimiter":"\u0000"}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1065, N'Umbraco.Tags', N'Nvarchar', N'{"group":"default","storageType":1,"Delimiter":"\u0000"}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1066, N'Umbraco.NestedContent', N'Ntext', N'{"contentTypes":[{"ncAlias":"feature","ncTabAlias":"Feature","nameTemplate":"{{featureName}}"}],"minItems":0,"maxItems":0,"confirmDeletes":true,"showIcons":true,"hideLabel":false}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1067, N'Umbraco.MediaPicker', N'Ntext', N'{"multiPicker":false,"onlyImages":true,"disableFolderSelect":true,"startNodeId":"umb://media/6d5bf746cb8245c5bd15dd3798209b87","ignoreUserStartNodes":false}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1068, N'Umbraco.Decimal', N'Decimal', N'{}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1069, N'Umbraco.DropDown.Flexible', N'Nvarchar', N'{"multiple":false,"items":[{"id":1,"value":"€"},{"id":2,"value":"£"},{"id":3,"value":"$"},{"id":4,"value":"DKK"}]}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1070, N'Umbraco.MultiNodeTreePicker', N'Ntext', N'{"startNode":null,"filter":"product","minNumber":0,"maxNumber":9,"showOpenButton":false,"ignoreUserStartNodes":false}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1071, N'Our.Umbraco.OsmMaps', N'Nvarchar', N'{}')
INSERT [dbo].[umbracoDocument] ([nodeId], [published], [edited]) VALUES (1095, 1, 0)
INSERT [dbo].[umbracoDocument] ([nodeId], [published], [edited]) VALUES (1096, 1, 0)
INSERT [dbo].[umbracoDocument] ([nodeId], [published], [edited]) VALUES (1097, 1, 0)
INSERT [dbo].[umbracoDocument] ([nodeId], [published], [edited]) VALUES (1098, 1, 0)
INSERT [dbo].[umbracoDocument] ([nodeId], [published], [edited]) VALUES (1099, 1, 0)
INSERT [dbo].[umbracoDocument] ([nodeId], [published], [edited]) VALUES (1100, 1, 0)
INSERT [dbo].[umbracoDocument] ([nodeId], [published], [edited]) VALUES (1101, 1, 0)
INSERT [dbo].[umbracoDocument] ([nodeId], [published], [edited]) VALUES (1102, 1, 0)
INSERT [dbo].[umbracoDocument] ([nodeId], [published], [edited]) VALUES (1103, 1, 0)
INSERT [dbo].[umbracoDocument] ([nodeId], [published], [edited]) VALUES (1104, 1, 0)
INSERT [dbo].[umbracoDocument] ([nodeId], [published], [edited]) VALUES (1105, 1, 0)
INSERT [dbo].[umbracoDocument] ([nodeId], [published], [edited]) VALUES (1106, 1, 0)
INSERT [dbo].[umbracoDocument] ([nodeId], [published], [edited]) VALUES (1107, 1, 0)
INSERT [dbo].[umbracoDocument] ([nodeId], [published], [edited]) VALUES (1108, 1, 0)
INSERT [dbo].[umbracoDocument] ([nodeId], [published], [edited]) VALUES (1109, 1, 0)
INSERT [dbo].[umbracoDocument] ([nodeId], [published], [edited]) VALUES (1110, 1, 0)
INSERT [dbo].[umbracoDocument] ([nodeId], [published], [edited]) VALUES (1111, 1, 0)
INSERT [dbo].[umbracoDocument] ([nodeId], [published], [edited]) VALUES (1112, 1, 0)
INSERT [dbo].[umbracoDocument] ([nodeId], [published], [edited]) VALUES (1113, 1, 0)
INSERT [dbo].[umbracoDocument] ([nodeId], [published], [edited]) VALUES (1114, 1, 0)
INSERT [dbo].[umbracoDocument] ([nodeId], [published], [edited]) VALUES (1115, 1, 0)
INSERT [dbo].[umbracoDocument] ([nodeId], [published], [edited]) VALUES (1116, 1, 0)
INSERT [dbo].[umbracoDocument] ([nodeId], [published], [edited]) VALUES (1117, 1, 0)
INSERT [dbo].[umbracoDocument] ([nodeId], [published], [edited]) VALUES (1118, 1, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (1, 1076, 1)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (2, 1081, 1)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (3, 1080, 1)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (4, 1080, 1)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (5, 1080, 1)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (6, 1080, 1)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (7, 1080, 1)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (8, 1080, 1)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (9, 1080, 1)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (10, 1080, 1)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (11, 1078, 1)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (12, 1079, 1)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (13, 1079, 1)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (14, 1079, 1)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (15, 1079, 1)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (16, 1079, 1)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (17, 1075, 1)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (18, 1075, 1)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (19, 1075, 1)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (20, 1072, 1)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (21, 1073, 1)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (22, 1073, 1)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (23, 1073, 1)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (24, 1074, 1)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (42, 1076, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (43, 1081, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (44, 1080, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (45, 1080, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (46, 1080, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (47, 1080, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (48, 1080, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (49, 1080, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (50, 1080, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (51, 1080, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (52, 1078, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (53, 1079, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (54, 1079, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (55, 1079, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (56, 1079, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (57, 1079, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (58, 1075, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (59, 1075, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (60, 1075, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (61, 1072, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (62, 1073, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (63, 1073, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (64, 1073, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (65, 1074, 0)
INSERT [dbo].[umbracoKeyValue] ([key], [value], [updated]) VALUES (N'Umbraco.Core.Upgrader.State+Umbraco.Core', N'{2AB29964-02A1-474D-BD6B-72148D2A53A2}', CAST(N'2020-06-03T14:52:05.750' AS DateTime))
SET IDENTITY_INSERT [dbo].[umbracoLanguage] ON 

INSERT [dbo].[umbracoLanguage] ([id], [languageISOCode], [languageCultureName], [isDefaultVariantLang], [mandatory], [fallbackLanguageId]) VALUES (1, N'en-US', N'English (United States)', 1, 0, NULL)
SET IDENTITY_INSERT [dbo].[umbracoLanguage] OFF
INSERT [dbo].[umbracoLock] ([id], [value], [name]) VALUES (-1000, 1, N'MainDom')
INSERT [dbo].[umbracoLock] ([id], [value], [name]) VALUES (-340, 1, N'Languages')
INSERT [dbo].[umbracoLock] ([id], [value], [name]) VALUES (-339, 1, N'KeyValues')
INSERT [dbo].[umbracoLock] ([id], [value], [name]) VALUES (-338, 1, N'Domains')
INSERT [dbo].[umbracoLock] ([id], [value], [name]) VALUES (-337, 1, N'MemberTypes')
INSERT [dbo].[umbracoLock] ([id], [value], [name]) VALUES (-336, 1, N'MediaTypes')
INSERT [dbo].[umbracoLock] ([id], [value], [name]) VALUES (-335, 1, N'MemberTree')
INSERT [dbo].[umbracoLock] ([id], [value], [name]) VALUES (-334, -1, N'MediaTree')
INSERT [dbo].[umbracoLock] ([id], [value], [name]) VALUES (-333, 1, N'ContentTree')
INSERT [dbo].[umbracoLock] ([id], [value], [name]) VALUES (-332, 1, N'ContentTypes')
INSERT [dbo].[umbracoLock] ([id], [value], [name]) VALUES (-331, 1, N'Servers')
SET IDENTITY_INSERT [dbo].[umbracoLog] ON 

INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1, -1, -1, N'Package', CAST(N'2020-06-03T14:52:12.230' AS DateTime), N'PackagerInstall', N'Package files installed for package ''The Starter Kit''.', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2, -1, 1048, N'DataType', CAST(N'2020-06-03T14:52:16.427' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (3, -1, -1, N'DataType', CAST(N'2020-06-03T14:52:16.563' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (4, -1, -1, N'Macro', CAST(N'2020-06-03T14:52:16.650' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (5, -1, -1, N'Macro', CAST(N'2020-06-03T14:52:16.657' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (6, -1, -1, N'Template', CAST(N'2020-06-03T14:52:16.797' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (7, -1, -1, N'DocumentType', CAST(N'2020-06-03T14:52:17.157' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (8, -1, -1, N'DocumentType', CAST(N'2020-06-03T14:52:17.407' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (9, NULL, -1, N'Document', CAST(N'2020-06-03T14:52:17.893' AS DateTime), N'Save', N'Saved multiple content', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (10, -1, 1092, N'DocumentType', CAST(N'2020-06-03T14:52:18.010' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (11, -1, 1074, N'Template', CAST(N'2020-06-03T14:52:18.030' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (12, -1, 1072, N'Template', CAST(N'2020-06-03T14:52:18.093' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (13, -1, 1073, N'Template', CAST(N'2020-06-03T14:52:18.100' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (14, -1, 1074, N'Template', CAST(N'2020-06-03T14:52:18.107' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (15, -1, 1075, N'Template', CAST(N'2020-06-03T14:52:18.117' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (16, -1, 1076, N'Template', CAST(N'2020-06-03T14:52:18.123' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (17, -1, 1078, N'Template', CAST(N'2020-06-03T14:52:18.130' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (18, -1, 1079, N'Template', CAST(N'2020-06-03T14:52:18.137' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (19, -1, 1080, N'Template', CAST(N'2020-06-03T14:52:18.143' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (20, -1, 1081, N'Template', CAST(N'2020-06-03T14:52:18.153' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (21, -1, 1119, N'Media', CAST(N'2020-06-03T14:52:18.213' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (22, -1, 1120, N'Media', CAST(N'2020-06-03T14:52:18.230' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (23, -1, 1121, N'Media', CAST(N'2020-06-03T14:52:18.240' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (24, -1, 1122, N'Media', CAST(N'2020-06-03T14:52:18.363' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (25, -1, 1123, N'Media', CAST(N'2020-06-03T14:52:18.397' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (26, -1, 1124, N'Media', CAST(N'2020-06-03T14:52:18.433' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (27, -1, 1125, N'Media', CAST(N'2020-06-03T14:52:18.480' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (28, -1, 1126, N'Media', CAST(N'2020-06-03T14:52:18.513' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (29, -1, 1127, N'Media', CAST(N'2020-06-03T14:52:18.547' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (30, -1, 1128, N'Media', CAST(N'2020-06-03T14:52:18.583' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (31, -1, 1129, N'Media', CAST(N'2020-06-03T14:52:18.620' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (32, -1, 1130, N'Media', CAST(N'2020-06-03T14:52:18.663' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (33, -1, 1131, N'Media', CAST(N'2020-06-03T14:52:18.793' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (34, -1, 1132, N'Media', CAST(N'2020-06-03T14:52:18.933' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (35, -1, 1133, N'Media', CAST(N'2020-06-03T14:52:19.080' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (36, -1, 1134, N'Media', CAST(N'2020-06-03T14:52:19.213' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (37, -1, 1135, N'Media', CAST(N'2020-06-03T14:52:19.347' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (38, -1, 1111, N'Document', CAST(N'2020-06-03T14:52:19.517' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (39, -1, 1116, N'Document', CAST(N'2020-06-03T14:52:19.550' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (40, -1, 1095, N'Document', CAST(N'2020-06-03T14:52:19.620' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (41, -1, 1096, N'Document', CAST(N'2020-06-03T14:52:19.697' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (42, -1, 1097, N'Document', CAST(N'2020-06-03T14:52:19.917' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (43, -1, 1098, N'Document', CAST(N'2020-06-03T14:52:19.943' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (44, -1, 1099, N'Document', CAST(N'2020-06-03T14:52:19.973' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (45, -1, 1100, N'Document', CAST(N'2020-06-03T14:52:19.997' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (46, -1, 1101, N'Document', CAST(N'2020-06-03T14:52:20.027' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (47, -1, 1102, N'Document', CAST(N'2020-06-03T14:52:20.057' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (48, -1, 1103, N'Document', CAST(N'2020-06-03T14:52:20.083' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (49, -1, 1104, N'Document', CAST(N'2020-06-03T14:52:20.117' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (50, -1, 1105, N'Document', CAST(N'2020-06-03T14:52:20.127' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (51, -1, 1106, N'Document', CAST(N'2020-06-03T14:52:20.153' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (52, -1, 1107, N'Document', CAST(N'2020-06-03T14:52:20.183' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (53, -1, 1108, N'Document', CAST(N'2020-06-03T14:52:20.207' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (54, -1, 1109, N'Document', CAST(N'2020-06-03T14:52:20.227' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (55, -1, 1110, N'Document', CAST(N'2020-06-03T14:52:20.257' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (56, -1, 1111, N'Document', CAST(N'2020-06-03T14:52:20.270' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (57, -1, 1112, N'Document', CAST(N'2020-06-03T14:52:20.280' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (58, -1, 1113, N'Document', CAST(N'2020-06-03T14:52:20.290' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (59, -1, 1114, N'Document', CAST(N'2020-06-03T14:52:20.300' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (60, -1, 1115, N'Document', CAST(N'2020-06-03T14:52:20.323' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (61, -1, 1116, N'Document', CAST(N'2020-06-03T14:52:20.353' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (62, -1, 1117, N'Document', CAST(N'2020-06-03T14:52:20.380' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (63, -1, 1118, N'Document', CAST(N'2020-06-03T14:52:20.393' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (64, -1, 1095, N'Document', CAST(N'2020-06-03T14:52:20.403' AS DateTime), N'Publish', N'Branch published', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (65, -1, -1, N'Package', CAST(N'2020-06-03T14:52:20.420' AS DateTime), N'PackagerInstall', N'Package data installed for package ''The Starter Kit''.', NULL)
SET IDENTITY_INSERT [dbo].[umbracoLog] OFF
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (25, NULL)
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (26, NULL)
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (27, NULL)
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (28, N'/media/dz4hz34t/16403439029_f500be349b_o.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (29, N'/media/cp3jdwxe/4730684907_8a7f8759cb_b.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (30, N'/media/hnyfzknb/7371127652_e01b6ab56f_b.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (31, N'/media/yktp5wup/14272036539_469ca21d5c_h.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (32, N'/media/25pekb0k/5852022211_9028df67c0_b.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (33, N'/media/o1xljr1e/5852022091_87c5d045ab_b.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (34, N'/media/203ljfha/7377957524_347859faac_b.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (35, N'/media/swqg1al3/7373036290_5e8420bf36_b.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (36, N'/media/mb2hcol5/7373036208_30257976a0_b.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (37, N'/media/4icfo4ms/18720470241_ff77768544_h.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (38, N'/media/x05fznos/18531852339_981b067419_h.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (39, N'/media/pqnlb42z/18531854019_351c579559_h.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (40, N'/media/ja2hllog/18095416144_44a566a5f4_h.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (41, N'/media/bn2fxjpy/18530280048_459b8b61b2_h.jpg')
SET IDENTITY_INSERT [dbo].[umbracoNode] ON 

INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-99, N'8f1ef1e1-9de4-40d3-a072-6673f631ca64', -1, 1, N'-1,-99', 39, 0, -1, N'Label (decimal)', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2020-06-03T14:52:05.323' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-98, N'a97cec69-9b71-4c30-8b12-ec398860d7e8', -1, 1, N'-1,-98', 38, 0, -1, N'Label (time)', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2020-06-03T14:52:05.323' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-97, N'aa2c52a0-ce87-4e65-a47c-7df09358585d', -1, 1, N'-1,-97', 2, 0, -1, N'List View - Members', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2020-06-03T14:52:05.330' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-96, N'3a0156c4-3b8c-4803-bdc1-6871faa83fff', -1, 1, N'-1,-96', 2, 0, -1, N'List View - Media', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2020-06-03T14:52:05.330' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-95, N'c0808dd3-8133-4e4b-8ce8-e2bea84a96a4', -1, 1, N'-1,-95', 2, 0, -1, N'List View - Content', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2020-06-03T14:52:05.330' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-94, N'0e9794eb-f9b5-4f20-a788-93acd233a7e4', -1, 1, N'-1,-94', 37, 0, -1, N'Label (datetime)', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2020-06-03T14:52:05.323' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-93, N'930861bf-e262-4ead-a704-f99453565708', -1, 1, N'-1,-93', 36, 0, -1, N'Label (bigint)', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2020-06-03T14:52:05.323' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-92, N'f0bc4bfb-b499-40d6-ba86-058885a5178c', -1, 1, N'-1,-92', 35, 0, -1, N'Label (string)', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2020-06-03T14:52:05.323' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-91, N'8e7f995c-bd81-4627-9932-c40e568ec788', -1, 1, N'-1,-91', 36, 0, -1, N'Label (integer)', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2020-06-03T14:52:05.323' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-90, N'84c6b441-31df-4ffe-b67e-67d5bc3ae65a', -1, 1, N'-1,-90', 34, 0, -1, N'Upload', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2020-06-03T14:52:05.323' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-89, N'c6bac0dd-4ab9-45b1-8e30-e4b619ee5da3', -1, 1, N'-1,-89', 33, 0, -1, N'Textarea', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2020-06-03T14:52:05.327' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-88, N'0cc0eba1-9960-42c9-bf9b-60e150b429ae', -1, 1, N'-1,-88', 32, 0, -1, N'Textstring', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2020-06-03T14:52:05.327' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-87, N'ca90c950-0aff-4e72-b976-a30b1ac57dad', -1, 1, N'-1,-87', 4, 0, -1, N'Richtext editor', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2020-06-03T14:52:05.327' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-51, N'2e6d3631-066e-44b8-aec4-96f09099b2b5', -1, 1, N'-1,-51', 2, 0, -1, N'Numeric', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2020-06-03T14:52:05.327' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-49, N'92897bc6-a5f3-4ffe-ae27-f2e7e33dda49', -1, 1, N'-1,-49', 2, 0, -1, N'True/false', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2020-06-03T14:52:05.327' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-43, N'fbaf13a8-4036-41f2-93a3-974f678c312a', -1, 1, N'-1,-43', 2, 0, -1, N'Checkbox list', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2020-06-03T14:52:05.327' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-42, N'f38f0ac7-1d27-439c-9f3f-089cd8825a53', -1, 1, N'-1,-42', 2, 0, -1, N'Dropdown multiple', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2020-06-03T14:52:05.327' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-41, N'5046194e-4237-453c-a547-15db3a07c4e1', -1, 1, N'-1,-41', 2, 0, -1, N'Date Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2020-06-03T14:52:05.327' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-40, N'bb5f57c9-ce2b-4bb9-b697-4caca783a805', -1, 1, N'-1,-40', 2, 0, -1, N'Radiobox', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2020-06-03T14:52:05.327' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-39, N'0b6a45e7-44ba-430d-9da5-4e46060b9e03', -1, 1, N'-1,-39', 2, 0, -1, N'Dropdown', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2020-06-03T14:52:05.327' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-37, N'0225af17-b302-49cb-9176-b9f35cab9c17', -1, 1, N'-1,-37', 2, 0, -1, N'Approved Color', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2020-06-03T14:52:05.327' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-36, N'e4d66c0f-b935-4200-81f0-025f7256b89a', -1, 1, N'-1,-36', 2, 0, -1, N'Date Picker with time', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2020-06-03T14:52:05.330' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-21, N'bf7c7cbc-952f-4518-97a2-69e9c7b33842', -1, 0, N'-1,-21', 0, 0, -1, N'Recycle Bin', N'cf3d8e34-1c1c-41e9-ae56-878b57b32113', CAST(N'2020-06-03T14:52:05.320' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-20, N'0f582a79-1e41-4cf0-bfa0-76340651891a', -1, 0, N'-1,-20', 0, 0, -1, N'Recycle Bin', N'01bb7ff2-24dc-4c0c-95a2-c24ef72bbac8', CAST(N'2020-06-03T14:52:05.320' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-1, N'916724a5-173d-4619-b97e-b9de133dd6f5', -1, 0, N'-1', 0, 0, -1, N'SYSTEM DATA: umbraco master root', N'ea7d8624-4cfe-4578-a871-24aa946bf34d', CAST(N'2020-06-03T14:52:05.317' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1031, N'f38bd2d7-65d0-48e6-95dc-87ce06ec2d3d', -1, 1, N'-1,1031', 2, 0, -1, N'Folder', N'4ea4382b-2f5a-4c2b-9587-ae9b3cf3602e', CAST(N'2020-06-03T14:52:05.330' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1032, N'cc07b313-0843-4aa8-bbda-871c8da728c8', -1, 1, N'-1,1032', 2, 0, -1, N'Image', N'4ea4382b-2f5a-4c2b-9587-ae9b3cf3602e', CAST(N'2020-06-03T14:52:05.330' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1033, N'4c52d8ab-54e6-40cd-999c-7a5f24903e4d', -1, 1, N'-1,1033', 2, 0, -1, N'File', N'4ea4382b-2f5a-4c2b-9587-ae9b3cf3602e', CAST(N'2020-06-03T14:52:05.330' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1041, N'b6b73142-b9c1-4bf8-a16d-e1c23320b549', -1, 1, N'-1,1041', 2, 0, -1, N'Tags', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2020-06-03T14:52:05.330' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1043, N'1df9f033-e6d4-451f-b8d2-e0cbc50a836f', -1, 1, N'-1,1043', 2, 0, -1, N'Image Cropper', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2020-06-03T14:52:05.330' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1044, N'd59be02f-1df9-4228-aa1e-01917d806cda', -1, 1, N'-1,1044', 0, 0, -1, N'Member', N'9b5416fb-e72f-45a9-a07b-5a9a2709ce43', CAST(N'2020-06-03T14:52:05.330' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1046, N'fd1e0da5-5606-4862-b679-5d0cf3a52a59', -1, 1, N'-1,1046', 2, 0, -1, N'Content Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2020-06-03T14:52:05.330' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1047, N'1ea2e01f-ebd8-4ce1-8d71-6b1149e63548', -1, 1, N'-1,1047', 2, 0, -1, N'Member Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2020-06-03T14:52:05.330' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1048, N'135d60e0-64d9-49ed-ab08-893c9ba44ae5', -1, 1, N'-1,1048', 2, 0, -1, N'Media Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2020-06-03T14:52:05.330' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1049, N'9dbbcbbb-2327-434a-b355-af1b84e5010a', -1, 1, N'-1,1049', 2, 0, -1, N'Multiple Media Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2020-06-03T14:52:05.330' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1050, N'b4e3535a-1753-47e2-8568-602cf8cfee6f', -1, 1, N'-1,1050', 2, 0, -1, N'Multi URL Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2020-06-03T14:52:05.330' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1051, N'3ece86aa-61ad-45d5-b1dd-8f02f25df949', -1, 1, N'-1,1051', 29, 0, -1, N'Home - Call To Action Link - Content Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2020-06-03T14:52:16.477' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1052, N'71548df5-836c-41f8-96ac-5b98fe5e2e19', -1, 1, N'-1,1052', 30, 0, -1, N'Home - Color Theme - Radio button list', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2020-06-03T14:52:16.497' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1053, N'34a7f8f5-a84e-439b-9322-466ff7ed8866', -1, 1, N'-1,1053', 31, 0, -1, N'Home - Content - Grid layout', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2020-06-03T14:52:16.500' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1054, N'fff3c360-3f90-45b3-a554-e29ca72cdce4', -1, 1, N'-1,1054', 32, 0, -1, N'Home - Font - Radio button list', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2020-06-03T14:52:16.507' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1055, N'519eaa41-b905-4371-aa7c-40c9b3946f66', -1, 1, N'-1,1055', 33, 0, -1, N'Home - Logo - Media Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2020-06-03T14:52:16.510' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1056, N'9d5ba2c5-ed7a-41f8-b454-9fc65f48752e', -1, 1, N'-1,1056', 34, 0, -1, N'Blog - How many posts should be shown - Slider', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2020-06-03T14:52:16.513' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1057, N'9d0726e6-5fa7-4455-8fe6-ed5bf9057cc4', -1, 1, N'-1,1057', 35, 0, -1, N'Blogpost - Categories - Tags', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2020-06-03T14:52:16.517' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1058, N'59accdfb-e0e7-4ff2-b8ab-4822b78d2c64', -1, 1, N'-1,1058', 36, 0, -1, N'Contact - Pick a Contact Form - Form Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2020-06-03T14:52:16.520' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1059, N'ecbbac0d-974e-490c-b533-fead926dc525', -1, 1, N'-1,1059', 37, 0, -1, N'Contact - Contact Intro - Rich Text Editor', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2020-06-03T14:52:16.527' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1060, N'ea0ed4c1-c489-43b8-9058-a70babf430ff', -1, 1, N'-1,1060', 38, 0, -1, N'Content Base - Content - Grid layout', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2020-06-03T14:52:16.530' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1061, N'4885450e-a60f-42bb-984a-43988baf5283', -1, 1, N'-1,1061', 39, 0, -1, N'People - Featured People - Multinode Treepicker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2020-06-03T14:52:16.533' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1062, N'b58c1530-91c9-4c83-aa35-032aca0f7b89', -1, 1, N'-1,1062', 40, 0, -1, N'Person - Department - Tags', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2020-06-03T14:52:16.537' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1063, N'e26a8d91-a9d7-475b-bc3b-2a09f4743754', -1, 1, N'-1,1063', 41, 0, -1, N'Person - Photo - Media Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2020-06-03T14:52:16.540' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1064, N'59ac0a33-9d34-4236-9886-99310d13d7f1', -1, 1, N'-1,1064', 42, 0, -1, N'Product - Category - Tags', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2020-06-03T14:52:16.543' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1065, N'30c35221-91b0-49a5-a599-42d1965161ea', -1, 1, N'-1,1065', 43, 0, -1, N'Navigation Base - Keywords - Tags', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2020-06-03T14:52:16.547' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1066, N'84bbeb67-df7e-4043-8db8-55df52d01456', -1, 1, N'-1,1066', 44, 0, -1, N'Product - Features - Nested Content', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2020-06-03T14:52:16.547' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1067, N'3ada047c-6dfc-4a14-afc4-7efb79390f92', -1, 1, N'-1,1067', 45, 0, -1, N'Product - Photos - Media Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2020-06-03T14:52:16.550' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1068, N'3f6619b6-08a4-4be7-8d6a-2761844ee567', -1, 1, N'-1,1068', 46, 0, -1, N'Product - Price - Decimal', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2020-06-03T14:52:16.553' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1069, N'28a6aeda-b3fc-4c4d-926e-607854a07891', -1, 1, N'-1,1069', 47, 0, -1, N'Products - Default Currency - Dropdown list', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2020-06-03T14:52:16.557' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1070, N'd0382188-119b-49b7-86d3-84119a02645f', -1, 1, N'-1,1070', 48, 0, -1, N'Products - Featured Products - Multinode Treepicker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2020-06-03T14:52:16.560' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1071, N'fc1475d2-7c7b-4b2f-bc53-54c86fd43d6c', -1, 1, N'-1,1071', 49, 0, -1, N'Contact - Map Coordinates - Open street maps', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2020-06-03T14:52:16.560' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1072, N'46f2d4ef-7857-47c7-84f4-f0733318317d', 1077, 1, N'-1,1077,1072', 0, 0, NULL, N'Blog', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(N'2020-06-03T14:52:16.690' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1073, N'b4af0528-fd35-455d-aa3e-c5150a0c83c9', 1077, 1, N'-1,1077,1073', 0, 0, NULL, N'Blogpost', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(N'2020-06-03T14:52:16.713' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1074, N'5875c982-cdc4-4fd2-8423-61fbd229b022', 1077, 1, N'-1,1077,1074', 0, 0, NULL, N'Contact', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(N'2020-06-03T14:52:16.727' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1075, N'e2b56ad1-023d-42c3-a357-de4e1240eddc', 1077, 1, N'-1,1077,1075', 0, 0, NULL, N'ContentPage', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(N'2020-06-03T14:52:16.730' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1076, N'68a7f91a-aaa6-4c7d-8172-94b4a4b23507', 1077, 1, N'-1,1077,1076', 0, 0, NULL, N'Home', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(N'2020-06-03T14:52:16.737' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1077, N'b3ae7655-b0ed-483c-a1e2-4bfaaa673d7b', -1, 1, N'-1,1077', 0, 0, NULL, N'Master', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(N'2020-06-03T14:52:16.743' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1078, N'a7d47ae7-540b-45ca-b698-6c05070954d7', 1077, 1, N'-1,1077,1078', 0, 0, NULL, N'People', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(N'2020-06-03T14:52:16.747' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1079, N'9f25e177-196e-4376-94fd-2388ccd1adee', 1077, 1, N'-1,1077,1079', 0, 0, NULL, N'Person', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(N'2020-06-03T14:52:16.760' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1080, N'f40cba1b-e4b2-4225-8555-838ed62aecf9', 1077, 1, N'-1,1077,1080', 0, 0, NULL, N'Product', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(N'2020-06-03T14:52:16.773' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1081, N'8e8abdbd-4e92-4044-90f7-d0061a511281', 1077, 1, N'-1,1077,1081', 0, 0, NULL, N'Products', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(N'2020-06-03T14:52:16.783' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1082, N'd1534142-44f6-420d-a691-3bc339b0ddd4', -1, 1, N'-1,1082', 0, 0, -1, N'Compositions', N'2f7a2769-6b0b-4468-90dd-af42d64f7f16', CAST(N'2020-06-03T14:52:16.817' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1083, N'8004c388-1184-4d41-9c60-9536afe85d81', 1082, 2, N'-1,1082,1083', 0, 0, -1, N'Content Base', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2020-06-03T14:52:17.033' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1084, N'a73f17a2-9d5f-4a2f-90b3-d356822b4db9', 1082, 2, N'-1,1082,1084', 1, 0, -1, N'Navigation Base', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2020-06-03T14:52:17.060' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1085, N'93a7c58f-c148-45fe-87f8-fe374eb1f710', -1, 1, N'-1,1085', 0, 0, -1, N'Products', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2020-06-03T14:52:17.067' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1086, N'505044b9-b516-4c8e-92b6-385ec23a24c9', -1, 1, N'-1,1086', 1, 0, -1, N'Product', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2020-06-03T14:52:17.077' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1087, N'88968837-b402-43dc-880d-e5ccf10209ed', -1, 1, N'-1,1087', 2, 0, -1, N'Person', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2020-06-03T14:52:17.087' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1088, N'a4352ef3-fae4-4dd2-bf66-bbeea31cee75', -1, 1, N'-1,1088', 3, 0, -1, N'People', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2020-06-03T14:52:17.100' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1089, N'9400946e-61a6-4da2-b8f7-aa2b2ff9ee6e', -1, 1, N'-1,1089', 4, 0, -1, N'Home', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2020-06-03T14:52:17.103' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1090, N'bc211557-df6d-4957-affc-6934e1f1fc10', 1082, 2, N'-1,1082,1090', 2, 0, -1, N'Feature', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2020-06-03T14:52:17.117' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1091, N'83afca14-d52d-43e0-9313-b429158eb77f', -1, 1, N'-1,1091', 5, 0, -1, N'Content Page', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2020-06-03T14:52:17.123' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1092, N'a85a664e-d59c-4e03-a328-044d26a8243e', -1, 1, N'-1,1092', 6, 0, -1, N'Contact', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2020-06-03T14:52:17.127' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1093, N'8b689f33-b229-46d0-84be-b25bfc2613ad', -1, 1, N'-1,1093', 7, 0, -1, N'Blogpost', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2020-06-03T14:52:17.133' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1094, N'80c04dc8-09ff-42ef-b7c0-5e1c9b3e29e7', -1, 1, N'-1,1094', 8, 0, -1, N'Blog', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2020-06-03T14:52:17.137' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1095, N'ca4249ed-2b23-4337-b522-63cabe5587d1', -1, 1, N'-1,1095', 0, 0, -1, N'Home', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2020-06-03T14:52:17.557' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1096, N'ec4aafcc-0c25-4f25-a8fe-705bfae1d324', 1095, 2, N'-1,1095,1096', 0, 0, -1, N'Products', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2020-06-03T14:52:17.697' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1097, N'df1eb830-411b-4d41-a343-3917b76d533c', 1096, 3, N'-1,1095,1096,1097', 0, 0, -1, N'Tattoo', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2020-06-03T14:52:17.710' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1098, N'4e96411a-b8e1-435f-9322-2faee30ef5f2', 1096, 3, N'-1,1095,1096,1098', 1, 0, -1, N'Unicorn', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2020-06-03T14:52:17.723' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1099, N'd390a562-107d-4f02-8df7-57aa86bad752', 1096, 3, N'-1,1095,1096,1099', 2, 0, -1, N'Ping Pong Ball', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2020-06-03T14:52:17.730' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1100, N'bb7d5ae0-07ac-40b8-b5b9-18c36947fb56', 1096, 3, N'-1,1095,1096,1100', 3, 0, -1, N'Bowling Ball', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2020-06-03T14:52:17.737' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1101, N'202cdc2f-1a45-40f4-a653-a7b321e1c54c', 1096, 3, N'-1,1095,1096,1101', 4, 0, -1, N'Jumpsuit', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2020-06-03T14:52:17.747' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1102, N'103171c8-e11c-4002-9bb2-f3404cada22a', 1096, 3, N'-1,1095,1096,1102', 5, 0, -1, N'Banjo', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2020-06-03T14:52:17.753' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1103, N'061662b9-b02a-4dcf-af59-92b603e8e3e1', 1096, 3, N'-1,1095,1096,1103', 6, 0, -1, N'Knitted West', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2020-06-03T14:52:17.760' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1104, N'262beb70-53a6-49b8-9e98-cfde2e85a78e', 1096, 3, N'-1,1095,1096,1104', 7, 0, -1, N'Biker Jacket', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2020-06-03T14:52:17.770' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1105, N'e8ad9b65-cff6-4952-ac5b-efe56a60db62', 1095, 2, N'-1,1095,1105', 1, 0, -1, N'People', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2020-06-03T14:52:17.797' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1106, N'616d0f54-b8b0-450e-be0d-2ca4c06672a2', 1105, 3, N'-1,1095,1105,1106', 0, 0, -1, N'Jan Skovgaard', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2020-06-03T14:52:17.803' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1107, N'eab72f13-b22e-46d5-b270-9c196e49a53b', 1105, 3, N'-1,1095,1105,1107', 1, 0, -1, N'Matt Brailsford', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2020-06-03T14:52:17.807' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1108, N'9946f249-0d6e-496c-91b6-64eaf1a3dffd', 1105, 3, N'-1,1095,1105,1108', 2, 0, -1, N'Lee Kelleher', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2020-06-03T14:52:17.817' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1109, N'4f0b7052-d854-43b5-bb7c-6c82af4d96d1', 1105, 3, N'-1,1095,1105,1109', 3, 0, -1, N'Jeavon Leopold', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2020-06-03T14:52:17.820' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1110, N'1301ecb2-beaf-44f3-a12e-48bdbcde6023', 1105, 3, N'-1,1095,1105,1110', 4, 0, -1, N'Jeroen Breuer', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2020-06-03T14:52:17.827' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1111, N'3cce2545-e3ac-44ec-bf55-a52cc5965db3', 1095, 2, N'-1,1095,1111', 2, 0, -1, N'About Us', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2020-06-03T14:52:17.830' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1112, N'ee82cba3-a0e7-4063-9ae1-3026a4f72a3d', 1111, 3, N'-1,1095,1111,1112', 0, 0, -1, N'About this Starter Kit', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2020-06-03T14:52:17.847' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1113, N'9c1c3a2c-72b0-45e2-a3c3-3c068164a018', 1111, 3, N'-1,1095,1111,1113', 1, 0, -1, N'Todo list for the Starter Kit', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2020-06-03T14:52:17.853' AS DateTime))
GO
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1114, N'1d770f10-d1ca-4a26-9d68-071e2c9f7ac1', 1095, 2, N'-1,1095,1114', 3, 0, -1, N'Blog', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2020-06-03T14:52:17.860' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1115, N'782c631b-11e9-4e90-8fc1-6aeff37b488a', 1114, 3, N'-1,1095,1114,1115', 0, 0, -1, N'My Blog Post', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2020-06-03T14:52:17.863' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1116, N'72346384-fc5e-4a6e-a07d-559eec11dcea', 1114, 3, N'-1,1095,1114,1116', 1, 0, -1, N'Another one', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2020-06-03T14:52:17.870' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1117, N'bc41a208-5c36-4978-a3e2-7cfcfd581980', 1114, 3, N'-1,1095,1114,1117', 2, 0, -1, N'This will be great', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2020-06-03T14:52:17.877' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1118, N'4a1f4198-e143-48ba-a0f5-1a7ef2df23aa', 1095, 2, N'-1,1095,1118', 4, 0, -1, N'Contact', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2020-06-03T14:52:17.887' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1119, N'b6f11172-373f-4473-af0f-0b0e5aefd21c', -1, 1, N'-1,1119', 1, 0, -1, N'Design', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2020-06-03T14:52:18.197' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1120, N'1fd2ecaf-f371-4c00-9306-867fa4585e7a', -1, 1, N'-1,1120', 1, 0, -1, N'People', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2020-06-03T14:52:18.223' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1121, N'6d5bf746-cb82-45c5-bd15-dd3798209b87', -1, 1, N'-1,1121', 1, 0, -1, N'Products', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2020-06-03T14:52:18.237' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1122, N'662af6ca-411a-4c93-a6c7-22c4845698e7', 1119, 2, N'-1,1119,1122', 0, 0, -1, N'Umbraco Campari Meeting Room', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2020-06-03T14:52:18.357' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1123, N'55514845-b8bd-487c-b370-9724852fd6bb', 1121, 2, N'-1,1121,1123', 0, 0, -1, N'Biker Jacket', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2020-06-03T14:52:18.393' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1124, N'20e3a8ff-ad1b-4fe9-b48c-b8461c46d2d0', 1121, 2, N'-1,1121,1124', 0, 0, -1, N'Tattoo', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2020-06-03T14:52:18.427' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1125, N'1bc5280b-8658-4027-89d9-58e2576e469b', 1121, 2, N'-1,1121,1125', 0, 0, -1, N'Unicorn', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2020-06-03T14:52:18.477' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1126, N'c09ec77f-08e3-466a-ac58-c979befd3cd6', 1121, 2, N'-1,1121,1126', 0, 0, -1, N'Ping Pong Ball', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2020-06-03T14:52:18.507' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1127, N'b76ddb4e-e603-4014-9906-6087984740ec', 1121, 2, N'-1,1121,1127', 0, 0, -1, N'Bowling Ball', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2020-06-03T14:52:18.540' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1128, N'46a025d6-095a-4b14-8b96-1b59ca4e951c', 1121, 2, N'-1,1121,1128', 0, 0, -1, N'Jumpsuit', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2020-06-03T14:52:18.577' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1129, N'17552d12-081d-4d01-b681-32c495d6576f', 1121, 2, N'-1,1121,1129', 0, 0, -1, N'Banjo', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2020-06-03T14:52:18.613' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1130, N'1d0b713a-022a-49c8-b842-a2463c83a553', 1121, 2, N'-1,1121,1130', 0, 0, -1, N'Knitted West', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2020-06-03T14:52:18.657' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1131, N'cf1ab8dc-ad0f-4a8e-974b-87b84777b0d6', 1120, 2, N'-1,1120,1131', 0, 0, -1, N'Jan Skovgaard', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2020-06-03T14:52:18.790' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1132, N'eee91c05-b2e8-4031-a056-dcd7f28eff89', 1120, 2, N'-1,1120,1132', 0, 0, -1, N'Matt Brailsford', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2020-06-03T14:52:18.927' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1133, N'fa763e0d-0ceb-408c-8720-365d57e06e32', 1120, 2, N'-1,1120,1133', 0, 0, -1, N'Lee Kelleher', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2020-06-03T14:52:19.073' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1134, N'c0969cab-13ab-4de9-819a-848619ac2b5d', 1120, 2, N'-1,1120,1134', 0, 0, -1, N'Jeavon Leopold', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2020-06-03T14:52:19.210' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1135, N'34371d08-92c8-4015-912e-baacd002c5d0', 1120, 2, N'-1,1120,1135', 0, 0, -1, N'Jeroen Breuer', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2020-06-03T14:52:19.340' AS DateTime))
SET IDENTITY_INSERT [dbo].[umbracoNode] OFF
SET IDENTITY_INSERT [dbo].[umbracoPropertyData] ON 

INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (147, 28, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/dz4hz34t/16403439029_f500be349b_o.jpg","crops":null}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (148, 28, 7, NULL, NULL, 1600, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (149, 28, 8, NULL, NULL, 1067, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (150, 28, 9, NULL, NULL, NULL, NULL, NULL, N'759116', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (151, 28, 10, NULL, NULL, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (152, 29, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/cp3jdwxe/4730684907_8a7f8759cb_b.jpg","crops":null}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (153, 29, 7, NULL, NULL, 680, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (154, 29, 8, NULL, NULL, 1024, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (155, 29, 9, NULL, NULL, NULL, NULL, NULL, N'224349', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (156, 29, 10, NULL, NULL, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (157, 30, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/hnyfzknb/7371127652_e01b6ab56f_b.jpg","crops":null}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (158, 30, 7, NULL, NULL, 683, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (159, 30, 8, NULL, NULL, 1024, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (160, 30, 9, NULL, NULL, NULL, NULL, NULL, N'258796', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (161, 30, 10, NULL, NULL, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (162, 31, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/yktp5wup/14272036539_469ca21d5c_h.jpg","crops":null}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (163, 31, 7, NULL, NULL, 1067, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (164, 31, 8, NULL, NULL, 1600, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (165, 31, 9, NULL, NULL, NULL, NULL, NULL, N'367954', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (166, 31, 10, NULL, NULL, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (167, 32, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/25pekb0k/5852022211_9028df67c0_b.jpg","crops":null}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (168, 32, 7, NULL, NULL, 1024, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (169, 32, 8, NULL, NULL, 683, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (170, 32, 9, NULL, NULL, NULL, NULL, NULL, N'205417', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (171, 32, 10, NULL, NULL, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (172, 33, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/o1xljr1e/5852022091_87c5d045ab_b.jpg","crops":null}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (173, 33, 7, NULL, NULL, 684, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (174, 33, 8, NULL, NULL, 1024, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (175, 33, 9, NULL, NULL, NULL, NULL, NULL, N'222536', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (176, 33, 10, NULL, NULL, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (177, 34, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/203ljfha/7377957524_347859faac_b.jpg","crops":null}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (178, 34, 7, NULL, NULL, 683, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (179, 34, 8, NULL, NULL, 1024, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (180, 34, 9, NULL, NULL, NULL, NULL, NULL, N'369611', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (181, 34, 10, NULL, NULL, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (182, 35, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/swqg1al3/7373036290_5e8420bf36_b.jpg","crops":null}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (183, 35, 7, NULL, NULL, 1024, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (184, 35, 8, NULL, NULL, 683, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (185, 35, 9, NULL, NULL, NULL, NULL, NULL, N'299546', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (186, 35, 10, NULL, NULL, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (187, 36, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/mb2hcol5/7373036208_30257976a0_b.jpg","crops":null}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (188, 36, 7, NULL, NULL, 683, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (189, 36, 8, NULL, NULL, 1024, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (190, 36, 9, NULL, NULL, NULL, NULL, NULL, N'602717', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (191, 36, 10, NULL, NULL, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (192, 37, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/4icfo4ms/18720470241_ff77768544_h.jpg","crops":null}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (193, 37, 7, NULL, NULL, 1600, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (194, 37, 8, NULL, NULL, 1067, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (195, 37, 9, NULL, NULL, NULL, NULL, NULL, N'240126', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (196, 37, 10, NULL, NULL, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (197, 38, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/x05fznos/18531852339_981b067419_h.jpg","crops":null}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (198, 38, 7, NULL, NULL, 1600, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (199, 38, 8, NULL, NULL, 1067, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (200, 38, 9, NULL, NULL, NULL, NULL, NULL, N'438249', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (201, 38, 10, NULL, NULL, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (202, 39, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/pqnlb42z/18531854019_351c579559_h.jpg","crops":null}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (203, 39, 7, NULL, NULL, 1600, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (204, 39, 8, NULL, NULL, 1067, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (205, 39, 9, NULL, NULL, NULL, NULL, NULL, N'324821', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (206, 39, 10, NULL, NULL, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (207, 40, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/ja2hllog/18095416144_44a566a5f4_h.jpg","crops":null}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (208, 40, 7, NULL, NULL, 1600, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (209, 40, 8, NULL, NULL, 1067, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (210, 40, 9, NULL, NULL, NULL, NULL, NULL, N'348162', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (211, 40, 10, NULL, NULL, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (212, 41, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/bn2fxjpy/18530280048_459b8b61b2_h.jpg","crops":null}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (213, 41, 7, NULL, NULL, 1600, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (214, 41, 8, NULL, NULL, 1067, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (215, 41, 9, NULL, NULL, NULL, NULL, NULL, N'240519', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (216, 41, 10, NULL, NULL, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (227, 1, 60, NULL, NULL, NULL, NULL, NULL, N'Umbraco Demo', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (228, 42, 60, NULL, NULL, NULL, NULL, NULL, N'Umbraco Demo', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (229, 1, 61, NULL, NULL, NULL, NULL, NULL, NULL, N'Moonfish, steelhead, lamprey southern flounder tadpole fish sculpin bigeye, blue-redstripe danio collared dogfish. Smalleye squaretail goldfish arowana butterflyfish pipefish wolf-herring jewel tetra, shiner; gibberfish red velvetfish. Thornyhead yellowfin pike threadsail ayu cutlassfish.')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (230, 42, 61, NULL, NULL, NULL, NULL, NULL, NULL, N'Moonfish, steelhead, lamprey southern flounder tadpole fish sculpin bigeye, blue-redstripe danio collared dogfish. Smalleye squaretail goldfish arowana butterflyfish pipefish wolf-herring jewel tetra, shiner; gibberfish red velvetfish. Thornyhead yellowfin pike threadsail ayu cutlassfish.')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (231, 1, 62, NULL, NULL, NULL, NULL, NULL, N'Check our products', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (232, 42, 62, NULL, NULL, NULL, NULL, NULL, N'Check our products', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (233, 1, 63, NULL, NULL, NULL, NULL, NULL, N'umb://document/ec4aafcc0c254f25a8fe705bfae1d324', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (234, 42, 63, NULL, NULL, NULL, NULL, NULL, N'umb://document/ec4aafcc0c254f25a8fe705bfae1d324', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (235, 1, 64, NULL, NULL, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Full Width",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media",
                "macro",
                "embed",
                "headline"
              ],
              "hasConfig": false,
              "controls": [
                {
                  "value": {
                    "macroAlias": "latestBlogposts",
                    "macroParamsDictionary": {
                      "numberOfPosts": "3",
                      "startNodeId": "umb://document/1d770f10d1ca4a269d68071e2c9f7ac1"
                    }
                  },
                  "editor": {
                    "name": "Macro",
                    "alias": "macro",
                    "view": "macro",
                    "render": null,
                    "icon": "icon-settings-alt",
                    "config": {}
                  },
                  "active": false
                }
              ]
            }
          ],
          "hasConfig": false,
          "id": "314cb47b-fbe1-eeb6-f7cc-38db875d0f06"
        }
      ]
    }
  ]
}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (236, 42, 64, NULL, NULL, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Full Width",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media",
                "macro",
                "embed",
                "headline"
              ],
              "hasConfig": false,
              "controls": [
                {
                  "value": {
                    "macroAlias": "latestBlogposts",
                    "macroParamsDictionary": {
                      "numberOfPosts": "3",
                      "startNodeId": "umb://document/1d770f10d1ca4a269d68071e2c9f7ac1"
                    }
                  },
                  "editor": {
                    "name": "Macro",
                    "alias": "macro",
                    "view": "macro",
                    "render": null,
                    "icon": "icon-settings-alt",
                    "config": {}
                  },
                  "active": false
                }
              ]
            }
          ],
          "hasConfig": false,
          "id": "314cb47b-fbe1-eeb6-f7cc-38db875d0f06"
        }
      ]
    }
  ]
}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (237, 1, 65, NULL, NULL, NULL, NULL, NULL, N'Umbraco Demo', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (238, 42, 65, NULL, NULL, NULL, NULL, NULL, N'Umbraco Demo', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (239, 1, 66, NULL, NULL, NULL, NULL, NULL, NULL, N'Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Vivamus suscipit tortor eget felis porttitor volutpat')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (240, 42, 66, NULL, NULL, NULL, NULL, NULL, NULL, N'Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Vivamus suscipit tortor eget felis porttitor volutpat')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (241, 1, 67, NULL, NULL, NULL, NULL, NULL, N'Read All on the Blog', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (242, 42, 67, NULL, NULL, NULL, NULL, NULL, N'Read All on the Blog', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (243, 1, 68, NULL, NULL, NULL, NULL, NULL, N'umb://document/1d770f10d1ca4a269d68071e2c9f7ac1', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (244, 42, 68, NULL, NULL, NULL, NULL, NULL, N'umb://document/1d770f10d1ca4a269d68071e2c9f7ac1', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (245, 1, 69, NULL, NULL, NULL, NULL, NULL, N'Umbraco HQ - Unicorn Square - Haubergsvej 1 - 5000 Odense C - Denmark - +45 70 26 11 62', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (246, 42, 69, NULL, NULL, NULL, NULL, NULL, N'Umbraco HQ - Unicorn Square - Haubergsvej 1 - 5000 Odense C - Denmark - +45 70 26 11 62', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (247, 1, 70, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://media/662af6ca411a4c93a6c722c4845698e7')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (248, 42, 70, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://media/662af6ca411a4c93a6c722c4845698e7')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (249, 1, 71, NULL, NULL, NULL, NULL, NULL, N'serif', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (250, 42, 71, NULL, NULL, NULL, NULL, NULL, N'serif', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (251, 1, 72, NULL, NULL, NULL, NULL, NULL, N'earth', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (252, 42, 72, NULL, NULL, NULL, NULL, NULL, N'earth', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (253, 1, 73, NULL, NULL, NULL, NULL, NULL, N'Umbraco Sample Site', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (254, 42, 73, NULL, NULL, NULL, NULL, NULL, N'Umbraco Sample Site', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (255, 2, 37, NULL, NULL, NULL, NULL, NULL, N'Our Gorgeous Selection', NULL)
GO
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (256, 43, 37, NULL, NULL, NULL, NULL, NULL, N'Our Gorgeous Selection', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (257, 2, 38, NULL, NULL, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "allowAll": true,
      "rows": []
    }
  ]
}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (258, 43, 38, NULL, NULL, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "allowAll": true,
      "rows": []
    }
  ]
}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (259, 2, 40, NULL, NULL, NULL, NULL, NULL, N'[]', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (260, 43, 40, NULL, NULL, NULL, NULL, NULL, N'[]', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (261, 2, 41, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (262, 43, 41, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (263, 2, 42, NULL, NULL, NULL, NULL, NULL, N'["€"]', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (264, 43, 42, NULL, NULL, NULL, NULL, NULL, N'["€"]', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (265, 2, 43, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://document/262beb7053a649b89e98cfde2e85a78e,umb://document/df1eb830411b4d41a3433917b76d533c,umb://document/4e96411ab8e1435f93222faee30ef5f2,umb://document/d390a562107d4f028df757aa86bad752,umb://document/bb7d5ae007ac40b8b5b918c36947fb56,umb://document/202cdc2f1a4540f4a653a7b321e1c54c,umb://document/103171c8e11c40029bb2f3404cada22a,umb://document/061662b9b02a4dcfaf5992b603e8e3e1')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (266, 43, 43, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://document/262beb7053a649b89e98cfde2e85a78e,umb://document/df1eb830411b4d41a3433917b76d533c,umb://document/4e96411ab8e1435f93222faee30ef5f2,umb://document/d390a562107d4f028df757aa86bad752,umb://document/bb7d5ae007ac40b8b5b918c36947fb56,umb://document/202cdc2f1a4540f4a653a7b321e1c54c,umb://document/103171c8e11c40029bb2f3404cada22a,umb://document/061662b9b02a4dcfaf5992b603e8e3e1')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (267, 3, 44, NULL, NULL, NULL, NULL, NULL, N'Tattoo', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (268, 44, 44, NULL, NULL, NULL, NULL, NULL, N'Tattoo', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (269, 3, 45, NULL, NULL, NULL, CAST(499.000000 AS Decimal(38, 6)), NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (270, 44, 45, NULL, NULL, NULL, CAST(499.000000 AS Decimal(38, 6)), NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (271, 3, 46, NULL, NULL, NULL, NULL, NULL, N'tattoo,dedication', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (272, 44, 46, NULL, NULL, NULL, NULL, NULL, N'tattoo,dedication', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (273, 3, 47, NULL, NULL, NULL, NULL, NULL, NULL, N'Cras ultricies ligula sed magna dictum porta.')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (274, 44, 47, NULL, NULL, NULL, NULL, NULL, NULL, N'Cras ultricies ligula sed magna dictum porta.')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (275, 3, 48, NULL, NULL, NULL, NULL, NULL, N'UMB-TATTOO', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (276, 44, 48, NULL, NULL, NULL, NULL, NULL, N'UMB-TATTOO', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (277, 3, 49, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://media/20e3a8ffad1b4fe9b48cb8461c46d2d0')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (278, 44, 49, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://media/20e3a8ffad1b4fe9b48cb8461c46d2d0')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (279, 3, 51, NULL, NULL, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "allowAll": true,
      "rows": []
    }
  ]
}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (280, 44, 51, NULL, NULL, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "allowAll": true,
      "rows": []
    }
  ]
}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (281, 4, 44, NULL, NULL, NULL, NULL, NULL, N'Unicorn', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (282, 45, 44, NULL, NULL, NULL, NULL, NULL, N'Unicorn', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (283, 4, 45, NULL, NULL, NULL, CAST(249.000000 AS Decimal(38, 6)), NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (284, 45, 45, NULL, NULL, NULL, CAST(249.000000 AS Decimal(38, 6)), NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (285, 4, 46, NULL, NULL, NULL, NULL, NULL, N'animals', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (286, 45, 46, NULL, NULL, NULL, NULL, NULL, N'animals', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (287, 4, 47, NULL, NULL, NULL, NULL, NULL, NULL, N'Quisque velit nisi, pretium ut lacinia in, elementum id enim. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Cras ultricies ligula sed magna dictum porta.')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (288, 45, 47, NULL, NULL, NULL, NULL, NULL, NULL, N'Quisque velit nisi, pretium ut lacinia in, elementum id enim. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Cras ultricies ligula sed magna dictum porta.')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (289, 4, 48, NULL, NULL, NULL, NULL, NULL, N'UMB-UNICORN', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (290, 45, 48, NULL, NULL, NULL, NULL, NULL, N'UMB-UNICORN', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (291, 4, 49, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://media/1bc5280b8658402789d958e2576e469b')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (292, 45, 49, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://media/1bc5280b8658402789d958e2576e469b')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (293, 4, 51, NULL, NULL, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "allowAll": true,
      "rows": []
    }
  ]
}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (294, 45, 51, NULL, NULL, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "allowAll": true,
      "rows": []
    }
  ]
}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (295, 5, 44, NULL, NULL, NULL, NULL, NULL, N'Ping Pong Ball', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (296, 46, 44, NULL, NULL, NULL, NULL, NULL, N'Ping Pong Ball', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (297, 5, 45, NULL, NULL, NULL, CAST(2.000000 AS Decimal(38, 6)), NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (298, 46, 45, NULL, NULL, NULL, CAST(2.000000 AS Decimal(38, 6)), NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (299, 5, 46, NULL, NULL, NULL, NULL, NULL, N'sports,bingo', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (300, 46, 46, NULL, NULL, NULL, NULL, NULL, N'sports,bingo', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (301, 5, 47, NULL, NULL, NULL, NULL, NULL, NULL, N'Vivamus suscipit tortor eget felis porttitor volutpat. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Cras ultricies ligula sed magna dictum porta.')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (302, 46, 47, NULL, NULL, NULL, NULL, NULL, NULL, N'Vivamus suscipit tortor eget felis porttitor volutpat. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Cras ultricies ligula sed magna dictum porta.')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (303, 5, 48, NULL, NULL, NULL, NULL, NULL, N'UMB-PINGPONG', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (304, 46, 48, NULL, NULL, NULL, NULL, NULL, N'UMB-PINGPONG', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (305, 5, 49, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://media/c09ec77f08e3466aac58c979befd3cd6')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (306, 46, 49, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://media/c09ec77f08e3466aac58c979befd3cd6')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (307, 5, 51, NULL, NULL, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "allowAll": true,
      "rows": []
    }
  ]
}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (308, 46, 51, NULL, NULL, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "allowAll": true,
      "rows": []
    }
  ]
}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (309, 6, 44, NULL, NULL, NULL, NULL, NULL, N'Bowling Ball', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (310, 47, 44, NULL, NULL, NULL, NULL, NULL, N'Bowling Ball', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (311, 6, 45, NULL, NULL, NULL, CAST(899.000000 AS Decimal(38, 6)), NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (312, 47, 45, NULL, NULL, NULL, CAST(899.000000 AS Decimal(38, 6)), NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (313, 6, 46, NULL, NULL, NULL, NULL, NULL, N'sports,bingo', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (314, 47, 46, NULL, NULL, NULL, NULL, NULL, N'sports,bingo', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (315, 6, 47, NULL, NULL, NULL, NULL, NULL, NULL, N'Cras ultricies ligula sed magna dictum porta.')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (316, 47, 47, NULL, NULL, NULL, NULL, NULL, NULL, N'Cras ultricies ligula sed magna dictum porta.')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (317, 6, 48, NULL, NULL, NULL, NULL, NULL, N'UMB-BOWLING', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (318, 47, 48, NULL, NULL, NULL, NULL, NULL, N'UMB-BOWLING', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (319, 6, 49, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://media/b76ddb4ee603401499066087984740ec')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (320, 47, 49, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://media/b76ddb4ee603401499066087984740ec')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (321, 6, 51, NULL, NULL, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "allowAll": true,
      "rows": []
    }
  ]
}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (322, 47, 51, NULL, NULL, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "allowAll": true,
      "rows": []
    }
  ]
}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (323, 7, 44, NULL, NULL, NULL, NULL, NULL, N'Jumpsuit', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (324, 48, 44, NULL, NULL, NULL, NULL, NULL, N'Jumpsuit', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (325, 7, 45, NULL, NULL, NULL, CAST(89.000000 AS Decimal(38, 6)), NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (326, 48, 45, NULL, NULL, NULL, CAST(89.000000 AS Decimal(38, 6)), NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (327, 7, 46, NULL, NULL, NULL, NULL, NULL, N'fashion,bingo', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (328, 48, 46, NULL, NULL, NULL, NULL, NULL, N'fashion,bingo', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (329, 7, 47, NULL, NULL, NULL, NULL, NULL, NULL, N'Proin eget tortor risus. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Quisque velit nisi, pretium ut lacinia in, elementum id enim. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Cras ultricies ligula sed magna dictum porta.')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (330, 48, 47, NULL, NULL, NULL, NULL, NULL, NULL, N'Proin eget tortor risus. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Quisque velit nisi, pretium ut lacinia in, elementum id enim. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Cras ultricies ligula sed magna dictum porta.')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (331, 7, 48, NULL, NULL, NULL, NULL, NULL, N'UMB-JUMPSUIT', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (332, 48, 48, NULL, NULL, NULL, NULL, NULL, N'UMB-JUMPSUIT', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (333, 7, 49, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://media/46a025d6095a4b148b961b59ca4e951c')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (334, 48, 49, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://media/46a025d6095a4b148b961b59ca4e951c')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (335, 7, 51, NULL, NULL, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "allowAll": true,
      "rows": []
    }
  ]
}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (336, 48, 51, NULL, NULL, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "allowAll": true,
      "rows": []
    }
  ]
}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (337, 8, 44, NULL, NULL, NULL, NULL, NULL, N'Banjo', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (338, 49, 44, NULL, NULL, NULL, NULL, NULL, N'Banjo', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (339, 8, 45, NULL, NULL, NULL, CAST(399.000000 AS Decimal(38, 6)), NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (340, 49, 45, NULL, NULL, NULL, CAST(399.000000 AS Decimal(38, 6)), NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (341, 8, 46, NULL, NULL, NULL, NULL, NULL, N'bingo,music', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (342, 49, 46, NULL, NULL, NULL, NULL, NULL, N'bingo,music', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (343, 8, 47, NULL, NULL, NULL, NULL, NULL, NULL, N'Vivamus suscipit tortor eget felis porttitor volutpat. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula. Proin eget tortor risus.')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (344, 49, 47, NULL, NULL, NULL, NULL, NULL, NULL, N'Vivamus suscipit tortor eget felis porttitor volutpat. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula. Proin eget tortor risus.')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (345, 8, 48, NULL, NULL, NULL, NULL, NULL, N'UMB-BANJO', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (346, 49, 48, NULL, NULL, NULL, NULL, NULL, N'UMB-BANJO', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (347, 8, 49, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://media/17552d12081d4d01b68132c495d6576f')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (348, 49, 49, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://media/17552d12081d4d01b68132c495d6576f')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (349, 8, 51, NULL, NULL, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "allowAll": true,
      "rows": []
    }
  ]
}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (350, 49, 51, NULL, NULL, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "allowAll": true,
      "rows": []
    }
  ]
}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (351, 9, 44, NULL, NULL, NULL, NULL, NULL, N'Knitted Unicorn West', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (352, 50, 44, NULL, NULL, NULL, NULL, NULL, N'Knitted Unicorn West', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (353, 9, 45, NULL, NULL, NULL, CAST(1899.000000 AS Decimal(38, 6)), NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (354, 50, 45, NULL, NULL, NULL, CAST(1899.000000 AS Decimal(38, 6)), NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (355, 9, 46, NULL, NULL, NULL, NULL, NULL, N'bingo,fashion', NULL)
GO
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (356, 50, 46, NULL, NULL, NULL, NULL, NULL, N'bingo,fashion', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (357, 9, 47, NULL, NULL, NULL, NULL, NULL, NULL, N'Knitted Unicorn West')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (358, 50, 47, NULL, NULL, NULL, NULL, NULL, NULL, N'Knitted Unicorn West')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (359, 9, 48, NULL, NULL, NULL, NULL, NULL, N'UMB-WEST', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (360, 50, 48, NULL, NULL, NULL, NULL, NULL, N'UMB-WEST', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (361, 9, 49, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://media/1d0b713a022a49c8b842a2463c83a553')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (362, 50, 49, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://media/1d0b713a022a49c8b842a2463c83a553')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (363, 9, 51, NULL, NULL, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "allowAll": true,
      "rows": []
    }
  ]
}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (364, 50, 51, NULL, NULL, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "allowAll": true,
      "rows": []
    }
  ]
}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (365, 10, 44, NULL, NULL, NULL, NULL, NULL, N'Biker Jacket', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (366, 51, 44, NULL, NULL, NULL, NULL, NULL, N'Biker Jacket', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (367, 10, 45, NULL, NULL, NULL, CAST(199.000000 AS Decimal(38, 6)), NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (368, 51, 45, NULL, NULL, NULL, CAST(199.000000 AS Decimal(38, 6)), NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (369, 10, 46, NULL, NULL, NULL, NULL, NULL, N'bingo,clothing', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (370, 51, 46, NULL, NULL, NULL, NULL, NULL, N'bingo,clothing', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (371, 10, 47, NULL, NULL, NULL, NULL, NULL, NULL, N'Donec rutrum congue leo eget malesuada. Vivamus suscipit tortor eget felis porttitor volutpat.')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (372, 51, 47, NULL, NULL, NULL, NULL, NULL, NULL, N'Donec rutrum congue leo eget malesuada. Vivamus suscipit tortor eget felis porttitor volutpat.')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (373, 10, 48, NULL, NULL, NULL, NULL, NULL, N'UMB-BIKER-JACKET', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (374, 51, 48, NULL, NULL, NULL, NULL, NULL, N'UMB-BIKER-JACKET', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (375, 10, 49, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://media/55514845b8bd487cb3709724852fd6bb')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (376, 51, 49, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://media/55514845b8bd487cb3709724852fd6bb')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (377, 10, 50, NULL, NULL, NULL, NULL, NULL, NULL, N'[{"key":"6a47c043-7699-49c6-a0ed-b335b135ea2b","name":"Free shipping","ncContentTypeAlias":"feature","featureName":"Free shipping","featureDetails":"Isn''t that awesome - you only pay for the product"},{"key":"075c935f-4987-4a46-bed9-3286c27f0121","name":"1 Day return policy","ncContentTypeAlias":"feature","featureName":"1 Day return policy","featureDetails":"You''ll need to make up your mind fast"},{"key":"457e0ee3-c066-46fa-b379-a083b38aaa20","name":"100 Years warranty","ncContentTypeAlias":"feature","featureName":"100 Years warranty","featureDetails":"But if you''re satisfied it''ll last a lifetime"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (378, 51, 50, NULL, NULL, NULL, NULL, NULL, NULL, N'[{"key":"6a47c043-7699-49c6-a0ed-b335b135ea2b","name":"Free shipping","ncContentTypeAlias":"feature","featureName":"Free shipping","featureDetails":"Isn''t that awesome - you only pay for the product"},{"key":"075c935f-4987-4a46-bed9-3286c27f0121","name":"1 Day return policy","ncContentTypeAlias":"feature","featureName":"1 Day return policy","featureDetails":"You''ll need to make up your mind fast"},{"key":"457e0ee3-c066-46fa-b379-a083b38aaa20","name":"100 Years warranty","ncContentTypeAlias":"feature","featureName":"100 Years warranty","featureDetails":"But if you''re satisfied it''ll last a lifetime"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (379, 10, 51, NULL, NULL, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "allowAll": true,
      "rows": []
    }
  ]
}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (380, 51, 51, NULL, NULL, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "allowAll": true,
      "rows": []
    }
  ]
}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (381, 11, 40, NULL, NULL, NULL, NULL, NULL, N'[]', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (382, 52, 40, NULL, NULL, NULL, NULL, NULL, N'[]', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (383, 11, 41, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (384, 52, 41, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (385, 11, 37, NULL, NULL, NULL, NULL, NULL, N'Nice crazy people', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (386, 52, 37, NULL, NULL, NULL, NULL, NULL, N'Nice crazy people', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (387, 11, 38, NULL, NULL, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "allowAll": true,
      "rows": []
    }
  ]
}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (388, 52, 38, NULL, NULL, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "allowAll": true,
      "rows": []
    }
  ]
}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (389, 12, 40, NULL, NULL, NULL, NULL, NULL, N'[]', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (390, 53, 40, NULL, NULL, NULL, NULL, NULL, N'[]', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (391, 12, 41, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (392, 53, 41, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (393, 12, 52, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://media/cf1ab8dcad0f4a8e974b87b84777b0d6')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (394, 53, 52, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://media/cf1ab8dcad0f4a8e974b87b84777b0d6')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (395, 12, 53, NULL, NULL, NULL, NULL, NULL, N'mvp,Denmark', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (396, 53, 53, NULL, NULL, NULL, NULL, NULL, N'mvp,Denmark', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (397, 13, 40, NULL, NULL, NULL, NULL, NULL, N'[]', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (398, 54, 40, NULL, NULL, NULL, NULL, NULL, N'[]', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (399, 13, 41, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (400, 54, 41, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (401, 13, 52, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://media/eee91c05b2e84031a056dcd7f28eff89')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (402, 54, 52, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://media/eee91c05b2e84031a056dcd7f28eff89')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (403, 13, 53, NULL, NULL, NULL, NULL, NULL, N'United Kingdom,mvp', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (404, 54, 53, NULL, NULL, NULL, NULL, NULL, N'United Kingdom,mvp', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (405, 13, 55, NULL, NULL, NULL, NULL, NULL, N'mattbrailsford', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (406, 54, 55, NULL, NULL, NULL, NULL, NULL, N'mattbrailsford', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (407, 13, 58, NULL, NULL, NULL, NULL, NULL, N'circuitbeard', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (408, 54, 58, NULL, NULL, NULL, NULL, NULL, N'circuitbeard', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (409, 14, 40, NULL, NULL, NULL, NULL, NULL, N'[]', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (410, 55, 40, NULL, NULL, NULL, NULL, NULL, N'[]', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (411, 14, 41, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (412, 55, 41, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (413, 14, 52, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://media/fa763e0d0ceb408c8720365d57e06e32')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (414, 55, 52, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://media/fa763e0d0ceb408c8720365d57e06e32')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (415, 14, 53, NULL, NULL, NULL, NULL, NULL, N'United Kingdom,mvp', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (416, 55, 53, NULL, NULL, NULL, NULL, NULL, N'United Kingdom,mvp', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (417, 15, 40, NULL, NULL, NULL, NULL, NULL, N'[]', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (418, 56, 40, NULL, NULL, NULL, NULL, NULL, N'[]', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (419, 15, 41, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (420, 56, 41, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (421, 15, 52, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://media/c0969cab13ab4de9819a848619ac2b5d')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (422, 56, 52, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://media/c0969cab13ab4de9819a848619ac2b5d')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (423, 15, 53, NULL, NULL, NULL, NULL, NULL, N'United Kingdom,mvp', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (424, 56, 53, NULL, NULL, NULL, NULL, NULL, N'United Kingdom,mvp', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (425, 16, 40, NULL, NULL, NULL, NULL, NULL, N'[]', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (426, 57, 40, NULL, NULL, NULL, NULL, NULL, N'[]', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (427, 16, 41, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (428, 57, 41, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (429, 16, 52, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://media/34371d0892c84015912ebaacd002c5d0')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (430, 57, 52, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://media/34371d0892c84015912ebaacd002c5d0')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (431, 16, 53, NULL, NULL, NULL, NULL, NULL, N'Netherlands,mvp', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (432, 57, 53, NULL, NULL, NULL, NULL, NULL, N'Netherlands,mvp', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (433, 17, 37, NULL, NULL, NULL, NULL, NULL, N'About Us', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (434, 58, 37, NULL, NULL, NULL, NULL, NULL, N'About Us', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (435, 17, 38, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"FullWidth","id":"f10995f1-918d-3e50-e50d-8c41bbe297ce","areas":[{"grid":"12","controls":[{"value":"Oooh la la","editor":{"alias":"headline","view":"textstring"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null},{"name":"Article","id":"4d6e2221-e2d9-95bc-8ceb-624bc8df8e3f","areas":[{"grid":"4","controls":[{"value":{"udi":"umb://media/c0969cab13ab4de9819a848619ac2b5d","image":"/media/ja2hllog/18095416144_44a566a5f4_h.jpg"},"editor":{"alias":"media","view":"media"},"styles":null,"config":null}],"styles":null,"config":null},{"grid":"8","controls":[{"value":"<p>Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Curabitur aliquet quam id dui posuere blandit. Vivamus suscipit tortor eget felis porttitor volutpat. Proin eget tortor risus. Sed porttitor lectus nibh. Cras ultricies ligula sed magna dictum porta. Pellentesque in ipsum id orci porta dapibus. Pellentesque in ipsum id orci porta dapibus. Nulla porttitor accumsan tincidunt. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a.</p>\n<p>Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Curabitur aliquet quam id dui posuere blandit. Vivamus suscipit tortor eget felis porttitor volutpat. Proin eget tortor risus. Sed porttitor lectus nibh. Cras ultricies ligula sed magna dictum porta. Pellentesque in ipsum id orci porta dapibus. Pellentesque in ipsum id orci porta dapibus. Nulla porttitor accumsan tincidunt. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a.</p>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null},{"value":"<iframe width=\"360\" height=\"203\" src=\"https://www.youtube.com/embed/HPgKSCp_Y_U?feature=oembed\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>","editor":{"alias":"embed","view":"embed"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (436, 58, 38, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"FullWidth","id":"f10995f1-918d-3e50-e50d-8c41bbe297ce","areas":[{"grid":"12","controls":[{"value":"Oooh la la","editor":{"alias":"headline","view":"textstring"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null},{"name":"Article","id":"4d6e2221-e2d9-95bc-8ceb-624bc8df8e3f","areas":[{"grid":"4","controls":[{"value":{"udi":"umb://media/c0969cab13ab4de9819a848619ac2b5d","image":"/media/ja2hllog/18095416144_44a566a5f4_h.jpg"},"editor":{"alias":"media","view":"media"},"styles":null,"config":null}],"styles":null,"config":null},{"grid":"8","controls":[{"value":"<p>Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Curabitur aliquet quam id dui posuere blandit. Vivamus suscipit tortor eget felis porttitor volutpat. Proin eget tortor risus. Sed porttitor lectus nibh. Cras ultricies ligula sed magna dictum porta. Pellentesque in ipsum id orci porta dapibus. Pellentesque in ipsum id orci porta dapibus. Nulla porttitor accumsan tincidunt. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a.</p>\n<p>Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Curabitur aliquet quam id dui posuere blandit. Vivamus suscipit tortor eget felis porttitor volutpat. Proin eget tortor risus. Sed porttitor lectus nibh. Cras ultricies ligula sed magna dictum porta. Pellentesque in ipsum id orci porta dapibus. Pellentesque in ipsum id orci porta dapibus. Nulla porttitor accumsan tincidunt. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a.</p>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null},{"value":"<iframe width=\"360\" height=\"203\" src=\"https://www.youtube.com/embed/HPgKSCp_Y_U?feature=oembed\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>","editor":{"alias":"embed","view":"embed"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (437, 17, 40, NULL, NULL, NULL, NULL, NULL, N'[]', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (438, 58, 40, NULL, NULL, NULL, NULL, NULL, N'[]', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (439, 17, 41, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (440, 58, 41, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (441, 18, 37, NULL, NULL, NULL, NULL, NULL, N'About this Starter Kit', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (442, 59, 37, NULL, NULL, NULL, NULL, NULL, N'About this Starter Kit', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (443, 18, 38, NULL, NULL, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "allowAll": true,      
      "rows": []
    }
  ]
}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (444, 59, 38, NULL, NULL, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "allowAll": true,      
      "rows": []
    }
  ]
}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (445, 18, 40, NULL, NULL, NULL, NULL, NULL, N'[]', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (446, 59, 40, NULL, NULL, NULL, NULL, NULL, N'[]', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (447, 18, 41, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (448, 59, 41, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (449, 19, 37, NULL, NULL, NULL, NULL, NULL, N'Things to improve', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (450, 60, 37, NULL, NULL, NULL, NULL, NULL, N'Things to improve', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (451, 19, 38, NULL, NULL, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "allowAll": true,
      "rows": [
        {
          "label": "",
          "name": "Full Width",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "hasConfig": false,
              "controls": [
                {
                  "value": "<p>Here''s what could be improved in the Starter Kit so far:</p>\n<p> </p>\n<p>For v1:</p>\n<ul>\n<li>Use a custom grid editor for testimonials</li>\n<li>Integrated Analytics on pages</li>\n<li>Call To Action Button in the grid (with \"Tag Manager\" integration)</li>\n<li>Macro for fetching products (with friendly grid preview)</li>\n<li>Design Review (polish)</li>\n<li>Verify licenses of photos (Niels)</li>\n</ul>\n<p>For vNext</p>\n<ul>\n<li><span style=\"text-decoration: line-through;\">Swap text with uploaded logo</span></li>\n<li>Nicer pickers of products and employees</li>\n<li>Custom Listview for products and employees</li>\n<li>Discus template on blog posts</li>\n<li>404 template</li>\n<li>Member Login/Register/Profile/Forgot password</li>\n<li>Update default styling of grid header</li>\n<li>On a Blog post -&gt; Share/Social (tweet this / facebook this)</li>\n</ul>",
                  "editor": {
                    "alias": "rte"
                  },
                  "active": true,
                }
              ],
              "active": true,
              "hasActiveChild": true
            }
          ],
          "hasConfig": false,
          "id": "5ea1e364-8406-e5e6-a82c-45985fd6054e",
          "hasActiveChild": true,
          "active": true
        }
      ]
    }
  ]
}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (452, 60, 38, NULL, NULL, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "allowAll": true,
      "rows": [
        {
          "label": "",
          "name": "Full Width",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "hasConfig": false,
              "controls": [
                {
                  "value": "<p>Here''s what could be improved in the Starter Kit so far:</p>\n<p> </p>\n<p>For v1:</p>\n<ul>\n<li>Use a custom grid editor for testimonials</li>\n<li>Integrated Analytics on pages</li>\n<li>Call To Action Button in the grid (with \"Tag Manager\" integration)</li>\n<li>Macro for fetching products (with friendly grid preview)</li>\n<li>Design Review (polish)</li>\n<li>Verify licenses of photos (Niels)</li>\n</ul>\n<p>For vNext</p>\n<ul>\n<li><span style=\"text-decoration: line-through;\">Swap text with uploaded logo</span></li>\n<li>Nicer pickers of products and employees</li>\n<li>Custom Listview for products and employees</li>\n<li>Discus template on blog posts</li>\n<li>404 template</li>\n<li>Member Login/Register/Profile/Forgot password</li>\n<li>Update default styling of grid header</li>\n<li>On a Blog post -&gt; Share/Social (tweet this / facebook this)</li>\n</ul>",
                  "editor": {
                    "alias": "rte"
                  },
                  "active": true,
                }
              ],
              "active": true,
              "hasActiveChild": true
            }
          ],
          "hasConfig": false,
          "id": "5ea1e364-8406-e5e6-a82c-45985fd6054e",
          "hasActiveChild": true,
          "active": true
        }
      ]
    }
  ]
}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (453, 19, 40, NULL, NULL, NULL, NULL, NULL, N'[]', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (454, 60, 40, NULL, NULL, NULL, NULL, NULL, N'[]', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (455, 19, 41, NULL, NULL, 0, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (456, 60, 41, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (457, 20, 40, NULL, NULL, NULL, NULL, NULL, N'[]', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (458, 61, 40, NULL, NULL, NULL, NULL, NULL, N'[]', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (459, 20, 41, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (460, 61, 41, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (461, 20, 37, NULL, NULL, NULL, NULL, NULL, N'Behind The Scenes', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (462, 61, 37, NULL, NULL, NULL, NULL, NULL, N'Behind The Scenes', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (463, 20, 38, NULL, NULL, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "allowAll": true,
      "rows": []
    }
  ]
}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (464, 61, 38, NULL, NULL, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "allowAll": true,
      "rows": []
    }
  ]
}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (465, 20, 87, NULL, NULL, NULL, NULL, NULL, N'2', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (466, 61, 87, NULL, NULL, NULL, NULL, NULL, N'2', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (467, 21, 40, NULL, NULL, NULL, NULL, NULL, N'[]', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (468, 62, 40, NULL, NULL, NULL, NULL, NULL, N'[]', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (469, 21, 41, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (470, 62, 41, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (471, 21, 83, NULL, NULL, NULL, NULL, NULL, N'My Blog Post', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (472, 62, 83, NULL, NULL, NULL, NULL, NULL, N'My Blog Post', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (473, 21, 84, NULL, NULL, NULL, NULL, NULL, N'["demo","umbraco","starter kit"]', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (474, 62, 84, NULL, NULL, NULL, NULL, NULL, N'["demo","umbraco","starter kit"]', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (475, 21, 85, NULL, NULL, NULL, NULL, NULL, NULL, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla quis lorem ut libero malesuada feugiat. Donec rutrum congue leo eget malesuada. Donec rutrum congue leo eget malesuada.')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (476, 62, 85, NULL, NULL, NULL, NULL, NULL, NULL, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla quis lorem ut libero malesuada feugiat. Donec rutrum congue leo eget malesuada. Donec rutrum congue leo eget malesuada.')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (477, 21, 86, NULL, NULL, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "allowAll": true,
      "rows": [
        {
          "label": "",
          "name": "Full Width",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "hasConfig": false,
              "controls": [
                {
                  "value": "<p>Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Donec sollicitudin molestie malesuada. Vivamus suscipit tortor eget felis porttitor volutpat. Sed porttitor lectus nibh. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Donec sollicitudin molestie malesuada.</p>\n<p>Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Donec sollicitudin molestie malesuada. Vivamus suscipit tortor eget felis porttitor volutpat. Sed porttitor lectus nibh. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Donec sollicitudin molestie malesuada.</p>\n<p>Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Donec sollicitudin molestie malesuada. Vivamus suscipit tortor eget felis porttitor volutpat. Sed porttitor lectus nibh. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Donec sollicitudin molestie malesuada.</p>",
                  "editor": {
                    "alias": "rte"
                  },
                  "active": true,
                }
              ],
              "active": true
            }
          ],
          "hasConfig": false,
          "id": "1f96a69f-0cb9-4a00-6a76-f8cec30befec",
          "hasActiveChild": true,
          "active": true
        }
      ]
    }
  ]
}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (478, 62, 86, NULL, NULL, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "allowAll": true,
      "rows": [
        {
          "label": "",
          "name": "Full Width",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "hasConfig": false,
              "controls": [
                {
                  "value": "<p>Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Donec sollicitudin molestie malesuada. Vivamus suscipit tortor eget felis porttitor volutpat. Sed porttitor lectus nibh. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Donec sollicitudin molestie malesuada.</p>\n<p>Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Donec sollicitudin molestie malesuada. Vivamus suscipit tortor eget felis porttitor volutpat. Sed porttitor lectus nibh. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Donec sollicitudin molestie malesuada.</p>\n<p>Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Donec sollicitudin molestie malesuada. Vivamus suscipit tortor eget felis porttitor volutpat. Sed porttitor lectus nibh. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Donec sollicitudin molestie malesuada.</p>",
                  "editor": {
                    "alias": "rte"
                  },
                  "active": true,
                }
              ],
              "active": true
            }
          ],
          "hasConfig": false,
          "id": "1f96a69f-0cb9-4a00-6a76-f8cec30befec",
          "hasActiveChild": true,
          "active": true
        }
      ]
    }
  ]
}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (479, 22, 40, NULL, NULL, NULL, NULL, NULL, N'[]', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (480, 63, 40, NULL, NULL, NULL, NULL, NULL, N'[]', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (481, 22, 41, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (482, 63, 41, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (483, 22, 83, NULL, NULL, NULL, NULL, NULL, N'Now it gets exciting', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (484, 63, 83, NULL, NULL, NULL, NULL, NULL, N'Now it gets exciting', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (485, 22, 84, NULL, NULL, NULL, NULL, NULL, N'["cg16","codegarden","umbraco"]', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (486, 63, 84, NULL, NULL, NULL, NULL, NULL, N'["cg16","codegarden","umbraco"]', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (487, 22, 85, NULL, NULL, NULL, NULL, NULL, NULL, N'Donec sollicitudin molestie malesuada. Vivamus suscipit tortor eget felis porttitor volutpat. Sed porttitor lectus nibh.')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (488, 63, 85, NULL, NULL, NULL, NULL, NULL, NULL, N'Donec sollicitudin molestie malesuada. Vivamus suscipit tortor eget felis porttitor volutpat. Sed porttitor lectus nibh.')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (489, 22, 86, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Article","id":"011e74f2-b4de-0e4e-1cb9-23b2356b1213","areas":[{"grid":"4","controls":[{"value":{"udi":"umb://media/55514845b8bd487cb3709724852fd6bb","image":"/media/cp3jdwxe/4730684907_8a7f8759cb_b.jpg"},"editor":{"alias":"media","view":null},"styles":null,"config":null}],"styles":null,"config":null},{"grid":"8","controls":[{"value":"<p>Donec sollicitudin molestie malesuada. Proin eget tortor risus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Nulla porttitor accumsan tincidunt. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Nulla porttitor accumsan tincidunt. Donec rutrum congue leo eget malesuada.</p>\n<p>Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula. Pellentesque in ipsum id orci porta dapibus. Donec rutrum congue leo eget malesuada. Nulla porttitor accumsan tincidunt. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Proin eget tortor risus. Pellentesque in ipsum id orci porta dapibus. Proin eget tortor risus. Sed porttitor lectus nibh.</p>\n<p>Pellentesque in ipsum id orci porta dapibus. Curabitur aliquet quam id dui posuere blandit. Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Donec rutrum congue leo eget malesuada. Donec rutrum congue leo eget malesuada. Sed porttitor lectus nibh. Nulla quis lorem ut libero malesuada feugiat.</p>","editor":{"alias":"rte","view":null},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (490, 63, 86, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Article","id":"011e74f2-b4de-0e4e-1cb9-23b2356b1213","areas":[{"grid":"4","controls":[{"value":{"udi":"umb://media/55514845b8bd487cb3709724852fd6bb","image":"/media/cp3jdwxe/4730684907_8a7f8759cb_b.jpg"},"editor":{"alias":"media","view":null},"styles":null,"config":null}],"styles":null,"config":null},{"grid":"8","controls":[{"value":"<p>Donec sollicitudin molestie malesuada. Proin eget tortor risus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Nulla porttitor accumsan tincidunt. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Nulla porttitor accumsan tincidunt. Donec rutrum congue leo eget malesuada.</p>\n<p>Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula. Pellentesque in ipsum id orci porta dapibus. Donec rutrum congue leo eget malesuada. Nulla porttitor accumsan tincidunt. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Proin eget tortor risus. Pellentesque in ipsum id orci porta dapibus. Proin eget tortor risus. Sed porttitor lectus nibh.</p>\n<p>Pellentesque in ipsum id orci porta dapibus. Curabitur aliquet quam id dui posuere blandit. Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Donec rutrum congue leo eget malesuada. Donec rutrum congue leo eget malesuada. Sed porttitor lectus nibh. Nulla quis lorem ut libero malesuada feugiat.</p>","editor":{"alias":"rte","view":null},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (491, 23, 40, NULL, NULL, NULL, NULL, NULL, N'[]', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (492, 64, 40, NULL, NULL, NULL, NULL, NULL, N'[]', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (493, 23, 41, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (494, 64, 41, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (495, 23, 83, NULL, NULL, NULL, NULL, NULL, N'This will be great', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (496, 64, 83, NULL, NULL, NULL, NULL, NULL, N'This will be great', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (497, 23, 84, NULL, NULL, NULL, NULL, NULL, N'["great","umbraco"]', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (498, 64, 84, NULL, NULL, NULL, NULL, NULL, N'["great","umbraco"]', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (499, 23, 85, NULL, NULL, NULL, NULL, NULL, NULL, N'Proin eget tortor risus. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Vivamus magna justo, lacinia eget consectetur sed')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (500, 64, 85, NULL, NULL, NULL, NULL, NULL, NULL, N'Proin eget tortor risus. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Vivamus magna justo, lacinia eget consectetur sed')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (501, 23, 86, NULL, NULL, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "allowAll": true,
      "rows": [
        {
          "label": "",
          "name": "Full Width",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "hasConfig": false,
              "controls": [
                {
                  "value": "<p>Vivamus suscipit tortor eget felis porttitor volutpat. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Quisque velit nisi, pretium ut lacinia in, elementum id enim. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Proin eget tortor risus. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Donec rutrum congue leo eget malesuada. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula.</p>",
                  "editor": {
                    "alias": "rte"
                  },
                  "active": false,
                },
                {
                  "value": "",
                  "editor": {
                    "alias": "embed"
                  },
                  "active": false,
                },
                {
                  "value": "<p> </p>\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec sollicitudin molestie malesuada. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. Cras ultricies ligula sed magna dictum porta. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras ultricies ligula sed magna dictum porta. Pellentesque in ipsum id orci porta dapibus.</p>\n<p>Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Nulla quis lorem ut libero malesuada feugiat. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Sed porttitor lectus nibh. Vivamus suscipit tortor eget felis porttitor volutpat. Nulla porttitor accumsan tincidunt. Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Nulla porttitor accumsan tincidunt.</p>\n<p>Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Vivamus suscipit tortor eget felis porttitor volutpat. Sed porttitor lectus nibh. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Quisque velit nisi, pretium ut lacinia in, elementum id enim. Donec rutrum congue leo eget malesuada. Nulla porttitor accumsan tincidunt. Nulla quis lorem ut libero malesuada feugiat. Quisque velit nisi, pretium ut lacinia in, elementum id enim. Donec sollicitudin molestie malesuada.</p>\n<p>Proin eget tortor risus. Donec rutrum congue leo eget malesuada. Pellentesque in ipsum id orci porta dapibus. Donec rutrum congue leo eget malesuada. Nulla quis lorem ut libero malesuada feugiat. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Donec sollicitudin molestie malesuada. Vivamus suscipit tortor eget felis porttitor volutpat.</p>",
                  "editor": {
                    "alias": "rte"
                  },
                  "active": true,
                }
              ],
              "active": true,
              "hasActiveChild": true
            }
          ],
          "hasConfig": false,
          "id": "4820aba2-8d6b-4a7e-7f57-e0490a9b475e",
          "hasActiveChild": true,
          "active": true
        }
      ]
    }
  ]
}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (502, 64, 86, NULL, NULL, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "allowAll": true,
      "rows": [
        {
          "label": "",
          "name": "Full Width",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "hasConfig": false,
              "controls": [
                {
                  "value": "<p>Vivamus suscipit tortor eget felis porttitor volutpat. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Quisque velit nisi, pretium ut lacinia in, elementum id enim. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Proin eget tortor risus. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Donec rutrum congue leo eget malesuada. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula.</p>",
                  "editor": {
                    "alias": "rte"
                  },
                  "active": false,
                },
                {
                  "value": "",
                  "editor": {
                    "alias": "embed"
                  },
                  "active": false,
                },
                {
                  "value": "<p> </p>\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec sollicitudin molestie malesuada. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. Cras ultricies ligula sed magna dictum porta. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras ultricies ligula sed magna dictum porta. Pellentesque in ipsum id orci porta dapibus.</p>\n<p>Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Nulla quis lorem ut libero malesuada feugiat. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Sed porttitor lectus nibh. Vivamus suscipit tortor eget felis porttitor volutpat. Nulla porttitor accumsan tincidunt. Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Nulla porttitor accumsan tincidunt.</p>\n<p>Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Vivamus suscipit tortor eget felis porttitor volutpat. Sed porttitor lectus nibh. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Quisque velit nisi, pretium ut lacinia in, elementum id enim. Donec rutrum congue leo eget malesuada. Nulla porttitor accumsan tincidunt. Nulla quis lorem ut libero malesuada feugiat. Quisque velit nisi, pretium ut lacinia in, elementum id enim. Donec sollicitudin molestie malesuada.</p>\n<p>Proin eget tortor risus. Donec rutrum congue leo eget malesuada. Pellentesque in ipsum id orci porta dapibus. Donec rutrum congue leo eget malesuada. Nulla quis lorem ut libero malesuada feugiat. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Donec sollicitudin molestie malesuada. Vivamus suscipit tortor eget felis porttitor volutpat.</p>",
                  "editor": {
                    "alias": "rte"
                  },
                  "active": true,
                }
              ],
              "active": true,
              "hasActiveChild": true
            }
          ],
          "hasConfig": false,
          "id": "4820aba2-8d6b-4a7e-7f57-e0490a9b475e",
          "hasActiveChild": true,
          "active": true
        }
      ]
    }
  ]
}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (503, 24, 40, NULL, NULL, NULL, NULL, NULL, N'[]', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (504, 65, 40, NULL, NULL, NULL, NULL, NULL, N'[]', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (505, 24, 41, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (506, 65, 41, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (507, 24, 77, NULL, NULL, NULL, NULL, NULL, N'Let''s have a chat', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (508, 65, 77, NULL, NULL, NULL, NULL, NULL, N'Let''s have a chat', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (509, 24, 78, NULL, NULL, NULL, NULL, NULL, N'Send Us A Message', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (510, 65, 78, NULL, NULL, NULL, NULL, NULL, N'Send Us A Message', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (511, 24, 79, NULL, NULL, NULL, NULL, NULL, NULL, N'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam eget lacinia nisl. Aenean sollicitudin diam vitae enim ultrices, semper euismod magna efficitur.</p>')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (512, 65, 79, NULL, NULL, NULL, NULL, NULL, NULL, N'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam eget lacinia nisl. Aenean sollicitudin diam vitae enim ultrices, semper euismod magna efficitur.</p>')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (513, 24, 80, NULL, NULL, NULL, NULL, NULL, N'adf160f1-39f5-44c0-b01d-9e2da32bf093', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (514, 65, 80, NULL, NULL, NULL, NULL, NULL, N'adf160f1-39f5-44c0-b01d-9e2da32bf093', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (515, 24, 81, NULL, NULL, NULL, NULL, NULL, N'You''ll find us here', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (516, 65, 81, NULL, NULL, NULL, NULL, NULL, N'You''ll find us here', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (517, 24, 82, NULL, NULL, NULL, NULL, NULL, N'55.40622012982414,10.388404726982117,18', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (518, 65, 82, NULL, NULL, NULL, NULL, NULL, N'55.40622012982414,10.388404726982117,18', NULL)
SET IDENTITY_INSERT [dbo].[umbracoPropertyData] OFF
SET IDENTITY_INSERT [dbo].[umbracoRelation] ON 

INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (3, 1095, 1096, 5, CAST(N'2020-06-03T14:52:19.617' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (4, 1095, 1114, 5, CAST(N'2020-06-03T14:52:19.617' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (5, 1095, 1122, 4, CAST(N'2020-06-03T14:52:19.617' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (6, 1096, 1104, 5, CAST(N'2020-06-03T14:52:19.693' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (7, 1096, 1097, 5, CAST(N'2020-06-03T14:52:19.693' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (8, 1096, 1098, 5, CAST(N'2020-06-03T14:52:19.693' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (9, 1096, 1099, 5, CAST(N'2020-06-03T14:52:19.693' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (10, 1096, 1100, 5, CAST(N'2020-06-03T14:52:19.693' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (11, 1096, 1101, 5, CAST(N'2020-06-03T14:52:19.693' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (12, 1096, 1102, 5, CAST(N'2020-06-03T14:52:19.693' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (13, 1096, 1103, 5, CAST(N'2020-06-03T14:52:19.693' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (14, 1097, 1124, 4, CAST(N'2020-06-03T14:52:19.913' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (15, 1098, 1125, 4, CAST(N'2020-06-03T14:52:19.943' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (16, 1099, 1126, 4, CAST(N'2020-06-03T14:52:19.970' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (17, 1100, 1127, 4, CAST(N'2020-06-03T14:52:19.993' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (18, 1101, 1128, 4, CAST(N'2020-06-03T14:52:20.023' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (19, 1102, 1129, 4, CAST(N'2020-06-03T14:52:20.053' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (20, 1103, 1130, 4, CAST(N'2020-06-03T14:52:20.080' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (21, 1104, 1123, 4, CAST(N'2020-06-03T14:52:20.113' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (22, 1106, 1131, 4, CAST(N'2020-06-03T14:52:20.150' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (23, 1107, 1132, 4, CAST(N'2020-06-03T14:52:20.180' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (24, 1108, 1133, 4, CAST(N'2020-06-03T14:52:20.203' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (25, 1109, 1134, 4, CAST(N'2020-06-03T14:52:20.223' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (26, 1110, 1135, 4, CAST(N'2020-06-03T14:52:20.250' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (27, 1111, 1134, 4, CAST(N'2020-06-03T14:52:20.267' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (28, 1116, 1123, 4, CAST(N'2020-06-03T14:52:20.350' AS DateTime), N'')
SET IDENTITY_INSERT [dbo].[umbracoRelation] OFF
SET IDENTITY_INSERT [dbo].[umbracoRelationType] ON 

INSERT [dbo].[umbracoRelationType] ([id], [typeUniqueId], [dual], [parentObjectType], [childObjectType], [name], [alias]) VALUES (1, N'4cbeb612-e689-3563-b755-bf3ede295433', 1, N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', N'Relate Document On Copy', N'relateDocumentOnCopy')
INSERT [dbo].[umbracoRelationType] ([id], [typeUniqueId], [dual], [parentObjectType], [childObjectType], [name], [alias]) VALUES (2, N'0cc3507c-66ab-3091-8913-3d998148e423', 0, N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', N'Relate Parent Document On Delete', N'relateParentDocumentOnDelete')
INSERT [dbo].[umbracoRelationType] ([id], [typeUniqueId], [dual], [parentObjectType], [childObjectType], [name], [alias]) VALUES (3, N'8307994f-faf2-3844-bab9-72d34514edf2', 0, N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', N'Relate Parent Media Folder On Delete', N'relateParentMediaFolderOnDelete')
INSERT [dbo].[umbracoRelationType] ([id], [typeUniqueId], [dual], [parentObjectType], [childObjectType], [name], [alias]) VALUES (4, N'4954ce93-3bf9-3d1e-9cd2-21bf9f9c2abf', 0, NULL, NULL, N'Related Media', N'umbMedia')
INSERT [dbo].[umbracoRelationType] ([id], [typeUniqueId], [dual], [parentObjectType], [childObjectType], [name], [alias]) VALUES (5, N'0b93e414-5abe-36ec-a6bb-516e56f12238', 0, NULL, NULL, N'Related Document', N'umbDocument')
SET IDENTITY_INSERT [dbo].[umbracoRelationType] OFF
SET IDENTITY_INSERT [dbo].[umbracoServer] ON 

INSERT [dbo].[umbracoServer] ([id], [address], [computerName], [registeredDate], [lastNotifiedDate], [isActive], [isMaster]) VALUES (1, N'http://localhost/umbraco', N'DESKTOP-OAG5O3P//LM/W3SVC/2/ROOT', CAST(N'2020-06-03T14:52:54.633' AS DateTime), CAST(N'2020-06-07T14:23:22.200' AS DateTime), 1, 1)
SET IDENTITY_INSERT [dbo].[umbracoServer] OFF
SET IDENTITY_INSERT [dbo].[umbracoUser] ON 

INSERT [dbo].[umbracoUser] ([id], [userDisabled], [userNoConsole], [userName], [userLogin], [userPassword], [passwordConfig], [userEmail], [userLanguage], [securityStampToken], [failedLoginAttempts], [lastLockoutDate], [lastPasswordChangeDate], [lastLoginDate], [emailConfirmedDate], [invitedDate], [createDate], [updateDate], [avatar], [tourData]) VALUES (-1, 0, 0, N'apichai', N'apichairattana111@gmail.com', N'S+eT4ApDikRblhIhJMtW3g==c3yUveBqEKQ0TwsTL9RnuQbkA2uCX4YKfWrKUAdVgUU=', N'{"hashAlgorithm":"HMACSHA256"}', N'apichairattana111@gmail.com', N'en-US', N'97b13032-c8b2-4bf0-9ad0-8eea74aeb3b5', NULL, NULL, CAST(N'2020-06-03T14:52:06.073' AS DateTime), CAST(N'2020-06-07T13:27:19.180' AS DateTime), NULL, NULL, CAST(N'2020-06-03T14:52:05.237' AS DateTime), CAST(N'2020-06-07T13:27:19.197' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[umbracoUser] OFF
INSERT [dbo].[umbracoUser2UserGroup] ([userId], [userGroupId]) VALUES (-1, 1)
INSERT [dbo].[umbracoUser2UserGroup] ([userId], [userGroupId]) VALUES (-1, 5)
SET IDENTITY_INSERT [dbo].[umbracoUserGroup] ON 

INSERT [dbo].[umbracoUserGroup] ([id], [userGroupAlias], [userGroupName], [userGroupDefaultPermissions], [createDate], [updateDate], [icon], [startContentId], [startMediaId]) VALUES (1, N'admin', N'Administrators', N'CADMOSKTPIURZ:5F7ï', CAST(N'2020-06-03T14:52:05.680' AS DateTime), CAST(N'2020-06-03T14:52:05.680' AS DateTime), N'icon-medal', -1, -1)
INSERT [dbo].[umbracoUserGroup] ([id], [userGroupAlias], [userGroupName], [userGroupDefaultPermissions], [createDate], [updateDate], [icon], [startContentId], [startMediaId]) VALUES (2, N'writer', N'Writers', N'CAH:F', CAST(N'2020-06-03T14:52:05.683' AS DateTime), CAST(N'2020-06-03T14:52:05.683' AS DateTime), N'icon-edit', -1, -1)
INSERT [dbo].[umbracoUserGroup] ([id], [userGroupAlias], [userGroupName], [userGroupDefaultPermissions], [createDate], [updateDate], [icon], [startContentId], [startMediaId]) VALUES (3, N'editor', N'Editors', N'CADMOSKTPUZ:5Fï', CAST(N'2020-06-03T14:52:05.683' AS DateTime), CAST(N'2020-06-03T14:52:05.683' AS DateTime), N'icon-tools', -1, -1)
INSERT [dbo].[umbracoUserGroup] ([id], [userGroupAlias], [userGroupName], [userGroupDefaultPermissions], [createDate], [updateDate], [icon], [startContentId], [startMediaId]) VALUES (4, N'translator', N'Translators', N'AF', CAST(N'2020-06-03T14:52:05.683' AS DateTime), CAST(N'2020-06-03T14:52:05.683' AS DateTime), N'icon-globe', -1, -1)
INSERT [dbo].[umbracoUserGroup] ([id], [userGroupAlias], [userGroupName], [userGroupDefaultPermissions], [createDate], [updateDate], [icon], [startContentId], [startMediaId]) VALUES (5, N'sensitiveData', N'Sensitive data', N'', CAST(N'2020-06-03T14:52:05.683' AS DateTime), CAST(N'2020-06-03T14:52:05.683' AS DateTime), N'icon-lock', -1, -1)
SET IDENTITY_INSERT [dbo].[umbracoUserGroup] OFF
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (1, N'content')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (1, N'forms')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (1, N'media')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (1, N'member')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (1, N'packages')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (1, N'settings')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (1, N'translation')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (1, N'users')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (2, N'content')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (3, N'content')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (3, N'forms')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (3, N'media')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (4, N'translation')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'006a78bf-50ea-46db-a08e-459159bb5968', -1, CAST(N'2020-06-03T07:52:57.490' AS DateTime), CAST(N'2020-06-03T08:05:17.313' AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'3251c1dc-0a40-474a-8823-5308e58db69d', -1, CAST(N'2020-06-07T06:27:19.790' AS DateTime), CAST(N'2020-06-07T06:27:19.790' AS DateTime), NULL, N'::1')
/****** Object:  Index [IX_cmsContentType]    Script Date: 6/7/2020 2:23:27 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsContentType] ON [dbo].[cmsContentType]
(
	[nodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_cmsContentType_icon]    Script Date: 6/7/2020 2:23:27 PM ******/
CREATE NONCLUSTERED INDEX [IX_cmsContentType_icon] ON [dbo].[cmsContentType]
(
	[icon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsDictionary_id]    Script Date: 6/7/2020 2:23:27 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsDictionary_id] ON [dbo].[cmsDictionary]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_cmsDictionary_key]    Script Date: 6/7/2020 2:23:27 PM ******/
CREATE NONCLUSTERED INDEX [IX_cmsDictionary_key] ON [dbo].[cmsDictionary]
(
	[key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsMacro_UniqueId]    Script Date: 6/7/2020 2:23:27 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsMacro_UniqueId] ON [dbo].[cmsMacro]
(
	[uniqueId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_cmsMacroPropertyAlias]    Script Date: 6/7/2020 2:23:27 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsMacroPropertyAlias] ON [dbo].[cmsMacro]
(
	[macroAlias] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_cmsMacroProperty_Alias]    Script Date: 6/7/2020 2:23:27 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsMacroProperty_Alias] ON [dbo].[cmsMacroProperty]
(
	[macro] ASC,
	[macroPropertyAlias] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsMacroProperty_UniquePropertyId]    Script Date: 6/7/2020 2:23:27 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsMacroProperty_UniquePropertyId] ON [dbo].[cmsMacroProperty]
(
	[uniquePropertyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_cmsMember_LoginName]    Script Date: 6/7/2020 2:23:27 PM ******/
CREATE NONCLUSTERED INDEX [IX_cmsMember_LoginName] ON [dbo].[cmsMember]
(
	[LoginName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_cmsPropertyTypeAlias]    Script Date: 6/7/2020 2:23:27 PM ******/
CREATE NONCLUSTERED INDEX [IX_cmsPropertyTypeAlias] ON [dbo].[cmsPropertyType]
(
	[Alias] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsPropertyTypeUniqueID]    Script Date: 6/7/2020 2:23:27 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsPropertyTypeUniqueID] ON [dbo].[cmsPropertyType]
(
	[UniqueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsPropertyTypeGroupUniqueID]    Script Date: 6/7/2020 2:23:27 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsPropertyTypeGroupUniqueID] ON [dbo].[cmsPropertyTypeGroup]
(
	[uniqueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_cmsTags]    Script Date: 6/7/2020 2:23:27 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsTags] ON [dbo].[cmsTags]
(
	[group] ASC,
	[tag] ASC,
	[languageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsTags_LanguageId]    Script Date: 6/7/2020 2:23:27 PM ******/
CREATE NONCLUSTERED INDEX [IX_cmsTags_LanguageId] ON [dbo].[cmsTags]
(
	[languageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsTemplate_nodeId]    Script Date: 6/7/2020 2:23:27 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsTemplate_nodeId] ON [dbo].[cmsTemplate]
(
	[nodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoAccess_nodeId]    Script Date: 6/7/2020 2:23:27 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoAccess_nodeId] ON [dbo].[umbracoAccess]
(
	[nodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_umbracoAccessRule]    Script Date: 6/7/2020 2:23:27 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoAccessRule] ON [dbo].[umbracoAccessRule]
(
	[ruleValue] ASC,
	[ruleType] ASC,
	[accessId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoContentVersion_NodeId]    Script Date: 6/7/2020 2:23:27 PM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoContentVersion_NodeId] ON [dbo].[umbracoContentVersion]
(
	[nodeId] ASC,
	[current] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoContentVersionCultureVariation_LanguageId]    Script Date: 6/7/2020 2:23:27 PM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoContentVersionCultureVariation_LanguageId] ON [dbo].[umbracoContentVersionCultureVariation]
(
	[languageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoContentVersionCultureVariation_VersionId]    Script Date: 6/7/2020 2:23:27 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoContentVersionCultureVariation_VersionId] ON [dbo].[umbracoContentVersionCultureVariation]
(
	[versionId] ASC,
	[languageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoDocument_Published]    Script Date: 6/7/2020 2:23:27 PM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoDocument_Published] ON [dbo].[umbracoDocument]
(
	[published] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoDocumentCultureVariation_LanguageId]    Script Date: 6/7/2020 2:23:27 PM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoDocumentCultureVariation_LanguageId] ON [dbo].[umbracoDocumentCultureVariation]
(
	[languageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoDocumentCultureVariation_NodeId]    Script Date: 6/7/2020 2:23:27 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoDocumentCultureVariation_NodeId] ON [dbo].[umbracoDocumentCultureVariation]
(
	[nodeId] ASC,
	[languageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoLanguage_fallbackLanguageId]    Script Date: 6/7/2020 2:23:27 PM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoLanguage_fallbackLanguageId] ON [dbo].[umbracoLanguage]
(
	[fallbackLanguageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_umbracoLanguage_languageISOCode]    Script Date: 6/7/2020 2:23:27 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoLanguage_languageISOCode] ON [dbo].[umbracoLanguage]
(
	[languageISOCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoLog]    Script Date: 6/7/2020 2:23:27 PM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoLog] ON [dbo].[umbracoLog]
(
	[NodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_umbracoMediaVersion]    Script Date: 6/7/2020 2:23:27 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoMediaVersion] ON [dbo].[umbracoMediaVersion]
(
	[id] ASC,
	[path] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoNode_ObjectType]    Script Date: 6/7/2020 2:23:27 PM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoNode_ObjectType] ON [dbo].[umbracoNode]
(
	[nodeObjectType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoNode_ParentId]    Script Date: 6/7/2020 2:23:27 PM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoNode_ParentId] ON [dbo].[umbracoNode]
(
	[parentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_umbracoNode_Path]    Script Date: 6/7/2020 2:23:27 PM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoNode_Path] ON [dbo].[umbracoNode]
(
	[path] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoNode_Trashed]    Script Date: 6/7/2020 2:23:27 PM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoNode_Trashed] ON [dbo].[umbracoNode]
(
	[trashed] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoNode_UniqueId]    Script Date: 6/7/2020 2:23:27 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoNode_UniqueId] ON [dbo].[umbracoNode]
(
	[uniqueId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoPropertyData_LanguageId]    Script Date: 6/7/2020 2:23:27 PM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoPropertyData_LanguageId] ON [dbo].[umbracoPropertyData]
(
	[languageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoPropertyData_PropertyTypeId]    Script Date: 6/7/2020 2:23:27 PM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoPropertyData_PropertyTypeId] ON [dbo].[umbracoPropertyData]
(
	[propertyTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_umbracoPropertyData_Segment]    Script Date: 6/7/2020 2:23:27 PM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoPropertyData_Segment] ON [dbo].[umbracoPropertyData]
(
	[segment] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_umbracoPropertyData_VersionId]    Script Date: 6/7/2020 2:23:27 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoPropertyData_VersionId] ON [dbo].[umbracoPropertyData]
(
	[versionId] ASC,
	[propertyTypeId] ASC,
	[languageId] ASC,
	[segment] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_umbracoRedirectUrl]    Script Date: 6/7/2020 2:23:27 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoRedirectUrl] ON [dbo].[umbracoRedirectUrl]
(
	[urlHash] ASC,
	[contentKey] ASC,
	[culture] ASC,
	[createDateUtc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoRelation_parentChildType]    Script Date: 6/7/2020 2:23:27 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoRelation_parentChildType] ON [dbo].[umbracoRelation]
(
	[parentId] ASC,
	[childId] ASC,
	[relType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_umbracoRelationType_alias]    Script Date: 6/7/2020 2:23:27 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoRelationType_alias] ON [dbo].[umbracoRelationType]
(
	[alias] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_umbracoRelationType_name]    Script Date: 6/7/2020 2:23:27 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoRelationType_name] ON [dbo].[umbracoRelationType]
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoRelationType_UniqueId]    Script Date: 6/7/2020 2:23:27 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoRelationType_UniqueId] ON [dbo].[umbracoRelationType]
(
	[typeUniqueId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_computerName]    Script Date: 6/7/2020 2:23:27 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_computerName] ON [dbo].[umbracoServer]
(
	[computerName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoServer_isActive]    Script Date: 6/7/2020 2:23:27 PM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoServer_isActive] ON [dbo].[umbracoServer]
(
	[isActive] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_umbracoUser_userLogin]    Script Date: 6/7/2020 2:23:27 PM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoUser_userLogin] ON [dbo].[umbracoUser]
(
	[userLogin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_umbracoUserGroup_userGroupAlias]    Script Date: 6/7/2020 2:23:27 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoUserGroup_userGroupAlias] ON [dbo].[umbracoUserGroup]
(
	[userGroupAlias] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_umbracoUserGroup_userGroupName]    Script Date: 6/7/2020 2:23:27 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoUserGroup_userGroupName] ON [dbo].[umbracoUserGroup]
(
	[userGroupName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoUser2NodePermission_nodeId]    Script Date: 6/7/2020 2:23:27 PM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoUser2NodePermission_nodeId] ON [dbo].[umbracoUserGroup2NodePermission]
(
	[nodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoUserLogin_lastValidatedUtc]    Script Date: 6/7/2020 2:23:27 PM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoUserLogin_lastValidatedUtc] ON [dbo].[umbracoUserLogin]
(
	[lastValidatedUtc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoUserStartNode_startNodeType]    Script Date: 6/7/2020 2:23:27 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoUserStartNode_startNodeType] ON [dbo].[umbracoUserStartNode]
(
	[startNodeType] ASC,
	[startNode] ASC,
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[cmsContentType] ADD  CONSTRAINT [DF_cmsContentType_thumbnail]  DEFAULT ('folder.png') FOR [thumbnail]
GO
ALTER TABLE [dbo].[cmsContentType] ADD  CONSTRAINT [DF_cmsContentType_isContainer]  DEFAULT ('0') FOR [isContainer]
GO
ALTER TABLE [dbo].[cmsContentType] ADD  CONSTRAINT [DF_cmsContentType_isElement]  DEFAULT ('0') FOR [isElement]
GO
ALTER TABLE [dbo].[cmsContentType] ADD  CONSTRAINT [DF_cmsContentType_allowAtRoot]  DEFAULT ('0') FOR [allowAtRoot]
GO
ALTER TABLE [dbo].[cmsContentType] ADD  CONSTRAINT [DF_cmsContentType_variations]  DEFAULT ('1') FOR [variations]
GO
ALTER TABLE [dbo].[cmsContentTypeAllowedContentType] ADD  CONSTRAINT [df_cmsContentTypeAllowedContentType_sortOrder]  DEFAULT ('0') FOR [SortOrder]
GO
ALTER TABLE [dbo].[cmsDocumentType] ADD  CONSTRAINT [DF_cmsDocumentType_IsDefault]  DEFAULT ('0') FOR [IsDefault]
GO
ALTER TABLE [dbo].[cmsMacro] ADD  CONSTRAINT [DF_cmsMacro_macroUseInEditor]  DEFAULT ('0') FOR [macroUseInEditor]
GO
ALTER TABLE [dbo].[cmsMacro] ADD  CONSTRAINT [DF_cmsMacro_macroRefreshRate]  DEFAULT ('0') FOR [macroRefreshRate]
GO
ALTER TABLE [dbo].[cmsMacro] ADD  CONSTRAINT [DF_cmsMacro_macroCacheByPage]  DEFAULT ('1') FOR [macroCacheByPage]
GO
ALTER TABLE [dbo].[cmsMacro] ADD  CONSTRAINT [DF_cmsMacro_macroCachePersonalized]  DEFAULT ('0') FOR [macroCachePersonalized]
GO
ALTER TABLE [dbo].[cmsMacro] ADD  CONSTRAINT [DF_cmsMacro_macroDontRender]  DEFAULT ('0') FOR [macroDontRender]
GO
ALTER TABLE [dbo].[cmsMacroProperty] ADD  CONSTRAINT [DF_cmsMacroProperty_macroPropertySortOrder]  DEFAULT ('0') FOR [macroPropertySortOrder]
GO
ALTER TABLE [dbo].[cmsMember] ADD  CONSTRAINT [DF_cmsMember_Email]  DEFAULT ('''') FOR [Email]
GO
ALTER TABLE [dbo].[cmsMember] ADD  CONSTRAINT [DF_cmsMember_LoginName]  DEFAULT ('''') FOR [LoginName]
GO
ALTER TABLE [dbo].[cmsMember] ADD  CONSTRAINT [DF_cmsMember_Password]  DEFAULT ('''') FOR [Password]
GO
ALTER TABLE [dbo].[cmsMemberType] ADD  CONSTRAINT [DF_cmsMemberType_memberCanEdit]  DEFAULT ('0') FOR [memberCanEdit]
GO
ALTER TABLE [dbo].[cmsMemberType] ADD  CONSTRAINT [DF_cmsMemberType_viewOnProfile]  DEFAULT ('0') FOR [viewOnProfile]
GO
ALTER TABLE [dbo].[cmsMemberType] ADD  CONSTRAINT [DF_cmsMemberType_isSensitive]  DEFAULT ('0') FOR [isSensitive]
GO
ALTER TABLE [dbo].[cmsPropertyType] ADD  CONSTRAINT [DF_cmsPropertyType_sortOrder]  DEFAULT ('0') FOR [sortOrder]
GO
ALTER TABLE [dbo].[cmsPropertyType] ADD  CONSTRAINT [DF_cmsPropertyType_mandatory]  DEFAULT ('0') FOR [mandatory]
GO
ALTER TABLE [dbo].[cmsPropertyType] ADD  CONSTRAINT [DF_cmsPropertyType_variations]  DEFAULT ('1') FOR [variations]
GO
ALTER TABLE [dbo].[cmsPropertyType] ADD  CONSTRAINT [DF_cmsPropertyType_UniqueID]  DEFAULT (newid()) FOR [UniqueID]
GO
ALTER TABLE [dbo].[cmsPropertyTypeGroup] ADD  CONSTRAINT [DF_cmsPropertyTypeGroup_uniqueID]  DEFAULT (newid()) FOR [uniqueID]
GO
ALTER TABLE [dbo].[umbracoAccess] ADD  CONSTRAINT [DF_umbracoAccess_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[umbracoAccess] ADD  CONSTRAINT [DF_umbracoAccess_updateDate]  DEFAULT (getdate()) FOR [updateDate]
GO
ALTER TABLE [dbo].[umbracoAccessRule] ADD  CONSTRAINT [DF_umbracoAccessRule_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[umbracoAccessRule] ADD  CONSTRAINT [DF_umbracoAccessRule_updateDate]  DEFAULT (getdate()) FOR [updateDate]
GO
ALTER TABLE [dbo].[umbracoAudit] ADD  CONSTRAINT [DF_umbracoAudit_eventDateUtc]  DEFAULT (getdate()) FOR [eventDateUtc]
GO
ALTER TABLE [dbo].[umbracoCacheInstruction] ADD  CONSTRAINT [DF_umbracoCacheInstruction_instructionCount]  DEFAULT ('1') FOR [instructionCount]
GO
ALTER TABLE [dbo].[umbracoConsent] ADD  CONSTRAINT [DF_umbracoConsent_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[umbracoContentVersion] ADD  CONSTRAINT [DF_umbracoContentVersion_versionDate]  DEFAULT (getdate()) FOR [versionDate]
GO
ALTER TABLE [dbo].[umbracoExternalLogin] ADD  CONSTRAINT [DF_umbracoExternalLogin_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[umbracoKeyValue] ADD  CONSTRAINT [DF_umbracoKeyValue_updated]  DEFAULT (getdate()) FOR [updated]
GO
ALTER TABLE [dbo].[umbracoLanguage] ADD  CONSTRAINT [DF_umbracoLanguage_isDefaultVariantLang]  DEFAULT ('0') FOR [isDefaultVariantLang]
GO
ALTER TABLE [dbo].[umbracoLanguage] ADD  CONSTRAINT [DF_umbracoLanguage_mandatory]  DEFAULT ('0') FOR [mandatory]
GO
ALTER TABLE [dbo].[umbracoLog] ADD  CONSTRAINT [DF_umbracoLog_Datestamp]  DEFAULT (getdate()) FOR [Datestamp]
GO
ALTER TABLE [dbo].[umbracoNode] ADD  CONSTRAINT [DF_umbracoNode_uniqueId]  DEFAULT (newid()) FOR [uniqueId]
GO
ALTER TABLE [dbo].[umbracoNode] ADD  CONSTRAINT [DF_umbracoNode_trashed]  DEFAULT ('0') FOR [trashed]
GO
ALTER TABLE [dbo].[umbracoNode] ADD  CONSTRAINT [DF_umbracoNode_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[umbracoRelation] ADD  CONSTRAINT [DF_umbracoRelation_datetime]  DEFAULT (getdate()) FOR [datetime]
GO
ALTER TABLE [dbo].[umbracoServer] ADD  CONSTRAINT [DF_umbracoServer_registeredDate]  DEFAULT (getdate()) FOR [registeredDate]
GO
ALTER TABLE [dbo].[umbracoUser] ADD  CONSTRAINT [DF_umbracoUser_userDisabled]  DEFAULT ('0') FOR [userDisabled]
GO
ALTER TABLE [dbo].[umbracoUser] ADD  CONSTRAINT [DF_umbracoUser_userNoConsole]  DEFAULT ('0') FOR [userNoConsole]
GO
ALTER TABLE [dbo].[umbracoUser] ADD  CONSTRAINT [DF_umbracoUser_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[umbracoUser] ADD  CONSTRAINT [DF_umbracoUser_updateDate]  DEFAULT (getdate()) FOR [updateDate]
GO
ALTER TABLE [dbo].[umbracoUserGroup] ADD  CONSTRAINT [DF_umbracoUserGroup_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[umbracoUserGroup] ADD  CONSTRAINT [DF_umbracoUserGroup_updateDate]  DEFAULT (getdate()) FOR [updateDate]
GO
ALTER TABLE [dbo].[cmsContentNu]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentNu_umbracoContent_nodeId] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoContent] ([nodeId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[cmsContentNu] CHECK CONSTRAINT [FK_cmsContentNu_umbracoContent_nodeId]
GO
ALTER TABLE [dbo].[cmsContentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentType_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsContentType] CHECK CONSTRAINT [FK_cmsContentType_umbracoNode_id]
GO
ALTER TABLE [dbo].[cmsContentType2ContentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentType2ContentType_umbracoNode_child] FOREIGN KEY([childContentTypeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsContentType2ContentType] CHECK CONSTRAINT [FK_cmsContentType2ContentType_umbracoNode_child]
GO
ALTER TABLE [dbo].[cmsContentType2ContentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentType2ContentType_umbracoNode_parent] FOREIGN KEY([parentContentTypeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsContentType2ContentType] CHECK CONSTRAINT [FK_cmsContentType2ContentType_umbracoNode_parent]
GO
ALTER TABLE [dbo].[cmsContentTypeAllowedContentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentTypeAllowedContentType_cmsContentType] FOREIGN KEY([Id])
REFERENCES [dbo].[cmsContentType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsContentTypeAllowedContentType] CHECK CONSTRAINT [FK_cmsContentTypeAllowedContentType_cmsContentType]
GO
ALTER TABLE [dbo].[cmsContentTypeAllowedContentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentTypeAllowedContentType_cmsContentType1] FOREIGN KEY([AllowedId])
REFERENCES [dbo].[cmsContentType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsContentTypeAllowedContentType] CHECK CONSTRAINT [FK_cmsContentTypeAllowedContentType_cmsContentType1]
GO
ALTER TABLE [dbo].[cmsDictionary]  WITH CHECK ADD  CONSTRAINT [FK_cmsDictionary_cmsDictionary_id] FOREIGN KEY([parent])
REFERENCES [dbo].[cmsDictionary] ([id])
GO
ALTER TABLE [dbo].[cmsDictionary] CHECK CONSTRAINT [FK_cmsDictionary_cmsDictionary_id]
GO
ALTER TABLE [dbo].[cmsDocumentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsDocumentType_cmsContentType_nodeId] FOREIGN KEY([contentTypeNodeId])
REFERENCES [dbo].[cmsContentType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsDocumentType] CHECK CONSTRAINT [FK_cmsDocumentType_cmsContentType_nodeId]
GO
ALTER TABLE [dbo].[cmsDocumentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsDocumentType_cmsTemplate_nodeId] FOREIGN KEY([templateNodeId])
REFERENCES [dbo].[cmsTemplate] ([nodeId])
GO
ALTER TABLE [dbo].[cmsDocumentType] CHECK CONSTRAINT [FK_cmsDocumentType_cmsTemplate_nodeId]
GO
ALTER TABLE [dbo].[cmsDocumentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsDocumentType_umbracoNode_id] FOREIGN KEY([contentTypeNodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsDocumentType] CHECK CONSTRAINT [FK_cmsDocumentType_umbracoNode_id]
GO
ALTER TABLE [dbo].[cmsLanguageText]  WITH CHECK ADD  CONSTRAINT [FK_cmsLanguageText_cmsDictionary_id] FOREIGN KEY([UniqueId])
REFERENCES [dbo].[cmsDictionary] ([id])
GO
ALTER TABLE [dbo].[cmsLanguageText] CHECK CONSTRAINT [FK_cmsLanguageText_cmsDictionary_id]
GO
ALTER TABLE [dbo].[cmsLanguageText]  WITH CHECK ADD  CONSTRAINT [FK_cmsLanguageText_umbracoLanguage_id] FOREIGN KEY([languageId])
REFERENCES [dbo].[umbracoLanguage] ([id])
GO
ALTER TABLE [dbo].[cmsLanguageText] CHECK CONSTRAINT [FK_cmsLanguageText_umbracoLanguage_id]
GO
ALTER TABLE [dbo].[cmsMacroProperty]  WITH CHECK ADD  CONSTRAINT [FK_cmsMacroProperty_cmsMacro_id] FOREIGN KEY([macro])
REFERENCES [dbo].[cmsMacro] ([id])
GO
ALTER TABLE [dbo].[cmsMacroProperty] CHECK CONSTRAINT [FK_cmsMacroProperty_cmsMacro_id]
GO
ALTER TABLE [dbo].[cmsMember]  WITH CHECK ADD  CONSTRAINT [FK_cmsMember_umbracoContent_nodeId] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoContent] ([nodeId])
GO
ALTER TABLE [dbo].[cmsMember] CHECK CONSTRAINT [FK_cmsMember_umbracoContent_nodeId]
GO
ALTER TABLE [dbo].[cmsMember2MemberGroup]  WITH CHECK ADD  CONSTRAINT [FK_cmsMember2MemberGroup_cmsMember_nodeId] FOREIGN KEY([Member])
REFERENCES [dbo].[cmsMember] ([nodeId])
GO
ALTER TABLE [dbo].[cmsMember2MemberGroup] CHECK CONSTRAINT [FK_cmsMember2MemberGroup_cmsMember_nodeId]
GO
ALTER TABLE [dbo].[cmsMember2MemberGroup]  WITH CHECK ADD  CONSTRAINT [FK_cmsMember2MemberGroup_umbracoNode_id] FOREIGN KEY([MemberGroup])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsMember2MemberGroup] CHECK CONSTRAINT [FK_cmsMember2MemberGroup_umbracoNode_id]
GO
ALTER TABLE [dbo].[cmsMemberType]  WITH CHECK ADD  CONSTRAINT [FK_cmsMemberType_cmsContentType_nodeId] FOREIGN KEY([NodeId])
REFERENCES [dbo].[cmsContentType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsMemberType] CHECK CONSTRAINT [FK_cmsMemberType_cmsContentType_nodeId]
GO
ALTER TABLE [dbo].[cmsMemberType]  WITH CHECK ADD  CONSTRAINT [FK_cmsMemberType_umbracoNode_id] FOREIGN KEY([NodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsMemberType] CHECK CONSTRAINT [FK_cmsMemberType_umbracoNode_id]
GO
ALTER TABLE [dbo].[cmsPropertyType]  WITH CHECK ADD  CONSTRAINT [FK_cmsPropertyType_cmsContentType_nodeId] FOREIGN KEY([contentTypeId])
REFERENCES [dbo].[cmsContentType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsPropertyType] CHECK CONSTRAINT [FK_cmsPropertyType_cmsContentType_nodeId]
GO
ALTER TABLE [dbo].[cmsPropertyType]  WITH CHECK ADD  CONSTRAINT [FK_cmsPropertyType_cmsPropertyTypeGroup_id] FOREIGN KEY([propertyTypeGroupId])
REFERENCES [dbo].[cmsPropertyTypeGroup] ([id])
GO
ALTER TABLE [dbo].[cmsPropertyType] CHECK CONSTRAINT [FK_cmsPropertyType_cmsPropertyTypeGroup_id]
GO
ALTER TABLE [dbo].[cmsPropertyType]  WITH CHECK ADD  CONSTRAINT [FK_cmsPropertyType_umbracoDataType_nodeId] FOREIGN KEY([dataTypeId])
REFERENCES [dbo].[umbracoDataType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsPropertyType] CHECK CONSTRAINT [FK_cmsPropertyType_umbracoDataType_nodeId]
GO
ALTER TABLE [dbo].[cmsPropertyTypeGroup]  WITH CHECK ADD  CONSTRAINT [FK_cmsPropertyTypeGroup_cmsContentType_nodeId] FOREIGN KEY([contenttypeNodeId])
REFERENCES [dbo].[cmsContentType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsPropertyTypeGroup] CHECK CONSTRAINT [FK_cmsPropertyTypeGroup_cmsContentType_nodeId]
GO
ALTER TABLE [dbo].[cmsTagRelationship]  WITH CHECK ADD  CONSTRAINT [FK_cmsTagRelationship_cmsContent] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoContent] ([nodeId])
GO
ALTER TABLE [dbo].[cmsTagRelationship] CHECK CONSTRAINT [FK_cmsTagRelationship_cmsContent]
GO
ALTER TABLE [dbo].[cmsTagRelationship]  WITH CHECK ADD  CONSTRAINT [FK_cmsTagRelationship_cmsPropertyType] FOREIGN KEY([propertyTypeId])
REFERENCES [dbo].[cmsPropertyType] ([id])
GO
ALTER TABLE [dbo].[cmsTagRelationship] CHECK CONSTRAINT [FK_cmsTagRelationship_cmsPropertyType]
GO
ALTER TABLE [dbo].[cmsTagRelationship]  WITH CHECK ADD  CONSTRAINT [FK_cmsTagRelationship_cmsTags_id] FOREIGN KEY([tagId])
REFERENCES [dbo].[cmsTags] ([id])
GO
ALTER TABLE [dbo].[cmsTagRelationship] CHECK CONSTRAINT [FK_cmsTagRelationship_cmsTags_id]
GO
ALTER TABLE [dbo].[cmsTags]  WITH CHECK ADD  CONSTRAINT [FK_cmsTags_umbracoLanguage_id] FOREIGN KEY([languageId])
REFERENCES [dbo].[umbracoLanguage] ([id])
GO
ALTER TABLE [dbo].[cmsTags] CHECK CONSTRAINT [FK_cmsTags_umbracoLanguage_id]
GO
ALTER TABLE [dbo].[cmsTemplate]  WITH CHECK ADD  CONSTRAINT [FK_cmsTemplate_umbracoNode] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsTemplate] CHECK CONSTRAINT [FK_cmsTemplate_umbracoNode]
GO
ALTER TABLE [dbo].[umbracoAccess]  WITH CHECK ADD  CONSTRAINT [FK_umbracoAccess_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoAccess] CHECK CONSTRAINT [FK_umbracoAccess_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoAccess]  WITH CHECK ADD  CONSTRAINT [FK_umbracoAccess_umbracoNode_id1] FOREIGN KEY([loginNodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoAccess] CHECK CONSTRAINT [FK_umbracoAccess_umbracoNode_id1]
GO
ALTER TABLE [dbo].[umbracoAccess]  WITH CHECK ADD  CONSTRAINT [FK_umbracoAccess_umbracoNode_id2] FOREIGN KEY([noAccessNodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoAccess] CHECK CONSTRAINT [FK_umbracoAccess_umbracoNode_id2]
GO
ALTER TABLE [dbo].[umbracoAccessRule]  WITH CHECK ADD  CONSTRAINT [FK_umbracoAccessRule_umbracoAccess_id] FOREIGN KEY([accessId])
REFERENCES [dbo].[umbracoAccess] ([id])
GO
ALTER TABLE [dbo].[umbracoAccessRule] CHECK CONSTRAINT [FK_umbracoAccessRule_umbracoAccess_id]
GO
ALTER TABLE [dbo].[umbracoContent]  WITH CHECK ADD  CONSTRAINT [FK_umbracoContent_cmsContentType_NodeId] FOREIGN KEY([contentTypeId])
REFERENCES [dbo].[cmsContentType] ([nodeId])
GO
ALTER TABLE [dbo].[umbracoContent] CHECK CONSTRAINT [FK_umbracoContent_cmsContentType_NodeId]
GO
ALTER TABLE [dbo].[umbracoContent]  WITH CHECK ADD  CONSTRAINT [FK_umbracoContent_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoContent] CHECK CONSTRAINT [FK_umbracoContent_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoContentSchedule]  WITH CHECK ADD  CONSTRAINT [FK_umbracoContentSchedule_umbracoContent_nodeId] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoContent] ([nodeId])
GO
ALTER TABLE [dbo].[umbracoContentSchedule] CHECK CONSTRAINT [FK_umbracoContentSchedule_umbracoContent_nodeId]
GO
ALTER TABLE [dbo].[umbracoContentSchedule]  WITH CHECK ADD  CONSTRAINT [FK_umbracoContentSchedule_umbracoLanguage_id] FOREIGN KEY([languageId])
REFERENCES [dbo].[umbracoLanguage] ([id])
GO
ALTER TABLE [dbo].[umbracoContentSchedule] CHECK CONSTRAINT [FK_umbracoContentSchedule_umbracoLanguage_id]
GO
ALTER TABLE [dbo].[umbracoContentVersion]  WITH CHECK ADD  CONSTRAINT [FK_umbracoContentVersion_umbracoContent_nodeId] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoContent] ([nodeId])
GO
ALTER TABLE [dbo].[umbracoContentVersion] CHECK CONSTRAINT [FK_umbracoContentVersion_umbracoContent_nodeId]
GO
ALTER TABLE [dbo].[umbracoContentVersion]  WITH CHECK ADD  CONSTRAINT [FK_umbracoContentVersion_umbracoUser_id] FOREIGN KEY([userId])
REFERENCES [dbo].[umbracoUser] ([id])
GO
ALTER TABLE [dbo].[umbracoContentVersion] CHECK CONSTRAINT [FK_umbracoContentVersion_umbracoUser_id]
GO
ALTER TABLE [dbo].[umbracoContentVersionCultureVariation]  WITH CHECK ADD  CONSTRAINT [FK_umbracoContentVersionCultureVariation_umbracoContentVersion_id] FOREIGN KEY([versionId])
REFERENCES [dbo].[umbracoContentVersion] ([id])
GO
ALTER TABLE [dbo].[umbracoContentVersionCultureVariation] CHECK CONSTRAINT [FK_umbracoContentVersionCultureVariation_umbracoContentVersion_id]
GO
ALTER TABLE [dbo].[umbracoContentVersionCultureVariation]  WITH CHECK ADD  CONSTRAINT [FK_umbracoContentVersionCultureVariation_umbracoLanguage_id] FOREIGN KEY([languageId])
REFERENCES [dbo].[umbracoLanguage] ([id])
GO
ALTER TABLE [dbo].[umbracoContentVersionCultureVariation] CHECK CONSTRAINT [FK_umbracoContentVersionCultureVariation_umbracoLanguage_id]
GO
ALTER TABLE [dbo].[umbracoContentVersionCultureVariation]  WITH CHECK ADD  CONSTRAINT [FK_umbracoContentVersionCultureVariation_umbracoUser_id] FOREIGN KEY([availableUserId])
REFERENCES [dbo].[umbracoUser] ([id])
GO
ALTER TABLE [dbo].[umbracoContentVersionCultureVariation] CHECK CONSTRAINT [FK_umbracoContentVersionCultureVariation_umbracoUser_id]
GO
ALTER TABLE [dbo].[umbracoDataType]  WITH CHECK ADD  CONSTRAINT [FK_umbracoDataType_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoDataType] CHECK CONSTRAINT [FK_umbracoDataType_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoDocument]  WITH CHECK ADD  CONSTRAINT [FK_umbracoDocument_umbracoContent_nodeId] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoContent] ([nodeId])
GO
ALTER TABLE [dbo].[umbracoDocument] CHECK CONSTRAINT [FK_umbracoDocument_umbracoContent_nodeId]
GO
ALTER TABLE [dbo].[umbracoDocumentCultureVariation]  WITH CHECK ADD  CONSTRAINT [FK_umbracoDocumentCultureVariation_umbracoLanguage_id] FOREIGN KEY([languageId])
REFERENCES [dbo].[umbracoLanguage] ([id])
GO
ALTER TABLE [dbo].[umbracoDocumentCultureVariation] CHECK CONSTRAINT [FK_umbracoDocumentCultureVariation_umbracoLanguage_id]
GO
ALTER TABLE [dbo].[umbracoDocumentCultureVariation]  WITH CHECK ADD  CONSTRAINT [FK_umbracoDocumentCultureVariation_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoDocumentCultureVariation] CHECK CONSTRAINT [FK_umbracoDocumentCultureVariation_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoDocumentVersion]  WITH CHECK ADD  CONSTRAINT [FK_umbracoDocumentVersion_cmsTemplate_nodeId] FOREIGN KEY([templateId])
REFERENCES [dbo].[cmsTemplate] ([nodeId])
GO
ALTER TABLE [dbo].[umbracoDocumentVersion] CHECK CONSTRAINT [FK_umbracoDocumentVersion_cmsTemplate_nodeId]
GO
ALTER TABLE [dbo].[umbracoDocumentVersion]  WITH CHECK ADD  CONSTRAINT [FK_umbracoDocumentVersion_umbracoContentVersion_id] FOREIGN KEY([id])
REFERENCES [dbo].[umbracoContentVersion] ([id])
GO
ALTER TABLE [dbo].[umbracoDocumentVersion] CHECK CONSTRAINT [FK_umbracoDocumentVersion_umbracoContentVersion_id]
GO
ALTER TABLE [dbo].[umbracoDomain]  WITH CHECK ADD  CONSTRAINT [FK_umbracoDomain_umbracoNode_id] FOREIGN KEY([domainRootStructureID])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoDomain] CHECK CONSTRAINT [FK_umbracoDomain_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoLanguage]  WITH CHECK ADD  CONSTRAINT [FK_umbracoLanguage_umbracoLanguage_id] FOREIGN KEY([fallbackLanguageId])
REFERENCES [dbo].[umbracoLanguage] ([id])
GO
ALTER TABLE [dbo].[umbracoLanguage] CHECK CONSTRAINT [FK_umbracoLanguage_umbracoLanguage_id]
GO
ALTER TABLE [dbo].[umbracoLog]  WITH CHECK ADD  CONSTRAINT [FK_umbracoLog_umbracoUser_id] FOREIGN KEY([userId])
REFERENCES [dbo].[umbracoUser] ([id])
GO
ALTER TABLE [dbo].[umbracoLog] CHECK CONSTRAINT [FK_umbracoLog_umbracoUser_id]
GO
ALTER TABLE [dbo].[umbracoMediaVersion]  WITH CHECK ADD  CONSTRAINT [FK_umbracoMediaVersion_umbracoContentVersion_id] FOREIGN KEY([id])
REFERENCES [dbo].[umbracoContentVersion] ([id])
GO
ALTER TABLE [dbo].[umbracoMediaVersion] CHECK CONSTRAINT [FK_umbracoMediaVersion_umbracoContentVersion_id]
GO
ALTER TABLE [dbo].[umbracoNode]  WITH CHECK ADD  CONSTRAINT [FK_umbracoNode_umbracoNode_id] FOREIGN KEY([parentId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoNode] CHECK CONSTRAINT [FK_umbracoNode_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoNode]  WITH CHECK ADD  CONSTRAINT [FK_umbracoNode_umbracoUser_id] FOREIGN KEY([nodeUser])
REFERENCES [dbo].[umbracoUser] ([id])
GO
ALTER TABLE [dbo].[umbracoNode] CHECK CONSTRAINT [FK_umbracoNode_umbracoUser_id]
GO
ALTER TABLE [dbo].[umbracoPropertyData]  WITH CHECK ADD  CONSTRAINT [FK_umbracoPropertyData_cmsPropertyType_id] FOREIGN KEY([propertyTypeId])
REFERENCES [dbo].[cmsPropertyType] ([id])
GO
ALTER TABLE [dbo].[umbracoPropertyData] CHECK CONSTRAINT [FK_umbracoPropertyData_cmsPropertyType_id]
GO
ALTER TABLE [dbo].[umbracoPropertyData]  WITH CHECK ADD  CONSTRAINT [FK_umbracoPropertyData_umbracoContentVersion_id] FOREIGN KEY([versionId])
REFERENCES [dbo].[umbracoContentVersion] ([id])
GO
ALTER TABLE [dbo].[umbracoPropertyData] CHECK CONSTRAINT [FK_umbracoPropertyData_umbracoContentVersion_id]
GO
ALTER TABLE [dbo].[umbracoPropertyData]  WITH CHECK ADD  CONSTRAINT [FK_umbracoPropertyData_umbracoLanguage_id] FOREIGN KEY([languageId])
REFERENCES [dbo].[umbracoLanguage] ([id])
GO
ALTER TABLE [dbo].[umbracoPropertyData] CHECK CONSTRAINT [FK_umbracoPropertyData_umbracoLanguage_id]
GO
ALTER TABLE [dbo].[umbracoRedirectUrl]  WITH CHECK ADD  CONSTRAINT [FK_umbracoRedirectUrl_umbracoNode_uniqueID] FOREIGN KEY([contentKey])
REFERENCES [dbo].[umbracoNode] ([uniqueId])
GO
ALTER TABLE [dbo].[umbracoRedirectUrl] CHECK CONSTRAINT [FK_umbracoRedirectUrl_umbracoNode_uniqueID]
GO
ALTER TABLE [dbo].[umbracoRelation]  WITH NOCHECK ADD  CONSTRAINT [FK_umbracoRelation_umbracoNode] FOREIGN KEY([parentId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoRelation] CHECK CONSTRAINT [FK_umbracoRelation_umbracoNode]
GO
ALTER TABLE [dbo].[umbracoRelation]  WITH NOCHECK ADD  CONSTRAINT [FK_umbracoRelation_umbracoNode1] FOREIGN KEY([childId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoRelation] CHECK CONSTRAINT [FK_umbracoRelation_umbracoNode1]
GO
ALTER TABLE [dbo].[umbracoRelation]  WITH NOCHECK ADD  CONSTRAINT [FK_umbracoRelation_umbracoRelationType_id] FOREIGN KEY([relType])
REFERENCES [dbo].[umbracoRelationType] ([id])
GO
ALTER TABLE [dbo].[umbracoRelation] CHECK CONSTRAINT [FK_umbracoRelation_umbracoRelationType_id]
GO
ALTER TABLE [dbo].[umbracoUser2NodeNotify]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUser2NodeNotify_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoUser2NodeNotify] CHECK CONSTRAINT [FK_umbracoUser2NodeNotify_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoUser2NodeNotify]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUser2NodeNotify_umbracoUser_id] FOREIGN KEY([userId])
REFERENCES [dbo].[umbracoUser] ([id])
GO
ALTER TABLE [dbo].[umbracoUser2NodeNotify] CHECK CONSTRAINT [FK_umbracoUser2NodeNotify_umbracoUser_id]
GO
ALTER TABLE [dbo].[umbracoUser2UserGroup]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUser2UserGroup_umbracoUser_id] FOREIGN KEY([userId])
REFERENCES [dbo].[umbracoUser] ([id])
GO
ALTER TABLE [dbo].[umbracoUser2UserGroup] CHECK CONSTRAINT [FK_umbracoUser2UserGroup_umbracoUser_id]
GO
ALTER TABLE [dbo].[umbracoUser2UserGroup]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUser2UserGroup_umbracoUserGroup_id] FOREIGN KEY([userGroupId])
REFERENCES [dbo].[umbracoUserGroup] ([id])
GO
ALTER TABLE [dbo].[umbracoUser2UserGroup] CHECK CONSTRAINT [FK_umbracoUser2UserGroup_umbracoUserGroup_id]
GO
ALTER TABLE [dbo].[umbracoUserGroup]  WITH CHECK ADD  CONSTRAINT [FK_startContentId_umbracoNode_id] FOREIGN KEY([startContentId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoUserGroup] CHECK CONSTRAINT [FK_startContentId_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoUserGroup]  WITH CHECK ADD  CONSTRAINT [FK_startMediaId_umbracoNode_id] FOREIGN KEY([startMediaId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoUserGroup] CHECK CONSTRAINT [FK_startMediaId_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoUserGroup2App]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUserGroup2App_umbracoUserGroup_id] FOREIGN KEY([userGroupId])
REFERENCES [dbo].[umbracoUserGroup] ([id])
GO
ALTER TABLE [dbo].[umbracoUserGroup2App] CHECK CONSTRAINT [FK_umbracoUserGroup2App_umbracoUserGroup_id]
GO
ALTER TABLE [dbo].[umbracoUserGroup2NodePermission]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUserGroup2NodePermission_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoUserGroup2NodePermission] CHECK CONSTRAINT [FK_umbracoUserGroup2NodePermission_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoUserGroup2NodePermission]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUserGroup2NodePermission_umbracoUserGroup_id] FOREIGN KEY([userGroupId])
REFERENCES [dbo].[umbracoUserGroup] ([id])
GO
ALTER TABLE [dbo].[umbracoUserGroup2NodePermission] CHECK CONSTRAINT [FK_umbracoUserGroup2NodePermission_umbracoUserGroup_id]
GO
ALTER TABLE [dbo].[umbracoUserLogin]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUserLogin_umbracoUser_id] FOREIGN KEY([userId])
REFERENCES [dbo].[umbracoUser] ([id])
GO
ALTER TABLE [dbo].[umbracoUserLogin] CHECK CONSTRAINT [FK_umbracoUserLogin_umbracoUser_id]
GO
ALTER TABLE [dbo].[umbracoUserStartNode]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUserStartNode_umbracoNode_id] FOREIGN KEY([startNode])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoUserStartNode] CHECK CONSTRAINT [FK_umbracoUserStartNode_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoUserStartNode]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUserStartNode_umbracoUser_id] FOREIGN KEY([userId])
REFERENCES [dbo].[umbracoUser] ([id])
GO
ALTER TABLE [dbo].[umbracoUserStartNode] CHECK CONSTRAINT [FK_umbracoUserStartNode_umbracoUser_id]
GO
USE [master]
GO
ALTER DATABASE [CnxdevsoftDb] SET  READ_WRITE 
GO

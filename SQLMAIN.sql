USE [master]
GO
/****** Object:  Database [DBTRAVELMAIN]    Script Date: 25/05/2017 11:26:27 ******/
CREATE DATABASE [DBTRAVELMAIN]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DBTRAVELMAIN', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.ADMIN\MSSQL\DATA\DBTRAVELMAIN.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DBTRAVELMAIN_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.ADMIN\MSSQL\DATA\DBTRAVELMAIN_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DBTRAVELMAIN] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBTRAVELMAIN].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBTRAVELMAIN] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBTRAVELMAIN] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBTRAVELMAIN] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBTRAVELMAIN] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBTRAVELMAIN] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBTRAVELMAIN] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DBTRAVELMAIN] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBTRAVELMAIN] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBTRAVELMAIN] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBTRAVELMAIN] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBTRAVELMAIN] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBTRAVELMAIN] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBTRAVELMAIN] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBTRAVELMAIN] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBTRAVELMAIN] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DBTRAVELMAIN] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBTRAVELMAIN] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBTRAVELMAIN] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBTRAVELMAIN] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBTRAVELMAIN] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBTRAVELMAIN] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DBTRAVELMAIN] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBTRAVELMAIN] SET RECOVERY FULL 
GO
ALTER DATABASE [DBTRAVELMAIN] SET  MULTI_USER 
GO
ALTER DATABASE [DBTRAVELMAIN] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBTRAVELMAIN] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBTRAVELMAIN] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBTRAVELMAIN] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [DBTRAVELMAIN] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'DBTRAVELMAIN', N'ON'
GO
USE [DBTRAVELMAIN]
GO
/****** Object:  Table [dbo].[agencias]    Script Date: 25/05/2017 11:26:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[agencias](
	[agencia_id] [int] IDENTITY(1,1) NOT NULL,
	[agencia_description] [varchar](255) NULL,
	[agencia_phone] [varchar](20) NULL,
	[agencia_mail] [varchar](70) NULL,
 CONSTRAINT [PK__agencias__83A18C5383C36529] PRIMARY KEY CLUSTERED 
(
	[agencia_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ciudades]    Script Date: 25/05/2017 11:26:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ciudades](
	[ciudad_id] [int] NOT NULL,
	[ciudad_name] [varchar](50) NULL,
	[departamento_id] [int] NULL,
 CONSTRAINT [PK__ciudades__AA0ADB672F665B37] PRIMARY KEY CLUSTERED 
(
	[ciudad_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cronograma_transportes]    Script Date: 25/05/2017 11:26:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cronograma_transportes](
	[cronograma_transporte_id] [int] IDENTITY(1,1) NOT NULL,
	[cronograma_fecha] [date] NULL,
	[transporte_id] [int] NULL,
	[cronograma_fecha_regreso] [date] NULL,
 CONSTRAINT [PK__cronogra__352DC58EA0D110B6] PRIMARY KEY CLUSTERED 
(
	[cronograma_transporte_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[departamentos]    Script Date: 25/05/2017 11:26:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[departamentos](
	[id] [int] NOT NULL DEFAULT ('0'),
	[departamento] [varchar](50) NULL DEFAULT (NULL),
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[hoteles]    Script Date: 25/05/2017 11:26:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[hoteles](
	[hotel_id] [int] IDENTITY(1,1) NOT NULL,
	[hotel_description] [varchar](255) NULL,
	[hotel_precio_uni] [decimal](18, 2) NULL,
	[origen_ciudad_id] [int] NULL,
	[agencia_id] [int] NULL,
 CONSTRAINT [PK__hoteles__45FE7E2603775ECD] PRIMARY KEY CLUSTERED 
(
	[hotel_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[pasajeros]    Script Date: 25/05/2017 11:26:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[pasajeros](
	[pasajero_id] [int] IDENTITY(1,1) NOT NULL,
	[pasajero_dni] [varchar](10) NOT NULL,
	[pasajero_name] [varchar](50) NOT NULL,
	[pasajero_last_name] [varchar](50) NOT NULL,
	[pasajero_edad] [int] NULL,
	[pasajero_status] [varchar](15) NOT NULL CONSTRAINT [DF__pasajeros__pasaj__108B795B]  DEFAULT ('ACTIVO'),
 CONSTRAINT [PK__pasajero__8B0A15E540C4E66C] PRIMARY KEY CLUSTERED 
(
	[pasajero_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[transporte_clase]    Script Date: 25/05/2017 11:26:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[transporte_clase](
	[transporte_clase_id] [int] IDENTITY(1,1) NOT NULL,
	[transporte_id] [int] NULL,
	[transporte_clase_costo_pasaje] [decimal](10, 2) NULL,
	[transporte_clase_typo_pasaje] [varchar](50) NULL,
	[transporte_clase_asientos] [int] NULL,
 CONSTRAINT [PK__transpor__7FC1D12D0C69B3ED] PRIMARY KEY CLUSTERED 
(
	[transporte_clase_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[transportes]    Script Date: 25/05/2017 11:26:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[transportes](
	[transporte_id] [int] IDENTITY(1,1) NOT NULL,
	[agencia_id] [int] NULL,
	[origen_ciudad_id] [int] NULL,
	[destino_ciudad_id] [int] NULL,
	[type_transporte] [varchar](50) NULL,
	[transporte_status] [varchar](30) NULL CONSTRAINT [DF__transport__trans__182C9B23]  DEFAULT ('ACTIVO'),
 CONSTRAINT [PK__transpor__87F4A3AEE6CBB568] PRIMARY KEY CLUSTERED 
(
	[transporte_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[users]    Script Date: 25/05/2017 11:26:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[users](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[user_pass] [varchar](255) NULL,
	[user_type] [varchar](255) NULL,
	[user_dni] [varchar](255) NULL,
	[user_status] [varchar](255) NULL,
 CONSTRAINT [PK__users__B9BE370F8528D55D] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[venta_detelles]    Script Date: 25/05/2017 11:26:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[venta_detelles](
	[vendet_id] [int] IDENTITY(1,1) NOT NULL,
	[vendet_cost_uni] [decimal](10, 2) NULL,
	[vendet_status] [varchar](30) NULL,
	[pasajero_id] [int] NULL,
	[venta_id] [int] NULL,
	[transporte_clase_id] [int] NULL,
 CONSTRAINT [PK__venta_de__59DDC69DF0EC8F88] PRIMARY KEY CLUSTERED 
(
	[vendet_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ventas]    Script Date: 25/05/2017 11:26:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ventas](
	[ventas_id] [int] IDENTITY(1,1) NOT NULL,
	[venta_date_reserva] [date] NULL,
	[venta_date_venta] [date] NULL,
	[venta_status] [varchar](20) NOT NULL CONSTRAINT [DF__ventas__venta_st__1367E606]  DEFAULT ('COMENZADA'),
	[venta_code] [varchar](50) NULL,
	[fecha_partida_cronograma_transpote_id] [int] NULL,
	[user_id] [int] NOT NULL,
	[comprador_pasajero_id] [int] NULL,
	[transporte_id] [int] NULL,
	[hotel_id] [int] NULL,
	[venta_sub_total] [varchar](50) NULL,
	[venta_total] [varchar](50) NULL,
 CONSTRAINT [PK__ventas__3AA18F83573579B2] PRIMARY KEY CLUSTERED 
(
	[ventas_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[agencias] ON 

INSERT [dbo].[agencias] ([agencia_id], [agencia_description], [agencia_phone], [agencia_mail]) VALUES (1, N'new agency', N'123-123-1234', N'agency@test')
INSERT [dbo].[agencias] ([agencia_id], [agencia_description], [agencia_phone], [agencia_mail]) VALUES (2, N'DosAgencyVal', N'321332112', N'DosAgencyVal@DosAgencyVal.us')
INSERT [dbo].[agencias] ([agencia_id], [agencia_description], [agencia_phone], [agencia_mail]) VALUES (3, N'Bahía', N'432-234-3234', N'Bahia@ba_')
INSERT [dbo].[agencias] ([agencia_id], [agencia_description], [agencia_phone], [agencia_mail]) VALUES (4, N'AgencyOneT', N'123-123-1234', N'mailto@mail.com')
INSERT [dbo].[agencias] ([agencia_id], [agencia_description], [agencia_phone], [agencia_mail]) VALUES (5, N'AgencySuarez', N'123-123-1234', N'mailto@mail.com')
INSERT [dbo].[agencias] ([agencia_id], [agencia_description], [agencia_phone], [agencia_mail]) VALUES (6, N'AgencyMarcos', N'123-123-1234', N'mailto@mail.com')
INSERT [dbo].[agencias] ([agencia_id], [agencia_description], [agencia_phone], [agencia_mail]) VALUES (7, N'AgencySoledad', N'123-123-1234', N'mailto@mail.com')
INSERT [dbo].[agencias] ([agencia_id], [agencia_description], [agencia_phone], [agencia_mail]) VALUES (8, N'NoAgency', N'123-123-1234', N'mailto@mail.com')
INSERT [dbo].[agencias] ([agencia_id], [agencia_description], [agencia_phone], [agencia_mail]) VALUES (9, N'Amt', N'123-123-1234', N'mailto@mail.com')
INSERT [dbo].[agencias] ([agencia_id], [agencia_description], [agencia_phone], [agencia_mail]) VALUES (10, N'AgencyOneTOther', N'123-123-1234', N'mailto@mail.com')
SET IDENTITY_INSERT [dbo].[agencias] OFF
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (1, N'CHACHAPOYAS ', 1)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (2, N'BAGUA', 1)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (3, N'BONGARA', 1)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (4, N'CONDORCANQUI', 1)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (5, N'LUYA', 1)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (6, N'RODRIGUEZ DE MENDOZA', 1)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (7, N'UTCUBAMBA', 1)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (8, N'HUARAZ', 2)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (9, N'AIJA', 2)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (10, N'ANTONIO RAYMONDI', 2)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (11, N'ASUNCION', 2)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (12, N'BOLOGNESI', 2)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (13, N'CARHUAZ', 2)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (14, N'CARLOS FERMIN FITZCARRALD', 2)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (15, N'CASMA', 2)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (16, N'CORONGO', 2)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (17, N'HUARI', 2)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (18, N'HUARMEY', 2)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (19, N'HUAYLAS', 2)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (20, N'MARISCAL LUZURIAGA', 2)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (21, N'OCROS', 2)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (22, N'PALLASCA', 2)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (23, N'POMABAMBA', 2)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (24, N'RECUAY', 2)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (25, N'SANTA', 2)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (26, N'SIHUAS', 2)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (27, N'YUNGAY', 2)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (28, N'ABANCAY', 3)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (29, N'ANDAHUAYLAS', 3)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (30, N'ANTABAMBA', 3)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (31, N'AYMARAES', 3)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (32, N'COTABAMBAS', 3)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (33, N'CHINCHEROS', 3)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (34, N'GRAU', 3)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (35, N'AREQUIPA', 4)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (36, N'CAMANA', 4)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (37, N'CARAVELI', 4)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (38, N'CASTILLA', 4)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (39, N'CAYLLOMA', 4)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (40, N'CONDESUYOS', 4)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (41, N'ISLAY', 4)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (42, N'LA UNION', 4)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (43, N'HUAMANGA', 5)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (44, N'CANGALLO', 5)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (45, N'HUANCA SANCOS', 5)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (46, N'HUANTA', 5)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (47, N'LA MAR', 5)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (48, N'LUCANAS', 5)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (49, N'PARINACOCHAS', 5)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (50, N'PAUCAR DEL SARA SARA', 5)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (51, N'SUCRE', 5)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (52, N'VICTOR FAJARDO', 5)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (53, N'VILCAS HUAMAN', 5)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (54, N'CAJAMARCA', 6)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (55, N'CAJABAMBA', 6)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (56, N'CELENDIN', 6)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (57, N'CHOTA ', 6)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (58, N'CONTUMAZA', 6)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (59, N'CUTERVO', 6)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (60, N'HUALGAYOC', 6)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (61, N'JAEN', 6)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (62, N'SAN IGNACIO', 6)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (63, N'SAN MARCOS', 6)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (64, N'SAN PABLO', 6)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (65, N'SANTA CRUZ', 6)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (66, N'CALLAO', 7)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (67, N'CUSCO', 8)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (68, N'ACOMAYO', 8)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (69, N'ANTA', 8)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (70, N'CALCA', 8)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (71, N'CANAS', 8)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (72, N'CANCHIS', 8)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (73, N'CHUMBIVILCAS', 8)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (74, N'ESPINAR', 8)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (75, N'LA CONVENCION', 8)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (76, N'PARURO', 8)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (77, N'PAUCARTAMBO', 8)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (78, N'QUISPICANCHI', 8)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (79, N'URUBAMBA', 8)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (80, N'HUANCAVELICA', 9)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (81, N'ACOBAMBA', 9)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (82, N'ANGARAES', 9)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (83, N'CASTROVIRREYNA', 9)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (84, N'CHURCAMPA', 9)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (85, N'HUAYTARA', 9)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (86, N'TAYACAJA', 9)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (87, N'HUANUCO', 10)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (88, N'AMBO', 10)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (89, N'DOS DE MAYO', 10)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (90, N'HUACAYBAMBA', 10)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (91, N'HUAMALIES', 10)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (92, N'LEONCIO PRADO', 10)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (93, N'MARA&Ntilde;ON', 10)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (94, N'PACHITEA', 10)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (95, N'PUERTO INCA', 10)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (96, N'LAURICOCHA', 10)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (97, N'YAROWILCA', 10)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (98, N'ICA', 11)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (99, N'CHINCHA', 11)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (100, N'NAZCA', 11)
GO
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (101, N'PALPA', 11)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (102, N'PISCO', 11)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (103, N'HUANCAYO', 12)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (104, N'CONCEPCION', 12)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (105, N'CHANCHAMAYO', 12)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (106, N'JAUJA', 12)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (107, N'JUNIN', 12)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (108, N'SATIPO', 12)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (109, N'TARMA', 12)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (110, N'YAULI', 12)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (111, N'CHUPACA', 12)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (112, N'TRUJILLO', 13)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (113, N'ASCOPE', 13)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (114, N'BOLIVAR', 13)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (115, N'CHEPEN', 13)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (116, N'JULCAN', 13)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (117, N'OTUZCO', 13)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (118, N'PACASMAYO', 13)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (119, N'PATAZ', 13)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (120, N'SANCHEZ CARRION', 13)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (121, N'SANTIAGO DE CHUCO', 13)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (122, N'GRAN CHIMU', 13)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (123, N'VIRU', 13)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (124, N'CHICLAYO', 14)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (125, N'FERRE&Ntilde;AFE', 14)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (126, N'LAMBAYEQUE', 14)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (127, N'LIMA', 15)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (128, N'BARRANCA', 15)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (129, N'CAJATAMBO', 15)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (130, N'CANTA', 15)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (131, N'CA&Ntilde;ETE', 15)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (132, N'HUARAL', 15)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (133, N'HUAROCHIRI', 15)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (134, N'HUAURA', 15)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (135, N'OYON', 15)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (136, N'YAUYOS', 15)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (137, N'MAYNAS', 16)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (138, N'ALTO AMAZONAS', 16)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (139, N'LORETO', 16)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (140, N'MARISCAL RAMON CASTILLA', 16)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (141, N'REQUENA', 16)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (142, N'UCAYALI', 16)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (143, N'TAMBOPATA', 17)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (144, N'MANU', 17)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (145, N'TAHUAMANU', 17)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (146, N'MARISCAL NIETO', 18)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (147, N'GENERAL SANCHEZ CERRO', 18)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (148, N'ILO', 18)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (149, N'PASCO', 19)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (150, N'DANIEL ALCIDES CARRION', 19)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (151, N'OXAPAMPA', 19)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (152, N'PIURA', 20)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (153, N'AYABACA', 20)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (154, N'HUANCABAMBA', 20)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (155, N'MORROPON', 20)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (156, N'PAITA', 20)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (157, N'SULLANA', 20)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (158, N'TALARA', 20)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (159, N'SECHURA', 20)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (160, N'PUNO', 21)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (161, N'AZANGARO', 21)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (162, N'CARABAYA', 21)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (163, N'CHUCUITO', 21)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (164, N'EL COLLAO', 21)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (165, N'HUANCANE', 21)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (166, N'LAMPA', 21)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (167, N'MELGAR', 21)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (168, N'MOHO', 21)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (169, N'SAN ANTONIO DE PUTINA', 21)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (170, N'SAN ROMAN', 21)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (171, N'SANDIA', 21)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (172, N'YUNGUYO', 21)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (173, N'MOYOBAMBA', 22)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (174, N'BELLAVISTA', 22)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (175, N'EL DORADO', 22)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (176, N'HUALLAGA', 22)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (177, N'LAMAS', 22)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (178, N'MARISCAL CACERES', 22)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (179, N'PICOTA', 22)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (180, N'RIOJA', 22)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (181, N'SAN MARTIN', 22)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (182, N'TOCACHE', 22)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (183, N'TACNA', 23)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (184, N'CANDARAVE', 23)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (185, N'JORGE BASADRE', 23)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (186, N'TARATA', 23)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (187, N'TUMBES', 24)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (188, N'CONTRALMIRANTE VILLAR', 24)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (189, N'ZARUMILLA', 24)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (190, N'CORONEL PORTILLO', 25)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (191, N'ATALAYA', 25)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (192, N'PADRE ABAD', 25)
INSERT [dbo].[ciudades] ([ciudad_id], [ciudad_name], [departamento_id]) VALUES (193, N'PURUS', 25)
SET IDENTITY_INSERT [dbo].[cronograma_transportes] ON 

INSERT [dbo].[cronograma_transportes] ([cronograma_transporte_id], [cronograma_fecha], [transporte_id], [cronograma_fecha_regreso]) VALUES (1, CAST(N'2017-09-21' AS Date), 1, CAST(N'2017-09-23' AS Date))
INSERT [dbo].[cronograma_transportes] ([cronograma_transporte_id], [cronograma_fecha], [transporte_id], [cronograma_fecha_regreso]) VALUES (2, CAST(N'2017-08-18' AS Date), 2, CAST(N'2017-08-20' AS Date))
INSERT [dbo].[cronograma_transportes] ([cronograma_transporte_id], [cronograma_fecha], [transporte_id], [cronograma_fecha_regreso]) VALUES (3, CAST(N'2018-01-19' AS Date), 3, CAST(N'2018-01-21' AS Date))
INSERT [dbo].[cronograma_transportes] ([cronograma_transporte_id], [cronograma_fecha], [transporte_id], [cronograma_fecha_regreso]) VALUES (4, CAST(N'2017-09-15' AS Date), 2, CAST(N'2018-01-19' AS Date))
SET IDENTITY_INSERT [dbo].[cronograma_transportes] OFF
INSERT [dbo].[departamentos] ([id], [departamento]) VALUES (1, N'AMAZONAS')
INSERT [dbo].[departamentos] ([id], [departamento]) VALUES (2, N'ANCASH')
INSERT [dbo].[departamentos] ([id], [departamento]) VALUES (3, N'APURIMAC')
INSERT [dbo].[departamentos] ([id], [departamento]) VALUES (4, N'AREQUIPA')
INSERT [dbo].[departamentos] ([id], [departamento]) VALUES (5, N'AYACUCHO')
INSERT [dbo].[departamentos] ([id], [departamento]) VALUES (6, N'CAJAMARCA')
INSERT [dbo].[departamentos] ([id], [departamento]) VALUES (7, N'CALLAO')
INSERT [dbo].[departamentos] ([id], [departamento]) VALUES (8, N'CUSCO')
INSERT [dbo].[departamentos] ([id], [departamento]) VALUES (9, N'HUANCAVELICA')
INSERT [dbo].[departamentos] ([id], [departamento]) VALUES (10, N'HUANUCO')
INSERT [dbo].[departamentos] ([id], [departamento]) VALUES (11, N'ICA')
INSERT [dbo].[departamentos] ([id], [departamento]) VALUES (12, N'JUNIN')
INSERT [dbo].[departamentos] ([id], [departamento]) VALUES (13, N'LA LIBERTAD')
INSERT [dbo].[departamentos] ([id], [departamento]) VALUES (14, N'LAMBAYEQUE')
INSERT [dbo].[departamentos] ([id], [departamento]) VALUES (15, N'LIMA')
INSERT [dbo].[departamentos] ([id], [departamento]) VALUES (16, N'LORETO')
INSERT [dbo].[departamentos] ([id], [departamento]) VALUES (17, N'MADRE DE DIOS')
INSERT [dbo].[departamentos] ([id], [departamento]) VALUES (18, N'MOQUEGUA')
INSERT [dbo].[departamentos] ([id], [departamento]) VALUES (19, N'PASCO')
INSERT [dbo].[departamentos] ([id], [departamento]) VALUES (20, N'PIURA')
INSERT [dbo].[departamentos] ([id], [departamento]) VALUES (21, N'PUNO')
INSERT [dbo].[departamentos] ([id], [departamento]) VALUES (22, N'SAN MARTIN')
INSERT [dbo].[departamentos] ([id], [departamento]) VALUES (23, N'TACNA')
INSERT [dbo].[departamentos] ([id], [departamento]) VALUES (24, N'TUMBES')
INSERT [dbo].[departamentos] ([id], [departamento]) VALUES (25, N'UCAYALI')
SET IDENTITY_INSERT [dbo].[hoteles] ON 

INSERT [dbo].[hoteles] ([hotel_id], [hotel_description], [hotel_precio_uni], [origen_ciudad_id], [agencia_id]) VALUES (1, N'HotelitosBaja', CAST(10.00 AS Decimal(18, 2)), 4, 2)
INSERT [dbo].[hoteles] ([hotel_id], [hotel_description], [hotel_precio_uni], [origen_ciudad_id], [agencia_id]) VALUES (2, N'other hotel', CAST(32.00 AS Decimal(18, 2)), 7, 2)
INSERT [dbo].[hoteles] ([hotel_id], [hotel_description], [hotel_precio_uni], [origen_ciudad_id], [agencia_id]) VALUES (3, N'mismo hotel', CAST(19.00 AS Decimal(18, 2)), 29, 2)
INSERT [dbo].[hoteles] ([hotel_id], [hotel_description], [hotel_precio_uni], [origen_ciudad_id], [agencia_id]) VALUES (4, N'HOtelos', CAST(30.00 AS Decimal(18, 2)), 87, 4)
INSERT [dbo].[hoteles] ([hotel_id], [hotel_description], [hotel_precio_uni], [origen_ciudad_id], [agencia_id]) VALUES (5, N'HOtees', CAST(10.00 AS Decimal(18, 2)), 117, 9)
INSERT [dbo].[hoteles] ([hotel_id], [hotel_description], [hotel_precio_uni], [origen_ciudad_id], [agencia_id]) VALUES (6, N'Hotek End', CAST(40.00 AS Decimal(18, 2)), 138, 10)
SET IDENTITY_INSERT [dbo].[hoteles] OFF
SET IDENTITY_INSERT [dbo].[pasajeros] ON 

INSERT [dbo].[pasajeros] ([pasajero_id], [pasajero_dni], [pasajero_name], [pasajero_last_name], [pasajero_edad], [pasajero_status]) VALUES (1, N'753445434', N'Bryan', N'Bryan', 32, N'ACTIVE')
INSERT [dbo].[pasajeros] ([pasajero_id], [pasajero_dni], [pasajero_name], [pasajero_last_name], [pasajero_edad], [pasajero_status]) VALUES (2, N'874534545', N'Lizana', N'Gonzales', 32, N'ACTIVE')
INSERT [dbo].[pasajeros] ([pasajero_id], [pasajero_dni], [pasajero_name], [pasajero_last_name], [pasajero_edad], [pasajero_status]) VALUES (3, N'758378234', N'Otro VBrya', N'Otro VBrya', 45, N'ACTIVE')
SET IDENTITY_INSERT [dbo].[pasajeros] OFF
SET IDENTITY_INSERT [dbo].[transporte_clase] ON 

INSERT [dbo].[transporte_clase] ([transporte_clase_id], [transporte_id], [transporte_clase_costo_pasaje], [transporte_clase_typo_pasaje], [transporte_clase_asientos]) VALUES (1, 1, CAST(10.50 AS Decimal(10, 2)), N'DEFAULT', 10)
INSERT [dbo].[transporte_clase] ([transporte_clase_id], [transporte_id], [transporte_clase_costo_pasaje], [transporte_clase_typo_pasaje], [transporte_clase_asientos]) VALUES (2, 1, CAST(45.00 AS Decimal(10, 2)), N'PREMIUN', 10)
INSERT [dbo].[transporte_clase] ([transporte_clase_id], [transporte_id], [transporte_clase_costo_pasaje], [transporte_clase_typo_pasaje], [transporte_clase_asientos]) VALUES (3, 2, CAST(20.30 AS Decimal(10, 2)), N'DEFAULT', 188)
INSERT [dbo].[transporte_clase] ([transporte_clase_id], [transporte_id], [transporte_clase_costo_pasaje], [transporte_clase_typo_pasaje], [transporte_clase_asientos]) VALUES (4, 2, CAST(187.78 AS Decimal(10, 2)), N'PREMIUN', 7)
INSERT [dbo].[transporte_clase] ([transporte_clase_id], [transporte_id], [transporte_clase_costo_pasaje], [transporte_clase_typo_pasaje], [transporte_clase_asientos]) VALUES (5, 3, CAST(23.31 AS Decimal(10, 2)), N'DEFAULT', 20)
INSERT [dbo].[transporte_clase] ([transporte_clase_id], [transporte_id], [transporte_clase_costo_pasaje], [transporte_clase_typo_pasaje], [transporte_clase_asientos]) VALUES (6, 3, CAST(40.50 AS Decimal(10, 2)), N'PREMIUN', 10)
INSERT [dbo].[transporte_clase] ([transporte_clase_id], [transporte_id], [transporte_clase_costo_pasaje], [transporte_clase_typo_pasaje], [transporte_clase_asientos]) VALUES (7, 4, CAST(30.00 AS Decimal(10, 2)), N'PREMIUN', 10)
INSERT [dbo].[transporte_clase] ([transporte_clase_id], [transporte_id], [transporte_clase_costo_pasaje], [transporte_clase_typo_pasaje], [transporte_clase_asientos]) VALUES (8, 4, CAST(23.00 AS Decimal(10, 2)), N'DEFAULT', 10)
INSERT [dbo].[transporte_clase] ([transporte_clase_id], [transporte_id], [transporte_clase_costo_pasaje], [transporte_clase_typo_pasaje], [transporte_clase_asientos]) VALUES (9, 5, CAST(100.00 AS Decimal(10, 2)), N'DEFAULT', 100)
INSERT [dbo].[transporte_clase] ([transporte_clase_id], [transporte_id], [transporte_clase_costo_pasaje], [transporte_clase_typo_pasaje], [transporte_clase_asientos]) VALUES (10, 5, CAST(200.00 AS Decimal(10, 2)), N'PREMIUN', 10)
SET IDENTITY_INSERT [dbo].[transporte_clase] OFF
SET IDENTITY_INSERT [dbo].[transportes] ON 

INSERT [dbo].[transportes] ([transporte_id], [agencia_id], [origen_ciudad_id], [destino_ciudad_id], [type_transporte], [transporte_status]) VALUES (1, 2, 4, 98, N'AVION', N'ACTIVE')
INSERT [dbo].[transportes] ([transporte_id], [agencia_id], [origen_ciudad_id], [destino_ciudad_id], [type_transporte], [transporte_status]) VALUES (2, 4, 2, 29, N'CRUCERO', N'ACTIVE')
INSERT [dbo].[transportes] ([transporte_id], [agencia_id], [origen_ciudad_id], [destino_ciudad_id], [type_transporte], [transporte_status]) VALUES (3, 9, 38, 55, N'BUS', N'ACTIVE')
INSERT [dbo].[transportes] ([transporte_id], [agencia_id], [origen_ciudad_id], [destino_ciudad_id], [type_transporte], [transporte_status]) VALUES (4, 8, 163, 183, N'CRUCERO', N'ACTIVE')
INSERT [dbo].[transportes] ([transporte_id], [agencia_id], [origen_ciudad_id], [destino_ciudad_id], [type_transporte], [transporte_status]) VALUES (5, 2, 176, 193, N'CRUCERO', N'ACTIVE')
SET IDENTITY_INSERT [dbo].[transportes] OFF
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([user_id], [user_pass], [user_type], [user_dni], [user_status]) VALUES (1, N'123', N'ROOT', N'123123123', N'ACTIVE')
INSERT [dbo].[users] ([user_id], [user_pass], [user_type], [user_dni], [user_status]) VALUES (2, N'123', N'AREAVENTAS', N'ventas', N'ACTIVE')
INSERT [dbo].[users] ([user_id], [user_pass], [user_type], [user_dni], [user_status]) VALUES (3, N'123', N'AREAREGISTROS', N'registros', N'ACTIVE')
INSERT [dbo].[users] ([user_id], [user_pass], [user_type], [user_dni], [user_status]) VALUES (4, N'123', N'AREAREPORTES', N'reportes', N'ACTIVE')
INSERT [dbo].[users] ([user_id], [user_pass], [user_type], [user_dni], [user_status]) VALUES (5, N'123', N'AREAUSUARIOS', N'users', N'ACTIVE')
SET IDENTITY_INSERT [dbo].[users] OFF
SET IDENTITY_INSERT [dbo].[venta_detelles] ON 

INSERT [dbo].[venta_detelles] ([vendet_id], [vendet_cost_uni], [vendet_status], [pasajero_id], [venta_id], [transporte_clase_id]) VALUES (1, CAST(45.00 AS Decimal(10, 2)), N'ACTIVO', 1, 1, 2)
INSERT [dbo].[venta_detelles] ([vendet_id], [vendet_cost_uni], [vendet_status], [pasajero_id], [venta_id], [transporte_clase_id]) VALUES (2, CAST(45.00 AS Decimal(10, 2)), N'ACTIVO', 2, 1, 2)
INSERT [dbo].[venta_detelles] ([vendet_id], [vendet_cost_uni], [vendet_status], [pasajero_id], [venta_id], [transporte_clase_id]) VALUES (3, CAST(45.00 AS Decimal(10, 2)), N'ACTIVO', 2, 2, 2)
INSERT [dbo].[venta_detelles] ([vendet_id], [vendet_cost_uni], [vendet_status], [pasajero_id], [venta_id], [transporte_clase_id]) VALUES (4, CAST(45.00 AS Decimal(10, 2)), N'ACTIVO', 2, 4, 2)
INSERT [dbo].[venta_detelles] ([vendet_id], [vendet_cost_uni], [vendet_status], [pasajero_id], [venta_id], [transporte_clase_id]) VALUES (5, CAST(45.00 AS Decimal(10, 2)), N'ACTIVO', 2, 6, 2)
INSERT [dbo].[venta_detelles] ([vendet_id], [vendet_cost_uni], [vendet_status], [pasajero_id], [venta_id], [transporte_clase_id]) VALUES (6, CAST(187.78 AS Decimal(10, 2)), N'ACTIVO', 2, 8, 4)
INSERT [dbo].[venta_detelles] ([vendet_id], [vendet_cost_uni], [vendet_status], [pasajero_id], [venta_id], [transporte_clase_id]) VALUES (7, CAST(187.78 AS Decimal(10, 2)), N'ACTIVO', 3, 9, 4)
INSERT [dbo].[venta_detelles] ([vendet_id], [vendet_cost_uni], [vendet_status], [pasajero_id], [venta_id], [transporte_clase_id]) VALUES (8, CAST(187.78 AS Decimal(10, 2)), N'ACTIVO', 3, 9, 4)
SET IDENTITY_INSERT [dbo].[venta_detelles] OFF
SET IDENTITY_INSERT [dbo].[ventas] ON 

INSERT [dbo].[ventas] ([ventas_id], [venta_date_reserva], [venta_date_venta], [venta_status], [venta_code], [fecha_partida_cronograma_transpote_id], [user_id], [comprador_pasajero_id], [transporte_id], [hotel_id], [venta_sub_total], [venta_total]) VALUES (1, NULL, NULL, N'ENPROCESO', N'VENTA1', NULL, 2, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[ventas] ([ventas_id], [venta_date_reserva], [venta_date_venta], [venta_status], [venta_code], [fecha_partida_cronograma_transpote_id], [user_id], [comprador_pasajero_id], [transporte_id], [hotel_id], [venta_sub_total], [venta_total]) VALUES (2, NULL, NULL, N'ENPROCESO', N'VENTA2', NULL, 2, 2, 1, NULL, NULL, NULL)
INSERT [dbo].[ventas] ([ventas_id], [venta_date_reserva], [venta_date_venta], [venta_status], [venta_code], [fecha_partida_cronograma_transpote_id], [user_id], [comprador_pasajero_id], [transporte_id], [hotel_id], [venta_sub_total], [venta_total]) VALUES (3, NULL, NULL, N'ENPROCESO', N'VENTA3', NULL, 2, 2, 1, NULL, NULL, NULL)
INSERT [dbo].[ventas] ([ventas_id], [venta_date_reserva], [venta_date_venta], [venta_status], [venta_code], [fecha_partida_cronograma_transpote_id], [user_id], [comprador_pasajero_id], [transporte_id], [hotel_id], [venta_sub_total], [venta_total]) VALUES (4, NULL, NULL, N'ENPROCESO', N'VENTA4', NULL, 2, 2, 1, NULL, NULL, NULL)
INSERT [dbo].[ventas] ([ventas_id], [venta_date_reserva], [venta_date_venta], [venta_status], [venta_code], [fecha_partida_cronograma_transpote_id], [user_id], [comprador_pasajero_id], [transporte_id], [hotel_id], [venta_sub_total], [venta_total]) VALUES (5, NULL, NULL, N'ENPROCESO', N'VENTA5', NULL, 2, 2, 2, NULL, NULL, NULL)
INSERT [dbo].[ventas] ([ventas_id], [venta_date_reserva], [venta_date_venta], [venta_status], [venta_code], [fecha_partida_cronograma_transpote_id], [user_id], [comprador_pasajero_id], [transporte_id], [hotel_id], [venta_sub_total], [venta_total]) VALUES (6, CAST(N'2017-05-25' AS Date), CAST(N'2017-05-25' AS Date), N'COMPLETADO', N'VENTA6', 1, 2, 2, 1, NULL, N'45.00', N'53.10')
INSERT [dbo].[ventas] ([ventas_id], [venta_date_reserva], [venta_date_venta], [venta_status], [venta_code], [fecha_partida_cronograma_transpote_id], [user_id], [comprador_pasajero_id], [transporte_id], [hotel_id], [venta_sub_total], [venta_total]) VALUES (7, NULL, NULL, N'ENPROCESO', N'VENTA7', NULL, 2, 2, 2, NULL, NULL, NULL)
INSERT [dbo].[ventas] ([ventas_id], [venta_date_reserva], [venta_date_venta], [venta_status], [venta_code], [fecha_partida_cronograma_transpote_id], [user_id], [comprador_pasajero_id], [transporte_id], [hotel_id], [venta_sub_total], [venta_total]) VALUES (8, CAST(N'2017-05-25' AS Date), CAST(N'2017-05-25' AS Date), N'COMPLETADO', N'VENTA8', 4, 2, 2, 2, NULL, N'187.78', NULL)
INSERT [dbo].[ventas] ([ventas_id], [venta_date_reserva], [venta_date_venta], [venta_status], [venta_code], [fecha_partida_cronograma_transpote_id], [user_id], [comprador_pasajero_id], [transporte_id], [hotel_id], [venta_sub_total], [venta_total]) VALUES (9, CAST(N'2017-05-25' AS Date), CAST(N'2017-05-25' AS Date), N'COMPLETADO', N'VENTA9', 2, 2, 3, 2, 5, N'375.56', N'443.1608')
SET IDENTITY_INSERT [dbo].[ventas] OFF
ALTER TABLE [dbo].[cronograma_transportes]  WITH CHECK ADD  CONSTRAINT [fk_cronograma_transportes_transportes_1] FOREIGN KEY([transporte_id])
REFERENCES [dbo].[transportes] ([transporte_id])
GO
ALTER TABLE [dbo].[cronograma_transportes] CHECK CONSTRAINT [fk_cronograma_transportes_transportes_1]
GO
ALTER TABLE [dbo].[hoteles]  WITH CHECK ADD  CONSTRAINT [fk_hoteles_agencias_1] FOREIGN KEY([agencia_id])
REFERENCES [dbo].[agencias] ([agencia_id])
GO
ALTER TABLE [dbo].[hoteles] CHECK CONSTRAINT [fk_hoteles_agencias_1]
GO
ALTER TABLE [dbo].[hoteles]  WITH CHECK ADD  CONSTRAINT [fk_hoteles_ciudades_1] FOREIGN KEY([origen_ciudad_id])
REFERENCES [dbo].[ciudades] ([ciudad_id])
GO
ALTER TABLE [dbo].[hoteles] CHECK CONSTRAINT [fk_hoteles_ciudades_1]
GO
ALTER TABLE [dbo].[transporte_clase]  WITH CHECK ADD  CONSTRAINT [fk_transporte_clase_transportes_1] FOREIGN KEY([transporte_id])
REFERENCES [dbo].[transportes] ([transporte_id])
GO
ALTER TABLE [dbo].[transporte_clase] CHECK CONSTRAINT [fk_transporte_clase_transportes_1]
GO
ALTER TABLE [dbo].[transportes]  WITH CHECK ADD  CONSTRAINT [fk_transportes_agencias_1] FOREIGN KEY([agencia_id])
REFERENCES [dbo].[agencias] ([agencia_id])
GO
ALTER TABLE [dbo].[transportes] CHECK CONSTRAINT [fk_transportes_agencias_1]
GO
ALTER TABLE [dbo].[transportes]  WITH CHECK ADD  CONSTRAINT [fk_transportes_ciudades_1] FOREIGN KEY([origen_ciudad_id])
REFERENCES [dbo].[ciudades] ([ciudad_id])
GO
ALTER TABLE [dbo].[transportes] CHECK CONSTRAINT [fk_transportes_ciudades_1]
GO
ALTER TABLE [dbo].[transportes]  WITH CHECK ADD  CONSTRAINT [fk_transportes_ciudades_2] FOREIGN KEY([destino_ciudad_id])
REFERENCES [dbo].[ciudades] ([ciudad_id])
GO
ALTER TABLE [dbo].[transportes] CHECK CONSTRAINT [fk_transportes_ciudades_2]
GO
ALTER TABLE [dbo].[venta_detelles]  WITH CHECK ADD  CONSTRAINT [fk_venta_detelles_pasajeros_1] FOREIGN KEY([pasajero_id])
REFERENCES [dbo].[pasajeros] ([pasajero_id])
GO
ALTER TABLE [dbo].[venta_detelles] CHECK CONSTRAINT [fk_venta_detelles_pasajeros_1]
GO
ALTER TABLE [dbo].[venta_detelles]  WITH CHECK ADD  CONSTRAINT [fk_venta_detelles_transporte_clase_1] FOREIGN KEY([transporte_clase_id])
REFERENCES [dbo].[transporte_clase] ([transporte_clase_id])
GO
ALTER TABLE [dbo].[venta_detelles] CHECK CONSTRAINT [fk_venta_detelles_transporte_clase_1]
GO
ALTER TABLE [dbo].[venta_detelles]  WITH CHECK ADD  CONSTRAINT [fk_venta_detelles_ventas_1] FOREIGN KEY([venta_id])
REFERENCES [dbo].[ventas] ([ventas_id])
GO
ALTER TABLE [dbo].[venta_detelles] CHECK CONSTRAINT [fk_venta_detelles_ventas_1]
GO
ALTER TABLE [dbo].[ventas]  WITH CHECK ADD  CONSTRAINT [fk_ventas_hoteles_1] FOREIGN KEY([hotel_id])
REFERENCES [dbo].[hoteles] ([hotel_id])
GO
ALTER TABLE [dbo].[ventas] CHECK CONSTRAINT [fk_ventas_hoteles_1]
GO
ALTER TABLE [dbo].[ventas]  WITH CHECK ADD  CONSTRAINT [fk_ventas_pasajeros_1] FOREIGN KEY([comprador_pasajero_id])
REFERENCES [dbo].[pasajeros] ([pasajero_id])
GO
ALTER TABLE [dbo].[ventas] CHECK CONSTRAINT [fk_ventas_pasajeros_1]
GO
ALTER TABLE [dbo].[ventas]  WITH CHECK ADD  CONSTRAINT [fk_ventas_transportes_1] FOREIGN KEY([transporte_id])
REFERENCES [dbo].[transportes] ([transporte_id])
GO
ALTER TABLE [dbo].[ventas] CHECK CONSTRAINT [fk_ventas_transportes_1]
GO
ALTER TABLE [dbo].[ventas]  WITH CHECK ADD  CONSTRAINT [fk_ventas_users_1] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[ventas] CHECK CONSTRAINT [fk_ventas_users_1]
GO
/****** Object:  StoredProcedure [dbo].[sp_Delete_agencias]    Script Date: 25/05/2017 11:26:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

------------------------------------- 
create procedure [dbo].[sp_Delete_agencias] ( 
@agencia_id int ) AS 
begin 
DELETE agencias WHERE agencia_id = @agencia_id 
end 



GO
/****** Object:  StoredProcedure [dbo].[sp_Delete_ciudades]    Script Date: 25/05/2017 11:26:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

------------------------------------- 
create procedure [dbo].[sp_Delete_ciudades] ( 
@ciudad_id int ) AS 
begin 
DELETE ciudades WHERE ciudad_id = @ciudad_id 
end 



GO
/****** Object:  StoredProcedure [dbo].[sp_Delete_cronograma_transportes]    Script Date: 25/05/2017 11:26:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

------------------------------------- 
create procedure [dbo].[sp_Delete_cronograma_transportes] ( 
@cronograma_transporte_id int ) AS 
begin 
DELETE cronograma_transportes WHERE cronograma_transporte_id = @cronograma_transporte_id 
end 



GO
/****** Object:  StoredProcedure [dbo].[sp_Delete_hoteles]    Script Date: 25/05/2017 11:26:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

------------------------------------- 
create procedure [dbo].[sp_Delete_hoteles] ( 
@hotel_id int ) AS 
begin 
DELETE hoteles WHERE hotel_id = @hotel_id 
end 



GO
/****** Object:  StoredProcedure [dbo].[sp_Delete_pasajeros]    Script Date: 25/05/2017 11:26:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

------------------------------------- 
create procedure [dbo].[sp_Delete_pasajeros] ( 
@pasajero_id int ) AS 
begin 
DELETE pasajeros WHERE pasajero_id = @pasajero_id 
end 



GO
/****** Object:  StoredProcedure [dbo].[sp_Delete_transporte_clase]    Script Date: 25/05/2017 11:26:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

------------------------------------- 
create procedure [dbo].[sp_Delete_transporte_clase] ( 
@transporte_clase_id int ) AS 
begin 
DELETE transporte_clase WHERE transporte_clase_id = @transporte_clase_id 
end 



GO
/****** Object:  StoredProcedure [dbo].[sp_Delete_transportes]    Script Date: 25/05/2017 11:26:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

------------------------------------- 
create procedure [dbo].[sp_Delete_transportes] ( 
@transporte_id int ) AS 
begin 
DELETE transportes WHERE transporte_id = @transporte_id 
end 



GO
/****** Object:  StoredProcedure [dbo].[sp_Delete_users]    Script Date: 25/05/2017 11:26:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

------------------------------------- 
create procedure [dbo].[sp_Delete_users] ( 
@user_id int ) AS 
begin 
DELETE users WHERE user_id = @user_id 
end 



GO
/****** Object:  StoredProcedure [dbo].[sp_Delete_venta_detelles]    Script Date: 25/05/2017 11:26:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

------------------------------------- 
create procedure [dbo].[sp_Delete_venta_detelles] ( 
@vendet_id int ) AS 
begin 
DELETE venta_detelles WHERE vendet_id = @vendet_id 
end 



GO
/****** Object:  StoredProcedure [dbo].[sp_Delete_ventas]    Script Date: 25/05/2017 11:26:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

------------------------------------- 
create procedure [dbo].[sp_Delete_ventas] ( 
@ventas_id int ) AS 
begin 
DELETE ventas WHERE ventas_id = @ventas_id 
end 



GO
/****** Object:  StoredProcedure [dbo].[sp_Get_id_transporte_class]    Script Date: 25/05/2017 11:26:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_Get_id_transporte_class] ( 
@transporte_id int , 
@transporte_clase_typo_pasaje varchar(255)) AS 
begin 
SELECT transporte_clase_id FROM transporte_clase WHERE transporte_id = @transporte_id AND transporte_clase_typo_pasaje = @transporte_clase_typo_pasaje
end 




GO
/****** Object:  StoredProcedure [dbo].[sp_Get_last_code_venta]    Script Date: 25/05/2017 11:26:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_Get_last_code_venta]  AS 

DECLARE @code int

begin 

SELECT  @code =  MAX(ventas_id) FROM ventas;

if @code is NULL
	SET @code = 1
else
	SET @code += 1 

SELECT @code
 end



GO
/****** Object:  StoredProcedure [dbo].[sp_Get_last_id_pasajero]    Script Date: 25/05/2017 11:26:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_Get_last_id_pasajero] as
begin
SELECT Top 1 pasajero_id FROM  pasajeros ORDER by pasajero_id DESC
end



GO
/****** Object:  StoredProcedure [dbo].[sp_Get_last_id_venta]    Script Date: 25/05/2017 11:26:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_Get_last_id_venta] as
begin
SELECT Top 1 ventas_id FROM  ventas ORDER by ventas_id DESC
end



GO
/****** Object:  StoredProcedure [dbo].[sp_Get_precio_transporte_class]    Script Date: 25/05/2017 11:26:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_Get_precio_transporte_class] ( 
@transporte_clase_id int  ) AS 
begin 
SELECT transporte_clase_costo_pasaje FROM transporte_clase WHERE  transporte_clase_id = @transporte_clase_id
end 




GO
/****** Object:  StoredProcedure [dbo].[sp_Get_total_venta]    Script Date: 25/05/2017 11:26:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_Get_total_venta]( @ventas_id int  )AS
begin 

SELECT SUM(vendet_cost_uni) as total from venta_detelles where venta_id = @ventas_id
 
 end



GO
/****** Object:  StoredProcedure [dbo].[sp_Insert_agencias]    Script Date: 25/05/2017 11:26:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ------------------------------------- 
-- public string Transporte_clase_id {get;set;} 
-- public string Transporte_id {get;set;} 
-- public string Transporte_clase_costo_pasaje {get;set;} 
-- public string Transporte_clase_typo_pasaje {get;set;} 
-- cmd.Parameters.Add("@transporte_clase_id", SqlDbType.Varchar,30).Value = transporte_clase.Transporte_clase_id;
-- cmd.Parameters.Add("@transporte_id", SqlDbType.Varchar,30).Value = transporte_clase.Transporte_id;
-- cmd.Parameters.Add("@transporte_clase_costo_pasaje", SqlDbType.Varchar,30).Value = transporte_clase.Transporte_clase_costo_pasaje;
-- cmd.Parameters.Add("@transporte_clase_typo_pasaje", SqlDbType.Varchar,30).Value = transporte_clase.Transporte_clase_typo_pasaje;


create procedure [dbo].[sp_Insert_agencias] ( 
@agencia_id int , 
@agencia_description varchar(255) , 
@agencia_phone varchar(20) , 
@agencia_mail varchar(70)) AS 
if @agencia_id = 0 
begin 
INSERT INTO agencias( agencia_description,agencia_phone,agencia_mail ) VALUES (@agencia_description,@agencia_phone,@agencia_mail) 
end 
else 
begin 
UPDATE agencias set agencia_description= @agencia_description,agencia_phone= @agencia_phone,agencia_mail= @agencia_mail WHERE agencia_id = @agencia_id 
end 



GO
/****** Object:  StoredProcedure [dbo].[sp_Insert_cronograma_transportes]    Script Date: 25/05/2017 11:26:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

------------------------------------- 
-- public string Agencia_id {get;set;} 
-- public string Agencia_description {get;set;} 
-- public string Agencia_phone {get;set;} 
-- public string Agencia_mail {get;set;} 
-- cmd.Parameters.Add("@agencia_id", SqlDbType.Varchar,30).Value = agencias.Agencia_id;
-- cmd.Parameters.Add("@agencia_description", SqlDbType.Varchar,30).Value = agencias.Agencia_description;
-- cmd.Parameters.Add("@agencia_phone", SqlDbType.Varchar,30).Value = agencias.Agencia_phone;
-- cmd.Parameters.Add("@agencia_mail", SqlDbType.Varchar,30).Value = agencias.Agencia_mail;


CREATE procedure [dbo].[sp_Insert_cronograma_transportes] ( 
@cronograma_transporte_id int , 
@cronograma_fecha date , 
@transporte_id int,
@cronograma_fecha_regreso date
) AS 
if @cronograma_transporte_id = 0 
begin 
INSERT INTO cronograma_transportes( cronograma_fecha,transporte_id,cronograma_fecha_regreso ) VALUES (@cronograma_fecha,@transporte_id,@cronograma_fecha_regreso) 
end 
else 
begin 
UPDATE cronograma_transportes set cronograma_fecha= @cronograma_fecha,transporte_id= @transporte_id,cronograma_fecha_regreso = @cronograma_fecha_regreso WHERE cronograma_transporte_id = @cronograma_transporte_id 
end 



GO
/****** Object:  StoredProcedure [dbo].[sp_Insert_hoteles]    Script Date: 25/05/2017 11:26:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

------------------------------------- 
-- public string Cronograma_transporte_id {get;set;} 
-- public string Cronograma_fecha {get;set;} 
-- public string Transporte_id {get;set;} 
-- cmd.Parameters.Add("@cronograma_transporte_id", SqlDbType.Varchar,30).Value = cronograma_transportes.Cronograma_transporte_id;
-- cmd.Parameters.Add("@cronograma_fecha", SqlDbType.Varchar,30).Value = cronograma_transportes.Cronograma_fecha;
-- cmd.Parameters.Add("@transporte_id", SqlDbType.Varchar,30).Value = cronograma_transportes.Transporte_id;


CREATE procedure [dbo].[sp_Insert_hoteles] ( 
@hotel_id int , 
@hotel_description varchar(255) , 
@hotel_precio_uni decimal(18,2) , 
@origen_ciudad_id int , 
@agencia_id int) AS 
if @hotel_id = 0 
begin 
INSERT INTO hoteles( hotel_description,hotel_precio_uni,origen_ciudad_id,agencia_id ) VALUES (@hotel_description,@hotel_precio_uni,@origen_ciudad_id,@agencia_id) 
end 
else 
begin 
UPDATE hoteles set hotel_description= @hotel_description,hotel_precio_uni= @hotel_precio_uni,origen_ciudad_id= @origen_ciudad_id,agencia_id= @agencia_id WHERE hotel_id = @hotel_id 
end 



GO
/****** Object:  StoredProcedure [dbo].[sp_Insert_pasajeros]    Script Date: 25/05/2017 11:26:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sp_Insert_pasajeros] ( 
@pasajero_id int , 
@pasajero_dni varchar(10) , 
@pasajero_name varchar(50) , 
@pasajero_last_name varchar(50) , 
@pasajero_edad int , 
@pasajero_status varchar(15)) AS 
if @pasajero_id = 0 
begin 
INSERT INTO pasajeros( pasajero_dni,pasajero_name,pasajero_last_name,pasajero_edad,pasajero_status ) VALUES (@pasajero_dni,@pasajero_name,@pasajero_last_name,@pasajero_edad,@pasajero_status) 
end 
else 
begin 
UPDATE pasajeros set  pasajero_dni= @pasajero_dni,pasajero_name= @pasajero_name,pasajero_last_name= @pasajero_last_name,pasajero_edad= @pasajero_edad,pasajero_status= @pasajero_status    WHERE pasajero_id = @pasajero_id 

end 



GO
/****** Object:  StoredProcedure [dbo].[sp_Insert_transporte_clase]    Script Date: 25/05/2017 11:26:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_Insert_transporte_clase] ( 
@transporte_clase_id int , 
@transporte_id int , 
@transporte_clase_costo_pasaje decimal(10,2) , 
@transporte_clase_typo_pasaje varchar(30),
@transporte_clase_asientos int
) AS 
if @transporte_clase_id = 0 
begin 
INSERT INTO transporte_clase( transporte_id,transporte_clase_costo_pasaje,transporte_clase_typo_pasaje,transporte_clase_asientos ) VALUES (@transporte_id,@transporte_clase_costo_pasaje,@transporte_clase_typo_pasaje,@transporte_clase_asientos) 
end 
else 
begin 
UPDATE transporte_clase set transporte_id= @transporte_id,transporte_clase_costo_pasaje= @transporte_clase_costo_pasaje,transporte_clase_typo_pasaje= @transporte_clase_typo_pasaje,transporte_clase_asientos =@transporte_clase_asientos WHERE transporte_clase_id = @transporte_clase_id 
end 




GO
/****** Object:  StoredProcedure [dbo].[sp_Insert_transportes]    Script Date: 25/05/2017 11:26:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

------------------------------------- 
-- public string Vendet_id {get;set;} 
-- public string Vendet_cost_uni {get;set;} 
-- public string Vendet_status {get;set;} 
-- public string Pasajero_id {get;set;} 
-- public string Venta_id {get;set;} 
-- public string Transporte_clase_id {get;set;} 
-- cmd.Parameters.Add("@vendet_id", SqlDbType.Varchar,30).Value = venta_detelles.Vendet_id;
-- cmd.Parameters.Add("@vendet_cost_uni", SqlDbType.Varchar,30).Value = venta_detelles.Vendet_cost_uni;
-- cmd.Parameters.Add("@vendet_status", SqlDbType.Varchar,30).Value = venta_detelles.Vendet_status;
-- cmd.Parameters.Add("@pasajero_id", SqlDbType.Varchar,30).Value = venta_detelles.Pasajero_id;
-- cmd.Parameters.Add("@venta_id", SqlDbType.Varchar,30).Value = venta_detelles.Venta_id;
-- cmd.Parameters.Add("@transporte_clase_id", SqlDbType.Varchar,30).Value = venta_detelles.Transporte_clase_id;



-----------
create procedure [dbo].[sp_Insert_transportes] ( 
@transporte_id int , 
@agencia_id int , 
@origen_ciudad_id int , 
@destino_ciudad_id int , 
@type_transporte varchar(50) , 
@transporte_status varchar(30)) AS 
if @transporte_id = 0 
begin 
INSERT INTO transportes(agencia_id,origen_ciudad_id,destino_ciudad_id,type_transporte,transporte_status ) VALUES (@agencia_id,@origen_ciudad_id,@destino_ciudad_id,@type_transporte,@transporte_status) 
end 
else 
begin 
UPDATE transportes set agencia_id= @agencia_id,origen_ciudad_id= @origen_ciudad_id,destino_ciudad_id= @destino_ciudad_id,type_transporte= @type_transporte,transporte_status= @transporte_status WHERE transporte_id = @transporte_id 
end 



GO
/****** Object:  StoredProcedure [dbo].[sp_Insert_users]    Script Date: 25/05/2017 11:26:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_Insert_users] ( 
@user_id int , 
@user_pass varchar(255) , 
@user_type varchar(255) , 
@user_dni varchar(255) , 
@user_status varchar(255)) AS 
if @user_id = 0 
begin 
INSERT INTO users( user_pass,user_type,user_dni,user_status ) VALUES (@user_pass,@user_type,@user_dni,@user_status) 
end 
else 
begin 
UPDATE users set user_pass= @user_pass,user_type= @user_type,user_dni= @user_dni,user_status= @user_status WHERE user_id = @user_id 
end 



GO
/****** Object:  StoredProcedure [dbo].[sp_Insert_venta_detelles]    Script Date: 25/05/2017 11:26:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_Insert_venta_detelles] ( 
@vendet_id int , 
@vendet_cost_uni decimal(10,2) , 
@vendet_status varchar(30) , 
@pasajero_id int , 
@venta_id int , 
@transporte_clase_id int) AS 
if @vendet_id = 0 
begin 
INSERT INTO venta_detelles( vendet_cost_uni,vendet_status,pasajero_id,venta_id,transporte_clase_id ) VALUES (@vendet_cost_uni,@vendet_status,@pasajero_id,@venta_id,@transporte_clase_id) 
UPDATE transporte_clase  SET transporte_clase_asientos = ( transporte_clase_asientos - 1) WHERE transporte_clase_id = @transporte_clase_id

end 
else 
begin 
UPDATE venta_detelles set vendet_cost_uni= @vendet_cost_uni,vendet_status= @vendet_status,pasajero_id= @pasajero_id,venta_id= @venta_id,transporte_clase_id= @transporte_clase_id WHERE vendet_id = @vendet_id 
end 




GO
/****** Object:  StoredProcedure [dbo].[sp_Insert_ventas]    Script Date: 25/05/2017 11:26:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sp_Insert_ventas] ( 
@ventas_id int , 
@venta_date_reserva date = null , 
@venta_date_venta date = null, 
@venta_status varchar(20) = null, 
@venta_code varchar(50) = null, 
@fecha_partida_cronograma_transpote_id int = null , 
@user_id int = null , 
@comprador_pasajero_id int = null , 
@transporte_id int = null , 
@hotel_id int = null, 
@venta_sub_total varchar(50) = null, 
@venta_total varchar(50) = null) AS 
if @ventas_id = 0 
begin 
INSERT INTO ventas( venta_date_reserva,venta_date_venta,venta_status,venta_code,fecha_partida_cronograma_transpote_id,user_id,comprador_pasajero_id,transporte_id,hotel_id,venta_sub_total,venta_total ) VALUES (@venta_date_reserva,@venta_date_venta,@venta_status,@venta_code,@fecha_partida_cronograma_transpote_id,@user_id,@comprador_pasajero_id,@transporte_id,@hotel_id,@venta_sub_total,@venta_total)
end 
else 
begin 
UPDATE ventas set venta_date_reserva= @venta_date_reserva,venta_date_venta= @venta_date_venta,venta_status= @venta_status,venta_code= @venta_code,fecha_partida_cronograma_transpote_id= @fecha_partida_cronograma_transpote_id,user_id= @user_id,comprador_pasajero_id= @comprador_pasajero_id,transporte_id= @transporte_id,hotel_id= @hotel_id,venta_sub_total= @venta_sub_total,venta_total= @venta_total WHERE ventas_id = @ventas_id 
end 



GO
/****** Object:  StoredProcedure [dbo].[sp_List_agencias]    Script Date: 25/05/2017 11:26:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

------------------------------------- 
create procedure [dbo].[sp_List_agencias] ( 
@agencia_id int ) AS 
if @agencia_id = 0 
begin 
SELECT * FROM agencias 
end 
else 
begin 
SELECT * FROM agencias WHERE agencia_id = @agencia_id 
end 



GO
/****** Object:  StoredProcedure [dbo].[sp_List_ciudades]    Script Date: 25/05/2017 11:26:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

------------------------------------- 
create procedure [dbo].[sp_List_ciudades] ( 
@ciudad_id int ) AS 
if @ciudad_id = 0 
begin 
SELECT * FROM ciudades 
end 
else 
begin 
SELECT * FROM ciudades WHERE ciudad_id = @ciudad_id 
end 



GO
/****** Object:  StoredProcedure [dbo].[sp_List_ciudades_of_hoteles]    Script Date: 25/05/2017 11:26:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[sp_List_ciudades_of_hoteles]  AS 

begin 

SELECT c.ciudad_id , c.ciudad_name , h.hotel_id ,h.hotel_description , h.hotel_precio_uni   FROM hoteles as h INNER JOIN ciudades as c on h.origen_ciudad_id =  c.ciudad_id
 
 end



GO
/****** Object:  StoredProcedure [dbo].[sp_List_ciudades_of_transporte]    Script Date: 25/05/2017 11:26:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_List_ciudades_of_transporte]  AS 

begin 

SELECT t.transporte_id , t.type_transporte , a.agencia_description , co.ciudad_name as 'Parte de:' ,cd.ciudad_name as 'Hasta:', ct.cronograma_fecha, ct.cronograma_transporte_id ,tcls.transporte_clase_asientos FROM transportes as t INNER JOIN ciudades as co on co.ciudad_id = t.origen_ciudad_id INNER JOIN ciudades as cd on cd.ciudad_id =  t.destino_ciudad_id  INNER JOIN agencias as a on a.agencia_id = t.agencia_id inner join cronograma_transportes as ct on ct.transporte_id = t.transporte_id   INNER JOIN Transporte_clase as tcls on tcls.transporte_id = t.transporte_id where transporte_clase_asientos > 0
 
 end



GO
/****** Object:  StoredProcedure [dbo].[sp_List_ciudades_visitadas]    Script Date: 25/05/2017 11:26:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----description
CREATE procedure [dbo].[sp_List_ciudades_visitadas]  AS 
begin 

    SElECT  c.ciudad_name, COUNT(t.destino_ciudad_id) as 'cantidad'   FROM ventas AS v   INNER JOIN transportes as t ON t.transporte_id = v.transporte_id   INNER JOIN ciudades AS c ON c.ciudad_id = t.destino_ciudad_id GROUP BY c.ciudad_name order by cantidad desc

end 

GO
/****** Object:  StoredProcedure [dbo].[sp_List_cronograma_transportes]    Script Date: 25/05/2017 11:26:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

------------------------------------- 
CREATE procedure [dbo].[sp_List_cronograma_transportes] ( 
@cronograma_transporte_id int,
@transporte_id int) AS 
if @cronograma_transporte_id = 0 
begin 

	if @transporte_id = 0 
		begin 
			SELECT cr.cronograma_transporte_id,cr.cronograma_fecha,cr.cronograma_fecha_regreso,cr.transporte_id,c.ciudad_name FROM cronograma_transportes cr INNER JOIN transportes as t on t.transporte_id = cr.transporte_id INNER JOIN ciudades as c on c.ciudad_id =t.origen_ciudad_id order by cr.cronograma_transporte_id DESC
		 end 
	else 
		begin 
			SELECT cr.cronograma_transporte_id,cr.cronograma_fecha,cr.cronograma_fecha_regreso,cr.transporte_id,c.ciudad_name FROM cronograma_transportes cr INNER JOIN transportes as t on t.transporte_id = cr.transporte_id INNER JOIN ciudades as c on c.ciudad_id =t.origen_ciudad_id WHERE  cr.transporte_id = @transporte_id order by cr.cronograma_transporte_id DESC
		end 



 
 end 
else 
begin 
SELECT cr.cronograma_transporte_id,cr.cronograma_fecha,cr.cronograma_fecha_regreso,cr.transporte_id,c.ciudad_name FROM cronograma_transportes cr INNER JOIN transportes as t on t.transporte_id = cr.transporte_id INNER JOIN ciudades as c on c.ciudad_id =t.origen_ciudad_id WHERE cr.cronograma_transporte_id = @cronograma_transporte_id order by cr.cronograma_transporte_id DESC
end 



GO
/****** Object:  StoredProcedure [dbo].[sp_List_fechas_ventas]    Script Date: 25/05/2017 11:26:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----description
CREATE procedure [dbo].[sp_List_fechas_ventas]  AS 
begin 

    SElECT venta_date_venta, COUNT(venta_date_venta) FROM ventas   GROUP BY venta_date_venta HAVING COUNT(venta_date_venta) > 0

end 

GO
/****** Object:  StoredProcedure [dbo].[sp_List_fechas_viajes]    Script Date: 25/05/2017 11:26:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----description
CREATE procedure [dbo].[sp_List_fechas_viajes]  AS 
begin 

    SElECT ct.Cronograma_fecha ,COUNT(v.fecha_partida_cronograma_transpote_id) FROM ventas  as v INNER JOIN Cronograma_transportes  as ct on ct.Cronograma_transporte_id = v.fecha_partida_cronograma_transpote_id GROUP BY ct.Cronograma_fecha

end 

GO
/****** Object:  StoredProcedure [dbo].[sp_List_hoteles]    Script Date: 25/05/2017 11:26:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

------------------------------------- 
CREATE procedure [dbo].[sp_List_hoteles] ( 
@hotel_id int ) AS 
if @hotel_id = 0 
begin 
SELECT h.hotel_id,h.hotel_description,h.hotel_precio_uni,c.ciudad_name,c.ciudad_id ,a.agencia_id,a.agencia_description FROM hoteles as h INNER JOIN agencias as a on a.agencia_id = h.agencia_id INNER JOIN ciudades as c on c.ciudad_id = h.origen_ciudad_id
end 
else 
begin 
SELECT h.hotel_id,h.hotel_description,h.hotel_precio_uni,c.ciudad_name,c.ciudad_id ,a.agencia_id,a.agencia_description FROM hoteles as h INNER JOIN agencias as a on a.agencia_id = h.agencia_id INNER JOIN ciudades as c on c.ciudad_id = h.origen_ciudad_id WHERE h.hotel_id = @hotel_id 
end 



GO
/****** Object:  StoredProcedure [dbo].[sp_List_pasajeros]    Script Date: 25/05/2017 11:26:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

------------------------------------- 
create procedure [dbo].[sp_List_pasajeros] ( 
@pasajero_id int ) AS 
if @pasajero_id = 0 
begin 
SELECT * FROM pasajeros 
end 
else 
begin 
SELECT * FROM pasajeros WHERE pasajero_id = @pasajero_id 
end 



GO
/****** Object:  StoredProcedure [dbo].[sp_List_pasajeros_viajeros]    Script Date: 25/05/2017 11:26:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----description
CREATE procedure [dbo].[sp_List_pasajeros_viajeros]  AS 
begin 

    SElECT p.pasajero_dni , COUNT(vd.pasajero_id ) as 'viajes' FROM venta_detelles as vd INNER JOIN pasajeros as p on p.pasajero_id = vd.pasajero_id   inner join ventas as v on v.ventas_id = vd.venta_id  where v.venta_status = 'COMPLETADO'  GROUP BY p.pasajero_dni order by viajes desc

end 

GO
/****** Object:  StoredProcedure [dbo].[sp_List_transporte_clase]    Script Date: 25/05/2017 11:26:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

------------------------------------- 
CREATE procedure [dbo].[sp_List_transporte_clase] ( 
@transporte_clase_id int,
@transporte_id int

 ) AS 
if @transporte_clase_id = 0 
begin 
	if @transporte_id = 0 
	begin 
		SELECT * FROM transporte_clase 
	end 
	else 
	begin 
		SELECT * FROM transporte_clase WHERE transporte_id = @transporte_id 
	end 	 
end 
else 
begin 
SELECT * FROM transporte_clase WHERE transporte_clase_id = @transporte_clase_id 
end 



GO
/****** Object:  StoredProcedure [dbo].[sp_List_transportes]    Script Date: 25/05/2017 11:26:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

------------------------------------- 
CREATE procedure [dbo].[sp_List_transportes] ( 
@transporte_id int ) AS 
if @transporte_id = 0 
begin 
SELECT t.transporte_id,t.type_transporte,t.transporte_status, t.agencia_id,a.agencia_description,co.ciudad_id as 'ciudad_o_id',co.ciudad_name as 'Parte de', cd.ciudad_id  as 'ciudad_d_id',cd.ciudad_name as 'A :'   FROM transportes as t INNER JOIN ciudades as co on co.ciudad_id = t.origen_ciudad_id INNER JOIN ciudades as cd on cd.ciudad_id = t.destino_ciudad_id INNER JOIN agencias as a on a.agencia_id = t.agencia_id  order by t.transporte_id DESC
end 
else 
begin 
SELECT t.transporte_id,t.type_transporte,t.transporte_status, t.agencia_id,a.agencia_description,co.ciudad_id as 'ciudad_o_id',co.ciudad_name as 'Parte de', cd.ciudad_id  as 'ciudad_d_id',cd.ciudad_name as 'A :'  FROM transportes   as t INNER JOIN ciudades as co on co.ciudad_id = t.origen_ciudad_id INNER JOIN ciudades as cd on cd.ciudad_id = t.destino_ciudad_id INNER JOIN agencias as a on a.agencia_id = t.agencia_id   WHERE t.transporte_id = @transporte_id order by t.transporte_id DESC
end 



GO
/****** Object:  StoredProcedure [dbo].[sp_List_users]    Script Date: 25/05/2017 11:26:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

------------------------------------- 
CREATE procedure [dbo].[sp_List_users] ( 
@user_id int ) AS 
if @user_id = 0 
begin 
SELECT user_id,user_dni,user_pass,user_status,user_type FROM users 
end 
else 
begin 
SELECT user_id,user_dni,user_pass,user_status,user_type FROM users WHERE user_id = @user_id 
end 



GO
/****** Object:  StoredProcedure [dbo].[sp_List_users_ventas]    Script Date: 25/05/2017 11:26:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----description
CREATE procedure [dbo].[sp_List_users_ventas]  AS 
begin 

    SElECT user_dni , COUNT(v.user_id) FROM users as u INNER JOIN ventas as v on v.user_id = u.user_id GROUP BY u.user_dni

end 

GO
/****** Object:  StoredProcedure [dbo].[sp_List_venta_detelles]    Script Date: 25/05/2017 11:26:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------- 
CREATE procedure [dbo].[sp_List_venta_detelles] ( 
@ventas_id int 
) AS 
if @ventas_id = 0 
begin 
SELECT * FROM venta_detelles 
end 
else 
begin 
SELECT * FROM venta_detelles WHERE venta_id = @Ventas_id 
end 




GO
/****** Object:  StoredProcedure [dbo].[sp_List_ventas]    Script Date: 25/05/2017 11:26:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

------------------------------------- 
CREATE procedure [dbo].[sp_List_ventas] ( 
@ventas_id int ) AS 
if @ventas_id = 0 
begin 
SELECT v.ventas_id  as 'ID',v.venta_code as 'Code',v.venta_status as 'Estado',v.venta_date_venta as 'VentaFech',c.ciudad_name as 'ViajeDestino',ct.cronograma_fecha as 'ViajeFech' ,h.hotel_description as 'Hospedaje' ,p.pasajero_dni as 'CompradorDNI' ,p.pasajero_last_name as 'CompradorName' , v.venta_sub_total as 'SubTotal' , v.venta_total as 'Total'
FROM ventas as v 
left join cronograma_transportes as ct on v.fecha_partida_cronograma_transpote_id = ct.cronograma_transporte_id
inner join pasajeros as p on v.comprador_pasajero_id = p.pasajero_id
 left join transportes as t on t.transporte_id = v.transporte_id
 inner join ciudades as c on c.ciudad_id = t.origen_ciudad_id
left join hoteles as h on h.hotel_id = v.hotel_id order by v.ventas_id DESC
end 
else 
begin 
SELECT v.ventas_id  as 'ID',v.venta_code as 'Code',v.venta_status as 'Estado',v.venta_date_venta as 'VentaFech',c.ciudad_name as 'ViajeDestino',ct.cronograma_fecha as 'ViajeFech' ,h.hotel_description as 'Hospedaje' ,p.pasajero_dni as 'CompradorDNI' ,p.pasajero_last_name as 'CompradorName' , v.venta_sub_total as 'SubTotal' , v.venta_total as 'Total'
FROM ventas as v 
left join cronograma_transportes as ct on v.fecha_partida_cronograma_transpote_id = ct.cronograma_transporte_id
inner join pasajeros as p on v.comprador_pasajero_id = p.pasajero_id
 left join transportes as t on t.transporte_id = v.transporte_id
 inner join ciudades as c on c.ciudad_id = t.origen_ciudad_id
left join hoteles as h on h.hotel_id = v.hotel_id
 WHERE v.venta_status = 'COMPLETADO' and ventas_id = @ventas_id 
end 



GO
/****** Object:  StoredProcedure [dbo].[sp_Login]    Script Date: 25/05/2017 11:26:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_Login] ( 
@user_pass varchar(255) , 
@user_dni varchar(255)) AS 
begin 
SELECT user_dni,user_id,user_pass,user_status,user_type FROM users WHERE user_dni = @user_dni AND user_pass = @user_pass
end 



GO
/****** Object:  StoredProcedure [dbo].[sp_Search_pasajero]    Script Date: 25/05/2017 11:26:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

------------------------------------- 
CREATE procedure [dbo].[sp_Search_pasajero] ( 
@pasajero_dni varchar(30) ) AS 

begin 

SELECT * FROM pasajeros WHERE pasajero_dni like @pasajero_dni 
end 



GO
/****** Object:  StoredProcedure [dbo].[sp_Update_status_venta]    Script Date: 25/05/2017 11:26:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_Update_status_venta] ( 
@ventas_id int , 
@venta_status varchar(20) 
) AS 
begin 
UPDATE ventas set venta_status = @venta_status WHERE ventas_id = @ventas_id
end



GO
USE [master]
GO
ALTER DATABASE [DBTRAVELMAIN] SET  READ_WRITE 
GO

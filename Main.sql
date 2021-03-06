USE [master]
GO
/****** Object:  Database [DBTRAVELSAGENCY]    Script Date: 23/5/2017 22:56:03 ******/
CREATE DATABASE [DBTRAVELSAGENCY]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DBTRAVELSAGENCY', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\DBTRAVELSAGENCY.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DBTRAVELSAGENCY_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\DBTRAVELSAGENCY_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DBTRAVELSAGENCY] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBTRAVELSAGENCY].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBTRAVELSAGENCY] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBTRAVELSAGENCY] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBTRAVELSAGENCY] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBTRAVELSAGENCY] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBTRAVELSAGENCY] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBTRAVELSAGENCY] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DBTRAVELSAGENCY] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBTRAVELSAGENCY] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBTRAVELSAGENCY] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBTRAVELSAGENCY] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBTRAVELSAGENCY] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBTRAVELSAGENCY] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBTRAVELSAGENCY] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBTRAVELSAGENCY] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBTRAVELSAGENCY] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DBTRAVELSAGENCY] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBTRAVELSAGENCY] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBTRAVELSAGENCY] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBTRAVELSAGENCY] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBTRAVELSAGENCY] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBTRAVELSAGENCY] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DBTRAVELSAGENCY] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBTRAVELSAGENCY] SET RECOVERY FULL 
GO
ALTER DATABASE [DBTRAVELSAGENCY] SET  MULTI_USER 
GO
ALTER DATABASE [DBTRAVELSAGENCY] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBTRAVELSAGENCY] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBTRAVELSAGENCY] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBTRAVELSAGENCY] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [DBTRAVELSAGENCY] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'DBTRAVELSAGENCY', N'ON'
GO
USE [DBTRAVELSAGENCY]
GO
/****** Object:  Table [dbo].[agencias]    Script Date: 23/5/2017 22:56:03 ******/
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
/****** Object:  Table [dbo].[ciudades]    Script Date: 23/5/2017 22:56:03 ******/
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
/****** Object:  Table [dbo].[cronograma_transportes]    Script Date: 23/5/2017 22:56:03 ******/
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
/****** Object:  Table [dbo].[departamentos]    Script Date: 23/5/2017 22:56:03 ******/
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
/****** Object:  Table [dbo].[hoteles]    Script Date: 23/5/2017 22:56:03 ******/
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
/****** Object:  Table [dbo].[pasajeros]    Script Date: 23/5/2017 22:56:03 ******/
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
/****** Object:  Table [dbo].[transporte_clase]    Script Date: 23/5/2017 22:56:03 ******/
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
/****** Object:  Table [dbo].[transportes]    Script Date: 23/5/2017 22:56:03 ******/
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
/****** Object:  Table [dbo].[users]    Script Date: 23/5/2017 22:56:03 ******/
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
/****** Object:  Table [dbo].[venta_detelles]    Script Date: 23/5/2017 22:56:03 ******/
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
/****** Object:  Table [dbo].[ventas]    Script Date: 23/5/2017 22:56:03 ******/
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
	[venta_sub_total] [decimal](10, 2) NULL,
	[venta_total] [decimal](10, 2) NULL,
 CONSTRAINT [PK__ventas__3AA18F83573579B2] PRIMARY KEY CLUSTERED 
(
	[ventas_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
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
/****** Object:  StoredProcedure [dbo].[sp_Delete_agencias]    Script Date: 23/5/2017 22:56:03 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Delete_ciudades]    Script Date: 23/5/2017 22:56:03 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Delete_cronograma_transportes]    Script Date: 23/5/2017 22:56:03 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Delete_hoteles]    Script Date: 23/5/2017 22:56:03 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Delete_pasajeros]    Script Date: 23/5/2017 22:56:03 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Delete_transporte_clase]    Script Date: 23/5/2017 22:56:03 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Delete_transportes]    Script Date: 23/5/2017 22:56:03 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Delete_users]    Script Date: 23/5/2017 22:56:03 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Delete_venta_detelles]    Script Date: 23/5/2017 22:56:03 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Delete_ventas]    Script Date: 23/5/2017 22:56:03 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Get_id_transporte_class]    Script Date: 23/5/2017 22:56:03 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Get_last_code_venta]    Script Date: 23/5/2017 22:56:03 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Get_last_id_pasajero]    Script Date: 23/5/2017 22:56:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_Get_last_id_pasajero] as
begin
SELECT Top 1 pasajero_id FROM  pasajeros ORDER by pasajero_id DESC
end

GO
/****** Object:  StoredProcedure [dbo].[sp_Get_last_id_venta]    Script Date: 23/5/2017 22:56:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_Get_last_id_venta] as
begin
SELECT Top 1 ventas_id FROM  ventas ORDER by ventas_id DESC
end

GO
/****** Object:  StoredProcedure [dbo].[sp_Get_precio_transporte_class]    Script Date: 23/5/2017 22:56:03 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Insert_agencias]    Script Date: 23/5/2017 22:56:03 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Insert_cronograma_transportes]    Script Date: 23/5/2017 22:56:03 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Insert_hoteles]    Script Date: 23/5/2017 22:56:03 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Insert_pasajeros]    Script Date: 23/5/2017 22:56:03 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Insert_transporte_clase]    Script Date: 23/5/2017 22:56:03 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Insert_transportes]    Script Date: 23/5/2017 22:56:03 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Insert_users]    Script Date: 23/5/2017 22:56:03 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Insert_venta_detelles]    Script Date: 23/5/2017 22:56:03 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Insert_ventas]    Script Date: 23/5/2017 22:56:03 ******/
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
@venta_sub_total decimal(10,2) = null, 
@venta_total decimal(10,2) = null) AS 
if @ventas_id = 0 
begin 
INSERT INTO ventas( venta_date_reserva,venta_date_venta,venta_status,venta_code,fecha_partida_cronograma_transpote_id,user_id,comprador_pasajero_id,transporte_id,hotel_id,venta_sub_total,venta_total ) VALUES (@venta_date_reserva,@venta_date_venta,@venta_status,@venta_code,@fecha_partida_cronograma_transpote_id,@user_id,@comprador_pasajero_id,@transporte_id,@hotel_id,@venta_sub_total,@venta_total)
end 
else 
begin 
UPDATE ventas set venta_date_reserva= @venta_date_reserva,venta_date_venta= @venta_date_venta,venta_status= @venta_status,venta_code= @venta_code,fecha_partida_cronograma_transpote_id= @fecha_partida_cronograma_transpote_id,user_id= @user_id,comprador_pasajero_id= @comprador_pasajero_id,transporte_id= @transporte_id,hotel_id= @hotel_id,venta_sub_total= @venta_sub_total,venta_total= @venta_total WHERE ventas_id = @ventas_id 
end 

GO
/****** Object:  StoredProcedure [dbo].[sp_List_agencias]    Script Date: 23/5/2017 22:56:03 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_List_ciudades]    Script Date: 23/5/2017 22:56:03 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_List_ciudades_of_hoteles]    Script Date: 23/5/2017 22:56:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[sp_List_ciudades_of_hoteles]  AS 

begin 

SELECT c.ciudad_id , c.ciudad_name , h.hotel_id ,h.hotel_description , h.hotel_precio_uni   FROM hoteles as h INNER JOIN ciudades as c on h.origen_ciudad_id =  c.ciudad_id
 
 end

GO
/****** Object:  StoredProcedure [dbo].[sp_List_ciudades_of_transporte]    Script Date: 23/5/2017 22:56:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_List_ciudades_of_transporte]  AS 

begin 

SELECT t.transporte_id , t.type_transporte , a.agencia_description , co.ciudad_name as 'Parte de:' ,cd.ciudad_name as 'Hasta:' FROM transportes as t INNER JOIN ciudades as co on co.ciudad_id = t.origen_ciudad_id INNER JOIN ciudades as cd on cd.ciudad_id =  t.destino_ciudad_id  INNER JOIN agencias as a on a.agencia_id = t.agencia_id
 
 end

GO
/****** Object:  StoredProcedure [dbo].[sp_List_cronograma_transportes]    Script Date: 23/5/2017 22:56:03 ******/
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
			SELECT cr.cronograma_transporte_id,cr.cronograma_fecha,cr.cronograma_fecha_regreso,cr.transporte_id,c.ciudad_name FROM cronograma_transportes cr INNER JOIN transportes as t on t.transporte_id = cr.transporte_id INNER JOIN ciudades as c on c.ciudad_id =t.origen_ciudad_id
		 end 
	else 
		begin 
			SELECT cr.cronograma_transporte_id,cr.cronograma_fecha,cr.cronograma_fecha_regreso,cr.transporte_id,c.ciudad_name FROM cronograma_transportes cr INNER JOIN transportes as t on t.transporte_id = cr.transporte_id INNER JOIN ciudades as c on c.ciudad_id =t.origen_ciudad_id WHERE  cr.transporte_id = @transporte_id
		end 



 
 end 
else 
begin 
SELECT cr.cronograma_transporte_id,cr.cronograma_fecha,cr.cronograma_fecha_regreso,cr.transporte_id,c.ciudad_name FROM cronograma_transportes cr INNER JOIN transportes as t on t.transporte_id = cr.transporte_id INNER JOIN ciudades as c on c.ciudad_id =t.origen_ciudad_id WHERE cr.cronograma_transporte_id = @cronograma_transporte_id 
end 

GO
/****** Object:  StoredProcedure [dbo].[sp_List_hoteles]    Script Date: 23/5/2017 22:56:03 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_List_pasajeros]    Script Date: 23/5/2017 22:56:03 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_List_transporte_clase]    Script Date: 23/5/2017 22:56:03 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_List_transportes]    Script Date: 23/5/2017 22:56:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

------------------------------------- 
CREATE procedure [dbo].[sp_List_transportes] ( 
@transporte_id int ) AS 
if @transporte_id = 0 
begin 
SELECT t.transporte_id,t.type_transporte,t.transporte_status, t.agencia_id,a.agencia_description,co.ciudad_id as 'ciudad_o_id',co.ciudad_name as 'Parte de', cd.ciudad_id  as 'ciudad_d_id',cd.ciudad_name as 'A :'   FROM transportes as t INNER JOIN ciudades as co on co.ciudad_id = t.origen_ciudad_id INNER JOIN ciudades as cd on cd.ciudad_id = t.destino_ciudad_id INNER JOIN agencias as a on a.agencia_id = t.agencia_id  
end 
else 
begin 
SELECT t.transporte_id,t.type_transporte,t.transporte_status, t.agencia_id,a.agencia_description,co.ciudad_id as 'ciudad_o_id',co.ciudad_name as 'Parte de', cd.ciudad_id  as 'ciudad_d_id',cd.ciudad_name as 'A :'  FROM transportes   as t INNER JOIN ciudades as co on co.ciudad_id = t.origen_ciudad_id INNER JOIN ciudades as cd on cd.ciudad_id = t.destino_ciudad_id INNER JOIN agencias as a on a.agencia_id = t.agencia_id   WHERE t.transporte_id = @transporte_id 
end 

GO
/****** Object:  StoredProcedure [dbo].[sp_List_users]    Script Date: 23/5/2017 22:56:03 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_List_venta_detelles]    Script Date: 23/5/2017 22:56:03 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_List_ventas]    Script Date: 23/5/2017 22:56:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

------------------------------------- 
create procedure [dbo].[sp_List_ventas] ( 
@ventas_id int ) AS 
if @ventas_id = 0 
begin 
SELECT * FROM ventas 
end 
else 
begin 
SELECT * FROM ventas WHERE ventas_id = @ventas_id 
end 

GO
/****** Object:  StoredProcedure [dbo].[sp_Login]    Script Date: 23/5/2017 22:56:03 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Update_status_venta]    Script Date: 23/5/2017 22:56:03 ******/
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
ALTER DATABASE [DBTRAVELSAGENCY] SET  READ_WRITE 
GO

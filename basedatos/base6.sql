USE [master]
GO
/****** Object:  Database [pil2b]    Script Date: 13/10/2021 17:18:46 ******/
CREATE DATABASE [pil2b]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'pil2b', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\pil2b.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'pil2b_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\pil2b_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [pil2b] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [pil2b].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [pil2b] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [pil2b] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [pil2b] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [pil2b] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [pil2b] SET ARITHABORT OFF 
GO
ALTER DATABASE [pil2b] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [pil2b] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [pil2b] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [pil2b] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [pil2b] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [pil2b] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [pil2b] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [pil2b] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [pil2b] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [pil2b] SET  DISABLE_BROKER 
GO
ALTER DATABASE [pil2b] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [pil2b] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [pil2b] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [pil2b] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [pil2b] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [pil2b] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [pil2b] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [pil2b] SET RECOVERY FULL 
GO
ALTER DATABASE [pil2b] SET  MULTI_USER 
GO
ALTER DATABASE [pil2b] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [pil2b] SET DB_CHAINING OFF 
GO
ALTER DATABASE [pil2b] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [pil2b] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [pil2b] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [pil2b] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'pil2b', N'ON'
GO
ALTER DATABASE [pil2b] SET QUERY_STORE = OFF
GO
USE [pil2b]
GO
/****** Object:  Table [dbo].[cliente]    Script Date: 13/10/2021 17:18:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cliente](
	[id_cliente] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellido] [varchar](50) NOT NULL,
	[fecha_de_nacimiento] [date] NOT NULL,
	[documento] [int] NOT NULL,
	[cuil] [varchar](50) NOT NULL,
	[nacionalidad] [varchar](50) NOT NULL,
	[genero] [varchar](50) NOT NULL,
	[id_localidad] [int] NOT NULL,
	[mail] [varchar](50) NOT NULL,
	[contrasena] [varchar](50) NOT NULL,
	[imagen_delantera] [varchar](50) NOT NULL,
	[imagen_trasera] [varchar](50) NOT NULL,
 CONSTRAINT [PK_cliente] PRIMARY KEY CLUSTERED 
(
	[id_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cuenta]    Script Date: 13/10/2021 17:18:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cuenta](
	[id_cuenta] [int] IDENTITY(1,1) NOT NULL,
	[id_cliente] [int] NOT NULL,
	[cvu] [varchar](50) NOT NULL,
	[numero_de_cuenta] [varchar](50) NOT NULL,
	[saldo] [int] NOT NULL,
	[id_tipo_cuenta] [int] NOT NULL,
 CONSTRAINT [PK_cuenta] PRIMARY KEY CLUSTERED 
(
	[id_cuenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[localidad]    Script Date: 13/10/2021 17:18:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[localidad](
	[id_localidad] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nchar](10) NOT NULL,
	[codigo_postal] [int] NOT NULL,
	[id_provincia] [int] NOT NULL,
 CONSTRAINT [PK_localidad] PRIMARY KEY CLUSTERED 
(
	[id_localidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[operacion]    Script Date: 13/10/2021 17:18:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[operacion](
	[id_operaciones] [int] IDENTITY(1,1) NOT NULL,
	[id_cuenta] [int] NOT NULL,
	[id_tipo_operacion] [int] NOT NULL,
	[monto] [int] NOT NULL,
	[id_cuenta_destino] [int] NULL,
	[concepto] [varchar](200) NOT NULL,
	[fecha_hora] [datetime] NOT NULL,
	[estado] [varchar](50) NOT NULL,
 CONSTRAINT [PK_operacion] PRIMARY KEY CLUSTERED 
(
	[id_operaciones] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[provincia]    Script Date: 13/10/2021 17:18:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[provincia](
	[id_provincia] [int] IDENTITY(1,1) NOT NULL,
	[provincia] [varchar](50) NOT NULL,
 CONSTRAINT [PK_provincia] PRIMARY KEY CLUSTERED 
(
	[id_provincia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[telefono]    Script Date: 13/10/2021 17:18:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[telefono](
	[id_telefono] [int] IDENTITY(1,1) NOT NULL,
	[id_cliente] [int] NOT NULL,
	[telefono] [varchar](50) NOT NULL,
 CONSTRAINT [PK_telefono] PRIMARY KEY CLUSTERED 
(
	[id_telefono] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipo_cuenta]    Script Date: 13/10/2021 17:18:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipo_cuenta](
	[id_tipo_cuenta] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[moneda] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tipo_cuenta] PRIMARY KEY CLUSTERED 
(
	[id_tipo_cuenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipo_operacion]    Script Date: 13/10/2021 17:18:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipo_operacion](
	[id_tipo_operacion] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tipo_operacion] PRIMARY KEY CLUSTERED 
(
	[id_tipo_operacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[cliente] ON 

INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [fecha_de_nacimiento], [documento], [cuil], [nacionalidad], [genero], [id_localidad], [mail], [contrasena], [imagen_delantera], [imagen_trasera]) VALUES (1, N'Juan', N'Perez', CAST(N'2000-03-03' AS Date), 23400456, N'23-23400456-0', N'Argentina', N'Masculino', 1, N'juanperez@gmail.com', N'123456', N'si', N'si')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [fecha_de_nacimiento], [documento], [cuil], [nacionalidad], [genero], [id_localidad], [mail], [contrasena], [imagen_delantera], [imagen_trasera]) VALUES (4, N'Ana', N'Lopeza', CAST(N'2021-10-06' AS Date), 36000339, N'23-36000339-3', N'Boliviana', N'Masculino', 1003, N'analopez@gmail.com', N'', N'Si', N'Si')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [fecha_de_nacimiento], [documento], [cuil], [nacionalidad], [genero], [id_localidad], [mail], [contrasena], [imagen_delantera], [imagen_trasera]) VALUES (5, N'Pablo', N'Lopez', CAST(N'2021-10-09' AS Date), 42333458, N'23-42333458-4', N'Argentina', N'Masculino', 1, N'pablolopez@gmail.com', N'12344444', N'si', N'si')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [fecha_de_nacimiento], [documento], [cuil], [nacionalidad], [genero], [id_localidad], [mail], [contrasena], [imagen_delantera], [imagen_trasera]) VALUES (6, N'Camila', N'Lopez', CAST(N'2021-09-13' AS Date), 40222111, N'22-40222111-6', N'Argentina', N'Femenino', 1, N'camilopez@gmail.com', N'123456789', N'si', N'si')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [fecha_de_nacimiento], [documento], [cuil], [nacionalidad], [genero], [id_localidad], [mail], [contrasena], [imagen_delantera], [imagen_trasera]) VALUES (7, N'Maria', N'Gomez', CAST(N'2021-10-09' AS Date), 49000111, N'23-49000111-2', N'Argentina', N'Femenino', 1, N'mariagomez@gmail.com', N'12345678', N'si', N'si')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [fecha_de_nacimiento], [documento], [cuil], [nacionalidad], [genero], [id_localidad], [mail], [contrasena], [imagen_delantera], [imagen_trasera]) VALUES (8, N'Micaela', N'Lopez', CAST(N'2021-09-13' AS Date), 30444567, N'23-30444567-5', N'Argentina', N'Femenino', 1, N'micalopez@gmail.com', N'12345678', N'si', N'si')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [fecha_de_nacimiento], [documento], [cuil], [nacionalidad], [genero], [id_localidad], [mail], [contrasena], [imagen_delantera], [imagen_trasera]) VALUES (9, N'Pia', N'Perez', CAST(N'2021-10-09' AS Date), 40333001, N'25-40333001-6', N'Argentina', N'Femenino', 1, N'piaperez@hotmail.com', N'11111111111111', N'Si', N'Si')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [fecha_de_nacimiento], [documento], [cuil], [nacionalidad], [genero], [id_localidad], [mail], [contrasena], [imagen_delantera], [imagen_trasera]) VALUES (15, N'Agustin', N'Perez', CAST(N'2021-09-03' AS Date), 23555777, N'21-23555777-1', N'Argentina', N'Masculino', 1003, N'agustinperez@gmail.com', N'12345678', N'Si', N'Si')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [fecha_de_nacimiento], [documento], [cuil], [nacionalidad], [genero], [id_localidad], [mail], [contrasena], [imagen_delantera], [imagen_trasera]) VALUES (16, N'Agustina', N'Lopez', CAST(N'2021-09-10' AS Date), 25111000, N'21-25111000-6', N'Argentina', N'Femenino', 1004, N'agustinalopez@gmail.com', N'12456789', N'Si', N'Si')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [fecha_de_nacimiento], [documento], [cuil], [nacionalidad], [genero], [id_localidad], [mail], [contrasena], [imagen_delantera], [imagen_trasera]) VALUES (17, N'Camila', N'Perez', CAST(N'2021-09-02' AS Date), 13456456, N'21-13456456-2', N'Argentina', N'Femenino', 1003, N'camilaperez@gmail.com', N'12345678', N'Si', N'Si')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [fecha_de_nacimiento], [documento], [cuil], [nacionalidad], [genero], [id_localidad], [mail], [contrasena], [imagen_delantera], [imagen_trasera]) VALUES (19, N'Pablo', N'Gomez', CAST(N'2021-09-11' AS Date), 34111777, N'27-34111777-1', N'Brasilera', N'Masculino', 1003, N'pablogomez@gmail.com', N'12345678', N'Si', N'Si')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [fecha_de_nacimiento], [documento], [cuil], [nacionalidad], [genero], [id_localidad], [mail], [contrasena], [imagen_delantera], [imagen_trasera]) VALUES (20, N'Camila', N'Gomez', CAST(N'2021-09-09' AS Date), 23677677, N'23-23677677-1', N'Argentina', N'Femenino', 1004, N'camilagomez@gmail.com', N'333333333', N'Si', N'Si')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [fecha_de_nacimiento], [documento], [cuil], [nacionalidad], [genero], [id_localidad], [mail], [contrasena], [imagen_delantera], [imagen_trasera]) VALUES (21, N'Tiziana', N'Perez', CAST(N'2021-09-02' AS Date), 33888777, N'23-33888777-1', N'Argentina', N'Femenino', 1003, N'tizianaperez@gmail.com', N'111111111', N'Si', N'Si')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [fecha_de_nacimiento], [documento], [cuil], [nacionalidad], [genero], [id_localidad], [mail], [contrasena], [imagen_delantera], [imagen_trasera]) VALUES (22, N'Tatiana', N'Perez', CAST(N'2021-09-09' AS Date), 44555111, N'21-44555111-1', N'Argentina', N'Femenino', 1003, N'tatianaperez@gmail.com', N'11111111', N'Si', N'Si')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [fecha_de_nacimiento], [documento], [cuil], [nacionalidad], [genero], [id_localidad], [mail], [contrasena], [imagen_delantera], [imagen_trasera]) VALUES (1010, N'Daniel', N'Lopez', CAST(N'2021-09-03' AS Date), 12000999, N'20-12000999-0', N'Argentina', N'Masculino', 1, N'daniellopez@gmail.com', N'123456789', N'Si', N'Si')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [fecha_de_nacimiento], [documento], [cuil], [nacionalidad], [genero], [id_localidad], [mail], [contrasena], [imagen_delantera], [imagen_trasera]) VALUES (1011, N'Mara', N'Perez', CAST(N'2021-09-14' AS Date), 43678678, N'23-43678678-1', N'Chilena', N'Femenino', 2011, N'maraperez@gmail.com', N'123456777', N'Si', N'Si')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [fecha_de_nacimiento], [documento], [cuil], [nacionalidad], [genero], [id_localidad], [mail], [contrasena], [imagen_delantera], [imagen_trasera]) VALUES (1012, N'Mariana', N'Perez', CAST(N'2021-09-14' AS Date), 45555555, N'23-45555555-1', N'Argentina', N'Femenino', 2004, N'marianaperez@gmail.com', N'111111111', N'Si', N'Si')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [fecha_de_nacimiento], [documento], [cuil], [nacionalidad], [genero], [id_localidad], [mail], [contrasena], [imagen_delantera], [imagen_trasera]) VALUES (1013, N'Pepa', N'Perez', CAST(N'2021-09-01' AS Date), 22555666, N'21-22555666-1', N'Argentina', N'Femenino', 2019, N'pepaperez@gmail.com', N'111111111', N'Si', N'Si')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [fecha_de_nacimiento], [documento], [cuil], [nacionalidad], [genero], [id_localidad], [mail], [contrasena], [imagen_delantera], [imagen_trasera]) VALUES (1014, N'Pepe', N'Perez', CAST(N'2021-09-09' AS Date), 22555111, N'21-22555111-1', N'Boliviana', N'Masculino', 2013, N'pepeperez@gmail.com', N'111111111', N'Si', N'Si')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [fecha_de_nacimiento], [documento], [cuil], [nacionalidad], [genero], [id_localidad], [mail], [contrasena], [imagen_delantera], [imagen_trasera]) VALUES (1015, N'Mariana', N'Palacios', CAST(N'2021-09-03' AS Date), 33666000, N'37-33666000-1', N'Boliviana', N'Femenino', 2017, N'marianapalacios@gmail.com', N'11111111', N'Si', N'Si')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [fecha_de_nacimiento], [documento], [cuil], [nacionalidad], [genero], [id_localidad], [mail], [contrasena], [imagen_delantera], [imagen_trasera]) VALUES (1016, N'Paloma', N'Perez', CAST(N'2021-09-08' AS Date), 30456789, N'23-30456789-2', N'Argentina', N'Femenino', 2015, N'palomaperez@gmail.com', N'11111111', N'Si', N'Si')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [fecha_de_nacimiento], [documento], [cuil], [nacionalidad], [genero], [id_localidad], [mail], [contrasena], [imagen_delantera], [imagen_trasera]) VALUES (1017, N'Palomo', N'Perez', CAST(N'2021-09-08' AS Date), 30456788, N'23-30456788-2', N'Argentina', N'Masculino', 2015, N'palomaperez@gmail.com', N'11111111', N'Si', N'Si')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [fecha_de_nacimiento], [documento], [cuil], [nacionalidad], [genero], [id_localidad], [mail], [contrasena], [imagen_delantera], [imagen_trasera]) VALUES (1018, N'Palomo', N'Perez', CAST(N'2021-09-08' AS Date), 30456788, N'23-30456788-2', N'Argentina', N'Masculino', 2015, N'palomaperez@gmail.com', N'11111111', N'Si', N'Si')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [fecha_de_nacimiento], [documento], [cuil], [nacionalidad], [genero], [id_localidad], [mail], [contrasena], [imagen_delantera], [imagen_trasera]) VALUES (1019, N'Pato', N'Perez', CAST(N'2021-09-01' AS Date), 22222333, N'22-22222333-1', N'Boliviana', N'Femenino', 2004, N'patoperez@gmail.com', N'patoperez@g', N'Si', N'Si')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [fecha_de_nacimiento], [documento], [cuil], [nacionalidad], [genero], [id_localidad], [mail], [contrasena], [imagen_delantera], [imagen_trasera]) VALUES (1020, N'Juli', N'Perez', CAST(N'2021-09-02' AS Date), 33999000, N'21-33999000-1', N'Argentina', N'Femenino', 2019, N'juliperez@gmail.com', N'11111111111', N'Si', N'Si')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [fecha_de_nacimiento], [documento], [cuil], [nacionalidad], [genero], [id_localidad], [mail], [contrasena], [imagen_delantera], [imagen_trasera]) VALUES (1021, N'Julia', N'Perez', CAST(N'2021-09-03' AS Date), 33444888, N'21-33444888-1', N'Brasilera', N'Femenino', 2021, N'juliaperez@gmail.com', N'11111111', N'Si', N'Si')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [fecha_de_nacimiento], [documento], [cuil], [nacionalidad], [genero], [id_localidad], [mail], [contrasena], [imagen_delantera], [imagen_trasera]) VALUES (1022, N'Julio', N'Perez', CAST(N'2021-09-02' AS Date), 33000333, N'21-33000333-1', N'Argentina', N'Masculino', 2015, N'julioperez@gmail.com', N'12345677', N'Si', N'Si')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [fecha_de_nacimiento], [documento], [cuil], [nacionalidad], [genero], [id_localidad], [mail], [contrasena], [imagen_delantera], [imagen_trasera]) VALUES (1023, N'Diego', N'Palacios', CAST(N'2021-04-28' AS Date), 40679976, N'22-40679976-1', N'Uruguaya', N'Masculino', 2016, N'diegopalacios@gmail.com', N'111111111', N'Si', N'Si')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [fecha_de_nacimiento], [documento], [cuil], [nacionalidad], [genero], [id_localidad], [mail], [contrasena], [imagen_delantera], [imagen_trasera]) VALUES (1024, N'Melina', N'Perez', CAST(N'2021-09-08' AS Date), 45222111, N'21-45222111-1', N'Argentina', N'', 2011, N'melinaperez@gmail.com', N'12345666', N'Si', N'Si')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [fecha_de_nacimiento], [documento], [cuil], [nacionalidad], [genero], [id_localidad], [mail], [contrasena], [imagen_delantera], [imagen_trasera]) VALUES (1025, N'Gonzalo', N'Perez', CAST(N'2021-09-09' AS Date), 45666555, N'21-45666555-1', N'Argentina', N'Masculino', 2015, N'gonzaloperez@gmail.com', N'1111111111', N'Si', N'Si')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [fecha_de_nacimiento], [documento], [cuil], [nacionalidad], [genero], [id_localidad], [mail], [contrasena], [imagen_delantera], [imagen_trasera]) VALUES (1026, N'Nestor', N'Perez', CAST(N'2021-09-02' AS Date), 33123456, N'21-33123456-4', N'Argentina', N'Masculino', 2023, N'nestorperez@gmail.com', N'11111111', N'Si', N'Si')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [fecha_de_nacimiento], [documento], [cuil], [nacionalidad], [genero], [id_localidad], [mail], [contrasena], [imagen_delantera], [imagen_trasera]) VALUES (1027, N'Yanina', N'Perez', CAST(N'2021-09-03' AS Date), 43543678, N'21-43543678-2', N'Argentina', N'Femenino', 2019, N'yaninaperez@gmail.com', N'12345677', N'Si', N'Si')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [fecha_de_nacimiento], [documento], [cuil], [nacionalidad], [genero], [id_localidad], [mail], [contrasena], [imagen_delantera], [imagen_trasera]) VALUES (1028, N'Florencia', N'Perez', CAST(N'2021-07-06' AS Date), 23876123, N'21-23876123-1', N'Argentina', N'Femenino', 2023, N'florenciaperez@gmail.com', N'1234566666', N'Si', N'Si')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [fecha_de_nacimiento], [documento], [cuil], [nacionalidad], [genero], [id_localidad], [mail], [contrasena], [imagen_delantera], [imagen_trasera]) VALUES (1029, N'Emilia', N'Perez', CAST(N'2021-09-05' AS Date), 15234234, N'21-15234234-1', N'Argentina', N'Femenino', 2019, N'emiliaperez@gmail.com', N'11111111111', N'Si', N'Si')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [fecha_de_nacimiento], [documento], [cuil], [nacionalidad], [genero], [id_localidad], [mail], [contrasena], [imagen_delantera], [imagen_trasera]) VALUES (1030, N'Emilio', N'Perez', CAST(N'2021-09-05' AS Date), 12333444, N'25-12333444-1', N'Argentina', N'Femenino', 2006, N'emilioperez@gmail.com', N'11111111', N'Si', N'Si')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [fecha_de_nacimiento], [documento], [cuil], [nacionalidad], [genero], [id_localidad], [mail], [contrasena], [imagen_delantera], [imagen_trasera]) VALUES (1031, N'Diego', N'Perez', CAST(N'2021-09-01' AS Date), 44333222, N'27-44333222-1', N'Chilena', N'Masculino', 2011, N'diegoperez@gmail.com', N'11111111', N'Si', N'Si')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [fecha_de_nacimiento], [documento], [cuil], [nacionalidad], [genero], [id_localidad], [mail], [contrasena], [imagen_delantera], [imagen_trasera]) VALUES (1032, N'Bethy', N'Perez', CAST(N'2021-09-08' AS Date), 12222456, N'23-12222456-1', N'Chilena', N'Femenino', 2019, N'bethyperez@gmail.com', N'11111111', N'Si', N'Si')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [fecha_de_nacimiento], [documento], [cuil], [nacionalidad], [genero], [id_localidad], [mail], [contrasena], [imagen_delantera], [imagen_trasera]) VALUES (1033, N'Bety', N'Perez', CAST(N'2021-09-08' AS Date), 12222456, N'23-12222456-1', N'Chilena', N'Femenino', 2019, N'betyperez@gmail.com', N'11111111', N'Si', N'Si')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [fecha_de_nacimiento], [documento], [cuil], [nacionalidad], [genero], [id_localidad], [mail], [contrasena], [imagen_delantera], [imagen_trasera]) VALUES (1034, N'Vera', N'Perez', CAST(N'2021-09-08' AS Date), 13222456, N'23-13222456-1', N'Chilena', N'Femenino', 2019, N'veraperez@gmail.com', N'11111111', N'Si', N'Si')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [fecha_de_nacimiento], [documento], [cuil], [nacionalidad], [genero], [id_localidad], [mail], [contrasena], [imagen_delantera], [imagen_trasera]) VALUES (1035, N'Vero', N'Perez', CAST(N'2021-09-08' AS Date), 16222456, N'23-16222456-1', N'Chilena', N'Femenino', 2019, N'veroperez@gmail.com', N'11111111', N'Si', N'Si')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [fecha_de_nacimiento], [documento], [cuil], [nacionalidad], [genero], [id_localidad], [mail], [contrasena], [imagen_delantera], [imagen_trasera]) VALUES (1036, N'Ale', N'Perez', CAST(N'2021-08-29' AS Date), 23428913, N'21-23428913-1', N'Paraguaya', N'Femenino', 2019, N'aleperez@gmail.com', N'11111111111', N'Si', N'Si')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [fecha_de_nacimiento], [documento], [cuil], [nacionalidad], [genero], [id_localidad], [mail], [contrasena], [imagen_delantera], [imagen_trasera]) VALUES (1037, N'Aleja', N'Perez', CAST(N'2021-08-30' AS Date), 25364364, N'23-25364364-1', N'Brasilera', N'Femenino', 2021, N'alejaperez@gmail.com', N'1111111111', N'Si', N'Si')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [fecha_de_nacimiento], [documento], [cuil], [nacionalidad], [genero], [id_localidad], [mail], [contrasena], [imagen_delantera], [imagen_trasera]) VALUES (1038, N'Patricia', N'Perez', CAST(N'2021-02-01' AS Date), 12678987, N'21-12678987-0', N'Argentina', N'Femenino', 2025, N'patriciaperez@gmail.com', N'111111111', N'Si', N'Si')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [fecha_de_nacimiento], [documento], [cuil], [nacionalidad], [genero], [id_localidad], [mail], [contrasena], [imagen_delantera], [imagen_trasera]) VALUES (1039, N'Pepe', N'Palacios', CAST(N'2021-09-01' AS Date), 11678043, N'21-11678043-1', N'Boliviana', N'Masculino', 2015, N'pepepalacios@gmail.com', N'1111111111', N'Si', N'Si')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [fecha_de_nacimiento], [documento], [cuil], [nacionalidad], [genero], [id_localidad], [mail], [contrasena], [imagen_delantera], [imagen_trasera]) VALUES (1040, N'Luz', N'Perez', CAST(N'2021-02-17' AS Date), 54222333, N'29-54222333-9', N'Chilena', N'Femenino', 2025, N'luzperez@gmail.com', N'11111111', N'Si', N'Si')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [fecha_de_nacimiento], [documento], [cuil], [nacionalidad], [genero], [id_localidad], [mail], [contrasena], [imagen_delantera], [imagen_trasera]) VALUES (1041, N'Benjamin', N'Perez', CAST(N'2021-07-14' AS Date), 48754457, N'29-48754457-9', N'Argentina', N'', 2025, N'benjaminperez@gmail.com', N'11111111111', N'Si', N'Si')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [fecha_de_nacimiento], [documento], [cuil], [nacionalidad], [genero], [id_localidad], [mail], [contrasena], [imagen_delantera], [imagen_trasera]) VALUES (1042, N'Benjamin', N'Perez', CAST(N'2021-07-14' AS Date), 48754457, N'29-48754457-9', N'Argentina', N'', 2025, N'benjaminperez@gmail.com', N'11111111111', N'Si', N'Si')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [fecha_de_nacimiento], [documento], [cuil], [nacionalidad], [genero], [id_localidad], [mail], [contrasena], [imagen_delantera], [imagen_trasera]) VALUES (1043, N'Ema', N'Perez', CAST(N'2021-07-14' AS Date), 38567567, N'28-38567567-8', N'Argentina', N'Femenino', 2015, N'emaperez@gmail.com', N'11111111', N'Si', N'Si')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [fecha_de_nacimiento], [documento], [cuil], [nacionalidad], [genero], [id_localidad], [mail], [contrasena], [imagen_delantera], [imagen_trasera]) VALUES (1044, N'Emanol', N'Perez', CAST(N'2021-08-19' AS Date), 12345987, N'27-12345987-7', N'Argentina', N'Masculino', 2023, N'emanolperez@gmail.com', N'111111111', N'Si', N'Si')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [fecha_de_nacimiento], [documento], [cuil], [nacionalidad], [genero], [id_localidad], [mail], [contrasena], [imagen_delantera], [imagen_trasera]) VALUES (1045, N'Alberto', N'Perez', CAST(N'2021-09-08' AS Date), 8000111, N'1-8000111-1', N'Argentina', N'Masculino', 2019, N'albertoperez@gmail.com', N'11111111', N'Si', N'Si')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [fecha_de_nacimiento], [documento], [cuil], [nacionalidad], [genero], [id_localidad], [mail], [contrasena], [imagen_delantera], [imagen_trasera]) VALUES (1046, N'Marta', N'Perez', CAST(N'2021-09-01' AS Date), 13777888, N'21-13777888-1', N'Brasilera', N'Femenino', 2011, N'martaperez@gmail.com', N'1111111111', N'Si', N'Si')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [fecha_de_nacimiento], [documento], [cuil], [nacionalidad], [genero], [id_localidad], [mail], [contrasena], [imagen_delantera], [imagen_trasera]) VALUES (1047, N'Julieta', N'Garibaldi', CAST(N'2021-09-01' AS Date), 40000111, N'11-40000111-1', N'Chilena', N'Femenino', 2009, N'julietagaribaldi@gmail.com', N'1111111111', N'Si', N'Si')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [fecha_de_nacimiento], [documento], [cuil], [nacionalidad], [genero], [id_localidad], [mail], [contrasena], [imagen_delantera], [imagen_trasera]) VALUES (2037, N'Gonzalo', N'Pereyra', CAST(N'2021-02-25' AS Date), 23167921, N'20-23167921-1', N'Argentina', N'Masculino', 2017, N'gonzalopereyra@hotmail.com', N'111111111', N'Si', N'Si')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [fecha_de_nacimiento], [documento], [cuil], [nacionalidad], [genero], [id_localidad], [mail], [contrasena], [imagen_delantera], [imagen_trasera]) VALUES (2038, N'Maria Belen', N'Perez', CAST(N'2021-09-04' AS Date), 33678901, N'21-33678901-1', N'Argentina', N'Femenino', 2006, N'mariabperez@hotmail.com', N'11111111', N'Si', N'Si')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [fecha_de_nacimiento], [documento], [cuil], [nacionalidad], [genero], [id_localidad], [mail], [contrasena], [imagen_delantera], [imagen_trasera]) VALUES (2039, N'Maria', N'Pia', CAST(N'2021-09-03' AS Date), 23122122, N'21-23122122-1', N'Boliviana', N'Femenino', 2027, N'mariapperez@hotmail.com', N'11111111', N'Si', N'Si')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [fecha_de_nacimiento], [documento], [cuil], [nacionalidad], [genero], [id_localidad], [mail], [contrasena], [imagen_delantera], [imagen_trasera]) VALUES (2040, N'Melina ', N'Paredes', CAST(N'2021-09-02' AS Date), 28944567, N'23-28944567-1', N'Brasilera', N'Femenino', 2013, N'melinaparedes@hotmail.com', N'11111111', N'Si', N'Si')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [fecha_de_nacimiento], [documento], [cuil], [nacionalidad], [genero], [id_localidad], [mail], [contrasena], [imagen_delantera], [imagen_trasera]) VALUES (2041, N'Yanina', N'Paredes', CAST(N'2021-03-04' AS Date), 27400322, N'21-27400322-1', N'Argentina', N'Femenino', 2019, N'yaninaparedes@hotmail.com', N'1111111111', N'Si', N'Si')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [fecha_de_nacimiento], [documento], [cuil], [nacionalidad], [genero], [id_localidad], [mail], [contrasena], [imagen_delantera], [imagen_trasera]) VALUES (2042, N'Pedro', N'Palacios', CAST(N'2021-09-08' AS Date), 22945283, N'23-22945283-1', N'Chilena', N'Masculino', 2019, N'pepepalacios@gmail.com', N'11111111111', N'Si', N'Si')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [fecha_de_nacimiento], [documento], [cuil], [nacionalidad], [genero], [id_localidad], [mail], [contrasena], [imagen_delantera], [imagen_trasera]) VALUES (2043, N'Alejandra ', N'Perez', CAST(N'2021-09-09' AS Date), 93445432, N'21-93445432-1', N'Boliviana', N'Femenino', 2006, N'aleqjaperez@gmail.com', N'1111111111', N'Si', N'Si')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [fecha_de_nacimiento], [documento], [cuil], [nacionalidad], [genero], [id_localidad], [mail], [contrasena], [imagen_delantera], [imagen_trasera]) VALUES (2044, N'Veronica', N'Peretti', CAST(N'2021-09-02' AS Date), 22345876, N'28-22345876-1', N'Paraguaya', N'Femenino', 2017, N'veraperetti@gmail.com', N'22222222', N'Si', N'Si')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [fecha_de_nacimiento], [documento], [cuil], [nacionalidad], [genero], [id_localidad], [mail], [contrasena], [imagen_delantera], [imagen_trasera]) VALUES (2045, N'Mabel', N'Perez', CAST(N'2021-07-07' AS Date), 30444568, N'23-30444568-1', N'Chilena', N'Femenino', 2013, N'mabelperez@gmail.com', N'11111111', N'Si', N'Si')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [fecha_de_nacimiento], [documento], [cuil], [nacionalidad], [genero], [id_localidad], [mail], [contrasena], [imagen_delantera], [imagen_trasera]) VALUES (2046, N'Liliana', N'Perez', CAST(N'2021-03-28' AS Date), 40240210, N'21-40240210-0', N'Uruguaya', N'Femenino', 2021, N'liliana2perez@gmail.com', N'11111111', N'Si', N'Si')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [fecha_de_nacimiento], [documento], [cuil], [nacionalidad], [genero], [id_localidad], [mail], [contrasena], [imagen_delantera], [imagen_trasera]) VALUES (2047, N'Melanie', N'Perez', CAST(N'2021-09-09' AS Date), 40222567, N'23-40222567-6', N'Brasilera', N'Femenino', 2019, N'melanielopez@gmail.com', N'111111111111', N'Si', N'Si')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [fecha_de_nacimiento], [documento], [cuil], [nacionalidad], [genero], [id_localidad], [mail], [contrasena], [imagen_delantera], [imagen_trasera]) VALUES (2049, N'Juan', N'Perez', CAST(N'2021-10-01' AS Date), 34900142, N'23349001425', N'Boliviana', N'Masculino', 2013, N'juanperez@gmail.com.ar', N'111111111', N'Si', N'Si')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [fecha_de_nacimiento], [documento], [cuil], [nacionalidad], [genero], [id_localidad], [mail], [contrasena], [imagen_delantera], [imagen_trasera]) VALUES (2050, N'Pablo', N'Perez', CAST(N'2021-10-03' AS Date), 12789444, N'21-1278944455', N'Boliviana', N'Masculino', 2013, N'pablolopeeez@gmail.com', N'1111111111', N'Si', N'Si')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [fecha_de_nacimiento], [documento], [cuil], [nacionalidad], [genero], [id_localidad], [mail], [contrasena], [imagen_delantera], [imagen_trasera]) VALUES (3048, N'Emilia', N'Ches', CAST(N'2021-02-17' AS Date), 52212314, N'21-52212314-1', N'Chilena', N'Femenino', 2019, N'emiliaches@gmail.com', N'123456789', N'Si', N'Si')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [fecha_de_nacimiento], [documento], [cuil], [nacionalidad], [genero], [id_localidad], [mail], [contrasena], [imagen_delantera], [imagen_trasera]) VALUES (4048, N'Luz', N'Perez', CAST(N'1999-01-11' AS Date), 42678785, N'23-42678785-1', N'Argentina', N'Femenino', 2015, N'mabelperez@gmail.com', N'12345678', N'Si', N'Si')
SET IDENTITY_INSERT [dbo].[cliente] OFF
GO
SET IDENTITY_INSERT [dbo].[cuenta] ON 

INSERT [dbo].[cuenta] ([id_cuenta], [id_cliente], [cvu], [numero_de_cuenta], [saldo], [id_tipo_cuenta]) VALUES (1, 1, N'000001', N'000001', 0, 1)
INSERT [dbo].[cuenta] ([id_cuenta], [id_cliente], [cvu], [numero_de_cuenta], [saldo], [id_tipo_cuenta]) VALUES (2, 4, N'000002', N'000002', 0, 1)
INSERT [dbo].[cuenta] ([id_cuenta], [id_cliente], [cvu], [numero_de_cuenta], [saldo], [id_tipo_cuenta]) VALUES (3, 5, N'000003', N'000003', 0, 1)
INSERT [dbo].[cuenta] ([id_cuenta], [id_cliente], [cvu], [numero_de_cuenta], [saldo], [id_tipo_cuenta]) VALUES (10, 20, N'000020', N'000020', 0, 1)
INSERT [dbo].[cuenta] ([id_cuenta], [id_cliente], [cvu], [numero_de_cuenta], [saldo], [id_tipo_cuenta]) VALUES (11, 22, N'000022', N'000022', 0, 1)
INSERT [dbo].[cuenta] ([id_cuenta], [id_cliente], [cvu], [numero_de_cuenta], [saldo], [id_tipo_cuenta]) VALUES (1010, 1022, N'00001022', N'00001022', 0, 1)
INSERT [dbo].[cuenta] ([id_cuenta], [id_cliente], [cvu], [numero_de_cuenta], [saldo], [id_tipo_cuenta]) VALUES (1011, 1023, N'00001023', N'00001023', 0, 1)
INSERT [dbo].[cuenta] ([id_cuenta], [id_cliente], [cvu], [numero_de_cuenta], [saldo], [id_tipo_cuenta]) VALUES (1014, 1026, N'00001026', N'00001026', 0, 1)
INSERT [dbo].[cuenta] ([id_cuenta], [id_cliente], [cvu], [numero_de_cuenta], [saldo], [id_tipo_cuenta]) VALUES (1021, 1032, N'00001032', N'00001032', 0, 1)
INSERT [dbo].[cuenta] ([id_cuenta], [id_cliente], [cvu], [numero_de_cuenta], [saldo], [id_tipo_cuenta]) VALUES (1023, 1035, N'00001035', N'00001035', 0, 1)
INSERT [dbo].[cuenta] ([id_cuenta], [id_cliente], [cvu], [numero_de_cuenta], [saldo], [id_tipo_cuenta]) VALUES (1026, 1039, N'00001039', N'00001039', 0, 1)
INSERT [dbo].[cuenta] ([id_cuenta], [id_cliente], [cvu], [numero_de_cuenta], [saldo], [id_tipo_cuenta]) VALUES (1029, 1041, N'00001041', N'00001041', 0, 1)
INSERT [dbo].[cuenta] ([id_cuenta], [id_cliente], [cvu], [numero_de_cuenta], [saldo], [id_tipo_cuenta]) VALUES (1032, 1045, N'00001045', N'00001045', 0, 1)
INSERT [dbo].[cuenta] ([id_cuenta], [id_cliente], [cvu], [numero_de_cuenta], [saldo], [id_tipo_cuenta]) VALUES (1033, 1046, N'00001046', N'00001046', 0, 1)
INSERT [dbo].[cuenta] ([id_cuenta], [id_cliente], [cvu], [numero_de_cuenta], [saldo], [id_tipo_cuenta]) VALUES (1034, 1047, N'00001047', N'00001047', 0, 1)
INSERT [dbo].[cuenta] ([id_cuenta], [id_cliente], [cvu], [numero_de_cuenta], [saldo], [id_tipo_cuenta]) VALUES (2025, 1047, N'00001047', N'00001047', 0, 1)
INSERT [dbo].[cuenta] ([id_cuenta], [id_cliente], [cvu], [numero_de_cuenta], [saldo], [id_tipo_cuenta]) VALUES (2027, 2039, N'00002039', N'00002039', 0, 1)
INSERT [dbo].[cuenta] ([id_cuenta], [id_cliente], [cvu], [numero_de_cuenta], [saldo], [id_tipo_cuenta]) VALUES (2028, 2040, N'00002040', N'00002040', 0, 1)
INSERT [dbo].[cuenta] ([id_cuenta], [id_cliente], [cvu], [numero_de_cuenta], [saldo], [id_tipo_cuenta]) VALUES (2029, 2041, N'00002041', N'00002041', 0, 1)
INSERT [dbo].[cuenta] ([id_cuenta], [id_cliente], [cvu], [numero_de_cuenta], [saldo], [id_tipo_cuenta]) VALUES (2030, 2042, N'00002042', N'00002042', 0, 1)
INSERT [dbo].[cuenta] ([id_cuenta], [id_cliente], [cvu], [numero_de_cuenta], [saldo], [id_tipo_cuenta]) VALUES (2031, 2043, N'00002043', N'00002043', 0, 1)
INSERT [dbo].[cuenta] ([id_cuenta], [id_cliente], [cvu], [numero_de_cuenta], [saldo], [id_tipo_cuenta]) VALUES (2032, 2044, N'00002044', N'00002044', 0, 1)
INSERT [dbo].[cuenta] ([id_cuenta], [id_cliente], [cvu], [numero_de_cuenta], [saldo], [id_tipo_cuenta]) VALUES (2033, 2045, N'00002045', N'00002045', 0, 1)
INSERT [dbo].[cuenta] ([id_cuenta], [id_cliente], [cvu], [numero_de_cuenta], [saldo], [id_tipo_cuenta]) VALUES (2034, 2046, N'00002046', N'00002046', 0, 1)
INSERT [dbo].[cuenta] ([id_cuenta], [id_cliente], [cvu], [numero_de_cuenta], [saldo], [id_tipo_cuenta]) VALUES (2035, 2047, N'00002047', N'00002047', 0, 1)
INSERT [dbo].[cuenta] ([id_cuenta], [id_cliente], [cvu], [numero_de_cuenta], [saldo], [id_tipo_cuenta]) VALUES (2036, 2049, N'00002049', N'00002049', 0, 1)
INSERT [dbo].[cuenta] ([id_cuenta], [id_cliente], [cvu], [numero_de_cuenta], [saldo], [id_tipo_cuenta]) VALUES (2037, 2050, N'00002050', N'00002050', 0, 1)
INSERT [dbo].[cuenta] ([id_cuenta], [id_cliente], [cvu], [numero_de_cuenta], [saldo], [id_tipo_cuenta]) VALUES (3036, 3048, N'00003048', N'00003048', 0, 1)
INSERT [dbo].[cuenta] ([id_cuenta], [id_cliente], [cvu], [numero_de_cuenta], [saldo], [id_tipo_cuenta]) VALUES (4036, 4048, N'00004048', N'00004048', 0, 1)
SET IDENTITY_INSERT [dbo].[cuenta] OFF
GO
SET IDENTITY_INSERT [dbo].[localidad] ON 

INSERT [dbo].[localidad] ([id_localidad], [nombre], [codigo_postal], [id_provincia]) VALUES (1, N'Córdoba   ', 5008, 1)
INSERT [dbo].[localidad] ([id_localidad], [nombre], [codigo_postal], [id_provincia]) VALUES (1003, N'Cosquín   ', 5166, 1)
INSERT [dbo].[localidad] ([id_localidad], [nombre], [codigo_postal], [id_provincia]) VALUES (1004, N'Tanti     ', 5155, 1)
INSERT [dbo].[localidad] ([id_localidad], [nombre], [codigo_postal], [id_provincia]) VALUES (1005, N'Morón     ', 1708, 2)
INSERT [dbo].[localidad] ([id_localidad], [nombre], [codigo_postal], [id_provincia]) VALUES (1006, N'Rosario   ', 2000, 21)
INSERT [dbo].[localidad] ([id_localidad], [nombre], [codigo_postal], [id_provincia]) VALUES (2002, N'Campana   ', 2804, 2)
INSERT [dbo].[localidad] ([id_localidad], [nombre], [codigo_postal], [id_provincia]) VALUES (2003, N'Belgrano  ', 1092, 3)
INSERT [dbo].[localidad] ([id_localidad], [nombre], [codigo_postal], [id_provincia]) VALUES (2004, N'Caballito ', 1184, 3)
INSERT [dbo].[localidad] ([id_localidad], [nombre], [codigo_postal], [id_provincia]) VALUES (2005, N'Belén     ', 4750, 4)
INSERT [dbo].[localidad] ([id_localidad], [nombre], [codigo_postal], [id_provincia]) VALUES (2006, N'Tinogasta ', 5341, 4)
INSERT [dbo].[localidad] ([id_localidad], [nombre], [codigo_postal], [id_provincia]) VALUES (2007, N'Charata   ', 3730, 5)
INSERT [dbo].[localidad] ([id_localidad], [nombre], [codigo_postal], [id_provincia]) VALUES (2009, N'Quiltipi  ', 3530, 5)
INSERT [dbo].[localidad] ([id_localidad], [nombre], [codigo_postal], [id_provincia]) VALUES (2010, N'Rawson    ', 9103, 6)
INSERT [dbo].[localidad] ([id_localidad], [nombre], [codigo_postal], [id_provincia]) VALUES (2011, N'Trelew    ', 9100, 6)
INSERT [dbo].[localidad] ([id_localidad], [nombre], [codigo_postal], [id_provincia]) VALUES (2012, N'Corrientes', 3400, 7)
INSERT [dbo].[localidad] ([id_localidad], [nombre], [codigo_postal], [id_provincia]) VALUES (2013, N'Yapetu    ', 3231, 7)
INSERT [dbo].[localidad] ([id_localidad], [nombre], [codigo_postal], [id_provincia]) VALUES (2014, N'Concordia ', 3200, 8)
INSERT [dbo].[localidad] ([id_localidad], [nombre], [codigo_postal], [id_provincia]) VALUES (2015, N'Paraná    ', 3100, 8)
INSERT [dbo].[localidad] ([id_localidad], [nombre], [codigo_postal], [id_provincia]) VALUES (2016, N'Clorinda  ', 3610, 9)
INSERT [dbo].[localidad] ([id_localidad], [nombre], [codigo_postal], [id_provincia]) VALUES (2017, N'Formosa   ', 3600, 9)
INSERT [dbo].[localidad] ([id_localidad], [nombre], [codigo_postal], [id_provincia]) VALUES (2018, N'Humauaca  ', 4630, 10)
INSERT [dbo].[localidad] ([id_localidad], [nombre], [codigo_postal], [id_provincia]) VALUES (2019, N'Tilcara   ', 4624, 10)
INSERT [dbo].[localidad] ([id_localidad], [nombre], [codigo_postal], [id_provincia]) VALUES (2020, N'Macachin  ', 6307, 11)
INSERT [dbo].[localidad] ([id_localidad], [nombre], [codigo_postal], [id_provincia]) VALUES (2021, N'Victorica ', 6319, 11)
INSERT [dbo].[localidad] ([id_localidad], [nombre], [codigo_postal], [id_provincia]) VALUES (2022, N'La Rioja  ', 5300, 12)
INSERT [dbo].[localidad] ([id_localidad], [nombre], [codigo_postal], [id_provincia]) VALUES (2023, N'Chilecito ', 5360, 12)
INSERT [dbo].[localidad] ([id_localidad], [nombre], [codigo_postal], [id_provincia]) VALUES (2024, N'Maipú     ', 5500, 13)
INSERT [dbo].[localidad] ([id_localidad], [nombre], [codigo_postal], [id_provincia]) VALUES (2025, N'Mendoza   ', 5500, 13)
INSERT [dbo].[localidad] ([id_localidad], [nombre], [codigo_postal], [id_provincia]) VALUES (2026, N'Candelaria', 3308, 14)
INSERT [dbo].[localidad] ([id_localidad], [nombre], [codigo_postal], [id_provincia]) VALUES (2027, N'Posadas   ', 3300, 14)
INSERT [dbo].[localidad] ([id_localidad], [nombre], [codigo_postal], [id_provincia]) VALUES (2028, N'Caviahue  ', 8349, 15)
INSERT [dbo].[localidad] ([id_localidad], [nombre], [codigo_postal], [id_provincia]) VALUES (2029, N'Neuquén   ', 8300, 15)
INSERT [dbo].[localidad] ([id_localidad], [nombre], [codigo_postal], [id_provincia]) VALUES (2030, N'Cipolletti', 8324, 16)
SET IDENTITY_INSERT [dbo].[localidad] OFF
GO
SET IDENTITY_INSERT [dbo].[operacion] ON 

INSERT [dbo].[operacion] ([id_operaciones], [id_cuenta], [id_tipo_operacion], [monto], [id_cuenta_destino], [concepto], [fecha_hora], [estado]) VALUES (1, 1010, 1, 100, 1014, N'Prestamo', CAST(N'2020-02-01T00:00:00.000' AS DateTime), N'Finalizado')
INSERT [dbo].[operacion] ([id_operaciones], [id_cuenta], [id_tipo_operacion], [monto], [id_cuenta_destino], [concepto], [fecha_hora], [estado]) VALUES (2, 1014, 2, 55, 1010, N'Devolucion', CAST(N'2020-02-23T00:00:00.000' AS DateTime), N'Finalizado')
INSERT [dbo].[operacion] ([id_operaciones], [id_cuenta], [id_tipo_operacion], [monto], [id_cuenta_destino], [concepto], [fecha_hora], [estado]) VALUES (1003, 2033, 2, 4000, 3036, N'Pago', CAST(N'2020-02-23T00:00:00.000' AS DateTime), N'Aceptado')
INSERT [dbo].[operacion] ([id_operaciones], [id_cuenta], [id_tipo_operacion], [monto], [id_cuenta_destino], [concepto], [fecha_hora], [estado]) VALUES (1004, 2033, 1, 250, 3036, N'Devolución', CAST(N'2020-02-23T00:00:00.000' AS DateTime), N'Aceptado')
INSERT [dbo].[operacion] ([id_operaciones], [id_cuenta], [id_tipo_operacion], [monto], [id_cuenta_destino], [concepto], [fecha_hora], [estado]) VALUES (1005, 2033, 2, 1000, 2033, N'Sueldo', CAST(N'2020-02-23T00:00:00.000' AS DateTime), N'Finalizado')
INSERT [dbo].[operacion] ([id_operaciones], [id_cuenta], [id_tipo_operacion], [monto], [id_cuenta_destino], [concepto], [fecha_hora], [estado]) VALUES (1006, 2033, 2, 2000, 2033, N'Sueldo', CAST(N'2021-10-13T10:13:29.127' AS DateTime), N'Aceptado')
INSERT [dbo].[operacion] ([id_operaciones], [id_cuenta], [id_tipo_operacion], [monto], [id_cuenta_destino], [concepto], [fecha_hora], [estado]) VALUES (2005, 2033, 1, 750, 2034, N'Varios', CAST(N'2021-10-13T19:27:23.290' AS DateTime), N'Finalizado')
INSERT [dbo].[operacion] ([id_operaciones], [id_cuenta], [id_tipo_operacion], [monto], [id_cuenta_destino], [concepto], [fecha_hora], [estado]) VALUES (2006, 2033, 2, 700, 0, N'Varios', CAST(N'2021-10-13T19:30:23.463' AS DateTime), N'Finalizado')
INSERT [dbo].[operacion] ([id_operaciones], [id_cuenta], [id_tipo_operacion], [monto], [id_cuenta_destino], [concepto], [fecha_hora], [estado]) VALUES (2007, 4036, 2, 3000, 0, N'Varios', CAST(N'2021-10-13T19:41:46.933' AS DateTime), N'Finalizado')
INSERT [dbo].[operacion] ([id_operaciones], [id_cuenta], [id_tipo_operacion], [monto], [id_cuenta_destino], [concepto], [fecha_hora], [estado]) VALUES (2008, 4036, 1, 500, 2033, N'Varios', CAST(N'2021-10-13T19:41:46.933' AS DateTime), N'Finalizado')
SET IDENTITY_INSERT [dbo].[operacion] OFF
GO
SET IDENTITY_INSERT [dbo].[provincia] ON 

INSERT [dbo].[provincia] ([id_provincia], [provincia]) VALUES (1, N'Córdoba')
INSERT [dbo].[provincia] ([id_provincia], [provincia]) VALUES (2, N'Buenos Aires')
INSERT [dbo].[provincia] ([id_provincia], [provincia]) VALUES (3, N'Capital Federal')
INSERT [dbo].[provincia] ([id_provincia], [provincia]) VALUES (4, N'Catamarca')
INSERT [dbo].[provincia] ([id_provincia], [provincia]) VALUES (5, N'Chaco')
INSERT [dbo].[provincia] ([id_provincia], [provincia]) VALUES (6, N'Chubut')
INSERT [dbo].[provincia] ([id_provincia], [provincia]) VALUES (7, N'Corrientes')
INSERT [dbo].[provincia] ([id_provincia], [provincia]) VALUES (8, N'Entre Ríos')
INSERT [dbo].[provincia] ([id_provincia], [provincia]) VALUES (9, N'Formosa')
INSERT [dbo].[provincia] ([id_provincia], [provincia]) VALUES (10, N'Jujuy')
INSERT [dbo].[provincia] ([id_provincia], [provincia]) VALUES (11, N'La Pampa')
INSERT [dbo].[provincia] ([id_provincia], [provincia]) VALUES (12, N'La Rioja')
INSERT [dbo].[provincia] ([id_provincia], [provincia]) VALUES (13, N'Mendoza')
INSERT [dbo].[provincia] ([id_provincia], [provincia]) VALUES (14, N'Misiones')
INSERT [dbo].[provincia] ([id_provincia], [provincia]) VALUES (15, N'Neuquén')
INSERT [dbo].[provincia] ([id_provincia], [provincia]) VALUES (16, N'Río Negro')
INSERT [dbo].[provincia] ([id_provincia], [provincia]) VALUES (17, N'Salta')
INSERT [dbo].[provincia] ([id_provincia], [provincia]) VALUES (18, N'San Juan')
INSERT [dbo].[provincia] ([id_provincia], [provincia]) VALUES (19, N'San Luis')
INSERT [dbo].[provincia] ([id_provincia], [provincia]) VALUES (20, N'Santa Cruz')
INSERT [dbo].[provincia] ([id_provincia], [provincia]) VALUES (21, N'Santa Fe')
INSERT [dbo].[provincia] ([id_provincia], [provincia]) VALUES (22, N'Santiago del Estero')
INSERT [dbo].[provincia] ([id_provincia], [provincia]) VALUES (23, N'Tierra del Fuego')
INSERT [dbo].[provincia] ([id_provincia], [provincia]) VALUES (24, N'Tucumán')
SET IDENTITY_INSERT [dbo].[provincia] OFF
GO
SET IDENTITY_INSERT [dbo].[tipo_cuenta] ON 

INSERT [dbo].[tipo_cuenta] ([id_tipo_cuenta], [nombre], [moneda]) VALUES (1, N'Caja de Ahorro', N'Peso Argentino')
SET IDENTITY_INSERT [dbo].[tipo_cuenta] OFF
GO
SET IDENTITY_INSERT [dbo].[tipo_operacion] ON 

INSERT [dbo].[tipo_operacion] ([id_tipo_operacion], [nombre]) VALUES (1, N'Transferencia')
INSERT [dbo].[tipo_operacion] ([id_tipo_operacion], [nombre]) VALUES (2, N'Deposito')
SET IDENTITY_INSERT [dbo].[tipo_operacion] OFF
GO
ALTER TABLE [dbo].[cliente]  WITH CHECK ADD  CONSTRAINT [FK_cliente_localidad] FOREIGN KEY([id_localidad])
REFERENCES [dbo].[localidad] ([id_localidad])
GO
ALTER TABLE [dbo].[cliente] CHECK CONSTRAINT [FK_cliente_localidad]
GO
ALTER TABLE [dbo].[cuenta]  WITH CHECK ADD  CONSTRAINT [FK_cuenta_cliente] FOREIGN KEY([id_cliente])
REFERENCES [dbo].[cliente] ([id_cliente])
GO
ALTER TABLE [dbo].[cuenta] CHECK CONSTRAINT [FK_cuenta_cliente]
GO
ALTER TABLE [dbo].[cuenta]  WITH CHECK ADD  CONSTRAINT [FK_cuenta_tipo_cuenta] FOREIGN KEY([id_tipo_cuenta])
REFERENCES [dbo].[tipo_cuenta] ([id_tipo_cuenta])
GO
ALTER TABLE [dbo].[cuenta] CHECK CONSTRAINT [FK_cuenta_tipo_cuenta]
GO
ALTER TABLE [dbo].[localidad]  WITH CHECK ADD  CONSTRAINT [FK_localidad_provincia] FOREIGN KEY([id_provincia])
REFERENCES [dbo].[provincia] ([id_provincia])
GO
ALTER TABLE [dbo].[localidad] CHECK CONSTRAINT [FK_localidad_provincia]
GO
ALTER TABLE [dbo].[operacion]  WITH CHECK ADD  CONSTRAINT [FK_operacion_cuenta] FOREIGN KEY([id_cuenta])
REFERENCES [dbo].[cuenta] ([id_cuenta])
GO
ALTER TABLE [dbo].[operacion] CHECK CONSTRAINT [FK_operacion_cuenta]
GO
ALTER TABLE [dbo].[operacion]  WITH CHECK ADD  CONSTRAINT [FK_operacion_tipo_operacion] FOREIGN KEY([id_tipo_operacion])
REFERENCES [dbo].[tipo_operacion] ([id_tipo_operacion])
GO
ALTER TABLE [dbo].[operacion] CHECK CONSTRAINT [FK_operacion_tipo_operacion]
GO
ALTER TABLE [dbo].[telefono]  WITH CHECK ADD  CONSTRAINT [FK_telefono_cliente] FOREIGN KEY([id_cliente])
REFERENCES [dbo].[cliente] ([id_cliente])
GO
ALTER TABLE [dbo].[telefono] CHECK CONSTRAINT [FK_telefono_cliente]
GO
/****** Object:  StoredProcedure [dbo].[actualizar_persona]    Script Date: 13/10/2021 17:18:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[actualizar_persona]
	-- Add the parameters for the stored procedure here
	@id_cliente int,
	@nombre varchar(50),
	@apellido varchar(50),
	@fecha_de_nacimiento date,
	@documento int,
	@cuil varchar(50),
	@nacionalidad varchar(50),
	@genero varchar(50),
	@id_localidad int,
	@mail varchar(50),
	@contrasena varchar(50),
	@imagen_delantera varchar(50),
	@imagen_trasera varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [dbo].[cliente]
    SET [nombre] = @nombre
      ,[apellido] = @apellido
      ,[fecha_de_nacimiento] = @fecha_de_nacimiento
      ,[documento] = @documento
      ,[cuil] = @cuil
      ,[nacionalidad] = @nacionalidad
      ,[genero] = @genero
      ,[id_localidad] = @id_localidad
      ,[mail] = @mail
      ,[contrasena] = @contrasena
      ,[imagen_delantera] = @imagen_delantera
      ,[imagen_trasera] = @imagen_trasera
 WHERE id_cliente = @id_cliente
END
GO
/****** Object:  StoredProcedure [dbo].[comparar_usuario]    Script Date: 13/10/2021 17:18:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[comparar_usuario]
	-- Add the parameters for the stored procedure here
	@documento int,
	@cuil varchar(50),
	@mail varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [id_cliente],
	[nombre]
  FROM [dbo].[cliente]
  WHERE documento=@documento OR cuil=@cuil OR mail=@mail
END
GO
/****** Object:  StoredProcedure [dbo].[insertar_cuenta]    Script Date: 13/10/2021 17:18:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[insertar_cuenta]
	-- Add the parameters for the stored procedure here 
	@id_cliente int, 
	@cvu varchar(50), 
	@numero_de_cuenta varchar(50), 
	@saldo int, 
	@id_tipo_cuenta int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO cuenta (id_cliente,cvu,numero_de_cuenta,saldo,id_tipo_cuenta) VALUES (@id_cliente,@cvu,@numero_de_cuenta,@saldo,@id_tipo_cuenta)
END
GO
/****** Object:  StoredProcedure [dbo].[insertar_operacion]    Script Date: 13/10/2021 17:18:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[insertar_operacion]
	-- Add the parameters for the stored procedure here
	@id_cuenta int,
	@id_tipo_operacion int,
	@monto int,
	@id_cuenta_destino int,
	@concepto varchar(50),
	@fecha_hora datetime,
	@estado varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO operacion
           (id_cuenta,
		   id_tipo_operacion,
		   monto,
		   id_cuenta_destino,
		   concepto,
		   fecha_hora,
		   estado)
     VALUES
           (@id_cuenta
           , @id_tipo_operacion
           , @monto
           , @id_cuenta_destino
           , @concepto
           , @fecha_hora
           , @estado)
END
GO
/****** Object:  StoredProcedure [dbo].[insertar_persona]    Script Date: 13/10/2021 17:18:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[insertar_persona] 
	-- Add the parameters for the stored procedure here
	@nombre varchar(50),
	@apellido varchar(50),
	@fecha_de_nacimiento date,
	@documento int,
	@cuil varchar(50),
	@nacionalidad varchar(50),
	@genero varchar(50),
	@id_localidad int,
	@mail varchar(50),
	@contrasena varchar(50),
	@imagen_delantera varchar(50),
	@imagen_trasera varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO cliente
           (nombre,
		   apellido,
		   fecha_de_nacimiento,
		   documento,
		   cuil,
		   nacionalidad,
		   genero,
		   id_localidad,
		   mail,
		   contrasena,
		   imagen_delantera,
		   imagen_trasera)
     VALUES
           (@nombre
		   ,@apellido
		   ,@fecha_de_nacimiento
		   ,@documento
		   ,@cuil
		   ,@nacionalidad
		   ,@genero
		   ,@id_localidad
		   ,@mail
		   ,@contrasena
		   ,@imagen_delantera
		   ,@imagen_trasera)
END
GO
/****** Object:  StoredProcedure [dbo].[insertar_telefono]    Script Date: 13/10/2021 17:18:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[insertar_telefono]
	-- Add the parameters for the stored procedure here
	@id_telefono int, 
	@id_cliente int,
	@telefono varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO telefono (id_telefono, id_cliente, telefono) VALUES (@id_telefono,@id_cliente, @telefono)
END
GO
/****** Object:  StoredProcedure [dbo].[obtener_cuenta]    Script Date: 13/10/2021 17:18:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[obtener_cuenta]
	-- Add the parameters for the stored procedure here
	@id_cliente int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *
  FROM [dbo].[cuenta]
  WHERE id_cliente=@id_cliente
END
GO
/****** Object:  StoredProcedure [dbo].[obtener_cuentas]    Script Date: 13/10/2021 17:18:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[obtener_cuentas] 
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM [dbo].[cuenta]
END
GO
/****** Object:  StoredProcedure [dbo].[obtener_datos_logeo]    Script Date: 13/10/2021 17:18:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[obtener_datos_logeo]
	-- Add the parameters for the stored procedure here
	@mail varchar(50),
	@contrasena varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [id_cliente]
      ,[nombre]
FROM [dbo].[cliente]
WHERE mail=@mail AND
contrasena=@contrasena
END
GO
/****** Object:  StoredProcedure [dbo].[obtener_id]    Script Date: 13/10/2021 17:18:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[obtener_id]
	-- Add the parameters for the stored procedure here
	@cuil varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [id_cliente]
      ,[nombre]
	FROM [dbo].[cliente]
	WHERE cuil=@cuil
END
GO
/****** Object:  StoredProcedure [dbo].[obtener_id_cuenta]    Script Date: 13/10/2021 17:18:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[obtener_id_cuenta]
	-- Add the parameters for the stored procedure here
	@cvu varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [id_cuenta],[cvu]
  FROM [dbo].[cuenta]
  WHERE cvu=@cvu
END
GO
/****** Object:  StoredProcedure [dbo].[obtener_id_cuenta2]    Script Date: 13/10/2021 17:18:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[obtener_id_cuenta2]
	-- Add the parameters for the stored procedure here
	@id_cliente int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT [id_cuenta],[cvu]
  FROM [dbo].[cuenta]
  WHERE id_cliente=@id_cliente
END
GO
/****** Object:  StoredProcedure [dbo].[obtener_localidades]    Script Date: 13/10/2021 17:18:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[obtener_localidades] 

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM [dbo].[localidad]
END
GO
/****** Object:  StoredProcedure [dbo].[obtener_operacion]    Script Date: 13/10/2021 17:18:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[obtener_operacion]
	-- Add the parameters for the stored procedure here
	@id_cuenta int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *
	FROM [dbo].[operacion]
	WHERE id_cuenta=@id_cuenta OR id_cuenta_destino=@id_cuenta
END
GO
/****** Object:  StoredProcedure [dbo].[obtener_persona]    Script Date: 13/10/2021 17:18:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[obtener_persona] 
	-- Add the parameters for the stored procedure here
	@id_cliente int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [id_cliente]
      ,[nombre]
      ,[apellido]
      ,[fecha_de_nacimiento]
      ,[documento]
      ,[cuil]
      ,[nacionalidad]
      ,[genero]
      ,[id_localidad]
	  ,[mail]
      ,[contrasena]
      ,[imagen_delantera]
      ,[imagen_trasera]
  FROM [dbo].[cliente]
  WHERE id_cliente=@id_cliente
END
GO
/****** Object:  StoredProcedure [dbo].[obtener_personas]    Script Date: 13/10/2021 17:18:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[obtener_personas] 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM [dbo].[cliente]
END
GO
/****** Object:  StoredProcedure [dbo].[obtener_provincias]    Script Date: 13/10/2021 17:18:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[obtener_provincias] 

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM [dbo].[provincia]
END
GO
USE [master]
GO
ALTER DATABASE [pil2b] SET  READ_WRITE 
GO

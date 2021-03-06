USE [master]
GO
/****** Object:  Database [SGPDB]    Script Date: 13/05/2022 8:11:59 p. m. ******/
CREATE DATABASE [SGPDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SGPDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\SGPDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SGPDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\SGPDB.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SGPDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SGPDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SGPDB] SET ANSI_NULL_DEFAULT ON 
GO
ALTER DATABASE [SGPDB] SET ANSI_NULLS ON 
GO
ALTER DATABASE [SGPDB] SET ANSI_PADDING ON 
GO
ALTER DATABASE [SGPDB] SET ANSI_WARNINGS ON 
GO
ALTER DATABASE [SGPDB] SET ARITHABORT ON 
GO
ALTER DATABASE [SGPDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SGPDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SGPDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SGPDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SGPDB] SET CURSOR_DEFAULT  LOCAL 
GO
ALTER DATABASE [SGPDB] SET CONCAT_NULL_YIELDS_NULL ON 
GO
ALTER DATABASE [SGPDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SGPDB] SET QUOTED_IDENTIFIER ON 
GO
ALTER DATABASE [SGPDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SGPDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SGPDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SGPDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SGPDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SGPDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SGPDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SGPDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SGPDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SGPDB] SET RECOVERY FULL 
GO
ALTER DATABASE [SGPDB] SET  MULTI_USER 
GO
ALTER DATABASE [SGPDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SGPDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SGPDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SGPDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SGPDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SGPDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'SGPDB', N'ON'
GO
ALTER DATABASE [SGPDB] SET QUERY_STORE = OFF
GO
USE [SGPDB]
GO
/****** Object:  Table [dbo].[Documento]    Script Date: 13/05/2022 8:11:59 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Documento](
	[IdTipoDoc] [int] IDENTITY(1,1) NOT NULL,
	[ValTipoDoc] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdTipoDoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Entrevista]    Script Date: 13/05/2022 8:11:59 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Entrevista](
	[IdEntrevista] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NULL,
	[FechaEntrevista] [date] NULL,
	[Estado] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdEntrevista] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genero]    Script Date: 13/05/2022 8:11:59 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genero](
	[IdGenero] [int] IDENTITY(1,1) NOT NULL,
	[ValGenero] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdGenero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Homologacion]    Script Date: 13/05/2022 8:11:59 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Homologacion](
	[IdHomologacion] [int] IDENTITY(1,1) NOT NULL,
	[FechaHomologacion] [date] NULL,
	[Universidad] [varchar](500) NULL,
	[IdPrograma] [int] NULL,
	[IdModulo] [int] NULL,
	[Nota] [float] NULL,
	[IdUsuario] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdHomologacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Modulo]    Script Date: 13/05/2022 8:11:59 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Modulo](
	[IdModulo] [int] IDENTITY(1,1) NOT NULL,
	[ValModulo] [varchar](500) NULL,
	[Creditos] [int] NULL,
	[IdPrograma] [int] NULL,
	[Nivel] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdModulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pagos]    Script Date: 13/05/2022 8:11:59 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pagos](
	[IdPago] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [date] NULL,
	[Valor] [int] NULL,
	[IdUsuario] [int] NULL,
	[ComprovantePago] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Programa]    Script Date: 13/05/2022 8:11:59 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Programa](
	[IdPrograma] [int] IDENTITY(1,1) NOT NULL,
	[ValPrograma] [nvarchar](500) NULL,
	[Pensum] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdPrograma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Programacion]    Script Date: 13/05/2022 8:11:59 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Programacion](
	[IdProgramacion] [int] NOT NULL,
	[FechaIncio] [date] NULL,
	[FechaFin] [date] NULL,
	[Bloque] [int] NULL,
	[Salon] [varchar](500) NULL,
	[IdModulo] [int] NULL,
	[Semestre] [varchar](500) NULL,
	[IdPrograma] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdProgramacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProgramaUsuario]    Script Date: 13/05/2022 8:11:59 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProgramaUsuario](
	[IdProgramaUsuario] [int] IDENTITY(1,1) NOT NULL,
	[ValPrograma] [varchar](500) NULL,
	[IdUsuario] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdProgramaUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rol]    Script Date: 13/05/2022 8:11:59 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rol](
	[IdRol] [int] IDENTITY(1,1) NOT NULL,
	[ValRol] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 13/05/2022 8:11:59 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](300) NULL,
	[Apellido] [varchar](300) NULL,
	[IdGenero] [int] NULL,
	[IdTipoDoc] [int] NULL,
	[Documento] [varchar](300) NULL,
	[IdPrograma] [int] NULL,
	[Email] [varchar](500) NULL,
	[Telefono] [varchar](300) NULL,
	[IdRol] [int] NULL,
	[Direccion] [varchar](500) NULL,
	[Contraseña] [varchar](500) NULL,
	[Egresado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Documento] ON 

INSERT [dbo].[Documento] ([IdTipoDoc], [ValTipoDoc]) VALUES (1, N'Cedula')
INSERT [dbo].[Documento] ([IdTipoDoc], [ValTipoDoc]) VALUES (2, N'T.I')
INSERT [dbo].[Documento] ([IdTipoDoc], [ValTipoDoc]) VALUES (3, N'Pasaporte')
INSERT [dbo].[Documento] ([IdTipoDoc], [ValTipoDoc]) VALUES (4, N'Cd.Extrangera')
SET IDENTITY_INSERT [dbo].[Documento] OFF
GO
SET IDENTITY_INSERT [dbo].[Genero] ON 

INSERT [dbo].[Genero] ([IdGenero], [ValGenero]) VALUES (1, N'Masculino')
INSERT [dbo].[Genero] ([IdGenero], [ValGenero]) VALUES (2, N'Femenino')
INSERT [dbo].[Genero] ([IdGenero], [ValGenero]) VALUES (3, N'Otro')
SET IDENTITY_INSERT [dbo].[Genero] OFF
GO
SET IDENTITY_INSERT [dbo].[Programa] ON 

INSERT [dbo].[Programa] ([IdPrograma], [ValPrograma], [Pensum]) VALUES (1, N'ESP.TI', NULL)
INSERT [dbo].[Programa] ([IdPrograma], [ValPrograma], [Pensum]) VALUES (2, N'MG.TI', NULL)
INSERT [dbo].[Programa] ([IdPrograma], [ValPrograma], [Pensum]) VALUES (3, N'MGRA', NULL)
SET IDENTITY_INSERT [dbo].[Programa] OFF
GO
SET IDENTITY_INSERT [dbo].[Rol] ON 

INSERT [dbo].[Rol] ([IdRol], [ValRol]) VALUES (1, N'Administrador')
INSERT [dbo].[Rol] ([IdRol], [ValRol]) VALUES (2, N'Coordinador')
INSERT [dbo].[Rol] ([IdRol], [ValRol]) VALUES (3, N'Estudiante')
SET IDENTITY_INSERT [dbo].[Rol] OFF
GO
ALTER TABLE [dbo].[Entrevista]  WITH CHECK ADD  CONSTRAINT [FK_Entrevista_ToUsuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[Entrevista] CHECK CONSTRAINT [FK_Entrevista_ToUsuario]
GO
ALTER TABLE [dbo].[Homologacion]  WITH CHECK ADD  CONSTRAINT [FK_Homologacion_ToModulo] FOREIGN KEY([IdModulo])
REFERENCES [dbo].[Modulo] ([IdModulo])
GO
ALTER TABLE [dbo].[Homologacion] CHECK CONSTRAINT [FK_Homologacion_ToModulo]
GO
ALTER TABLE [dbo].[Homologacion]  WITH CHECK ADD  CONSTRAINT [FK_Homologacion_ToPrograma] FOREIGN KEY([IdPrograma])
REFERENCES [dbo].[Programa] ([IdPrograma])
GO
ALTER TABLE [dbo].[Homologacion] CHECK CONSTRAINT [FK_Homologacion_ToPrograma]
GO
ALTER TABLE [dbo].[Homologacion]  WITH CHECK ADD  CONSTRAINT [FK_Homologacion_ToUsuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[Homologacion] CHECK CONSTRAINT [FK_Homologacion_ToUsuario]
GO
ALTER TABLE [dbo].[Modulo]  WITH CHECK ADD  CONSTRAINT [FK_Modulo_ToPrograma] FOREIGN KEY([IdPrograma])
REFERENCES [dbo].[Programa] ([IdPrograma])
GO
ALTER TABLE [dbo].[Modulo] CHECK CONSTRAINT [FK_Modulo_ToPrograma]
GO
ALTER TABLE [dbo].[Pagos]  WITH CHECK ADD  CONSTRAINT [FK_Pagos_ToUsuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[Pagos] CHECK CONSTRAINT [FK_Pagos_ToUsuario]
GO
ALTER TABLE [dbo].[Programacion]  WITH CHECK ADD  CONSTRAINT [FK_Programacion_ToModulo] FOREIGN KEY([IdModulo])
REFERENCES [dbo].[Modulo] ([IdModulo])
GO
ALTER TABLE [dbo].[Programacion] CHECK CONSTRAINT [FK_Programacion_ToModulo]
GO
ALTER TABLE [dbo].[Programacion]  WITH CHECK ADD  CONSTRAINT [FK_Programacion_ToPrograma] FOREIGN KEY([IdPrograma])
REFERENCES [dbo].[Programa] ([IdPrograma])
GO
ALTER TABLE [dbo].[Programacion] CHECK CONSTRAINT [FK_Programacion_ToPrograma]
GO
ALTER TABLE [dbo].[ProgramaUsuario]  WITH CHECK ADD  CONSTRAINT [FK_ProgramaUsuario_ToUsuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[ProgramaUsuario] CHECK CONSTRAINT [FK_ProgramaUsuario_ToUsuario]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_ToDocumento] FOREIGN KEY([IdTipoDoc])
REFERENCES [dbo].[Documento] ([IdTipoDoc])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_ToDocumento]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_ToGenero] FOREIGN KEY([IdGenero])
REFERENCES [dbo].[Genero] ([IdGenero])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_ToGenero]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_ToPrograma] FOREIGN KEY([IdPrograma])
REFERENCES [dbo].[Programa] ([IdPrograma])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_ToPrograma]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_ToRol] FOREIGN KEY([IdRol])
REFERENCES [dbo].[Rol] ([IdRol])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_ToRol]
GO
USE [master]
GO
ALTER DATABASE [SGPDB] SET  READ_WRITE 
GO

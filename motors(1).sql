USE [wankamotors]
GO
/****** Object:  Table [dbo].[TblCliente]    Script Date: 1/12/2020 21:42:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblCliente](
	[CliDni] [nchar](8) NOT NULL,
	[CliNombre] [nvarchar](50) NULL,
	[CliApellido] [nvarchar](50) NULL,
	[CliDireccion] [nvarchar](50) NULL,
	[CliGenere] [nchar](10) NULL,
	[CliEmail] [nvarchar](50) NULL,
	[CliTelefono] [nchar](9) NULL,
	[PerDni] [nchar](8) NULL,
 CONSTRAINT [PK_TblCliente] PRIMARY KEY CLUSTERED 
(
	[CliDni] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblDeltalleVenta]    Script Date: 1/12/2020 21:42:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblDeltalleVenta](
	[IdDetalleVenta] [int] IDENTITY(1000,1) NOT NULL,
	[igv_dt] [nchar](10) NULL,
	[Cantidad_dt] [int] NULL,
	[Descuento_dt] [decimal](7, 2) NULL,
	[IdVenta_dt] [int] NULL,
	[idvehiculo_dt] [int] NULL,
	[MontoTotal_dt] [decimal](7, 2) NULL,
 CONSTRAINT [PK_TblDeltalleVenta] PRIMARY KEY CLUSTERED 
(
	[IdDetalleVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLogin]    Script Date: 1/12/2020 21:42:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLogin](
	[LogDni] [nchar](8) NOT NULL,
	[LogPassword] [nvarchar](50) NULL,
	[LogTipoUsuario] [nchar](1) NULL,
 CONSTRAINT [PK_tblLogin] PRIMARY KEY CLUSTERED 
(
	[LogDni] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPersonal]    Script Date: 1/12/2020 21:42:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPersonal](
	[PerDni] [nchar](8) NOT NULL,
	[PerNombre] [nvarchar](50) NULL,
	[PerApellido] [nvarchar](50) NULL,
	[PerDireccion] [nvarchar](50) NULL,
	[PerGenero] [nchar](10) NULL,
	[PerEmail] [nvarchar](50) NULL,
	[PerTelefono] [nchar](9) NULL,
 CONSTRAINT [PK_tblPersonal] PRIMARY KEY CLUSTERED 
(
	[PerDni] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblVehiculo]    Script Date: 1/12/2020 21:42:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblVehiculo](
	[idvehiculo] [int] IDENTITY(1000,1) NOT NULL,
	[VeModelo] [nvarchar](50) NULL,
	[VeVersion] [nvarchar](50) NULL,
	[VeColor] [nvarchar](50) NULL,
	[VeAño] [nchar](4) NULL,
	[VeMotor] [nvarchar](50) NULL,
	[VeConbustible] [nvarchar](50) NULL,
	[VeEjes] [nchar](2) NULL,
	[VeAsientos] [nchar](2) NULL,
	[VeRuedas] [nchar](2) NULL,
	[VeCarroseria] [nvarchar](50) NULL,
	[VePrecio] [decimal](7, 2) NULL,
	[VeImagen] [varbinary](max) NULL,
	[MarcaVehiculo] [varchar](100) NULL,
 CONSTRAINT [PK_tblVehiculo] PRIMARY KEY CLUSTERED 
(
	[idvehiculo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblVenta]    Script Date: 1/12/2020 21:42:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblVenta](
	[IdVenta] [int] IDENTITY(1000,1) NOT NULL,
	[Fecha] [date] NULL,
	[CliDni] [nchar](8) NULL,
	[PerDNI] [nchar](8) NULL,
 CONSTRAINT [PK_TblVenta] PRIMARY KEY CLUSTERED 
(
	[IdVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TblCliente]  WITH CHECK ADD  CONSTRAINT [FK_TblCliente_tblPersonal] FOREIGN KEY([PerDni])
REFERENCES [dbo].[tblPersonal] ([PerDni])
GO
ALTER TABLE [dbo].[TblCliente] CHECK CONSTRAINT [FK_TblCliente_tblPersonal]
GO
ALTER TABLE [dbo].[TblDeltalleVenta]  WITH CHECK ADD  CONSTRAINT [FK_TblDeltalleVenta_tblVehiculo] FOREIGN KEY([idvehiculo_dt])
REFERENCES [dbo].[tblVehiculo] ([idvehiculo])
GO
ALTER TABLE [dbo].[TblDeltalleVenta] CHECK CONSTRAINT [FK_TblDeltalleVenta_tblVehiculo]
GO
ALTER TABLE [dbo].[TblDeltalleVenta]  WITH CHECK ADD  CONSTRAINT [FK_TblDeltalleVenta_TblVenta] FOREIGN KEY([IdVenta_dt])
REFERENCES [dbo].[TblVenta] ([IdVenta])
GO
ALTER TABLE [dbo].[TblDeltalleVenta] CHECK CONSTRAINT [FK_TblDeltalleVenta_TblVenta]
GO
ALTER TABLE [dbo].[tblLogin]  WITH CHECK ADD  CONSTRAINT [FK_tblLogin_TblCliente] FOREIGN KEY([LogDni])
REFERENCES [dbo].[TblCliente] ([CliDni])
GO
ALTER TABLE [dbo].[tblLogin] CHECK CONSTRAINT [FK_tblLogin_TblCliente]
GO
ALTER TABLE [dbo].[tblLogin]  WITH CHECK ADD  CONSTRAINT [FK_tblLogin_tblPersonal] FOREIGN KEY([LogDni])
REFERENCES [dbo].[tblPersonal] ([PerDni])
GO
ALTER TABLE [dbo].[tblLogin] CHECK CONSTRAINT [FK_tblLogin_tblPersonal]
GO
ALTER TABLE [dbo].[TblVenta]  WITH CHECK ADD  CONSTRAINT [FK_TblVenta_TblCliente] FOREIGN KEY([CliDni])
REFERENCES [dbo].[TblCliente] ([CliDni])
GO
ALTER TABLE [dbo].[TblVenta] CHECK CONSTRAINT [FK_TblVenta_TblCliente]
GO
ALTER TABLE [dbo].[TblVenta]  WITH CHECK ADD  CONSTRAINT [FK_TblVenta_tblPersonal] FOREIGN KEY([PerDNI])
REFERENCES [dbo].[tblPersonal] ([PerDni])
GO
ALTER TABLE [dbo].[TblVenta] CHECK CONSTRAINT [FK_TblVenta_tblPersonal]
GO
/****** Object:  StoredProcedure [dbo].[Sp_DescripcionVehi]    Script Date: 1/12/2020 21:42:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Sp_DescripcionVehi]
@valor nvarchar(50)
as
select marcavehiculo,VeModelo,VeVersion,VeColor,VeAño,VeMotor,VeConbustible,VeEjes,VeAsientos,VeRuedas,VePrecio,VeImagen
from tblVehiculo
where VeModelo=@valor
GO
/****** Object:  StoredProcedure [dbo].[SP_insertCliente]    Script Date: 1/12/2020 21:42:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_insertCliente]
(@CliDni nchar(8),
@CliNombre nvarchar(50),
@CliApellido nvarchar(50),
@CliDireccion nvarchar(50),
@CliGenere nchar(10),
@CliEmail nvarchar(50),
@CliTelefono nchar (9))
as
insert into TblCliente
([CliDni],[CliNombre],[CliApellido],[CliDireccion],[CliGenere],[CliEmail],[CliTelefono])
values (@CliDni,@CliNombre,@CliApellido,@CliDireccion,@CliGenere,@CliEmail,@CliTelefono)
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertDetalle]    Script Date: 1/12/2020 21:42:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_InsertDetalle]
(@igv_dt nchar(10),
@Cantidad_dt int,
@Descuento_dt decimal (7,2),
@idvehiculo_dt nchar (10),
@MontoTotal_dt decimal (7,2))
as
insert into TblDeltalleVenta
(igv_dt,Cantidad_dt,Descuento_dt,IdVenta_dt,idvehiculo_dt,MontoTotal_dt)
values (@igv_dt,@Cantidad_dt,@Descuento_dt,(select top (1) IdVenta from TblVenta order by IdVenta desc),@idvehiculo_dt,@MontoTotal_dt)


GO
/****** Object:  StoredProcedure [dbo].[SP_InsertVenta]    Script Date: 1/12/2020 21:42:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_InsertVenta]
(
@CliDni nchar(8))
as
insert into TblVenta(Fecha,CliDni)
values (SYSDATETIME(),@CliDni)
GO
/****** Object:  StoredProcedure [dbo].[SP_MostrarAño]    Script Date: 1/12/2020 21:42:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_MostrarAño]
AS
SELECT 'Año: '+' '+ [VeAño] FROM tblVehiculo

WHERE idvehiculo='ford000001'
GO
/****** Object:  StoredProcedure [dbo].[Sp_mostrarAuto1]    Script Date: 1/12/2020 21:42:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[Sp_mostrarAuto1]
as
select ('Marca: '+ [MarcaVehiculo]) Marca ,('Modelo: '+VeModelo) Modelo,('Año: '+veaño) año,VePrecio 
from tblVehiculo
where [idvehiculo]='1001'
GO
/****** Object:  StoredProcedure [dbo].[Sp_mostrarAuto2]    Script Date: 1/12/2020 21:42:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Sp_mostrarAuto2]
as
select ('Marca: '+ [MarcaVehiculo]) Marca ,('Modelo: '+VeModelo) Modelo,('Año: '+veaño) año,VePrecio 
from tblVehiculo
where [idvehiculo]='1002'
GO
/****** Object:  StoredProcedure [dbo].[Sp_mostrarAuto3]    Script Date: 1/12/2020 21:42:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[Sp_mostrarAuto3]
as
select ('Marca: '+ [MarcaVehiculo]) Marca ,('Modelo: '+VeModelo) Modelo,('Año: '+veaño) año,VePrecio 
from tblVehiculo
where [idvehiculo]='1003'
GO
/****** Object:  StoredProcedure [dbo].[Sp_mostrarAuto4]    Script Date: 1/12/2020 21:42:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[Sp_mostrarAuto4]
as
select ('Marca: '+ [MarcaVehiculo]) Marca ,('Modelo: '+VeModelo) Modelo,('Año: '+veaño) año,VePrecio 
from tblVehiculo
where [idvehiculo]='1004'
GO
/****** Object:  StoredProcedure [dbo].[Sp_mostrarAuto5]    Script Date: 1/12/2020 21:42:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Sp_mostrarAuto5]
as
select ('Marca: '+ [MarcaVehiculo]) Marca ,('Modelo: '+VeModelo) Modelo,('Año: '+veaño) año,VePrecio 
from tblVehiculo
where [idvehiculo]='1005'
GO
/****** Object:  StoredProcedure [dbo].[Sp_mostrarAuto6]    Script Date: 1/12/2020 21:42:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[Sp_mostrarAuto6]
as
select ('Marca: '+ [MarcaVehiculo]) Marca ,('Modelo: '+VeModelo) Modelo,('Año: '+veaño) año,VePrecio 
from tblVehiculo
where [idvehiculo]='1006'
GO
/****** Object:  StoredProcedure [dbo].[Sp_mostrarAuto7]    Script Date: 1/12/2020 21:42:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Sp_mostrarAuto7]
as
select ('Marca: '+ [MarcaVehiculo]) Marca ,('Modelo: '+VeModelo) Modelo,('Año: '+veaño) año,VePrecio 
from tblVehiculo
where [idvehiculo]='1007'
GO
/****** Object:  StoredProcedure [dbo].[Sp_mostrarAuto8]    Script Date: 1/12/2020 21:42:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Sp_mostrarAuto8]
as
select ('Marca: '+ [MarcaVehiculo]) Marca ,('Modelo: '+VeModelo) Modelo,('Año: '+veaño) año,VePrecio 
from tblVehiculo
where [idvehiculo]='1008'
GO
/****** Object:  StoredProcedure [dbo].[SP_MostrarModelo]    Script Date: 1/12/2020 21:42:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_MostrarModelo]
AS
SELECT 'Modelo: '+' '+ [VeModelo] FROM tblVehiculo

WHERE idvehiculo='ford000001'
---MOSTRAMOS EL AÑO DEL AUTO------
GO
/****** Object:  StoredProcedure [dbo].[SP_MostrarNomAuto]    Script Date: 1/12/2020 21:42:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_MostrarNomAuto]
AS
SELECT 'Nombre: '+' '+ [MarcaVehiculo] FROM tblVehiculo

WHERE idvehiculo='ford000001'
GO

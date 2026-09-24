USE master 
GO

CREATE DATABASE BDClinica ON
(
	NAME = BDClinica, FILENAME = 'D:\UTN\PROGRAMACION\2026\Programación III\BDClinica.mdf'
)
GO

USE BDClinica
GO

CREATE TABLE Especialidad
(
	Id_Especialidad_Espe INT IDENTITY(1,1) NOT NULL,
	Nombre_Espe	NVARCHAR (50) NOT NULL,
	Descripcion_Espe NVARCHAR (300) NOT NULL,

	CONSTRAINT PK_Especialidad PRIMARY KEY (Id_Especialidad_Espe)
)
GO

CREATE TABLE EstadoTurno
(
	Id_Estado_EsTur INT IDENTITY(1,1) NOT NULL,
	Descripcion_EsTur NVARCHAR (300) NOT NULL,

	CONSTRAINT PK_EstadoTurno  PRIMARY KEY (Id_Estado_EsTur)
)
GO

CREATE TABLE EstadoPaciente
(
	Id_EstadoPaciente_EsPa	INT IDENTITY (1,1) NOT NULL,
	Descripcion_EsPa  NVARCHAR (300) NOT NULL,

	CONSTRAINT PK_EstadoPaciente PRIMARY KEY (Id_EstadoPaciente_EsPa)
)
GO

CREATE TABLE Administradores
(
	Id_Administrador_Admin INT IDENTITY (1,1) NOT NULL,
	DNI_Admin INT UNIQUE NOT NULL,
	Nombre_Admin NVARCHAR (50) NOT NULL,
	Apellido_Admin NVARCHAR (50) NOT NULL,
	CorreoElectronico_Admin NVARCHAR (300) NULL,
	Telefono_Admin NVARCHAR (30) NULL,
	Activo_Admin BIT DEFAULT 1,

	CONSTRAINT PK_Administradores PRIMARY KEY (Id_Administrador_Admin)
)
GO

CREATE TABLE Provincias
(
	Id_Provincia_Prov INT IDENTITY (1,1) NOT NULL,
	Descripcion_Prov NVARCHAR (300) NOT NULL,

	CONSTRAINT PK_Provincias PRIMARY KEY (Id_Provincia_Prov)
)
GO

CREATE TABLE Localidades
(
	Id_Localidad_Local INT IDENTITY (1,1) NOT NULL,
	Id_Provincia_Local INT NOT NULL,
	Descripcion_Local NVARCHAR (300) NOT NULL,

	CONSTRAINT PK_Localidades PRIMARY KEY (Id_Localidad_Local),
	CONSTRAINT FK_Localidades_Provincias FOREIGN KEY (Id_Provincia_Local) REFERENCES Provincias (Id_Provincia_Prov)
)
GO


CREATE TABLE Medicos
(
	Id_Medico_Med INT IDENTITY (1,1) NOT NULL,
	Legajo_Med NVARCHAR (15) UNIQUE NOT NULL,
	Id_Provincia_Med INT NOT NULL,
	Id_Localidad_Med INT NOT NULL,
	Id_Especialidad_Med INT NOT NULL,
	DNI_Med	INT UNIQUE NOT NULL,
	Nombre_Med NVARCHAR (50) NOT NULL,
	Apellido_Med NVARCHAR (50) NOT NULL,
	Sexo_Med NVARCHAR (30) NULL,
	Nacionalidad_Med NVARCHAR (50) NOT NULL,
	FechaNacimiento_Med DATE NULL,
	Direccion_Med NVARCHAR (50) NOT NULL,
	CorreoElectronico_Med NVARCHAR (300) NULL,
	Telefono_Med NVARCHAR (30) NULL,
	Activo_Med BIT DEFAULT 1 NOT NULL,

	CONSTRAINT PK_Medicos PRIMARY KEY (Id_Medico_Med),
	CONSTRAINT FK_Medicos_Provincias FOREIGN KEY (Id_Provincia_Med) REFERENCES Provincias (Id_Provincia_Prov),
	CONSTRAINT FK_Medicos_Localidades FOREIGN KEY (Id_Localidad_Med) REFERENCES Localidades (Id_Localidad_Local),
	CONSTRAINT FK_Medicos_Especialidad FOREIGN KEY (Id_Especialidad_Med) REFERENCES Especialidad (Id_Especialidad_Espe)
)
GO

CREATE TABLE Disponibilidad_Medico
(
	Id_COD_DispMed INT IDENTITY (1,1) NOT NULL,
	Id_Medico_DispMed INT NOT NULL,
	DiaSemana_DispMed INT NOT NULL,
	Horario_DispMed TIME NOT NULL,

	CONSTRAINT PK_Disponibilidad_Medicos PRIMARY KEY (Id_COD_DispMed),
	CONSTRAINT FK_Disponibilidad_Medicos FOREIGN KEY (Id_Medico_DispMed) REFERENCES Medicos (Id_Medico_Med)
)
GO

CREATE TABLE Pacientes
(
	Id_Paciente_Paci INT IDENTITY (1,1) NOT NULL,
	Id_Provincia_Paci INT NOT NULL,
	Id_Localidad_Paci INT NOT NULL,
	DNI_Paci INT UNIQUE NOT NULL,
	Nombre_Paci NVARCHAR (50) NOT NULL,
	Apellido_Paci NVARCHAR (50) NOT NULL,
	Sexo_Paci NVARCHAR (30) NULL,
	Nacionalidad_Paci NVARCHAR (50) NOT NULL,
	FechaNacimiento_Paci DATE NULL,
	Direccion_Paci NVARCHAR (50) NOT NULL,
	CorreoElectronico_Paci NVARCHAR (300) NULL,
	Telefono_Paci NVARCHAR (30) NULL,
	Activo_Paci BIT DEFAULT 1 NOT NULL,

	CONSTRAINT PK_Pacientes PRIMARY KEY (Id_Paciente_Paci),
	CONSTRAINT FK_Pacientes_Provincias FOREIGN KEY (Id_Provincia_Paci) REFERENCES Provincias(Id_Provincia_Prov),
	CONSTRAINT FK_Pacientes_Localidades FOREIGN KEY (Id_Localidad_Paci) REFERENCES Localidades(Id_Localidad_Local)
)
GO

CREATE TABLE Turnos
(
	Id_Turno_Tur INT IDENTITY (1,1) NOT NULL,
	Id_Medico_Tur INT NOT NULL,
	Id_Especialidad_Tur INT NOT NULL,
	Id_Paciente_Tur INT NOT NULL,
	Id_EstadoPaciente_Tur INT NULL,
	Id_EstadoTurno_Tur INT NOT NULL,
	Fecha_Tur DATE NOT NULL,
	Horario_Tur TIME NOT NULL,
	Descripcion_Tur NVARCHAR (300) NULL,
	Activo_Tur BIT DEFAULT 1 NOT NULL,

	CONSTRAINT PK_Turnos PRIMARY KEY (Id_Turno_Tur),
	CONSTRAINT FK_Turnos_Medicos FOREIGN KEY (Id_Medico_Tur) REFERENCES Medicos (Id_Medico_Med),
	CONSTRAINT FK_Turnos_Especialidad FOREIGN KEY (Id_Especialidad_Tur) REFERENCES Especialidad (Id_Especialidad_Espe),
	CONSTRAINT FK_Turnos_Pacientes FOREIGN KEY (Id_Paciente_Tur) REFERENCES Pacientes (Id_Paciente_Paci),
	CONSTRAINT FK_Turnos_EstadoPaciente FOREIGN KEY (Id_EstadoPaciente_Tur) REFERENCES EstadoPaciente (Id_EstadoPaciente_EsPa),
	CONSTRAINT FK_Turnos_EstadoTurno FOREIGN KEY (Id_EstadoTurno_Tur) REFERENCES EstadoTurno (Id_Estado_EsTur)
)
GO

CREATE TABLE Usuarios
(
	Id_Usuario_Usu INT IDENTITY (1,1) NOT NULL,
	Id_Medico_Usu INT DEFAULT NULL,
	Id_Administrador_Usu INT DEFAULT NULL,
	Username_Usu NVARCHAR(30) NOT NULL,
	Password_Usu VARBINARY(256) NOT NULL,
	Activo_Usu BIT DEFAULT 1 NOT NULL,

	CONSTRAINT PK_Usuarios PRIMARY KEY (Id_Usuario_Usu),
	CONSTRAINT FK_Usuarios_Medicos FOREIGN KEY (Id_Medico_Usu) REFERENCES Medicos (Id_Medico_Med),
	CONSTRAINT FK_Usuarios_Administradores FOREIGN KEY (Id_Administrador_Usu) REFERENCES Administradores (Id_Administrador_Admin)
)
GO
--Autor: Argenis García Zetina
--Fecha: 14/07/2016

CREATE DATABASE chinomanMail;

\c chinomanmail

CREATE TABLE Usuarios (
	idUsuario			serial,
	nombre				varchar(32) NOT NULL,
	apellidoPaterno			varchar(32) NOT NULL,
	apellidoMaterno			varchar(32) NOT NULL,
	correoElectronico		varchar(64) NOT NULL,
	contrasena			varchar(16) NOT NULL,
	CONSTRAINT pkUsuarios PRIMARY KEY (idUsuario)
);

CREATE TABLE Mensajes (
	idMensaje			serial,
	idRemitente			int NOT NULL,
	fecha				timestamp NOT NULL,
	asunto				varchar(256),
	mensaje				text,
	estatus				int NOT NULL, -- 1 Enviados, 2 Borradores, 3 Papelera
	CONSTRAINT pkMensajes PRIMARY KEY (idMensaje),
	CONSTRAINT fkUsuariosMensajes FOREIGN KEY (idRemitente) REFERENCES Usuarios (idUsuario)
);

CREATE TABLE UsuariosMensajes (
	idMensaje			int,
	idDestinatario			int,
	estatus				int NOT NULL, -- 1 Recibidos, 2 No deseado, 3 Papelera
	CONSTRAINT pkUsuariosMensajes PRIMARY KEY (idMensaje, idDestinatario),
	CONSTRAINT fkMensajesUsuariosMensajes FOREIGN KEY (idMensaje) REFERENCES Mensajes (idMensaje),
	CONSTRAINT fkUsuariosUsuariosMensajes FOREIGN KEY (idDestinatario) REFERENCES Usuarios (idUsuario)
);

CREATE TABLE Contactos (
	idUsuario			int,
	idContacto			int,
	CONSTRAINT pkContactos PRIMARY KEY (idUsuario, idContacto),
	CONSTRAINT fkUsuariosContactosUsr FOREIGN KEY (idUsuario) REFERENCES Usuarios (idUsuario),
	CONSTRAINT fkUsuariosContactosCtc FOREIGN KEY (idContacto) REFERENCES Usuarios (idUsuario)
);


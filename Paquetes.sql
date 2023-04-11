CREATE DATABASE Paquetes	

GO
USE Paquetes
GO

CREATE SCHEMA gral
GO
CREATE SCHEMA paqu
GO
CREATE SCHEMA acce

GO

--CREACION DE TABLA tbDepartamentos
CREATE TABLE gral.tbDepartamentos(
	dept_ID						CHAR(2),
	dept_Descripcion			NVARCHAR(200),
	dept_Estado					INT DEFAULT (1),
	dept_UserCreacion			INT,
	dept_FechaCreacion			DATETIME DEFAULT GETDATE(),
	dept_UserModificacion		INT,
	dept_FechaModificacion		DATETIME,	
	CONSTRAINT PK_gral_tbDepartamentos_dept_ID PRIMARY KEY (dept_ID)
)

GO

--CREACION DE TABLA tbMunicipios
CREATE TABLE gral.tbMunicipios(
	dept_ID						CHAR(2),
	muni_ID						CHAR(4),
	muni_Descripcion			NVARCHAR(200),
	muni_Estado					INT DEFAULT 1,
	muni_UserCreador			INT,
	muni_FechaCreacion			DATETIME DEFAULT GETDATE(),
	muni_UserModificacion		INT,
	muni_FechaModificacion		DATETIME,
	CONSTRAINT PK_gral_tbMunicipios_muni_ID PRIMARY KEY (muni_ID),
	CONSTRAINT FK_gral_tbMunicipios_tbDepartamentos_dept_ID FOREIGN KEY(dept_ID) 
	REFERENCES gral.tbDepartamentos (dept_ID),
)
GO

CREATE TABLE paqu.tbPersonas
(
pers_ID						INT IDENTITY(1,1),
pers_Identidad				NVARCHAR(13) NOT NULL,
pers_Nombres				NVARCHAR(150) NOT NULL,
pers_Apellidos				NVARCHAR(150) NOT NULL,
pers_Sexo					CHAR NOT NULL,
pers_EsAdmin				BIT,
pers_FechaCreacion			DATETIME DEFAULT GETDATE(),
pers_UserCreacion			INT NOT NULL,
pers_FechaModificacion		DATETIME,
pers_UserModificacion       INT,
pers_Estado                 BIT DEFAULT 1,

CONSTRAINT PK_tbPersonas_pers_ID PRIMARY KEY(pers_ID),
CONSTRAINT CK_tbPersonas_pers_Sexo CHECK (pers_Sexo = 'M' OR pers_Sexo = 'F'),
CONSTRAINT UQ_tbPersonas_pers_Identidad UNIQUE (pers_Identidad)
)

GO
INSERT INTO paqu.tbPersonas(pers_Identidad,pers_Nombres,
pers_Apellidos,pers_Sexo,
pers_EsAdmin,pers_UserCreacion,
pers_FechaModificacion,pers_UserModificacion)
VALUES('0501200414817','Christopher','Aguilar','M',1,1,NULL,NULL)
GO

CREATE TABLE acce.tbUsuarios
(
[user_ID]				INT IDENTITY (1,1),
user_Username			NVARCHAR(150) NOT NULL,
pers_ID					INT NOT NULL,
user_FechaCreacion      DATETIME DEFAULT GETDATE(),
user_UserCreacion		INT,
user_FechaModificacion  DATETIME,
user_UserModificacion   INT,
user_Estado				BIT DEFAULT 1,

CONSTRAINT PK_tbUsuarios_user_ID PRIMARY KEY([user_ID]),
CONSTRAINT FK_tbUsuarios_pers_ID_tbPersonas_pers_ID FOREIGN KEY (pers_ID) REFERENCES paqu.tbPersonas(pers_ID)
)

GO
INSERT INTO acce.tbUsuarios(user_Username,pers_ID,
user_UserCreacion,user_FechaModificacion,
user_UserModificacion)
VALUES('admin',1,1,NULL,NULL)
GO
 
ALTER TABLE acce.tbUsuarios
ADD CONSTRAINT FK_tbUsuario_user_ID_tbUsuarios_user_UserCreacion FOREIGN KEY (user_UserCreacion) REFERENCES acce.tbUsuarios ([user_ID])

GO

ALTER TABLE acce.tbUsuarios
ADD CONSTRAINT FK_tbUsuarios_user_ID_tbUsuarios_user_UserModificacion FOREIGN KEY (user_UserModificacion) REFERENCES acce.tbUsuarios ([user_ID])

GO

ALTER TABLE paqu.tbPersonas
ADD CONSTRAINT FK_tbPersonas_pers_UserCreacion_tbUsuarios_user_ID FOREIGN KEY (pers_UserCreacion) REFERENCES acce.tbUsuarios ([user_ID])

GO

ALTER TABLE paqu.tbPersonas
ADD CONSTRAINT FK_tbPersonas_pers_UserModificacion_tbUsuarios_user_ID FOREIGN KEY (pers_UserModificacion) REFERENCES acce.tbUsuarios ([user_ID])

GO

CREATE TABLE paqu.tbSucursales
(
sucu_ID						INT IDENTITY (1,1),
sucu_Nombre					NVARCHAR(150) NOT NULL,
muni_ID						CHAR(4) NOT NUll,
sucu_DireccionExacta		NVARCHAR(250) NOT NULL,
sucu_FechaCreacion			DATETIME DEFAULT GETDATE(),
sucu_UserCreacion			INT NOT NULL,
sucu_FechaModificacion		DATETIME,
sucu_UserModificacion		INT,

CONSTRAINT PK_tbSucursales_sucu_ID PRIMARY KEY(sucu_ID),
CONSTRAINT FK_tbSucursales_muni_ID_tbMunicipios_muni_ID FOREIGN KEY(muni_ID) REFERENCES gral.tbMunicipios (muni_ID),
CONSTRAINT FK_tbSucursales_sucu_UserCreacion_tbUsuarios_user_ID FOREIGN KEY (sucu_UserCreacion) REFERENCES acce.tbUsuarios([user_ID]),
CONSTRAINT FK_tbSucursales_sucu_UserModificacion_tbUsuarios_user_ID FOREIGN KEY (sucu_UserModificacion) REFERENCES acce.tbUsuarios([user_ID])
)

GO
CREATE TABLE gral.tbMetodosPago
(
meto_ID						INT IDENTITY(1,1),
meto_Nombre					NVARCHAR(150) NOT NULL,
meto_FechaCreacion			DATETIME DEFAULT GETDATE(),
meto_UserCreacion			INT NOT NULL,
meto_FechaModificacion		DATETIME,
meto_UserModificacion		INT,
meto_Estado					BIT

CONSTRAINT PK_tbMetodosPago_meto_ID PRIMARY KEY (meto_ID),
CONSTRAINT FK_tbMetodosPago_meto_userCreacion_tbUsuarios_user_ID FOREIGN KEY (meto_UserCreacion) REFERENCES acce.tbUsuarios ([user_ID]),
CONSTRAINT FK_tbMetodosPago_meto_user_Modificacion_tbUsuarios_user_ID FOREIGN KEY (meto_UserModificacion) REFERENCES acce.tbUsuarios ([user_ID])
)
GO

CREATE TABLE paqu.tbPaquetes
(
paqu_ID					INT IDENTITY (1,1),
paqu_Cliente			INT NOT NULL,
sucu_ID					INT NOT NULL,
paqu_Peso				INT NOT NULL,
paqu_Fragil				BIT NOT NULL,
meto_ID					INT NOT NULL,
muni_ID					CHAR(4) NOT NULL,
paqu_DireccionExacta    NVARCHAR(250) NOT NULL,
paqu_FechaSalida		DATETIME NOT NULL,
paqu_FechaCreacion      DATETIME DEFAULT GETDATE(),
paqu_UserCreacion		INT NOT NULL,
paqu_FechaModificacion  DATETIME,
paqu_UserModificacion	INT,
paqu_Estado				BIT,

CONSTRAINT PK_tbPaquetes_paqu_ID PRIMARY KEY (paqu_ID),
CONSTRAINT FK_tbPaquetes_sucu_ID_tbSucursales_sucu_ID FOREIGN KEY (sucu_ID) REFERENCES paqu.tbSucursales (sucu_ID),
CONSTRAINT FK_tbPaquetes_muni_ID_tbMunicipios_muni_ID FOREIGN KEY (muni_ID) REFERENCES gral.tbMunicipios (muni_ID),
CONSTRAINT FK_tbPaquetes_meto_ID_tbMetodosPago_meto_ID FOREIGN KEY (meto_ID) REFERENCES gral.tbMetodosPago (meto_ID),
CONSTRAINT FK_tbPaquetes_paqu_UserCreacion_tbUsuarios_user_ID FOREIGN KEY (paqu_UserCreacion) REFERENCES acce.tbUsuarios ([user_ID]),
CONSTRAINT FK_tbPaquetes_paqu_UserModificacion_tbUsuarios_user_ID FOREIGN KEY (paqu_UserModificacion) REFERENCES acce.tbUsuarios ([user_Id])
)

/*Insert de Departamentos y municipios*/
INSERT INTO gral.tbDepartamentos(dept_ID, dept_Descripcion, dept_Estado, dept_UsuarioCreador, dept_FechaCreacion, dept_UsuarioModificador, dept_FechaModificacion)
VALUES	('01','Atl�ntida', '1', NULL, GETDATE(), NULL, GETDATE()),
		('02','Col�n', '1', NULL, GETDATE(), NULL, GETDATE()),
		('03','Comayagua', '1', NULL, GETDATE(), NULL, GETDATE()),
		('04','Cop�n', '1', NULL, GETDATE(), NULL, GETDATE()),
		('05','Cort�s', '1', NULL, GETDATE(), NULL, GETDATE()),
		('06','Choluteca', '1', NULL, GETDATE(), NULL, GETDATE()),
		('07','El Para�so', '1', NULL, GETDATE(), NULL, GETDATE()),
		('08','Francisco Moraz�n', '1', NULL, GETDATE(), NULL, GETDATE()),
		('09','Gracias a Dios', '1', NULL, GETDATE(), NULL, GETDATE()),
		('10','Intibuc�', '1', NULL, GETDATE(), NULL, GETDATE()),
		('11','Islas de la Bah�a', '1', NULL, GETDATE(), NULL, GETDATE()),
		('12','La Paz', '1', NULL, GETDATE(), NULL, GETDATE()),
		('13','Lempira', '1', NULL, GETDATE(), NULL, GETDATE()),
		('14','Ocotepeque', '1', NULL, GETDATE(), NULL, GETDATE()),
		('15','Olancho', '1', NULL, GETDATE(), NULL, GETDATE()),
		('16','Santa B�rbara', '1', NULL, GETDATE(), NULL, GETDATE()),
		('17','Valle', '1', NULL, GETDATE(), NULL, GETDATE()),
		('18','Yoro', '1', NULL, GETDATE(), NULL, GETDATE());
GO


INSERT INTO gral.tbMunicipios(dept_ID, muni_ID, muni_Descripcion, muni_Estado, muni_UsuarioCreador, muni_FechaCreacion, muni_UsuarioModificador, muni_FechaModificacion)
VALUES	('01','0101','La Ceiba', '1', NULL, GETDATE(), NULL, GETDATE()),
		('01','0102','El Porvenir', '1', NULL, GETDATE(), NULL, GETDATE()),
		('01','0103','Tela', '1', NULL, GETDATE(), NULL, GETDATE()),
		('01','0104','Jutiapa', '1', NULL, GETDATE(), NULL, GETDATE()),
		('01','0105','La Masica', '1', NULL, GETDATE(), NULL, GETDATE()),
		('01','0106','San Francisco', '1', NULL, GETDATE(), NULL, GETDATE()),
		('01','0107','Arizona', '1', NULL, GETDATE(), NULL, GETDATE()),
		('01','0108','Esparta', '1', NULL, GETDATE(), NULL, GETDATE()),
	

		('02','0201','Trujillo', '1', NULL, GETDATE(), NULL, GETDATE()),
		('02','0202','Balfate', '1', NULL, GETDATE(), NULL, GETDATE()),
		('02','0203','Iriona', '1', NULL, GETDATE(), NULL, GETDATE()),
		('02','0204','Lim�n', '1', NULL, GETDATE(), NULL, GETDATE()),
		('02','0205','Sab�', '1', NULL, GETDATE(), NULL, GETDATE()),
		('02','0206','Santa Fe', '1', NULL, GETDATE(), NULL, GETDATE()),
		('02','0207','Santa Rosa de Agu�n', '1', NULL, GETDATE(), NULL, GETDATE()),
		('02','0208','Sonaguera', '1', NULL, GETDATE(), NULL, GETDATE()),
		('02','0209','Tocoa', '1', NULL, GETDATE(), NULL, GETDATE()),
		('02','0210','Bonito Oriental', '1', NULL, GETDATE(), NULL, GETDATE()),


		('03',		'0301',		'Comayagua', '1', NULL, GETDATE(), NULL, GETDATE()),
		('03',		'0302',		'Ajuterique', '1', NULL, GETDATE(), NULL, GETDATE()),
		('03',		'0303',		'El Rosario', '1', NULL, GETDATE(), NULL, GETDATE()),
		('03',		'0304',		'Esqu�as', '1', NULL, GETDATE(), NULL, GETDATE()),
		('03',		'0305',		'Humuya', '1', NULL, GETDATE(), NULL, GETDATE()),
		('03',		'0306',		'La Libertad', '1', NULL, GETDATE(), NULL, GETDATE()),
		('03',		'0307',		'Laman�', '1', NULL, GETDATE(), NULL, GETDATE()),
		('03',		'0308',		'La Trinidad', '1', NULL, GETDATE(), NULL, GETDATE()),
		('03',		'0309',		'Lejaman�', '1', NULL, GETDATE(), NULL, GETDATE()),
		('03',		'0310',		'Me�mbar', '1', NULL, GETDATE(), NULL, GETDATE()),
		('03',		'0311',		'Minas de Oro', '1', NULL, GETDATE(), NULL, GETDATE()),
		('03',		'0312',		'Ojos de Agua', '1', NULL, GETDATE(), NULL, GETDATE()),
		('03',		'0313',		'San Jer�nimo', '1', NULL, GETDATE(), NULL, GETDATE()),
		('03',		'0314',		'San Jos� de Comayagua', '1', NULL, GETDATE(), NULL, GETDATE()),
		('03',		'0315',		'San Jos� del Potrero', '1', NULL, GETDATE(), NULL, GETDATE()),
		('03',		'0316',		'San Luis', '1', NULL, GETDATE(), NULL, GETDATE()),
		('03',		'0317',		'San Sebasti�n', '1', NULL, GETDATE(), NULL, GETDATE()),
		('03',		'0318',		'Siguatepeque', '1', NULL, GETDATE(), NULL, GETDATE()),
		('03',		'0319',		'Villa de San Antonio', '1', NULL, GETDATE(), NULL, GETDATE()),
		('03',		'0320',		'Las Lajas', '1', NULL, GETDATE(), NULL, GETDATE()),
		('03',		'0321',		'Taulab�', '1', NULL, GETDATE(), NULL, GETDATE()),


		('04',	'0401','Santa Rosa de Cop�n', '1', NULL, GETDATE(), NULL, GETDATE()),
		('04',	'0402','Caba�as', '1', NULL, GETDATE(), NULL, GETDATE()),
		('04',	'0403','Concepci�n', '1', NULL, GETDATE(), NULL, GETDATE()),
		('04',	'0404','Cop�n Ruinas', '1', NULL, GETDATE(), NULL, GETDATE()),
		('04',	'0405','Corqu�n', '1', NULL, GETDATE(), NULL, GETDATE()),
		('04',	'0406','Cucuyagua', '1', NULL, GETDATE(), NULL, GETDATE()),
		('04',	'0407','Dolores', '1', NULL, GETDATE(), NULL, GETDATE()),
		('04',	'0408','Dulce Nombre', '1', NULL, GETDATE(), NULL, GETDATE()),
		('04',	'0409','El Para�so', '1', NULL, GETDATE(), NULL, GETDATE()),
		('04',	'0410','Florida', '1', NULL, GETDATE(), NULL, GETDATE()),
		('04',	'0411','La Jigua', '1', NULL, GETDATE(), NULL, GETDATE()),
		('04',	'0412','La Uni�n', '1', NULL, GETDATE(), NULL, GETDATE()),
		('04',	'0413','Nueva Arcadia', '1', NULL, GETDATE(), NULL, GETDATE()),
		('04',	'0414','San Agust�n', '1', NULL, GETDATE(), NULL, GETDATE()),
		('04',	'0415','San Antonio', '1', NULL, GETDATE(), NULL, GETDATE()),
		('04',	'0416','San Jer�nimo', '1', NULL, GETDATE(), NULL, GETDATE()),
		('04',	'0417','San Jos�', '1', NULL, GETDATE(), NULL, GETDATE()),
		('04',	'0418','San Juan de Opoa', '1', NULL, GETDATE(), NULL, GETDATE()),
		('04',	'0419','San Nicol�s', '1', NULL, GETDATE(), NULL, GETDATE()),
		('04',	'0420','San Pedro', '1', NULL, GETDATE(), NULL, GETDATE()),
		('04',	'0421','Santa Rita', '1', NULL, GETDATE(), NULL, GETDATE()),
		('04',	'0422','Trinidad de Cop�n', '1', NULL, GETDATE(), NULL, GETDATE()),
		('04',	'0423','Veracruz', '1', NULL, GETDATE(), NULL, GETDATE()),


		('05',	'0501','San Pedro Sula', '1', NULL, GETDATE(), NULL, GETDATE()),
		('05',	'0502','Choloma', '1', NULL, GETDATE(), NULL, GETDATE()),
		('05',	'0503','Omoa', '1', NULL, GETDATE(), NULL, GETDATE()),
		('05',	'0504','Pimienta', '1', NULL, GETDATE(), NULL, GETDATE()),
		('05',	'0505','Potrerillos', '1', NULL, GETDATE(), NULL, GETDATE()),
		('05',	'0506','Puerto Cort�s', '1', NULL, GETDATE(), NULL, GETDATE()),
		('05',	'0507','San Antonio de Cort�s', '1', NULL, GETDATE(), NULL, GETDATE()),
		('05',	'0508','San Francisco de Yojoa', '1', NULL, GETDATE(), NULL, GETDATE()),
		('05',	'0509','San Manuel', '1', NULL, GETDATE(), NULL, GETDATE()),
		('05',	'0510','Santa Cruz de Yojoa', '1', NULL, GETDATE(), NULL, GETDATE()),
		('05',	'0511','Villanueva', '1', NULL, GETDATE(), NULL, GETDATE()),
		('05',	'0512','La Lima', '1', NULL, GETDATE(), NULL, GETDATE()),


		('06',	'0601','Choluteca', '1', NULL, GETDATE(), NULL, GETDATE()),
		('06',	'0602','Apacilagua', '1', NULL, GETDATE(), NULL, GETDATE()),
		('06',	'0603','Concepci�n de María', '1', NULL, GETDATE(), NULL, GETDATE()),
		('06',	'0604','Duyure', '1', NULL, GETDATE(), NULL, GETDATE()),
		('06',	'0605','El Corpus', '1', NULL, GETDATE(), NULL, GETDATE()),
		('06',	'0606','El Triunfo', '1', NULL, GETDATE(), NULL, GETDATE()),
		('06',	'0607','Marcovia', '1', NULL, GETDATE(), NULL, GETDATE()),
		('06',	'0608','Morolica', '1', NULL, GETDATE(), NULL, GETDATE()),
		('06',	'0609','Namasig�e', '1', NULL, GETDATE(), NULL, GETDATE()),
		('06',	'0610','Orocuina', '1', NULL, GETDATE(), NULL, GETDATE()),
		('06',	'0611','Pespire', '1', NULL, GETDATE(), NULL, GETDATE()),
		('06',	'0612','San Antonio de Flores', '1', NULL, GETDATE(), NULL, GETDATE()),
		('06',	'0613','San Isidro', '1', NULL, GETDATE(), NULL, GETDATE()),
		('06',	'0614','San Jos�', '1', NULL, GETDATE(), NULL, GETDATE()),
		('06',	'0615','San Marcos de Col�n', '1', NULL, GETDATE(), NULL, GETDATE()),
		('06',	'0616','Santa Ana de Yusguare', '1', NULL, GETDATE(), NULL, GETDATE()),


		('07', '0701', 'Yuscar�n', '1', NULL, GETDATE(), NULL, GETDATE()),
		('07', '0702', 'Alauca', '1', NULL, GETDATE(), NULL, GETDATE()),
		('07', '0703', 'Danl�', '1', NULL, GETDATE(), NULL, GETDATE()),
		('07', '0704', 'El Para�so', '1', NULL, GETDATE(), NULL, GETDATE()),
		('07', '0705', 'G�inope', '1', NULL, GETDATE(), NULL, GETDATE()),
		('07', '0706', 'Jacaleapa', '1', NULL, GETDATE(), NULL, GETDATE()),
		('07', '0707', 'Liure', '1', NULL, GETDATE(), NULL, GETDATE()),
		('07', '0708', 'Morocel�', '1', NULL, GETDATE(), NULL, GETDATE()),
		('07', '0709', 'Oropol�', '1', NULL, GETDATE(), NULL, GETDATE()),
		('07', '0710', 'Potrerillos', '1', NULL, GETDATE(), NULL, GETDATE()),
		('07', '0711', 'San Antonio de Flores', '1', NULL, GETDATE(), NULL, GETDATE()),
		('07', '0712', 'San Lucas', '1', NULL, GETDATE(), NULL, GETDATE()),
		('07', '0713', 'San Mat�as', '1', NULL, GETDATE(), NULL, GETDATE()),
		('07', '0714', 'Soledad', '1', NULL, GETDATE(), NULL, GETDATE()),
		('07', '0715', 'Teupasenti', '1', NULL, GETDATE(), NULL, GETDATE()),
		('07', '0716', 'Texiguat', '1', NULL, GETDATE(), NULL, GETDATE()),
		('07', '0717', 'Vado Ancho', '1', NULL, GETDATE(), NULL, GETDATE()),
		('07', '0718', 'Yauyupe', '1', NULL, GETDATE(), NULL, GETDATE()),
		('07', '0719', 'Trojes', '1', NULL, GETDATE(), NULL, GETDATE()),


		('08', '0801', 'Distrito Central', '1', NULL, GETDATE(), NULL, GETDATE()),
		('08', '0802', 'Alubar�n', '1', NULL, GETDATE(), NULL, GETDATE()),
		('08', '0803', 'Cedros', '1', NULL, GETDATE(), NULL, GETDATE()),
		('08', '0804', 'Curar�n', '1', NULL, GETDATE(), NULL, GETDATE()),
		('08', '0805', 'El Porvenir', '1', NULL, GETDATE(), NULL, GETDATE()),
		('08', '0806', 'Guaimaca', '1', NULL, GETDATE(), NULL, GETDATE()),
		('08', '0807', 'La Libertad', '1', NULL, GETDATE(), NULL, GETDATE()),
		('08', '0808', 'La Venta', '1', NULL, GETDATE(), NULL, GETDATE()),
		('08', '0809', 'Lepaterique', '1', NULL, GETDATE(), NULL, GETDATE()),
		('08', '0810', 'Maraita', '1', NULL, GETDATE(), NULL, GETDATE()),
		('08', '0811', 'Marale', '1', NULL, GETDATE(), NULL, GETDATE()),
		('08', '0812', 'Nueva Armenia', '1', NULL, GETDATE(), NULL, GETDATE()),
		('08', '0813', 'Ojojona', '1', NULL, GETDATE(), NULL, GETDATE()),
		('08', '0814', 'Orica', '1', NULL, GETDATE(), NULL, GETDATE()),
		('08', '0815', 'Reitoca', '1', NULL, GETDATE(), NULL, GETDATE()),
		('08', '0816', 'Sabanagrande', '1', NULL, GETDATE(), NULL, GETDATE()),
		('08', '0817', 'San Antonio de Oriente', '1', NULL, GETDATE(), NULL, GETDATE()),
		('08', '0818', 'San Buenaventura', '1', NULL, GETDATE(), NULL, GETDATE()),
		('08', '0819', 'San Ignacio', '1', NULL, GETDATE(), NULL, GETDATE()),
		('08', '0820', 'San Juan de Flores', '1', NULL, GETDATE(), NULL, GETDATE()),
		('08', '0821', 'San Miguelito', '1', NULL, GETDATE(), NULL, GETDATE()),
		('08', '0822', 'Santa Ana', '1', NULL, GETDATE(), NULL, GETDATE()),
		('08', '0823', 'Santa Luc�a', '1', NULL, GETDATE(), NULL, GETDATE()),
		('08', '0824', 'Talanga', '1', NULL, GETDATE(), NULL, GETDATE()),
		('08', '0825', 'Tatumbla', '1', NULL, GETDATE(), NULL, GETDATE()),
		('08', '0826', 'Valle de �ngeles', '1', NULL, GETDATE(), NULL, GETDATE()),
		('08', '0827', 'Villa de San Francisco', '1', NULL, GETDATE(), NULL, GETDATE()),
		('08', '0828', 'Vallecillo', '1', NULL, GETDATE(), NULL, GETDATE()),


		('09', '0901', 'Puerto Lempira', '1', NULL, GETDATE(), NULL, GETDATE()),
		('09', '0902', 'Brus Laguna', '1', NULL, GETDATE(), NULL, GETDATE()),
		('09', '0903', 'Ahuas', '1', NULL, GETDATE(), NULL, GETDATE()),
		('09', '0904', 'Juan Francisco Bulnes', '1', NULL, GETDATE(), NULL, GETDATE()),
		('09', '0905', 'Ram�n Villeda Morales', '1', NULL, GETDATE(), NULL, GETDATE()),
		('09', '0906', 'Wampusirpe', '1', NULL, GETDATE(), NULL, GETDATE()),


		('10', '1001', 'La Esperanza', '1', NULL, GETDATE(), NULL, GETDATE()),
		('10', '1002', 'Camasca', '1', NULL, GETDATE(), NULL, GETDATE()),
		('10', '1003', 'Colomoncagua', '1', NULL, GETDATE(), NULL, GETDATE()),
		('10', '1004', 'Concepci�n', '1', NULL, GETDATE(), NULL, GETDATE()),
		('10', '1005', 'Dolores', '1', NULL, GETDATE(), NULL, GETDATE()),
		('10', '1006', 'Intibuc�', '1', NULL, GETDATE(), NULL, GETDATE()),
		('10', '1007', 'Jes�s de Otoro', '1', NULL, GETDATE(), NULL, GETDATE()),
		('10', '1008', 'Magdalena', '1', NULL, GETDATE(), NULL, GETDATE()),
		('10', '1009', 'Masaguara', '1', NULL, GETDATE(), NULL, GETDATE()),
		('10', '1010', 'San Antonio', '1', NULL, GETDATE(), NULL, GETDATE()),
		('10', '1011', 'San Isidro', '1', NULL, GETDATE(), NULL, GETDATE()),
		('10', '1012', 'San Juan', '1', NULL, GETDATE(), NULL, GETDATE()),
		('10', '1013', 'San Marcos de la Sierra', '1', NULL, GETDATE(), NULL, GETDATE()),
		('10', '1014', 'San Miguel Guancapla', '1', NULL, GETDATE(), NULL, GETDATE()),
		('10', '1015', 'Santa Luc�a', '1', NULL, GETDATE(), NULL, GETDATE()),
		('10', '1016', 'Yamaranguila', '1', NULL, GETDATE(), NULL, GETDATE()),
		('10', '1017', 'San Francisco de Opalaca', '1', NULL, GETDATE(), NULL, GETDATE()),


		('11', '1101', 'Roat�n', '1', NULL, GETDATE(), NULL, GETDATE()),
		('11', '1102', 'Guanaja', '1', NULL, GETDATE(), NULL, GETDATE()),
		('11', '1103', 'Jos� Santos Guardiola', '1', NULL, GETDATE(), NULL, GETDATE()),
		('11', '1104', 'Utila', '1', NULL, GETDATE(), NULL, GETDATE()),


		('12', '1201', 'La Paz', '1', NULL, GETDATE(), NULL, GETDATE()),
		('12', '1202', 'Aguanqueterique', '1', NULL, GETDATE(), NULL, GETDATE()),
		('12', '1203', 'Caba�as', '1', NULL, GETDATE(), NULL, GETDATE()),
		('12', '1204', 'Cane', '1', NULL, GETDATE(), NULL, GETDATE()),
		('12', '1205', 'Chinacla', '1', NULL, GETDATE(), NULL, GETDATE()),
		('12', '1206', 'Guajiquiro', '1', NULL, GETDATE(), NULL, GETDATE()),
		('12', '1207', 'Lauterique', '1', NULL, GETDATE(), NULL, GETDATE()),
		('12', '1208', 'Marcala', '1', NULL, GETDATE(), NULL, GETDATE()),
		('12', '1209', 'Mercedes de Oriente', '1', NULL, GETDATE(), NULL, GETDATE()),
		('12', '1210', 'Opatoro', '1', NULL, GETDATE(), NULL, GETDATE()),
		('12', '1211', 'San Antonio del Norte', '1', NULL, GETDATE(), NULL, GETDATE()),
		('12', '1212', 'San Jos�', '1', NULL, GETDATE(), NULL, GETDATE()),
		('12', '1213', 'San Juan', '1', NULL, GETDATE(), NULL, GETDATE()),
		('12', '1214', 'San Pedro de Tutule', '1', NULL, GETDATE(), NULL, GETDATE()),
		('12', '1215', 'Santa Ana', '1', NULL, GETDATE(), NULL, GETDATE()),
		('12', '1216', 'Santa Elena', '1', NULL, GETDATE(), NULL, GETDATE()),
		('12', '1217', 'Santa Mar�a', '1', NULL, GETDATE(), NULL, GETDATE()),
		('12', '1218', 'Santiago de Puringla', '1', NULL, GETDATE(), NULL, GETDATE()),
		('12', '1219', 'Yarula', '1', NULL, GETDATE(), NULL, GETDATE()),


		('13', '1301', 'Gracias', '1', NULL, GETDATE(), NULL, GETDATE()),
		('13', '1302', 'Bel�n', '1', NULL, GETDATE(), NULL, GETDATE()),
		('13', '1303', 'Candelaria', '1', NULL, GETDATE(), NULL, GETDATE()),
		('13', '1304', 'Cololaca', '1', NULL, GETDATE(), NULL, GETDATE()),
		('13', '1305', 'Erandique', '1', NULL, GETDATE(), NULL, GETDATE()),
		('13', '1306', 'Gualcince', '1', NULL, GETDATE(), NULL, GETDATE()),
		('13', '1307', 'Guarita', '1', NULL, GETDATE(), NULL, GETDATE()),
		('13', '1308', 'La Campa', '1', NULL, GETDATE(), NULL, GETDATE()),
		('13', '1309', 'La Iguala', '1', NULL, GETDATE(), NULL, GETDATE()),
		('13', '1310', 'Las Flores', '1', NULL, GETDATE(), NULL, GETDATE()),
		('13', '1311', 'La Uni�n', '1', NULL, GETDATE(), NULL, GETDATE()),
		('13', '1312', 'La Virtud', '1', NULL, GETDATE(), NULL, GETDATE()),
		('13', '1313', 'Lepaera', '1', NULL, GETDATE(), NULL, GETDATE()),
		('13', '1314', 'Mapulaca', '1', NULL, GETDATE(), NULL, GETDATE()),
		('13', '1315', 'Piraera', '1', NULL, GETDATE(), NULL, GETDATE()),
		('13', '1316', 'San Andr�s', '1', NULL, GETDATE(), NULL, GETDATE()),
		('13', '1317', 'San Francisco', '1', NULL, GETDATE(), NULL, GETDATE()),
		('13', '1318', 'San Juan Guarita', '1', NULL, GETDATE(), NULL, GETDATE()),
		('13', '1319', 'San Manuel Colohete', '1', NULL, GETDATE(), NULL, GETDATE()),
		('13', '1320', 'San Rafael', '1', NULL, GETDATE(), NULL, GETDATE()),
		('13', '1321', 'San Sebasti�n', '1', NULL, GETDATE(), NULL, GETDATE()),
		('13', '1322', 'Santa Cruz', '1', NULL, GETDATE(), NULL, GETDATE()),
		('13', '1323', 'Talgua', '1', NULL, GETDATE(), NULL, GETDATE()),
		('13', '1324', 'Tambla', '1', NULL, GETDATE(), NULL, GETDATE()),
		('13', '1325', 'Tomal�', '1', NULL, GETDATE(), NULL, GETDATE()),
		('13', '1326', 'Valladolid', '1', NULL, GETDATE(), NULL, GETDATE()),
		('13', '1327', 'Virginia', '1', NULL, GETDATE(), NULL, GETDATE()),
		('13', '1328', 'San Marcos de Caiqu�n', '1', NULL, GETDATE(), NULL, GETDATE()),


		('14', '1401', 'Ocotepeque', '1', NULL, GETDATE(), NULL, GETDATE()),
		('14', '1402', 'Bel�n Gualcho', '1', NULL, GETDATE(), NULL, GETDATE()),
		('14', '1403', 'Concepci�n', '1', NULL, GETDATE(), NULL, GETDATE()),
		('14', '1404', 'Dolores Merend�n', '1', NULL, GETDATE(), NULL, GETDATE()),
		('14', '1405', 'Fraternidad', '1', NULL, GETDATE(), NULL, GETDATE()),
		('14', '1406', 'La Encarnaci�n', '1', NULL, GETDATE(), NULL, GETDATE()),
		('14', '1407', 'La Labor', '1', NULL, GETDATE(), NULL, GETDATE()),
		('14', '1408', 'Lucerna', '1', NULL, GETDATE(), NULL, GETDATE()),
		('14', '1409', 'Mercedes', '1', NULL, GETDATE(), NULL, GETDATE()),
		('14', '1410', 'San Fernando', '1', NULL, GETDATE(), NULL, GETDATE()),
		('14', '1411', 'San Francisco del Valle', '1', NULL, GETDATE(), NULL, GETDATE()),
		('14', '1412', 'San Jorge', '1', NULL, GETDATE(), NULL, GETDATE()),
		('14', '1413', 'San Marcos', '1', NULL, GETDATE(), NULL, GETDATE()),
		('14', '1414', 'Santa Fe', '1', NULL, GETDATE(), NULL, GETDATE()),
		('14', '1415', 'Sensenti', '1', NULL, GETDATE(), NULL, GETDATE()),
		('14', '1416', 'Sinuapa', '1', NULL, GETDATE(), NULL, GETDATE()),


		('15', '1501', 'Juticalpa', '1', NULL, GETDATE(), NULL, GETDATE()),
		('15', '1502', 'Campamento', '1', NULL, GETDATE(), NULL, GETDATE()),
		('15', '1503', 'Catacamas', '1', NULL, GETDATE(), NULL, GETDATE()),
		('15', '1504', 'Concordia', '1', NULL, GETDATE(), NULL, GETDATE()),
		('15', '1505', 'Dulce Nombre de Culm�', '1', NULL, GETDATE(), NULL, GETDATE()),
		('15', '1506', 'El Rosario', '1', NULL, GETDATE(), NULL, GETDATE()),
		('15', '1507', 'Esquipulas del Norte', '1', NULL, GETDATE(), NULL, GETDATE()),
		('15', '1508', 'Gualaco', '1', NULL, GETDATE(), NULL, GETDATE()),
		('15', '1509', 'Guarizama', '1', NULL, GETDATE(), NULL, GETDATE()),
		('15', '1510', 'Guata', '1', NULL, GETDATE(), NULL, GETDATE()),
		('15', '1511', 'Guayape', '1', NULL, GETDATE(), NULL, GETDATE()),
		('15', '1512', 'Jano', '1', NULL, GETDATE(), NULL, GETDATE()),
		('15', '1513', 'La Uni�n', '1', NULL, GETDATE(), NULL, GETDATE()),
		('15', '1514', 'Mangulile', '1', NULL, GETDATE(), NULL, GETDATE()),
		('15', '1515', 'Manto', '1', NULL, GETDATE(), NULL, GETDATE()),
		('15', '1516', 'Salam�', '1', NULL, GETDATE(), NULL, GETDATE()),
		('15', '1517', 'San Esteban', '1', NULL, GETDATE(), NULL, GETDATE()),
		('15', '1518', 'San Francisco de Becerra', '1', NULL, GETDATE(), NULL, GETDATE()),
		('15', '1519', 'San Francisco de la Paz', '1', NULL, GETDATE(), NULL, GETDATE()),
		('15', '1520', 'Santa Mar�a del Real', '1', NULL, GETDATE(), NULL, GETDATE()),
		('15', '1521', 'Silca', '1', NULL, GETDATE(), NULL, GETDATE()),
		('15', '1522', 'Yoc�n', '1', NULL, GETDATE(), NULL, GETDATE()),
		('15', '1523', 'Patuca', '1', NULL, GETDATE(), NULL, GETDATE()),


		('16', '1601' , 'Santa B�rbara', '1', NULL, GETDATE(), NULL, GETDATE()),
		('16', '1602' , 'Arada', '1', NULL, GETDATE(), NULL, GETDATE()),
		('16', '1603' , 'Atima', '1', NULL, GETDATE(), NULL, GETDATE()),
		('16', '1604' , 'Azacualpa', '1', NULL, GETDATE(), NULL, GETDATE()),
		('16', '1605' , 'Ceguaca', '1', NULL, GETDATE(), NULL, GETDATE()),
		('16', '1606' , 'Concepci�n del Norte', '1', NULL, GETDATE(), NULL, GETDATE()),
		('16', '1607' , 'Concepci�n del Sur', '1', NULL, GETDATE(), NULL, GETDATE()),
		('16', '1608' , 'Chinda', '1', NULL, GETDATE(), NULL, GETDATE()),
		('16', '1609' , 'El N�spero', '1', NULL, GETDATE(), NULL, GETDATE()),
		('16', '1610' , 'Gualala', '1', NULL, GETDATE(), NULL, GETDATE()),
		('16', '1611' , 'Ilama', '1', NULL, GETDATE(), NULL, GETDATE()),
		('16', '1612' , 'Las Vegas', '1', NULL, GETDATE(), NULL, GETDATE()),
		('16', '1613' , 'Macuelizo', '1', NULL, GETDATE(), NULL, GETDATE()),
		('16', '1614' , 'Naranjito', '1', NULL, GETDATE(), NULL, GETDATE()),
		('16', '1615' , 'Nuevo Celilac', '1', NULL, GETDATE(), NULL, GETDATE()),
		('16', '1616' , 'Nueva Frontera', '1', NULL, GETDATE(), NULL, GETDATE()),
		('16', '1617' , 'Petoa', '1', NULL, GETDATE(), NULL, GETDATE()),
		('16', '1618' , 'Protecci�n', '1', NULL, GETDATE(), NULL, GETDATE()),
		('16', '1619' , 'Quimist�n', '1', NULL, GETDATE(), NULL, GETDATE()),
		('16', '1620' , 'San Francisco de Ojuera', '1', NULL, GETDATE(), NULL, GETDATE()),
		('16', '1621' , 'San Jos� de las Colinas', '1', NULL, GETDATE(), NULL, GETDATE()),
		('16', '1622' , 'San Luis', '1', NULL, GETDATE(), NULL, GETDATE()),
		('16', '1623' , 'San Marcos', '1', NULL, GETDATE(), NULL, GETDATE()),
		('16', '1624' , 'San Nicol�s', '1', NULL, GETDATE(), NULL, GETDATE()),
		('16', '1625' , 'San Pedro Zacapa', '1', NULL, GETDATE(), NULL, GETDATE()),
		('16', '1626' , 'San Vicente Centenario', '1', NULL, GETDATE(), NULL, GETDATE()),
		('16', '1627' , 'Santa Rita', '1', NULL, GETDATE(), NULL, GETDATE()),
		('16', '1628' , 'Trinidad', '1', NULL, GETDATE(), NULL, GETDATE()),


		('17', '1701', 'Nacaome', '1', NULL, GETDATE(), NULL, GETDATE()),
		('17', '1702', 'Alianza', '1', NULL, GETDATE(), NULL, GETDATE()),
		('17', '1703', 'Amapala', '1', NULL, GETDATE(), NULL, GETDATE()),
		('17', '1704', 'Aramecina', '1', NULL, GETDATE(), NULL, GETDATE()),
		('17', '1705', 'Caridad', '1', NULL, GETDATE(), NULL, GETDATE()),
		('17', '1706', 'Goascor�n', '1', NULL, GETDATE(), NULL, GETDATE()),
		('17', '1707', 'Langue', '1', NULL, GETDATE(), NULL, GETDATE()),
		('17', '1708', 'San Francisco de Coray', '1', NULL, GETDATE(), NULL, GETDATE()),
		('17', '1709', 'San Lorenzo', '1', NULL, GETDATE(), NULL, GETDATE()),


		('18', '1801', 'Yoro', '1', NULL, GETDATE(), NULL, GETDATE()),
		('18', '1802', 'Arenal', '1', NULL, GETDATE(), NULL, GETDATE()),
		('18', '1803', 'El Negrito', '1', NULL, GETDATE(), NULL, GETDATE()),
		('18', '1804', 'El Progreso', '1', NULL, GETDATE(), NULL, GETDATE()),
		('18', '1805', 'Joc�n', '1', NULL, GETDATE(), NULL, GETDATE()),
		('18', '1806', 'Moraz�n', '1', NULL, GETDATE(), NULL, GETDATE()),
		('18', '1807', 'Olanchito', '1', NULL, GETDATE(), NULL, GETDATE()),
		('18', '1808', 'Santa Rita', '1', NULL, GETDATE(), NULL, GETDATE()),
		('18', '1809', 'Sulaco', '1', NULL, GETDATE(), NULL, GETDATE()),
		('18', '1810', 'Victoria', '1', NULL, GETDATE(), NULL, GETDATE()),
		('18', '1811', 'Yorito', '1', NULL, GETDATE(), NULL, GETDATE());
GO

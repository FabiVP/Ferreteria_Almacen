--CREACIÓN DE LA BD

CREATE DATABASE dbJhaveJire;
GO

USE dbJhaveJire;
GO

-- CREACIÓN DE LAS TABLAS

CREATE TABLE ccv_tblCliente (
ccv_ID_Cliente VARCHAR(9) PRIMARY KEY,
ccv_C_Nombre VARCHAR(30) NOT NULL,
ccv_C_ApellidoPaterno VARCHAR(30) NOT NULL,
ccv_C_ApellidoMaterno VARCHAR(30)NOT NULL,
ccv_C_Tipo VARCHAR(20)NOT NULL,
ccv_C_Direccion VARCHAR(80)NOT NULL,
ccv_C_Telefono VARCHAR(9)NOT NULL,
cUsuario_C VARCHAR (9)NOT NULL,
cFecha_C DATE NOT NULL,
cHora_C TIME NOT NULL,
cLugar_C VARCHAR (30) NOT NULL,
cUsuario_A VARCHAR (9) NULL,
cFecha_A DATE  NULL,
cHora_A TIME NULL,
cLugar_A VARCHAR (30)  NULL);

CREATE TABLE ccv_tblEmpleado (
ccv_ID_Empleado VARCHAR(9) PRIMARY KEY,
ccv_E_Nombre VARCHAR(30) NOT NULL,
ccv_E_ApellidoPaterno VARCHAR(30) NOT NULL,
ccv_E_ApellidoMaterno VARCHAR(30)NOT NULL,
ccv_E_Tipo VARCHAR(20)NOT NULL,
ccv_E_Direccion VARCHAR(80)NOT NULL,
ccv_E_Sueldo NUMERIC(8)NOT NULL,
ccv_E_Telefono VARCHAR(9)NOT NULL,
eUsuario_C VARCHAR (9)NOT NULL,
eFecha_C DATE NOT NULL,
eHora_C TIME NOT NULL,
eLugar_C VARCHAR (30) NOT NULL,
eUsuario_A VARCHAR (9) NULL,
eFecha_A DATE  NULL,
eHora_A TIME  NULL,
eLugar_A VARCHAR (30) NULL);

CREATE TABLE ccv_tblProveedor (
ccv_ID_Proveedor VARCHAR(11) PRIMARY KEY,
ccv_PV_Nombre VARCHAR(30) NOT NULL,
ccv_PV_Direccion VARCHAR(80)NOT NULL,
ccv_PV_Telefono VARCHAR(9)NOT NULL,
pvUsuario_C VARCHAR (9)NOT NULL,
pvFecha_C DATE NOT NULL,
pvHora_C TIME NOT NULL,
pvLugar_C VARCHAR (30) NOT NULL,
pvUsuario_A VARCHAR (9)NULL,
pvFecha_A DATE  NULL,
pvHora_A TIME  NULL,
pvLugar_A VARCHAR (30)  NULL);

CREATE TABLE ccv_tblSalida (
ccv_ID_Salida VARCHAR(9) PRIMARY KEY,
ccv_SA_Cantidad NUMERIC(5) NOT NULL,
ccv_SA_Descripcion VARCHAR(80) NOT NULL,
ccv_SA_Subtotal NUMERIC(8) NOT NULL,
ccv_SA_Fecha DATE NOT NULL,
saUsuario_C VARCHAR (9)NOT NULL,
saFecha_C DATE NOT NULL,
saHora_C TIME NOT NULL,
saLugar_C VARCHAR (30) NOT NULL,
saUsuario_A VARCHAR (9) NULL,
saFecha_A DATE  NULL,
saHora_A TIME  NULL,
saLugar_A VARCHAR (30)  NULL);

CREATE TABLE ccv_tblEntrada (
ccv_ID_Entrada VARCHAR(9) PRIMARY KEY,
ccv_EN_Cantidad NUMERIC(5) NOT NULL,
ccv_EN_Descripcion VARCHAR(80) NOT NULL,
ccv_EN_Subtotal NUMERIC(8) NOT NULL,
ccv_EN_Fecha DATE NOT NULL,
enUsuario_C VARCHAR (9)NOT NULL,
enFecha_C DATE NOT NULL,
enHora_C TIME NOT NULL,
enLugar_C VARCHAR (30) NOT NULL,
enUsuario_A VARCHAR (9)NULL,
enFecha_A DATE  NULL,
enHora_A TIME  NULL,
enLugar_A VARCHAR (30)  NULL);

CREATE TABLE ccv_tblDocDevolucion (
ccv_ID_DocDevolucion VARCHAR(9) PRIMARY KEY,
ccv_DE_Fecha DATE NOT NULL,
ccv_DE_Estado VARCHAR(20) NOT NULL,
ccv_DE_Motivo VARCHAR(30) NOT NULL,
deUsuario_C VARCHAR (9)NOT NULL,
deFecha_C DATE NOT NULL,
deHora_C TIME NOT NULL,
deLugar_C VARCHAR (30) NOT NULL,
deUsuario_A VARCHAR (9) NULL,
deFecha_A DATE  NULL,
deHora_A TIME  NULL,
deLugar_A VARCHAR (30) NULL);

CREATE TABLE ccv_tblProducto (
ccv_ID_Producto VARCHAR(9) PRIMARY KEY,
ccv_P_Nombre VARCHAR(30) NOT NULL,
ccv_P_Precio VARCHAR(30) NOT NULL,
ccv_P_Tipo VARCHAR(30) NOT NULL,
ccv_P_FechaCaducidad DATE NOT NULL,
pUsuario_C VARCHAR (9)NOT NULL,
pFecha_C DATE NOT NULL,
pHora_C TIME NOT NULL,
pLugar_C VARCHAR (30) NOT NULL,
pUsuario_A VARCHAR (9) NULL,
pFecha_A DATE  NULL,
pHora_A TIME  NULL,
pLugar_A VARCHAR (30)  NULL);
--N2
CREATE TABLE ccv_tblStock (
ccv_ID_Cliente VARCHAR(9) NOT NULL,
ccv_ID_Empleado VARCHAR(9) NOT NULL,
ccv_ID_Proveedor VARCHAR(11) NOT NULL,
ccv_ID_Salida VARCHAR(9) NOT NULL,
ccv_ID_Entrada VARCHAR(9) NOT NULL,
ccv_ID_DocDevolucion VARCHAR(9) NOT NULL,
ccv_ID_Producto VARCHAR(9) NOT NULL,
ccv_ST_FechaIngreso DATE NOT NULL,
ccv_ST_FechaSalida DATE NOT NULL,
ccv_ST_CantidadIngreso INT NOT NULL,
ccv_ST_CantidadSalida INT NOT NULL,
ccv_ST_Saldo INT NOT NULL,
FOREIGN KEY (ccv_ID_Cliente ) REFERENCES ccv_tblCliente(ccv_ID_Cliente),
FOREIGN KEY (ccv_ID_Empleado ) REFERENCES ccv_tblEmpleado(ccv_ID_Empleado),
FOREIGN KEY (ccv_ID_Proveedor ) REFERENCES ccv_tblProveedor(ccv_ID_Proveedor),
FOREIGN KEY (ccv_ID_Salida) REFERENCES ccv_tblSalida(ccv_ID_Salida),
FOREIGN KEY (ccv_ID_Entrada) REFERENCES ccv_tblEntrada(ccv_ID_Entrada),
FOREIGN KEY (ccv_ID_DocDevolucion) REFERENCES ccv_tblDocDevolucion(ccv_ID_DocDevolucion),
FOREIGN KEY (ccv_ID_Producto) REFERENCES ccv_tblProducto(ccv_ID_Producto));

CREATE TABLE ccv_User(
IDUser VARCHAR(9) NOT NULL,
NombUser VARCHAR(9) NOT NULL,
PassUser VARCHAR(8) NOT NULL);




-- LLENADO DE DATOS
USE dbJhaveJire;
GO

SET DATEFORMAT YMD

-- TABLA ccv_User
INSERT INTO ccv_User VALUES ('1', 'almacen', 'alm123');

-- TABLA ccv_tblCliente
INSERT INTO ccv_tblCliente VALUES ('C12345678', 'María', 'González', 'López', 'A', '123 Calle Principal', '555123445', 'U101', '2023/10/24', '12:30:00', 'Tienda A', NULL, NULL, NULL, NULL);
INSERT INTO ccv_tblCliente VALUES ('C23456789', 'Luis', 'Martínez', 'Ramírez', 'B', '456 Calle Secundaria', '555534567', 'U102', '2023/10/25', '09:15:00', 'Tienda B', NULL, NULL, NULL, NULL);
INSERT INTO ccv_tblCliente VALUES ('C34567890', 'Ana', 'Hernández', 'García', 'C', '789 Calle Terciaria', '555345678', 'U103', '2023/10/26', '08:00:00', 'Tienda C', NULL, NULL, NULL, NULL);
INSERT INTO ccv_tblCliente VALUES ('C45678901', 'Carlos', 'Sánchez', 'Martínez', 'C', '101 Calle Cuarta', '555456789', 'U104', '2023/10/27', '10:45:00', 'Tienda D', NULL, NULL, NULL, NULL);
INSERT INTO ccv_tblCliente VALUES ('C56789012', 'Laura', 'Torres', 'Díaz', 'A', '123 Calle Quinta', '555567890', 'U105', '2023/10/28', '11:20:00', 'Tienda E', NULL, NULL, NULL, NULL);
INSERT INTO ccv_tblCliente VALUES ('C67890123', 'Javier', 'Fernández', 'Luna', 'B', '234 Calle Sexta', '555678901', 'U106', '2023/10/29', '14:10:00', 'Tienda F', NULL, NULL, NULL, NULL);
INSERT INTO ccv_tblCliente VALUES ('C78901234', 'María', 'García', 'López', 'A', '345 Calle Séptima', '555789012', 'U107', '2023/10/30', '09:40:00', 'Tienda G', NULL, NULL, NULL, NULL);

-- TABLA ccv_tblEmpleado
INSERT INTO ccv_tblEmpleado VALUES ('E12345678', 'Juan', 'Pérez', 'González', 'Gerente', '123 Calle Principal', '5000', '555123456', 'U001', '2023/10/24', '12:30:00', 'Oficina A', NULL, NULL, NULL, NULL);
INSERT INTO ccv_tblEmpleado VALUES ('E23456789', 'María', 'López', 'Martínez', 'Asistente', '456 Calle Secundaria', '3000', '555234567', 'U003', '2023/10/25', '09:15:00', 'Oficina C', NULL, NULL, NULL, NULL);
INSERT INTO ccv_tblEmpleado VALUES ('E34567890', 'Luis', 'García', 'Ramírez', 'Analista', '789 Calle Terciaria', '4000', '555345678', 'U005', '2023/10/26', '08:00:00', 'Oficina E', NULL, NULL, NULL, NULL);
INSERT INTO ccv_tblEmpleado VALUES ('E45678901', 'Ana', 'Martínez', 'Rodríguez', 'Asistente', '101 Calle Cuarta',' 3200', '555456789', 'U007', '2023/10/27', '10:45:00', 'Oficina G', NULL, NULL, NULL, NULL);
INSERT INTO ccv_tblEmpleado VALUES ('E56789012', 'Carlos', 'Hernández', 'Torres', 'Gerente', '123 Calle Quinta', '5500', '555567890', 'U009', '2023/10/28', '11:20:00', 'Oficina I', NULL, NULL, NULL, NULL);
INSERT INTO ccv_tblEmpleado VALUES ('E67890123', 'Laura', 'Díaz', 'Sánchez', 'Analista', '234 Calle Sexta', '4200', '555678901', 'U011', '2023/10/29', '14:10:00', 'Oficina K', NULL, NULL, NULL, NULL);
INSERT INTO ccv_tblEmpleado VALUES ('E78901234', 'Javier', 'Fernández', 'Luna', 'Asistente', '345 Calle Séptima', '3100', '555789012', 'U013', '2023/10/30', '09:40:00', 'Oficina M', NULL, NULL, NULL, NULL);

-- TABLA ccv_tblProveedor
INSERT INTO ccv_tblProveedor VALUES ('PV123456789', 'Proveedor Junín 1', 'Calle Principal 123, Huancayo, Junín', '987654321', 'U301', '2023-10-24', '12:30:00', 'Huancayo', NULL, NULL, NULL, NULL);
INSERT INTO ccv_tblProveedor VALUES ('PV234567890', 'Proveedor Junín 2', 'Av. Junín 456, Jauja, Junín', '987123456', 'U302', '2023-10-25', '09:15:00', 'Jauja', NULL, NULL, NULL, NULL);
INSERT INTO ccv_tblProveedor VALUES ('PV345678901', 'Proveedor Junín 3', 'Jr. Huancavelica 789, Tarma, Junín', '985678901', 'U303', '2023-10-26', '08:00:00', 'Tarma', NULL, NULL, NULL, NULL);
INSERT INTO ccv_tblProveedor VALUES ('PV456789012', 'Proveedor Junín 4', 'Av. Huancayo 101, Huancayo, Junín', '987890123', 'U304', '2023-10-27', '10:45:00', 'Huancayo', NULL, NULL, NULL, NULL);
INSERT INTO ccv_tblProveedor VALUES ('PV567890123', 'Proveedor Junín 5', 'Jr. Junín 567, Jauja, Junín', '985678901', 'U305', '2023-10-28', '11:20:00', 'Jauja', NULL, NULL, NULL, NULL);
INSERT INTO ccv_tblProveedor VALUES ('PV678901234', 'Proveedor Junín 6', 'Av. Tarma 234, Tarma, Junín', '987012345', 'U306', '2023-10-29', '14:10:00', 'Tarma', NULL, NULL, NULL, NULL);
INSERT INTO ccv_tblProveedor VALUES ('PV789012345', 'Proveedor Junín 7', 'Jr. Huancavelica 345, Huancayo, Junín', '985678901', 'U307', '2023-10-30', '09:40:00', 'Huancayo', NULL, NULL, NULL, NULL);

-- TABLA ccv_tblSalida
INSERT INTO ccv_tblSalida VALUES ('S00000001', 10, 'Venta de productos electrónicos', 500.00, '2023-10-24', 'U101', '2023-10-24', '15:45:00', 'Huancayo', NULL, NULL, NULL, NULL);
INSERT INTO ccv_tblSalida VALUES ('S00000002', 5, 'Envío a cliente en Jauja', 250.00, '2023-10-25', 'U102', '2023-10-25', '14:20:00', 'Jauja', NULL, NULL, NULL, NULL);
INSERT INTO ccv_tblSalida VALUES ('S00000003', 15, 'Venta de productos de jardineria', 750.00, '2023-10-26', 'U103', '2023-10-26', '11:55:00', 'Tarma', NULL, NULL, NULL, NULL);
INSERT INTO ccv_tblSalida VALUES ('S00000004', 8, 'Venta de construccio', 400.00, '2023-10-27', 'U104', '2023-10-27', '17:10:00', 'Chanchamayo', NULL, NULL, NULL, NULL);
INSERT INTO ccv_tblSalida VALUES ('S00000005', 6, 'Envío a cliente en Concepción', 300.00, '2023-10-28', 'U105', '2023-10-28', '14:45:00', 'Concepción', NULL, NULL, NULL, NULL);
INSERT INTO ccv_tblSalida VALUES ('S00000006', 12, 'Venta dejardineria', 600.00, '2023-10-29', 'U106', '2023-10-29', '16:30:00', 'Satipo', NULL, NULL, NULL, NULL);
INSERT INTO ccv_tblSalida VALUES ('S00000007', 7, 'Venta de productos electrónicos', 350.00, '2023-10-30', 'U107', '2023-10-30', '13:20:00', 'Junín', NULL, NULL, NULL, NULL);

-- TABLA ccv_tblEntrada
INSERT INTO ccv_tblEntrada VALUES ('E00000001', 20, 'Recepción de productos electrónicos', 800.00, '2023-10-24', 'U701', '2023-10-24', '10:30:00', 'Bodega A', NULL, NULL, NULL, NULL);
INSERT INTO ccv_tblEntrada VALUES ('E00000002', 15, 'Recepción de productos jardineria', 600.00, '2023-10-25', 'U702', '2023-10-25', '09:15:00', 'Bodega B', NULL, NULL, NULL, NULL);
INSERT INTO ccv_tblEntrada VALUES ('E00000003', 12, 'Recepción de productos construccion', 480.00, '2023-10-26', 'U703', '2023-10-26', '08:00:00', 'Bodega C', NULL, NULL, NULL, NULL);
INSERT INTO ccv_tblEntrada VALUES ('E00000004', 30, 'Recepción de jardineria', 1200.00, '2023-10-27', 'U704', '2023-10-27', '10:45:00', 'Bodega A', NULL, NULL, NULL, NULL);
INSERT INTO ccv_tblEntrada VALUES ('E00000005', 25, 'Recepción de productos electrónicos', 1000.00, '2023-10-28', 'U705', '2023-10-28', '11:20:00', 'Bodega B', NULL, NULL, NULL, NULL);
INSERT INTO ccv_tblEntrada VALUES ('E00000006', 18, 'Recepción de productos de construccion', 720.00, '2023-10-29', 'U706', '2023-10-29', '14:10:00', 'Bodega C', NULL, NULL, NULL, NULL);
INSERT INTO ccv_tblEntrada VALUES ('E00000007', 35, 'Recepción de productos jardineria', 1400.00, '2023-10-30', 'U707', '2023-10-30', '09:40:00', 'Bodega A', NULL, NULL, NULL, NULL);

-- TABLA ccv_tblDocDevolucion
INSERT INTO ccv_tblDocDevolucion VALUES ('DD0000001', '2023-10-24', 'Aceptada', 'producto defectuoso', 'U901', '2023-10-24', '10:30:00', 'Bodega A', NULL, NULL, NULL, NULL);
INSERT INTO ccv_tblDocDevolucion VALUES ('DD0000002', '2023-10-25', 'Rechazada', 'Producto incorrecto enviado', 'U902', '2023-10-25', '09:15:00', 'Bodega B', NULL, NULL, NULL, NULL);
INSERT INTO ccv_tblDocDevolucion VALUES ('DD0000003', '2023-10-26', 'Aceptada', 'daño en el transporte', 'U903', '2023-10-26', '08:00:00', 'Bodega C', NULL, NULL, NULL, NULL);
INSERT INTO ccv_tblDocDevolucion VALUES ('DD0000004', '2023-10-27', 'Pendiente', 'razones de calidad', 'U904', '2023-10-27', '10:45:00', 'Bodega A', NULL, NULL, NULL, NULL);
INSERT INTO ccv_tblDocDevolucion VALUES ('DD0000005', '2023-10-28', 'Aceptada', ' producto defectuoso', 'U905', '2023-10-28', '11:20:00', 'Bodega B', NULL, NULL, NULL, NULL);
INSERT INTO ccv_tblDocDevolucion VALUES ('DD0000006', '2023-10-29', 'Rechazada', 'Producto incorrecto enviado', 'U906', '2023-10-29', '14:10:00', 'Bodega C', NULL, NULL, NULL, NULL);
INSERT INTO ccv_tblDocDevolucion VALUES ('DD0000007', '2023-10-30', 'Aceptada', 'daño en el transporte', 'U907', '2023-10-30', '09:40:00', 'Bodega A', NULL, NULL, NULL, NULL);

-- TABLA ccv_tblProducto
INSERT INTO ccv_tblProducto VALUES ('P00000001', 'Producto A', '25.00', 'Electrónica', '2023-12-31', 'U1101', '2023-10-24', '10:30:00', 'Bodega A', NULL, NULL, NULL, NULL);
INSERT INTO ccv_tblProducto VALUES ('P00000002', 'Producto B', '15.00', 'Alimentos', '2023-11-30', 'U1102', '2023-10-25', '09:15:00', 'Bodega B', NULL, NULL, NULL, NULL);
INSERT INTO ccv_tblProducto VALUES ('P00000003', 'Producto C', '40.00', 'Ropa', '2024-02-29', 'U1103', '2023-10-26', '08:00:00', 'Bodega C', NULL, NULL, NULL, NULL);
INSERT INTO ccv_tblProducto VALUES ('P00000004', 'Producto D', '10.00', 'Electrónica', '2023-11-15', 'U1104', '2023-10-27', '10:45:00', 'Bodega A', NULL, NULL, NULL, NULL);
INSERT INTO ccv_tblProducto VALUES ('P00000005', 'Producto E', '35.00', 'Alimentos', '2023-12-05', 'U1105', '2023-10-28', '11:20:00', 'Bodega B', NULL, NULL, NULL, NULL);
INSERT INTO ccv_tblProducto VALUES ('P00000006', 'Producto F', '50.00', 'Ropa', '2023-12-31', 'U1106', '2023-10-29', '14:10:00', 'Bodega C', NULL, NULL, NULL, NULL);
INSERT INTO ccv_tblProducto VALUES ('P00000007', 'Producto G', '20.00', 'Alimentos', '2023-11-30', 'U1107', '2023-10-30', '09:40:00', 'Bodega A', NULL, NULL, NULL, NULL);

-- TABLA ccv_tblStock
INSERT INTO ccv_tblStock VALUES ('C12345678', 'E12345678', 'PV123456789', 'S00000001', 'E00000001', 'DD0000001', 'P00000001', '2023-10-24', '2023-10-24', 20, 10, 10);
INSERT INTO ccv_tblStock VALUES ('C23456789', 'E23456789', 'PV234567890', 'S00000002', 'E00000002', 'DD0000002', 'P00000002', '2023-10-25', '2023-10-25', 15, 8, 7);
INSERT INTO ccv_tblStock VALUES ('C34567890', 'E34567890', 'PV345678901', 'S00000003', 'E00000003', 'DD0000003', 'P00000003', '2023-10-26', '2023-10-26', 12, 12, 0);
INSERT INTO ccv_tblStock VALUES ('C45678901', 'E45678901', 'PV456789012', 'S00000004', 'E00000004', 'DD0000004', 'P00000004', '2023-10-27', '2023-10-27', 30, 25, 5);
INSERT INTO ccv_tblStock VALUES ('C56789012', 'E56789012', 'PV567890123', 'S00000005', 'E00000005', 'DD0000005', 'P00000005', '2023-10-28', '2023-10-28', 25, 18, 7);
INSERT INTO ccv_tblStock VALUES ('C67890123', 'E67890123', 'PV678901234', 'S00000006', 'E00000006', 'DD0000006', 'P00000006', '2023-10-29', '2023-10-29', 18, 15, 3);
INSERT INTO ccv_tblStock VALUES ('C78901234', 'E78901234', 'PV789012345', 'S00000007', 'E00000007', 'DD0000007', 'P00000007', '2023-10-30', '2023-10-30', 35, 30, 5);


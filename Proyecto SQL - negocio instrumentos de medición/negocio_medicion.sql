DROP DATABASE IF EXISTS tu_medicion;
CREATE DATABASE tu_medicion;
USE tu_medicion;

CREATE TABLE productos (
id_prod INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(50) NOT NULL,
stock INT NOT NULL,
precio_compra DECIMAL(10,2) NOT NULL,
precio_venta DECIMAL(10,2) NOT NULL,
descripcion VARCHAR(200),
id_prov INT NOT NULL,
id_var INT NOT NULL,
FOREIGN KEY (id_prov) REFERENCES proveedor(id_prov)
);

CREATE TABLE variable_productos (
id_var INT AUTO_INCREMENT PRIMARY KEY,
descripcion VARCHAR(100) NOT NULL,
cant_productos INT NOT NULL
);

CREATE TABLE proveedor (
id_prov INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(50),
mail VARCHAR(100) NOT NULL,
tel VARCHAR(10) NOT NULL,
nro_facturacion VARCHAR(20) NOT NULL,
ubicacion VARCHAR(70)
);

CREATE TABLE clientes (
id_cl INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(50),
mail VARCHAR(100) NOT NULL,
tel VARCHAR(10) NOT NULL,
nro_facturacion VARCHAR(20) NOT NULL,
ubicacion VARCHAR(70)
);

CREATE TABLE facturacion (
id_fc INT AUTO_INCREMENT PRIMARY KEY,
metodo_pago VARCHAR(20),
fecha DATE NOT NULL,
monto_total DECIMAL(10,2) NOT NULL,
cant_prod INT NOT NULL,
id_emp INT NOT NULL,
id_cl INT NOT NULL,
FOREIGN KEY (id_emp) REFERENCES empleados(id_emp),
FOREIGN KEY (id_cl) REFERENCES clientes(id_cl)
);

CREATE TABLE empleados (
id_emp INT AUTO_INCREMENT PRIMARY KEY,
fecha_ini DATE NOT NULL,
nomre_ape VARCHAR(40) NOT NULL,
cuil VARCHAR(20) NOT NULL,
tel INT,
mail VARCHAR(100),
tipo_emp VARCHAR(20) NOT NULL
);

CREATE TABLE calibraciones (
id_cal INT AUTO_INCREMENT PRIMARY KEY,
fecha_ini DATE NOT NULL,
fecha_fin DATE,
descripcion VARCHAR(200) NOT NULL,
id_emp INT NOT NULL,
id_cl INT,
id_var INT NOT NULL,
FOREIGN KEY (id_emp) REFERENCES empleados(id_emp),
FOREIGN KEY (id_cl) REFERENCES clientes(id_cl),
FOREIGN KEY (id_var) REFERENCES variable_productos(id_var)
);




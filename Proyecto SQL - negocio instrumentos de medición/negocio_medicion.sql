DROP DATABASE IF EXISTS tu_medicion;
CREATE DATABASE tu_medicion;
USE tu_medicion;


CREATE TABLE empleados (
id_emp INT AUTO_INCREMENT PRIMARY KEY,
fecha_ini DATE NOT NULL,
nomre_ape VARCHAR(40) NOT NULL,
cuil VARCHAR(20) NOT NULL,
tel INT,
mail VARCHAR(100),
tipo_emp VARCHAR(20) NOT NULL
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

CREATE TABLE productos (
id_prod INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(50) NOT NULL,
stock INT NOT NULL,
precio_compra DECIMAL(10,2) NOT NULL,
precio_venta DECIMAL(10,2) NOT NULL,
descripcion VARCHAR(200),
id_prov INT NOT NULL,
id_var INT NOT NULL,
FOREIGN KEY (id_prov) REFERENCES proveedor(id_prov),
FOREIGN KEY (id_var) REFERENCES variable_productos(id_var)
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

INSERT INTO empleados (fecha_ini, nomre_ape, cuil, tipo_emp) 
VALUES
	('2023-11-24', "Juan González", "23-96890623-1", "Comercial"),
    ('2019-04-17', "Martín Echeverría", "23-37834901-9", "Técnico"),
    ('2022-06-28', "Fabián Shalom", "20-30691285-7", "Comercial"),
    ('2015-06-09', "Pablo de la Serna", "23-33498217-9", "Comercial"),
    ('2015-08-05', "Tomás Alvariño", "23-35690731-1", "Técnico");
    
INSERT INTO variable_productos (descripcion, cant_productos)
VALUES
	("Temperatura", 2),
    ("Temperatura y humedad", 2),
    ("Humedad", 1),
    ("Presión", 2),
    ("Velocidad de viento", 1),
    ("Gases", 1)
    
INSERT INTO proveedor (nombre, mail, tel, nro_facturacion)
VALUES
	("La buena instrumentación", "info@instrumentos.com.ar", "1145678912", "33-79034721-9"),
    ("A medida", "administracion_medida@gmail.com" , "1134859012", "33-70451329-7"),
    ("MediTec" , "comercial@meditec.com.ar" , "1147748790", "23-35690231-9")
    
INSERT INTO clientes (nombre, mail, tel, nro_facturacion, ubicacion)
VALUES 
	("SolTecno", "info@soltecno.com.ar" , "1142356980", "30-70908751-9" , "Colegiales"),
    ("Francisco Elizalde" , "fran_eli@outlook.com" , "1134798124" , "23-39087635-7" , "Belgrano R"),
    ("María de los Campos" , "merydlcampos@gmail.com" , "1148901237" , "20-37648971-9", "Avellaneda"),
    ("Distribuidora San Martín" , "distri_sanm@gmail.com", "1147561289" , "30-79045681-7" , "San Martín"),
    ("Tu Premium Equipos" , "comercial@equipos_prem.com" , "1149871290" , "33-70895321-9" , "Olivos")

INSERT INTO productos (nombre, stock, precio_compra, precio_venta, descripcion, id_prov, id_var)
VALUES
	("Termómetro digital con sensor externo" , 150 , 4000.50 , 9410 , "Termómetro digital con sensor de 1 mt resistente a líquidos. Rango -50°c a 110°C. Exactitud +/-1°C" , 
    1 , 1),
    ("Termómetro ambiental analógico" , 50 , 2250.99 , 5500 , "Termómetro ambiental de base plastico. Interior y exterior. Rango -30°C a 50°C. Exactitud +/- 2°C" , 
    3 , 1),
    ("Termohigrómetro digital mini" , 20 , 8120.80 , 14100 , "Medidor de temperatura y humedad con sensor externo de 1.5 mt. Rango de 0 a 60°C, 5 a 98% HR. Exactitud +/- 1°C, 5%HR" ,
    3, 2),
    ("Termohigrómetro económico" , 15 , 8990 , 19990.99 , "Termohigrómetro digital con sensor interno. Rango -10° a 60°C, 10 a 99% HR. Exactitud +/-1°C, 7% HR" ,
    2 , 2),
    ("Higrómetro analógico" , 2 , 5500 , 12330.50 , "Higrómetro analógico de aguja. Para apoyar/colgar. Rango 0 a 100% HR. Exactitud +/- 7%HR" , 
    1, 3),
    ("Manómetro analógico acero" , 20 , 30550.89 , 71890 , "Manómetro analógico de acero inoxidable caja de 100 mm de diámetro. Rango seleccionable de -1 hasta 100 bar. Exactitud +/- 1.5%" ,
    3 , 4),
    ("Manómetro digital" , 5 , 230000.90 , 412000 , "Manómetro digial caja recubierta de goma diámetro de 63 mm. De 0 hasta 2000 bar. Exactitud +/- 1%. Funciona con dos pilas AAA" ,
    2 , 4),
    ("Anemómetro digital" , 3 , 30500.99 , 58900 , "Anemómetro digital de mano. Varias unidades de medición, km/h m/s m/h. Exactitud +/- 3%" , 
    2 , 5),
    ("Analizador de gases combustión" , 1 , 1350780 , 2350000 , "Medidor de gases de combustión de alta temperatura. CO CO2 O2. Garantía 2 años" , 
    3 , 6)
    
CREATE OR REPLACE VIEW vw_clientes_x_ubicacion AS
SELECT ubicacion, COUNT(*) AS cant_clientes
FROM clientes
GROUP BY ubicacion
ORDER BY cant_clientes;

CREATE OR REPLACE VIEW vw_tipo_empleado AS
SELECT tipo_emp, COUNT(*) AS cant_emple_x_tipo
FROM empleados
GROUP BY tipo_emp
ORDER BY cant_emple_x_tipo;

DELIMITER ??
CREATE FUNCTION CalcularGananciaBruta (
p_compra DECIMAL(10,2), p_venta DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN 
	RETURN p_venta - p_compra;
END ??


DELIMITER ??
CREATE FUNCTION CalculoAntiguedad (
inicio DATE)
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
	DECLARE años INT;
    DECLARE meses INT;
    DECLARE dias INT;
    
    SET años = TIMESTAMPDIFF(YEAR,inicio,CURDATE());
    SET meses = TIMESTAMPDIFF(MONTH,inicio,CURDATE()) % 12;
    SET dias = TIMESTAMPDIFF(DAY,inicio,CURDATE()) % 365;
    RETURN CONCAT(años,' años ',meses,' meses ',dias,' dias');
END ??

DELIMITER ??
CREATE PROCEDURE AñadirCliente (
	IN p_nombre VARCHAR(50),
	IN p_mail VARCHAR(100),
	IN p_tel VARCHAR(10),
	IN p_nro_facturacion VARCHAR(20))
BEGIN
	INSERT INTO clientes(nombre,mail,tel,nro_facturacion)
    VALUES (p_nombre,p_mail,p_tel,p_nro_facturacion);
END ??

DELIMITER ??
CREATE PROCEDURE IniciarCalibracion (
	IN p_fecha_ini DATE,
	IN p_descripcion VARCHAR(200),
    IN p_id_emp INT,
    IN p_id_var INT)
BEGIN
	INSERT INTO calibraciones(fecha_ini,descripcion,id_emp,id_var)
    VALUES (p_fecha_ini,p_descripcion,p_id_emp,p_id_var);
END ??

CALL IniciarCalibracion(CURDATE(),"Servicio de termómetro digital en -10 a 40°C",2,1)

CREATE TABLE alertas (
id_avisos INT AUTO_INCREMENT PRIMARY KEY,
id_prod INT NOT NULL,
mensaje VARCHAR(200));

DELIMITER ??
CREATE TRIGGER tr_stock_bajo
AFTER UPDATE ON productos
FOR EACH ROW
BEGIN 
	IF NEW.stock <= 3 THEN
		INSERT INTO alertas (id_prod,mensaje)
		VALUES (NEW.id_prod,CONCAT("Stock bajo del producto:",NEW.nombre,". Stock actualizado:",NEW.stock));
    END IF;
END ??

CREATE TABLE registros (
	id_registros INT AUTO_INCREMENT PRIMARY KEY,
    id_cl INT NOT NULL,
    nombre VARCHAR(50));
	
DELIMITER ??
CREATE TRIGGER tr_nuevos_clientes
AFTER INSERT ON clientes
FOR EACH ROW
BEGIN 
	INSERT INTO registros (id_cl, nombre)
    VALUES (NEW.id_cl, NEW.nombre);
END ??


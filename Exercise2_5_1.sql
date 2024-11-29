USE plantilla_empleados;

-- Insertar datos en REGION
INSERT INTO REGION VALUES ('01', 'Noroeste');
INSERT INTO REGION VALUES ('02', 'Noreste');
INSERT INTO REGION VALUES ('03', 'Centro');
INSERT INTO REGION VALUES ('04', 'Sureste');
INSERT INTO REGION VALUES ('05', 'Suroeste');

-- Insertar datos en PROVINCIA
INSERT INTO PROVINCIA VALUES ('11', 'Galicia', '01');
INSERT INTO PROVINCIA VALUES ('12', 'Asturias', '01');
INSERT INTO PROVINCIA VALUES ('21', 'Cataluña', '02');
INSERT INTO PROVINCIA VALUES ('22', 'Aragón', '02');
INSERT INTO PROVINCIA VALUES ('31', 'Madrid', '03');

-- Insertar datos en LOCALIDAD
INSERT INTO LOCALIDAD VALUES ('101', 'Vigo', '11');
INSERT INTO LOCALIDAD VALUES ('102', 'Oviedo', '12');
INSERT INTO LOCALIDAD VALUES ('201', 'Barcelona', '21');
INSERT INTO LOCALIDAD VALUES ('202', 'Zaragoza', '22');
INSERT INTO LOCALIDAD VALUES ('301', 'Madrid', '31');

-- Insertar datos en EMPLEADO
INSERT INTO EMPLEADO VALUES ('E00001', '12345678A', 'Laura Gómez', '600123123', 24000, '101');
INSERT INTO EMPLEADO VALUES ('E00002', '87654321B', 'Mario Pérez', '600321321', 26000, '102');
INSERT INTO EMPLEADO VALUES ('E00003', '11223344C', 'Ana Ruiz', '600456456', 30000, '201');
INSERT INTO EMPLEADO VALUES ('E00004', '22334455D', 'Juan Torres', '600789789', 28000, '202');
INSERT INTO EMPLEADO VALUES ('E00005', '33445566E', 'Elena López', '600111222', 32000, '301');


SELECT * FROM REGION;
SELECT * FROM PROVINCIA;
SELECT * FROM LOCALIDAD;
SELECT * FROM EMPLEADO;
-- ***********************************
-- Abastecimiento de imagen en Docker
-- ***********************************
 
-- Descargar la imagen
docker pull postgres:latest

-- Crear el contenedor
-- docker run --name postgres-tadb -e POSTGRES_PASSWORD=unaClav3 -d -p 5432:5432 postgres:latest

-- ****************************************
-- Creación de base de datos y usuarios
-- ****************************************

-- Con usuario Root: psql -U postgres

-- crear el esquema la base de datos
create database SE_ERP_PASTELERIA;

-- Conectarse a la base de datos
\c se_erp_pasteleria

-- crear el usuario con el que se realizarán las acciones
create user usr1 with password 'unaClav3';
grant all privileges on database se_erp_pasteleria to usr1;
grant all privileges on schema public to usr1;


-- Crear tabla insumo
CREATE TABLE "insumo" (
    "id" BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY,
    "nombre" VARCHAR(255) NOT NULL,
    "unidad_medida" VARCHAR(255) NOT NULL,
    "precio" VARCHAR(255) NOT NULL,
    "proveedor" VARCHAR(255) NOT NULL,
    PRIMARY KEY ("id")
);

-- Crear tabla producto
CREATE TABLE "producto" (
    "id" BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY,
    "nombre" VARCHAR(255) NOT NULL,
    "descripcion" VARCHAR(255) NULL,
    "instrucciones" VARCHAR(255) NOT NULL,
    "precio" VARCHAR(255) NOT NULL,
    "categoria" VARCHAR(255) NOT NULL,
    "imagen" VARCHAR(255) NULL,
    PRIMARY KEY ("id")
);

-- Crear tabla inventario
CREATE TABLE "inventario" (
    "id_insumo" BIGINT NOT NULL,
    "fecha_ingreso" DATE NOT NULL,
    "cantidad" DECIMAL(10,2) NOT NULL,
    "fecha_vencimiento" DATE NULL,
    PRIMARY KEY ("id_insumo", "fecha_ingreso"),
    FOREIGN KEY ("id_insumo") REFERENCES "insumo" ("id")
);

-- Crear tabla ingrediente_producto
CREATE TABLE "ingrediente_producto" (
    "id_producto" BIGINT NOT NULL,
    "id_ingrediente" BIGINT NOT NULL,
    "cant" DECIMAL(10,2) not NULL
    PRIMARY KEY ("id_producto", "id_ingrediente"),
    FOREIGN KEY ("id_producto") REFERENCES "producto" ("id"),
    FOREIGN KEY ("id_ingrediente") REFERENCES "insumo" ("id")
);

-- Crear tabla pedido
CREATE TABLE "pedido" (
    "id" BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY,
    "fecha" DATE NOT NULL,
    "direccion" VARCHAR(255) NOT NULL,
    "nombre_cliente" VARCHAR(255) NULL,
    "id_empleado" BIGINT NOT NULL,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("id_empleado") REFERENCES "usuario" ("id")
);

-- Crear tabla productos_pedido
CREATE TABLE "productos_pedido" (
    "id_pedido" BIGINT NOT NULL,
    "id_producto" BIGINT NOT NULL,
    PRIMARY KEY ("id_pedido", "id_producto"),
    FOREIGN KEY ("id_pedido") REFERENCES "pedido" ("id"),
    FOREIGN KEY ("id_producto") REFERENCES "producto" ("id")
);

-- Crear tabla usuario
CREATE TABLE "usuario" (
    "id" BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY,
    "nombre" VARCHAR(255) NOT NULL,
    "correo" VARCHAR(255) NOT NULL,
    "contraseña" VARCHAR(255) NOT NULL,
    "nivel_acceso" VARCHAR(255) NOT NULL,
    "activo" BOOLEAN NOT NULL DEFAULT TRUE,
    PRIMARY KEY ("id")
);

-- Añadir restricciones de claves foráneas
ALTER TABLE "productos_pedido" ADD CONSTRAINT "productos_pedido_id_pedido_foreign" FOREIGN KEY ("id_pedido") REFERENCES "pedido" ("id");
ALTER TABLE "productos_pedido" ADD CONSTRAINT "productos_pedido_id_producto_foreign" FOREIGN KEY ("id_producto") REFERENCES "producto" ("id");
ALTER TABLE "ingrediente_producto" ADD CONSTRAINT "ingrediente_producto_id_ingrediente_foreign" FOREIGN KEY ("id_ingrediente") REFERENCES "insumo" ("id");
ALTER TABLE "ingrediente_producto" ADD CONSTRAINT "ingrediente_producto_id_producto_foreign" FOREIGN KEY ("id_producto") REFERENCES "producto" ("id");
ALTER TABLE "pedido" ADD CONSTRAINT "pedido_id_empleado_foreign" FOREIGN KEY ("id_empleado") REFERENCES "usuario" ("id");

-- Añadir datos de ejemplo
INSERT INTO "usuario" ("nombre", "correo", "contraseña", "nivel_acceso") VALUES
('Juan Perez', 'juan.perez@example.com', 'contraseña123', 'admin'),
('Maria Gomez', 'maria.gomez@example.com', 'password456', 'usuario'),
('Carlos Lopez', 'carlos.lopez@example.com', 'clave789', 'usuario'),
('Ana Torres', 'ana.torres@example.com', 'mipass101', 'admin'),
('Luis Ramirez', 'luis.ramirez@example.com', 'mypassword202', 'usuario');

INSERT INTO "insumo" ("nombre", "unidad_medida", "precio", "proveedor") VALUES
('Harina', 'kg', '0.80', 'Proveedor A'),
('Azúcar', 'kg', '0.90', 'Proveedor B'),
('Leche', 'litro', '1.20', 'Proveedor C'),
('Huevos', 'docena', '1.50', 'Proveedor D'),
('Mantequilla', 'kg', '2.50', 'Proveedor E');

INSERT INTO "inventario" ("id_insumo", "fecha_ingreso", "cantidad", "fecha_vencimiento") VALUES
(1, '2024-05-01', 100.00, '2024-06-01'),
(2, '2024-05-05', 200.50, '2025-05-05'),
(3, '2024-05-10', 150.75, NULL),
(4, '2024-05-15', 50.25, '2024-05-30'),
(5, '2024-05-20', 80.80, '2024-06-15');

-- Insertar datos en la tabla insumo
INSERT INTO insumo (nombre, unidad_medida, precio, proveedor)
VALUES 
    ('queso crema', 'g', '5000', 'Quesos Ricos'),
    ('huevos', 'unidad', '1000', 'Granja Feliz'),
    ('azúcar', 'g', '2000', 'Dulces S.A.'),
    ('galletas', 'g', '3000', 'Galletas del Valle'),
    ('limones', 'unidad', '3000', 'Frutas Frescas'),
    ('leche condensada', 'g', '4000', 'Lácteos S.A.'),
    ('jamón', 'g', '6000', 'Carnes Premium'),
    ('queso', 'g', '5500', 'Lácteos S.A.'),
    ('crema de leche', 'ml', '2500', 'Lácteos S.A.'),
    ('chocolate para hornear', 'g', '7000', 'Chocolates Deliciosos'),
    ('harina', 'g', '1500', 'Molinos Modernos'),
    ('pollo desmenuzado', 'g', '8000', 'Carnes Premium'),
    ('verduras', 'g', '4000', 'Agrícolas S.A.'),
    ('mantequilla', 'g', '3500', 'Lácteos S.A.'),
    ('polvo para hornear', 'g', '2000', 'Hornos Felices'),
    ('arequipe', 'g', '6000', 'Dulces S.A.'),
    ('leche evaporada', 'ml', '3000', 'Lácteos S.A.'),
    ('crema de leche', 'ml', '2500', 'Lácteos S.A.'),
    ('bizcocho', 'unidad', '5000', 'Panadería Dulce'),
    ('masa de hojaldre', 'unidad', '4500', 'Panadería Dulce');

-- Insertar datos en la tabla producto
INSERT INTO producto (nombre, descripcion, instrucciones, precio, categoria, imagen)
VALUES 
    ('Pie de queso', 'Delicioso pie horneado con una cremosa mezcla de queso y una base crujiente de galletas.', 'Hornea y sirve', '50000', 'Pie dulce', NULL),
    ('Pie de limón', 'Refrescante pie con un relleno de limón dulce y ácido sobre una base de galletas.', 'Hornea y sirve', '50000', 'Pie dulce', NULL),
    ('Pie de jamón y queso', 'Pie salado relleno de una mezcla deliciosa de jamón y queso, perfecto para un almuerzo ligero o una merienda.', 'Hornea y sirve', '55000', 'Pie salado', NULL),
    ('Pastel de chocolate', 'Tentador pastel de chocolate con un rico y suave interior, perfecto para los amantes del chocolate.', 'Hornea y sirve', '42000', 'Pastel', NULL),
    ('Pie de pollo', 'Delicioso pie salado lleno de jugoso pollo desmenuzado y vegetales en una masa de hojaldre dorada.', 'Hornea y sirve', '50000', 'Pie salado', NULL),
    ('Croissants de chocolate x10', 'Diez croissants frescos y dorados, rellenos con suave chocolate para un desayuno o merienda deliciosa.', 'Hornea y sirve', '35000', 'Pan', NULL),
    ('Churros de arequipe x10', 'Diez churros crujientes y dulces, rellenos con delicioso arequipe, perfectos para disfrutar en cualquier momento del día.', 'Fríe y sirve', '25000', 'Otro', NULL),
    ('Torta fría de tres leches', 'Deliciosa torta empapada en una mezcla de tres leches, con un sabor suave y una textura húmeda que se derrite en la boca.', 'Refrigera y sirve', '38000', 'Pastel', NULL);

-- Insertar datos en la tabla ingrediente_producto
INSERT INTO ingrediente_producto ("id_producto", "id_ingrediente", "cant")
VALUES
(1, 1, 500.00), -- 500 unidades del ingrediente 1 para el producto 1
(1, 2, 3.00),   -- 3 unidades del ingrediente 2 para el producto 1
(1, 3, 200.00), -- 200 unidades del ingrediente 3 para el producto 1
(1, 4, 200.00), -- 200 unidades del ingrediente 4 para el producto 1
(2, 5, 4.00),   -- 4 unidades del ingrediente 5 para el producto 2
(2, 2, 4.00),   -- 4 unidades del ingrediente 2 para el producto 2
(2, 6, 397.00), -- 397 unidades del ingrediente 6 para el producto 2
(2, 4, 200.00), -- 200 unidades del ingrediente 4 para el producto 2
(3, 7, 200.00), -- 200 unidades del ingrediente 7 para el producto 3
(3, 1, 200.00), -- 200 unidades del ingrediente 1 para el producto 3
(3, 2, 3.00),   -- 3 unidades del ingrediente 2 para el producto 3
(3, 8, 200.00), -- 200 unidades del ingrediente 8 para el producto 3
(4, 9, 200.00), -- 200 unidades del ingrediente 9 para el producto 4
(4, 2, 4.00),   -- 4 unidades del ingrediente 2 para el producto 4
(4, 10, 200.00),-- 200 unidades del ingrediente 10 para el producto 4
(4, 11, 200.00),-- 200 unidades del ingrediente 11 para el producto 4
(5, 12, 300.00),-- 300 unidades del ingrediente 12 para el producto 5
(5, 6, 200.00), -- 200 unidades del ingrediente 6 para el producto 5
(5, 13, 150.00),-- 150 unidades del ingrediente 13 para el producto 5
(5, 14, 1.00),  -- 1 unidad del ingrediente 14 para el producto 5
(6, 15, 250.00),-- 250 unidades del ingrediente 15 para el producto 6
(6, 16, 500.00),-- 500 unidades del ingrediente 16 para el producto 6
(6, 17, 50.00), -- 50 unidades del ingrediente 17 para el producto 6
(6, 18, 200.00),-- 200 unidades del ingrediente 18 para el producto 6
(7, 19, 250.00),-- 250 unidades del ingrediente 19 para el producto 7
(7, 20, 250.00),-- 250 unidades del ingrediente 20 para el producto 7
(7, 16, 200.00),-- 200 unidades del ingrediente 16 para el producto 7
(7, 21, 50.00), -- 50 unidades del ingrediente 21 para el producto 7
(8, 22, 354.00),-- 354 unidades del ingrediente 22 para el producto 8
(8, 23, 397.00),-- 397 unidades del ingrediente 23 para el producto 8
(8, 24, 250.00),-- 250 unidades del ingrediente 24 para el producto 8
(8, 25, 1.00);  -- 1 unidad del ingrediente 25 para el producto 8

INSERT INTO inventario (id_insumo, fecha_ingreso, cantidad, fecha_vencimiento)
VALUES 
    -- Pie de queso
    (1, '2024-05-24', 1000.00, '2024-06-01'),   -- queso crema
    (2, '2024-05-24', 30.00, NULL),             -- huevos
    (3, '2024-05-24', 2000.00, '2024-06-15'),   -- azúcar
    (4, '2024-05-24', 2000.00, NULL),           -- galletas
    
    -- Pie de limón
    (5, '2024-05-24', 40.00, '2024-06-10'),     -- limones
    (6, '2024-05-21', 3970.00, '2024-06-20'),   -- leche condensada
    
    -- Pie de jamón y queso
    (7, '2024-05-22', 2000.00, '2024-06-05'),   -- jamón
    (8, '2024-05-22', 2000.00, '2024-06-08'),   -- queso
    (9, '2024-05-22', 2000.00, '2024-06-12'),   -- crema de leche
    
    -- Pastel de chocolate
    (10, '2024-05-23', 2000.00, '2024-06-03'),  -- chocolate para hornear
    (11, '2024-05-23', 2000.00, '2024-06-18'),  -- harina
    
    -- Pie de pollo
    (12, '2024-05-24', 3000.00, '2024-06-07'),  -- pollo desmenuzado
    (13, '2024-05-24', 1500.00, NULL),          -- verduras
    (18, '2024-05-24', 10.00, '2024-06-14'),    -- masa de hojaldre
    
    -- Croissants de chocolate x10
    (14, '2024-05-25', 2500.00, '2024-06-09'),  -- mantequilla
    (15, '2024-05-25', 500.00, NULL),           -- polvo para hornear
    (17, '2024-05-25', 2000.00, NULL),          -- leche
    
    -- Churros de arequipe x10
    (16, '2024-05-26', 3000.00, '2024-06-23'),  -- arequipe

    -- Insertar datos en la tabla pedido
INSERT INTO pedido (fecha, direccion, nombre_cliente, id_empleado)
VALUES 
    ('2024-05-20', 'Calle 123, Ciudad ABC', 'Cliente 1', 1),   -- Pedido 1
    ('2024-05-21', 'Av. Principal 456, Ciudad XYZ', 'Cliente 2', 2),   -- Pedido 2
    ('2024-05-22', 'Carrera 789, Ciudad DEF', 'Cliente 3', 3);   -- Pedido 3

-- Insertar datos en la tabla productos_pedido
INSERT INTO productos_pedido (id_pedido, id_producto)
VALUES
    -- Productos del Pedido 1
    (1, 1),  -- Pie de queso
    (1, 2),  -- Pie de limón

    -- Productos del Pedido 2
    (2, 4),  -- Pastel de chocolate
    (2, 5),  -- Pie de pollo

    -- Productos del Pedido 3
    (3, 3),  -- Pie de jamón y queso
    (3, 8);  -- Torta fría de tres leches
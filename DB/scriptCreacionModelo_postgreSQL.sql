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
('Juan Perez', 'juan.perez@example.com', 'contraseña123', 'administrador'),
('Maria Gomez', 'maria.gomez@example.com', 'password456', 'usuario'),
('Carlos Lopez', 'carlos.lopez@example.com', 'clave789', 'usuario'),
('Ana Torres', 'ana.torres@example.com', 'mipass101', 'moderador'),
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
-- Pie de queso
INSERT INTO ingrediente_producto (id_producto, id_ingrediente)
VALUES 
    (1, 1),  -- queso crema
    (1, 2),  -- huevos
    (1, 3),  -- azúcar
    (1, 4);  -- galletas

-- Pie de limón
INSERT INTO ingrediente_producto (id_producto, id_ingrediente)
VALUES 
    (2, 5),  -- limones
    (2, 2),  -- huevos
    (2, 6),  -- leche condensada
    (2, 4);  -- galletas

-- Pie de jamón y queso
INSERT INTO ingrediente_producto (id_producto, id_ingrediente)
VALUES 
    (3, 7),  -- jamón
    (3, 8),  -- queso
    (3, 2),  -- huevos
    (3, 9);  -- crema de leche

-- Pastel de chocolate
INSERT INTO ingrediente_producto (id_producto, id_ingrediente)
VALUES 
    (4, 10),  -- chocolate para hornear
    (4, 2),   -- huevos
    (4, 11),  -- harina
    (4, 3);   -- azúcar

-- Pie de pollo
INSERT INTO ingrediente_producto (id_producto, id_ingrediente)
VALUES 
    (5, 12),  -- pollo desmenuzado
    (5, 9),   -- crema de leche
    (5, 13),  -- verduras
    (5, 18);  -- masa de hojaldre

-- Croissants de chocolate x10
INSERT INTO ingrediente_producto (id_producto, id_ingrediente)
VALUES 
    (6, 14),  -- mantequilla
    (6, 11),  -- harina
    (6, 15),  -- polvo para hornear
    (6, 10),  -- chocolate
    (6, 17);  -- leche

-- Churros de arequipe x10
INSERT INTO ingrediente_producto (id_producto, id_ingrediente)
VALUES 
    (7, 11),  -- harina
    (7, 17),  -- leche
    (7, 14),  -- mantequilla
    (7, 15),  -- polvo para hornear
    (7, 16);  -- arequipe

-- Torta fría de tres leches
INSERT INTO ingrediente_producto (id_producto, id_ingrediente)
VALUES 
    (8, 17),  -- leche evaporada
    (8, 6),   -- leche condensada
    (8, 9),   -- crema de leche
    (8, 18);  -- bizcocho

INSERT INTO inventario (id_insumo, fecha_ingreso, cantidad, fecha_vencimiento)
VALUES 
    -- Pie de queso
    (1, '2024-05-20', 500.00, '2024-06-01'),   -- queso crema
    (2, '2024-05-20', 3.00, NULL),             -- huevos
    (3, '2024-05-20', 200.00, '2024-06-15'),   -- azúcar
    (4, '2024-05-20', 200.00, NULL),           -- galletas
    
    -- Pie de limón
    (5, '2024-05-21', 4.00, '2024-06-10'),     -- limones
    (2, '2024-05-21', 4.00, NULL),             -- huevos
    (6, '2024-05-21', 397.00, '2024-06-20'),   -- leche condensada
    (4, '2024-05-21', 200.00, NULL),           -- galletas
    
    -- Pie de jamón y queso
    (7, '2024-05-22', 200.00, '2024-06-05'),   -- jamón
    (8, '2024-05-22', 200.00, '2024-06-08'),   -- queso
    (2, '2024-05-22', 3.00, NULL),             -- huevos
    (9, '2024-05-22', 200.00, '2024-06-12'),   -- crema de leche
    
    -- Pastel de chocolate
    (10, '2024-05-23', 200.00, '2024-06-03'),  -- chocolate para hornear
    (2, '2024-05-23', 4.00, NULL),             -- huevos
    (11, '2024-05-23', 200.00, '2024-06-18'),  -- harina
    (3, '2024-05-23', 200.00, NULL),           -- azúcar
    
    -- Pie de pollo
    (12, '2024-05-24', 300.00, '2024-06-07'),  -- pollo desmenuzado
    (9, '2024-05-24', 200.00, '2024-06-25'),   -- crema de leche
    (13, '2024-05-24', 150.00, NULL),          -- verduras
    (18, '2024-05-24', 1.00, '2024-06-14'),    -- masa de hojaldre
    
    -- Croissants de chocolate x10
    (14, '2024-05-25', 250.00, '2024-06-09'),  -- mantequilla
    (11, '2024-05-25', 500.00, '2024-06-04'),  -- harina
    (15, '2024-05-25', 50.00, NULL),           -- polvo para hornear
    (10, '2024-05-25', 200.00, '2024-06-22'),  -- chocolate
    (17, '2024-05-25', 200.00, NULL),          -- leche
    
    -- Churros de arequipe x10
    (11, '2024-05-26', 250.00, '2024-06-11'),  -- harina
    (17, '2024-05-26', 250.00, '2024-06-17'),  -- leche
    (14, '2024-05-26', 200.00, '2024-06-19'),  -- mantequilla
    (15, '2024-05-26', 50.00, NULL),           -- polvo para hornear
    (16, '2024-05-26', 300.00, '2024-06-23'),  -- arequipe
    
    -- Torta fría de tres leches
    (17, '2024-05-27', 354.00, '2024-06-02'),  -- leche evaporada
    (6, '2024-05-27', 397.00, '2024-06-13'),   -- leche condensada
    (9, '2024-05-27', 250.00, '2024-06-16'),   -- crema de leche
    (18, '2024-05-27', 1.00, NULL);            -- bizcocho

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
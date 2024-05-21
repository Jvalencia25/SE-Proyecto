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
    "id" BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY,
    "id_insumo" BIGINT NOT NULL,
    "fecha_ingreso" DATE NOT NULL,
    "cantidad" BIGINT NOT NULL,
    "fecha_vencimiento" DATE NULL,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("id_insumo") REFERENCES "insumo" ("id")
);

-- Crear tabla ingrediente_producto
CREATE TABLE "ingrediente_producto" (
    "id" BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY,
    "id_producto" BIGINT NOT NULL,
    "id_ingrediente" BIGINT NOT NULL,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("id_producto") REFERENCES "producto" ("id"),
    FOREIGN KEY ("id_ingrediente") REFERENCES "insumo" ("id")
);

-- Crear tabla pedido
CREATE TABLE "pedido" (
    "id" BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY,
    "fecha" DATE NOT NULL,
    "estado" VARCHAR(255) NOT NULL,
    "nombre_cliente" VARCHAR(255) NULL,
    "id_empleado" BIGINT NOT NULL,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("id_empleado") REFERENCES "usuario" ("id")
);

-- Crear tabla productos_pedido
CREATE TABLE "productos_pedido" (
    "id" BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY,
    "id_pedido" BIGINT NOT NULL,
    "id_producto" BIGINT NOT NULL,
    PRIMARY KEY ("id"),
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
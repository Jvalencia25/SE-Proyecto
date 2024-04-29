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
create user usr1 with password 'unaClav3'
grant all privileges on database se_erp_pasteleria to usr1;
grant all privileges on schema public to usr1;


CREATE TABLE "insumo"(
    "id" BIGINT NOT NULL,
    "nombre" VARCHAR(255) NOT NULL,
    "unidad_medida" VARCHAR(255) NOT NULL,
    "precio" VARCHAR(255) NOT NULL,
    "proveedor" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "insumo" ADD PRIMARY KEY("id");
CREATE TABLE "producto"(
    "id" BIGINT NOT NULL,
    "nombre" VARCHAR(255) NOT NULL,
    "descripcion" VARCHAR(255) NULL,
    "instrucciones" VARCHAR(255) NOT NULL,
    "precio" VARCHAR(255) NOT NULL,
    "categoria" VARCHAR(255) NOT NULL,
    "imagen" VARCHAR(255) NULL
);
ALTER TABLE
    "producto" ADD PRIMARY KEY("id");
CREATE TABLE "inventario"(
    "id_insumo" BIGINT NOT NULL,
    "fecha_ingreso" DATE NOT NULL,
    "cantidad" BIGINT NOT NULL,
    "fecha_vencimiento" DATE NULL
);
ALTER TABLE
    "inventario" ADD PRIMARY KEY("id_insumo");
ALTER TABLE
    "inventario" ADD PRIMARY KEY("fecha_ingreso");
CREATE TABLE "ingrediente_producto"(
    "id_producto" BIGINT NOT NULL,
    "id_ingrediente" BIGINT NOT NULL
);
ALTER TABLE
    "ingrediente_producto" ADD PRIMARY KEY("id_producto");
ALTER TABLE
    "ingrediente_producto" ADD PRIMARY KEY("id_ingrediente");
CREATE TABLE "productos_pedido"(
    "id_pedido" BIGINT NOT NULL,
    "id_producto" BIGINT NOT NULL
);
ALTER TABLE
    "productos_pedido" ADD PRIMARY KEY("id_pedido");
ALTER TABLE
    "productos_pedido" ADD PRIMARY KEY("id_producto");
CREATE TABLE "pedido"(
    "id" BIGINT NOT NULL,
    "fecha" DATE NOT NULL,
    "estado" VARCHAR(255) NOT NULL,
    "nombre_cliente" VARCHAR(255) NULL,
    "id_empleado" BIGINT NOT NULL
);
ALTER TABLE
    "pedido" ADD PRIMARY KEY("id");
CREATE TABLE "usuario"(
    "id" BIGINT NOT NULL,
    "nombre" VARCHAR(255) NOT NULL,
    "correo" VARCHAR(255) NOT NULL,
    "contraseña" VARCHAR(255) NOT NULL,
    "nivel_acceso" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "usuario" ADD PRIMARY KEY("id");
ALTER TABLE
    "productos_pedido" ADD CONSTRAINT "productos_pedido_id_pedido_foreign" FOREIGN KEY("id_pedido") REFERENCES "pedido"("id");
ALTER TABLE
    "inventario" ADD CONSTRAINT "inventario_id_insumo_foreign" FOREIGN KEY("id_insumo") REFERENCES "insumo"("id");
ALTER TABLE
    "ingrediente_producto" ADD CONSTRAINT "ingrediente_producto_id_ingrediente_foreign" FOREIGN KEY("id_ingrediente") REFERENCES "insumo"("id");
ALTER TABLE
    "productos_pedido" ADD CONSTRAINT "productos_pedido_id_producto_foreign" FOREIGN KEY("id_producto") REFERENCES "producto"("id");
ALTER TABLE
    "ingrediente_producto" ADD CONSTRAINT "ingrediente_producto_id_producto_foreign" FOREIGN KEY("id_producto") REFERENCES "producto"("id");
ALTER TABLE
    "pedido" ADD CONSTRAINT "pedido_id_empleado_foreign" FOREIGN KEY("id_empleado") REFERENCES "usuario"("id");
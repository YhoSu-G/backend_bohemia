--
-- @file inventario.ddl
--
-- @brief Tablas del esquema Inventario
--
-- @author Josué Gutiérrez Quino <josuandroidg7@gmail.com>
--
--

create table inventario.productos (
  id_producto             serial primary key,
  producto                character varying( 200 ) unique,
  descripcion             text,
  costo_unitario          numeric,
  photo                   text,
  stock                   int,
--  tiempo_uso              integer default 0,
--  fecha_inicio            date not null,
--  fecha_fin               date, 
  enabled                 boolean not null default true,                 
  date_of_creation        timestamp with time zone not null default now(),
  last_modification       timestamp with time zone not null default now()
);

comment on table  inventario.productos                        is 'Tabla de productos';
comment on column inventario.productos.id_producto            is 'Identificador del producto';
comment on column inventario.productos.producto               is 'Nombre del producto';
comment on column inventario.productos.descripcion            is 'Descripcion del producto';
comment on column inventario.productos.costo_unitario         is 'Precio del producto';
comment on column inventario.productos.photo                  is 'Foto del producto';
comment on column inventario.productos.stock                  is 'Stock';
comment on column inventario.productos.enabled                is 'Estado del registro';
comment on column inventario.productos.last_modification      is 'Fecha de creación';
comment on column inventario.productos.date_of_creation       is 'Última fecha de modificación';

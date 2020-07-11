--
-- @file db.sql
--
-- @brief Ejecución de los archivos sql.
--
-- @author Josué Gutiérrez Quino <josuandroidg7@gmail.com>
--
--

drop schema if exists inventario cascade;
create schema inventario;
comment on schema inventario is 'Inventario';

\i inventario.ddl

\i inventario.functions.sql

-- \i inventario.dml


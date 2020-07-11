--*
-- @file inventario.functions.sql
--
-- @brief Funciones para utilizadas para inventario
--
-- @author Josué Gutiérrez Quino <josuandroidg7@gmail.com>
--
--
-- + FUNCTIONS FOR INVENTARY.

create or replace function inventario.crearProducto (
    producto_       text,
    descripcion_    text,
    costoUnitario_  numeric,
    photo_          text
) 
returns void 
language 'plpgsql'
as $__$
begin
  insert into inventario.productos ( 
      producto,
      descripcion,
      costo_unitario,
      photo
  ) values (
      producto_,
      descripcion_,
      costoUnitario_,
      photo_
  );
end;
$__$;


-- + Muestra la lista de productos existentes en la empresa
-- + > inventario.productos: Lista de Productos
create or replace function inventario.obtenerProductos()
returns text                    
language 'plpgsql'
as $__$
begin
    return json_build_object(
        'status', 'ok',
        'data', ( select 
                      json_agg( t )
                    from
                      ( 
                        select 
                            id_producto,
                            producto,
                            descripcion,
                            costo_unitario,
                            photo,
                            enabled
                          from
                            inventario.productos
                          where
                            enabled 
                          order by
                            producto
                      ) t 
                ) );
exception when others then
    raise exception '%', glb.checkError( SQLSTATE, SQLERRM );
    return '';
end;$__$;
